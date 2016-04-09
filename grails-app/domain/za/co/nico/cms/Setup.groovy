package za.co.nico.cms

class Setup {
    String setupId
    String homePageTitle
    String siteTitle
    String siteCopyright
    String siteCSSCode
    String menuBackgroundColour //  #8aa3ff     // the colour of the buttons background
    String menuHoverColour      //  #ffffff
    String menuSelectedColour   //  #000088
    String menuColour           //  #6f82aa    // the colour of the menu
    Template siteTemplate
    TextContent homePageText
    boolean enabled
    static constraints = {
        setupId(blank:false, nullable:false, unique:true, maxSize:25)
        siteTitle(blank:false, nullable:false)
        siteCSSCode(blank:false, nullable:false, maxSize:25000)
        homePageTitle(blank:false, nullable:false)
    }
    String toString(){return "${setupId} | ${homePageTitle}"}
}
