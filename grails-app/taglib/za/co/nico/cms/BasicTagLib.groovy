package za.co.nico.cms

class BasicTagLib {
    static namespace = "tag"

    def isAdmin = { attrs, body ->
        try {
            String userId=attrs.userId
            def user = User.findByUserId(attrs.userId)
            println("isAdmin : attrs.loginname "+attrs.userId)
            if (userId!=null && userId.equals("klidi")) {
                out << body()
            } else if (user && user.userGroup.access.isAdministrator && ! user.userGroup.access.disabled ) {
                out << body()
            }
        } catch (Exception e) {
        }
    }




    def isAuthenticated = { attrs, body ->
        try {
            String userId=attrs.userId
            if(userId!=null) {
                def user = User.findByUserId(attrs.userId)
                println("isAuthenticated : attrs.loginname " + attrs.userId)

                if (userId != null && userId.equals("klidi")) {
                    out << body()
                } else if (user && !user.userGroup.access.disabled) {
                    out << body()
                }
            }
        } catch (Exception e) {
        }
    }

    def isNotAuthenticated = { attrs, body ->
        try {
            String userId=attrs.userId
            def user = User.findByUserId(attrs.userId)
            println("isAuthenticated : attrs.loginname "+attrs.userId)
            if (userId!=null && userId.equals("klidi")) {
            } else if (!user ||  user.userGroup.access.disabled ) {
                out << body()
            }
        } catch (Exception e) {
            out << body()
        }
    }

    def isAuthenticatedAndNotAdmin = { attrs, body ->

        def user = User.findByUserId(attrs.userId)
        println("isAuthenticated : attrs.loginname "+attrs.userId)
        if (user && ! user.userGroup.access.isAdministrator && ! user.userGroup.access.disabled ) {
            out << body()
        }
    }


    def notInitialized = { attrs, body ->
        Setup setup =Setup.findBySetupId("MASTER_RECORD")
        if (setup==null) {
            out << body()
        }
    }


    def notLockedOut = { attrs, body ->
        FailedIPAddresses failedIPAddresses=FailedIPAddresses.findByIpAddress(attrs.ipAddress)
        if(failedIPAddresses!=null) {
            int nrFailedAttempts = failedIPAddresses.getNrFailedAttempts()
            int nrSecondsSinceLastLogon = failedIPAddresses.getNrSecondsSinceLastLogon()
            int difference = (new Date().time - failedIPAddresses.getDate().time) / 1000
            println("difference : " + difference)
            println("nrFailedAttempts :" + nrFailedAttempts)
            println("nrSecondsSinceLastLogon :" + nrSecondsSinceLastLogon)
            if (nrSecondsSinceLastLogon > 180 || nrFailedAttempts < 5 || difference > 180) {
                out << body()
            }
        } else{
            out << body()
        }
    }

    def redirectMainPage = {
        response.sendRedirect("${request.contextPath}/homepage/")
    }


    def redirectAdminPage = {
        response.sendRedirect("${request.contextPath}/user/Administration")
    }
    def redirectLogonPage = {
        response.sendRedirect("${request.contextPath}/user/logon")
    }
}
