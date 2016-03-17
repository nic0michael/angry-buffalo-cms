package za.co.nico.cms

class Template {

    String templateId
    String templateName
    String templateJspFile  // /homepage/_template1.jsp
    String cssPath
    Banner topBanner
    Banner bottomBanner
    boolean published

    static constraints = {
        templateId(blank:false, nullable:false, unique:true, maxSize:45)
        cssPath(blank:true, nullable:true)
        templateJspFile(blank:true, nullable:true)
    }

    String toString(){return "${templateId} | ${templateName}"}
}
