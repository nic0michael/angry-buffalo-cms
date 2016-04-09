package za.co.nico.cms

/**
 * Created with IntelliJ IDEA.
 * User: NMichael
 * Date: 2014/08/09
 * Time: 4:45 PM
 * To change this template use File | Settings | File Templates.
 */
class ExternalProperties {
    static String username = "root"
    static String password = "P@55w0rd"
    static String propertiesFileNAme ='nicoscms.properties'

    public static Properties props = new Properties()
    public static File propsFile = new File(propertiesFileNAme)

    public ExternalProperties(){
        propertiesFileNAme='test.properties'
//        readProperties()
    }

    public ExternalProperties(String propertiesFileNAme){
        this.propertiesFileNAme=propertiesFileNAme
        readProperties()
    }

    public static  void readProperties(){
        try {
            props.load(propsFile.newDataInputStream())
            println(propsFile.absolutePath)
            println(propsFile.absoluteFile)
            String usr=props.getProperty('username')
            String pwd=props.getProperty('password')
            println('username ' +usr)
            println('password ' +pwd)
            if(usr!=null && pwd!=null){
                username=usr
                password=pwd
            }
        } catch (Exception e) {
            writeProperties()
        }
    }

    public static void writeProperties(){
        try {
            props.setProperty('username', username)
            props.setProperty('password', password)
            props.store(propsFile.newWriter(), null)
        } catch (Exception e) {
            e.printStackTrace()
        }
    }

    public static String getUsername() {
        readProperties()
        return username
    }

    public static String getPassword() {
        readProperties()
        return password
    }

    public static String getPropertiesFile() {
        return propsFile.absolutePath
    }
}
