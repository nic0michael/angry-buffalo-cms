package za.co.nico.cms

class Menu {
    String menuId
    String label
    Page page
    String urlPageIdParameter
    Site site
    boolean isTopMenu
    boolean isSideMenu
    int menuOrder
    String menuURL
    String pageFileName

    static constraints = {
        menuId(blank:false, nullable:false, unique:true, maxSize:45)
        urlPageIdParameter(blank:false, nullable:false)
        menuURL(blank: true,nullable: true,maxSize:128)
        pageFileName(blank: true,nullable: true,maxSize:128)
    }
    public String toString(){return "${menuOrder}|${menuId} | ${label}"}
    public boolean equals(Menu menu){
        return this.menuId.equals(menu.menuId)
    }

    public boolean equals(String label){
        return this.label.equalsIgnoreCase(label)
    }

    public String showUrl(){
        return " ${site.htmlPage}?page_id=${urlPageIdParameter}"
    }

    public String makeMenuUrl(){
        if(label==null || site==null){
            return ""
        }
        String pageUrl=label.replaceAll(" ","").toLowerCase()
        String theSiteId=site.siteId
        theSiteId=theSiteId.replaceAll(" ","").toLowerCase()
        menuURL=site?.htmlPage+"?page_id="+pageUrl+"&site_id="+theSiteId
        urlPageIdParameter=theSiteId

        return menuURL
    }

    public String makePageFileName(){
        if(label==null || site==null){
            return ""
        }
        String pageUrl=label.replaceAll(" ","").toLowerCase()
        pageFileName=site.htmlPage+"_"+pageUrl

        return pageFileName
    }

}
