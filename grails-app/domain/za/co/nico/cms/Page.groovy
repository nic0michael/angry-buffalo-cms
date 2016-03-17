package za.co.nico.cms

class Page {
    String pageId
    String title
    String pageUrl
    User author
    Categories category
    Template template
    Permissions access
    boolean published


    static constraints = {
        pageId(blank:false, nullable:false, unique:true, maxSize:45)
        pageUrl(blank:true, nullable:true)
    }
    String toString(){return "${pageId} | ${title}"}
}
