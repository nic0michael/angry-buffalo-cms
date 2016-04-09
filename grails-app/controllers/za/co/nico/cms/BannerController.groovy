package za.co.nico.cms

class BannerController {
    def scaffold = true
//    def index() { }

    def addBanner(){
        chain(action: "bannerEditor", params: [operation: "ADD"])
    }
    def editBanner(){
        String bannerId  = params.bannerId
        Banner banner= Banner.findByBannerId(bannerId)
        chain(action: "bannerEditor", params: [operation: "EDIT",bannerId:bannerId])
    }
    def deleteBanner(){
        String bannerId  = params.bannerId
        Banner banner= Banner.findByBannerId(bannerId)
        banner.delete(flush: true)
        chain(action: "bannerManager")
    }


    def bannerManager(){

        List<Banner> banners=Banner.findAll([sort: "bannerId", order: "asc"])
        [banners:banners]
    }
    def bannerEditor(){
        String operation= params.operation
        String bannerId = params.bannerId
        println("bannerId :->${bannerId}<- | operation :${operation}")

        Banner banner= Banner.findByBannerId(bannerId)
        [banner:banner,operation:operation]
    }
    def bannerSave(){

        String operation= params.operation
        String bannerId = params.bannerId
        String bannerTitle = params.bannerTitle
        String bannerCssClass = params.bannerCssClass
        String imageId = params.imageId
        String useSiteTitleSt = params.useSiteTitle
        String publishedSt = params.published
        boolean useSiteTitle=false
        boolean published=false

        if (useSiteTitleSt!=null){
            useSiteTitle=useSiteTitleSt.equalsIgnoreCase("on")
        }
        if (publishedSt!=null){
            published=publishedSt.equalsIgnoreCase("on")
        }

        Banner banner=Banner.findByBannerId(bannerId)
        Images image =Images.findByImageId(imageId)

        if (operation.equalsIgnoreCase("EDIT") && banner!=null) {
            banner.bannerTitle=bannerTitle
            banner.bannerCssClass=bannerCssClass
            banner.image=image
            banner.useSiteTitle=useSiteTitle
            banner.published=published
            banner.save(flush: true)
            println("EDIT Updated banner ${banner.toString()}")

        } else if (operation.equalsIgnoreCase("ADD") && banner==null) {
            Banner banr= new Banner(
                    bannerId      :bannerId
                    ,bannerTitle   :bannerTitle
                    ,bannerCssClass:bannerCssClass
                    ,image         :image
                    ,useSiteTitle  :useSiteTitle
                    ,published     :published
            )

            banr.save(flush: true)
            banner=Banner.findByBannerId(bannerId)
            println("ADD Inserted banner ${banr.toString()}")
        }

        chain(action: "bannerManager")
    }
}
