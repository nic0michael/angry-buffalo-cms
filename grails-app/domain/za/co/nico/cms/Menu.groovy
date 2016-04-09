package za.co.nico.cms

class Menu {
    String menuId
    String label
    Page page
    String urlPageIdParameter
    boolean isTopMenu
    boolean isSideMenu
    Language language

    static constraints = {
        menuId(blank:false, nullable:false, unique:true, maxSize:45)
        urlPageIdParameter(blank:false, nullable:false)
    }
    String toString(){return "menuId: ${menuId} | label: ${label} | urlPageIdParameter: ${urlPageIdParameter} | ${language.languageName}"}


}
