package za.co.nico.cms

class Site {
    String siteId
    String siteName
    String description
    String htmlPage

    static constraints = {
        siteId(blank:false, nullable:false, unique:true, maxSize:45)
        siteName(blank:false, nullable:false, unique:true, maxSize:45)
        htmlPage(blank:false, nullable:false)
    }


    @Override
    public String toString()  {return "${siteId} | ${siteName}"}

}
