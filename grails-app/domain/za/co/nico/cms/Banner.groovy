package za.co.nico.cms

class Banner {
    String bannerId
    String bannerTitle
    String bannerCssClass
    Images image
    boolean useSiteTitle
    boolean published

    static constraints = {
        bannerId(blank:false, nullable:false, unique:true, maxSize:45)
    }
    String toString(){return "${bannerId} | ${bannerTitle} | ${image?.imageFileName}"}
}
