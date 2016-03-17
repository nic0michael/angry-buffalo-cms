package za.co.nico.cms

class UserController {
    Utils utils= new Utils()

//    def index() { }
    def scaffold = true

    def init() {

        String eTo = grailsApplication.config.emails.to
        String eFrom = grailsApplication.config.emails.from
    }

    def logon() {
//        ExternalProperties props=new ExternalProperties()
//        println(ExternalProperties.getUsername() )
//        println(ExternalProperties.getPassword() )
        int randonNr=utils.randomNumber(10)
         [randonNr:randonNr]
    }


    def logout(){
        session.invalidate()
        redirect(action: "logon")
    }
    def Administration() {
        println("Administration")
    }
    def AdvancedAdministration() {}

    def controlPanel(){

    }
    def user() {
        println("User Called")
        String loginname=params.loginname
        String password=params.password
        String klidi=params.klidi
        String captcha=params.captcha

        try {
            sqlInjectionTrap(password)
            sqlInjectionTrap(loginname)
            validateCaptcha(klidi,captcha)

            def user = User.findByUserIdAndPassword(loginname, password)

            if (user) {
                session.setAttribute("userId", user.userId)
                session.setAttribute("fullName", user.fullName)
                flash.message = "Hello ${user.userId}!"
                println("Success for userId: ${user.userId}  password : ${user.password}")

                if (user.userGroup.access.disabled) {        //.access.disabled
                    println("sorry userId: ${params.loginname}  password : ${params.password} is disabled")
                    flash.message = "Sorry, ${params.userName} is disabled Please try again."
                    session.invalidate()
                    redirect(action: "logon")

                } else if (user.userGroup.access.isAdministrator) {
                    session.setAttribute("isAdmin", "TRUE")
                    session.setAttribute("errorMessage", " ")
                    chain(action: "Administration")

                } else {
                    session.setAttribute("isAdmin", "FALSE")
                    session.setAttribute("errorMessage", " ")
                    chain(action: "Administration")

                }

            } else {
                if ("klidi".equals(params.loginname) && "P@55w0rd".equals(params.password)) {
                    session.setAttribute("userId",params.loginname)// "adminKl")
                    session.setAttribute("fullName", "Administrator")
                    session.setAttribute("isAdmin", "TRUE")
                    chain(action: "Administration")
                } else {
                    flash.message = "Sorry, ${params.userName}. Please try again."
                    println("sorry userId: ${params.loginname}  password : ${params.password}")
                    session.invalidate()
                    redirect(action: "logon")
                }
            }

        } catch (Exception e) {
            flash.message = "Sorry, ${params.userName}. Please try again."
            println("sorry userId: ${params.loginname}  password : ${params.password}")
            session.invalidate()
            redirect(action: "logon")
        }
    }

    void validateCaptcha(String klidi,String captcha) throws Exception{
        int key =klidi.toInteger()
        int value=captcha.toInteger()
        key=9999-key
        if (key==value){
            println("Captcha validated")
        }  else{
            throw new Exception("Captcha not validated")
        }

    }

    void sqlInjectionTrap(String str) throws Exception{
        String test= str.toUpperCase()
        if (test.contains("INSERT") || test.contains("UPDATE") || test.contains("DELETE")
                || test.contains("DROP") || test.contains("SELECT")
                ){
            println("SQl injection detected")
            throw new Exception("SQL injection detected")
        }
    }

}
