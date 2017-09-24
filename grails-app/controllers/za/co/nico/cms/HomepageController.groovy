package za.co.nico.cms

class HomepageController {
    Base64Wrapper base64 = new Base64Wrapper()
    Setup setup
    List<Setup> setups = Setup.findAllByEnabled(true)
    static final int NOT_ENCODED = 0
    static final int BASE64 = 1



    def page(){
        String thePageId = params.page_id;
        String templateGspFile = templateGspFile()
        String bottomBanner = getBottomBannerUrl(thePageId)
        String topBanner = getTopBannerUrl(thePageId)
        String siteTitle = siteTitle()
        String pageContent = retrievePageContent(thePageId,"default_site")//String pageId,String siteIdLC
        String siteCopyright = siteCopyright()
        int len = 0;
        if (pageContent != null) {
            len = pageContent.length()
        }

        Map<String, String> hc = new HashMap<>()
        hc.put("topBanner", topBanner)
        hc.put("bottomBanner", bottomBanner)
        hc.put("siteTitle", siteTitle)
        hc.put("retrievePageContent", pageContent)
        hc.put("siteCopyright", siteCopyright)
        hc.put("pageId", thePageId)
        hc.put("templateGspFile", templateGspFile)
        if (setups != null && setups.size() > 0) {
            setup = setups.get(0)

            hc.put("menuBackgroundColour", setup.menuBackgroundColour)
            hc.put("menuHoverColour", setup.menuHoverColour)
            hc.put("menuSelectedColour", setup.menuSelectedColour)
            hc.put("menuColour", setup.menuColour)
        } else {
            hc.put("menuBackgroundColour", "#FFA500") //,"#6f82aa")
            hc.put("menuHoverColour", "#ffffff")
            hc.put("menuSelectedColour", "#000088")
            hc.put("menuColour", "#8aa3ff")

        }

        [templateGspFile: templateGspFile, hc: hc, homePageTitle: homePageTitle()]

    }

    def index() {
        String thePageId = params.page_id
        String theSite_id=params.site_id
        if(theSite_id==null){
            theSite_id="default_site"
        }
        String templateGspFile = templateGspFile()
        String bottomBanner = getBottomBannerUrl(thePageId)
        String topBanner = getTopBannerUrl(thePageId)
        String siteTitle = siteTitle()
        String pageContent = retrievePageContent(thePageId,theSite_id)
        String siteCopyright = siteCopyright()
        int len = 0;
        if (pageContent != null) {
            len = pageContent.length()
        }

        Map<String, String> hc = new HashMap<>()
        hc.put("topBanner", topBanner)
        hc.put("bottomBanner", bottomBanner)
        hc.put("siteTitle", siteTitle)
        hc.put("retrievePageContent", pageContent)
        hc.put("siteCopyright", siteCopyright)
        hc.put("pageId", thePageId)
        hc.put("siteIdLC", "DEFAULT_SITE")
        hc.put("templateGspFile", templateGspFile)
        if (setups != null && setups.size() > 0) {
            setup = setups.get(0)

            hc.put("menuBackgroundColour", setup.menuBackgroundColour)
            hc.put("menuHoverColour", setup.menuHoverColour)
            hc.put("menuSelectedColour", setup.menuSelectedColour)
            hc.put("menuColour", setup.menuColour)
        } else {
            hc.put("menuBackgroundColour", "#FFA500") //,"#6f82aa")
            hc.put("menuHoverColour", "#ffffff")
            hc.put("menuSelectedColour", "#000088")
            hc.put("menuColour", "#8aa3ff")

        }

        [templateGspFile: templateGspFile, hc: hc, homePageTitle: homePageTitle()]
    }



    def index2() {
        String thePageId = params.page_id
        String theSite_id=params.site_id
        String templateGspFile = templateGspFile()
        String bottomBanner = getBottomBannerUrl(thePageId)
        String topBanner = getTopBannerUrl(thePageId)
        String siteTitle = siteTitle()
        String pageContent = retrievePageContent(thePageId,theSite_id)
        String siteCopyright = siteCopyright()
        int len = 0;
        if (pageContent != null) {
            len = pageContent.length()
        }

        Map<String, String> hc = new HashMap<>()
        hc.put("topBanner", topBanner)
        hc.put("bottomBanner", bottomBanner)
        hc.put("siteTitle", siteTitle)
        hc.put("retrievePageContent", pageContent)
        hc.put("siteCopyright", siteCopyright)
        hc.put("pageId", thePageId)
        hc.put("siteIdLC", "DEFAULT_SITE")
        hc.put("templateGspFile", templateGspFile)
        if (setups != null && setups.size() > 0) {
            setup = setups.get(0)

            hc.put("menuBackgroundColour", setup.menuBackgroundColour)
            hc.put("menuHoverColour", setup.menuHoverColour)
            hc.put("menuSelectedColour", setup.menuSelectedColour)
            hc.put("menuColour", setup.menuColour)
        } else {
            hc.put("menuBackgroundColour", "#FFA500") //,"#6f82aa")
            hc.put("menuHoverColour", "#ffffff")
            hc.put("menuSelectedColour", "#000088")
            hc.put("menuColour", "#8aa3ff")

        }

        [templateGspFile: templateGspFile, hc: hc, homePageTitle: homePageTitle()]
    }



    def index3() {
        String thePageId = params.page_id
        String theSite_id=params.site_id
        String templateGspFile = templateGspFile()
        String bottomBanner = getBottomBannerUrl(thePageId)
        String topBanner = getTopBannerUrl(thePageId)
        String siteTitle = siteTitle()
        String pageContent = retrievePageContent(thePageId,theSite_id)
        String siteCopyright = siteCopyright()
        int len = 0;
        if (pageContent != null) {
            len = pageContent.length()
        }

        Map<String, String> hc = new HashMap<>()
        hc.put("topBanner", topBanner)
        hc.put("bottomBanner", bottomBanner)
        hc.put("siteTitle", siteTitle)
        hc.put("retrievePageContent", pageContent)
        hc.put("siteCopyright", siteCopyright)
        hc.put("pageId", thePageId)
        hc.put("siteIdLC", "DEFAULT_SITE")
        hc.put("templateGspFile", templateGspFile)
        if (setups != null && setups.size() > 0) {
            setup = setups.get(0)

            hc.put("menuBackgroundColour", setup.menuBackgroundColour)
            hc.put("menuHoverColour", setup.menuHoverColour)
            hc.put("menuSelectedColour", setup.menuSelectedColour)
            hc.put("menuColour", setup.menuColour)
        } else {
            hc.put("menuBackgroundColour", "#FFA500") //,"#6f82aa")
            hc.put("menuHoverColour", "#ffffff")
            hc.put("menuSelectedColour", "#000088")
            hc.put("menuColour", "#8aa3ff")

        }

        [templateGspFile: templateGspFile, hc: hc, homePageTitle: homePageTitle()]
    }


    String siteTitle() {
        if (setups != null && setups.size() > 0) {
            return setups.get(0).siteTitle
        }
        return " "
    }


    String homePageTitle() {
        if (setups != null && setups.size() > 0) {
            return setups.get(0).homePageTitle
        }
        return " "
    }

    String siteCopyright() {
        if (setups != null && setups.size() > 0) {
            return setups.siteCopyright
        }
        return " "

    }

    /**
     * http://localhost:8080/NicosCMS/homepage/?page_id="page1"
     * http://localhost:8080/NicosCMS/homepage/index?page_id="page1"
     *
     * @param pageId
     * @return
     */
    String retrievePageContent(String pageId,String siteIdLC) {
        Setup setup =Setup.findBySetupId("MASTER_RECORD")

        println("Render content for page :  pageId : " + siteIdLC+pageId)
        StringBuilder sb = new StringBuilder()
        String filename
        String text
        boolean fileWasRead=false;

        if (pageId == null || pageId.length() < 2 || pageId.equalsIgnoreCase("HOME_PAGE")) {
            // no parameters passed ?page_id="page1"
            filename = "homepage.bin"
            if (Utilities.fileExists(filename)&& setup?.enableCaching) {
                text = Utilities.readFile(filename)
                println("Render content from file :" + filename)
                text=base64.decode(text)
                return text
            }
            println("Render Homepage : pageId : null : Home Page")
            sb.append(homePageContent())

        } else if (isPageOnMenu(pageId, siteIdLC)) {
            if(siteIdLC!=null ) {
                filename = Utilities.makePageFileName(siteIdLC+"_"+ pageId,".bin")
            } else{
                filename = Utilities.makePageFileName( pageId,".bin")
            }

            if (Utilities.fileExists(filename)&& setup?.enableCaching) {
                text = Utilities.readFile(filename)
                println("Render content from file :" + filename)
                text=base64.decode(text)
                return text
            }

            String menuURL=MenuListMaker.makeMenuURL(pageId,siteIdLC)
            sb.append(contentForPageOnMenu( siteIdLC, pageId,menuURL))

        } else {
            sb.append(homePageContent())
        }

        text = sb.toString()
        String fileExtension=""

        writeToFilePageContent(siteIdLC,pageId,text)
        return sb.toString()
    }

    void writeToFilePageContent(String siteIdLC,String pageId,String text){
        String filename
        if(siteIdLC!=null ) {
            filename = Utilities.makePageFileName(siteIdLC+"_"+ pageId,"")
        } else{
            filename = Utilities.makePageFileName( pageId,"")
        }
        Utilities.writeEncodedPage(filename,text)
    }

    void deleteAllPages(){
        List<Menu> menuItems = Menu.findAll()
        String filename
        for (Menu menu : menuItems) {
            String menuURL = menu.menuURL
            filename= Utilities.makePageFileName(menuURL,".bin")
            Utilities.deleteFile(filename)
            filename= Utilities.makePageFileName(menuURL,".qtr")
            Utilities.deleteFile(filename)
        }
        filename="index?page_id=patriarch&site_id=default_site.bin"
        Utilities.deleteFile(filename)
        filename="index?page_id=patriarch&site_id=default_site.bin"
        Utilities.deleteFile(filename)
        filename="index?page_id=archbishop&site_id=default_site.bin"
        Utilities.deleteFile(filename)

        Utilities.deleteAllFilesWithExtension(".bin")
        Utilities.deleteAllFilesWithExtension(".qtr")
    }

    void deleteFile(String siteIdLC,String pageId){
        String filename
        if(siteIdLC!=null ) {
            filename = Utilities.makePageFileName(siteIdLC+"_"+ pageId,".bin")
        } else{
            filename = Utilities.makePageFileName( pageId,".bin")
        }
        Utilities.deleteFile(filename)
    }

    void deleteQtrFile(String siteIdLC,String pageId){
        String filename
        if(siteIdLC!=null ) {
            filename = Utilities.makePageFileName(siteIdLC+"_"+ pageId,".qtr")
        } else{
            filename = Utilities.makePageFileName( pageId,".qtr")
        }

        Utilities.deleteFile(filename)
    }

    void writeToFilePageContent(String pageId) {
        println("Render content for page :  pageId : " + pageId)
        StringBuilder sb = new StringBuilder()
        char qu = '"'
        String homePageTitle = ""
        String filename
        String text

        text = sb.toString()
        Date date = content.lastChangedDate

        Utilities.writeEncodedPage(pageId,text)
        Utilities.writeQtrFile(pageId,date)
    }

    String fileReadPageContent(String pageId) {
        String filename

        if (pageId == null) {
            filename = "homepage.bin"
        } else {
            filename = Utilities.makePageFileName(pageId,".bin")
        }
        return Utilities.readFile(filename)
    }

    Date getDateInPageContentFile(String pageId) {
        Date date
        String filename

        if (pageId == null) {
            filename = "homepage.qtr"
        } else {
            filename = Utilities.makePageFileName(pageId,".qtr")
        }

        String dateStr = Utilities.readFile(filename)
        date = new Date().parse("yyyy-MM-dd HH:mm:ss", dateStr)
        return date
    }

    Date pageContentDate(String pageId) {
        Date date = new Date()

        if (pageId == null) {
            Setup setup = setups?.get(0)
            date = setup?.homePageText?.lastChangedDate
        } else {
            Menu menu = Menu.findByUrlPageIdParameter(stripQuotes(pageId))
            if (menu != null) {
                Page page = menu.page
                if (page != null) {
                    List<TextContent> pageContents = TextContent.findAllByPage(page)
                    if (pageContents != null) {
                        TextContent content = pageContents.get(0)
                        date = content.lastChangedDate
                    }
                }
            }

            return date
        }
    }

    String contentForPageOnMenu(String siteId,String pageId,String menuURL) {
        StringBuilder sb = new StringBuilder()
        Menu menu=Menu.findByMenuURL(menuURL)
        if (menu != null) {
            sb.append("<h2>${menu?.label}</h2> ")
            Page page = menu.page

            if (page != null) {
                List<TextContent> pageContents = TextContent.findAllByPage(page)
                if (pageContents != null) {
                    int count = 0
                    for (TextContent content : pageContents) {
                        println("Display content from :  pageId : " + page.pageId + " textContentId: " + content.textContentId)
                        String textContentText //=homePageText?.textContentText
                        if (content?.encoding == BASE64) {
                            textContentText = base64.decode(content?.textContentText)
                        } else {
                            textContentText = content?.textContentText
                        }
                        if (textContentText != null) {
                            sb.append(textContentText)
                        }
                        if (count == 0) {
                            Date date = content.lastChangedDate
                            if(siteId==null) {
                                Utilities.writeQtrFile(pageId, date)
                            } else {
                                Utilities.writeQtrFile(siteId + "_" + pageId, date)
                            }
                        }
                    }
                }
            }
        }

        return sb.toString()
    }

    private String homePageContent() {
        StringBuilder sb = new StringBuilder()
        if (setups == null || setups.size() < 1) {
            println("No home page content in database")
            sb.append("<h2>${homePageTitle()}</h2> ")
            sb.append("<strong>Under Construction :</strong>  <br>No content defined yet <br><br> please visit this site again <br><br><a href='../admin' target='_blank'>Login</a>")
            return sb.toString()
        }
        Setup setup = setups?.get(0)
        TextContent homePageText = setup?.homePageText
        String textContentText //=homePageText?.textContentText
        if (homePageText?.encoding == BASE64) {
            textContentText = base64.decode(homePageText?.textContentText)
        } else {
            textContentText = homePageText?.textContentText
        }
        sb.append(textContentText)
        Date date = homePageText.lastChangedDate

        String filename = "homepage.bin"
        String text = sb.toString()
        Utilities.writeEncodedPage(filename,text)
        Utilities.writeQtrFile(filename,date)

//        sb.append("<br>xxXHOME PAGEXxx ")
        return sb.toString()
    }


    boolean isPageOnMenu(String pageId,String siteIdLC) {
        Site site=null
        if(siteIdLC!=null) {
            site = Site.findBySiteId(siteIdLC.toUpperCase())
        } else{
            return false
        }
        String menuURL=MenuListMaker.makeMenuURL(pageId, siteIdLC)
        menuURL=stripQuotes(menuURL)
        Menu menu = Menu.findByMenuURL(menuURL)
//        Menu menu = Menu.findByUrlPageIdParameter(stripQuotes(pageId))
        return menu != null
    }

    Banner getDefaultTopBanner() {
        Banner banner = Banner.findByBannerId('TOP_BANNER')
        return banner
    }


    Banner getDefaultBottomBanner() {
        Banner banner = Banner.findByBannerId('BOTTOM_BANNER')
        return banner
    }

    Banner getTopBanner(String pageId) {
        Page page
        Banner banner = null
        Template template

        Menu menu = Menu.findByUrlPageIdParameter(stripQuotes(pageId))
        if (menu != null) {
            page = menu.page
            if (page != null) {
                template = page.template
                if (template != null) {
                    banner = template.topBanner
                }
            }
        }
        if (banner == null) {
            banner = getDefaultTopBanner()
        }
        return banner
    }


    Banner getBottomBanner(String pageId) {
        Page page
        Banner banner = null
        Template template

        Menu menu = Menu.findByUrlPageIdParameter(stripQuotes(pageId))
        if (menu != null) {
            page = menu.page
            if (page != null) {
                template = page.template
                if (template != null) {
                    banner = template.bottomBanner
                }
            }
        }
        if (banner == null) {
            banner = getDefaultBottomBanner()
        }
        return banner
    }

    String getTopBannerUrl(String pageId) {
        if (pageId == null) {
            Banner banner = getDefaultTopBanner()
            if (banner != null) {
                return banner.image.imagePath
            } else {
                return ""
            }
        }
        Images image
        String bannerUrl = " "
        Banner banner = getTopBanner(pageId)
        if (banner != null) {
            image = banner.image
            if (image != null) {
                bannerUrl = image.imagePath
            }
        }
        return bannerUrl;
    }

    String getBottomBannerUrl(String pageId) {
        if (pageId == null) {
            Banner banner = getDefaultBottomBanner()
            if (banner != null) {
                return banner.image.imagePath
            } else {
                return ""
            }
        }
        Images image
        String bannerUrl = " "
        Banner banner = getBottomBanner(pageId)
        if (banner != null) {
            image = banner.image
            if (image != null) {
                bannerUrl = image.imagePath
            }
        }
        return bannerUrl;
    }


    String homePageMenu() {
        if (setups != null && setups.size() > 0) {
            return " "
        }
        return " "
    }

    String templateGspFile() {
        Setup setup = Setup.findBySetupId("MASTER_RECORD")
        String templateGspFile = setup?.siteTemplate?.templateJspFile
        if (templateGspFile == null || templateGspFile.length() < 1) {
            templateGspFile = ""
        }
        return templateGspFile
    }

    String stripQuotes(String line) {
        String retStr=line.replace("\"", "").trim()
        return retStr
    }

    def cacheContent() {
        Setup setup =Setup.findBySetupId("MASTER_RECORD")
        setup.enableCaching=true
        setup.save(flush: true)
        regenerateMenu()
        deleteAllPages()
        cacheAllContent()
//        MenuListMaker.setAllMenuUrls()
        chain(controller: "user", action: "Administration")
    }



    def deleteAllFileContent(){
        deleteAllPages()
        chain(controller: "user", action: "Administration")
    }

     void cacheAllContent() {
        homePageContent()
        List<Menu> menuItems = Menu.findAll()

        for (Menu menuItem : menuItems) {
            String pageId = menuItem?.urlPageIdParameter
            String siteIdLC=menuItem?.site?.siteId
            siteIdLC=siteIdLC.toLowerCase()
            println(pageId)
            cacheContentForPageOnMenu(pageId,siteIdLC)
        }

    }


    void cacheContentForPageOnMenu(String pageId,String siteIdLC) {
        String text
        text=retrievePageContent( pageId, siteIdLC)
        deleteFile(siteIdLC, pageId)
        deleteQtrFile(siteIdLC, pageId)
        writeToFilePageContent( siteIdLC, pageId, text)
        Date date = new Date()
        Utilities.writeQtrFile(pageId,date)
    }

    void regenerateMenu(){
        List<Menu> menuItems = Menu.findAll()
        for (Menu menuItem : menuItems) {
            println("menuURL was : "+ menuItem.menuURL)
            String siteIdLc=menuItem.site.siteId.toLowerCase()
            String pageId=menuItem.label
            pageId=pageId.toLowerCase()
            pageId=pageId.replaceAll(" ","_")
            String menuURL=MenuListMaker.makeMenuURL(pageId,siteIdLc)
            println("menuURL now : "+ menuURL)
            menuItem.menuURL=menuURL
            menuItem.save(flush: true)
        }
    }


    String readCachedFileContent(String pageId) {
        String filename = swapSpacesWithUnderscore(pageId) + ".bin"
        String text = Utilities.readFile(filename)
        return base64.decode(text)
    }


    String readCachedFile(String filename) {
        String text = Utilities.readFile(filename)
        return base64.decode(text)
    }







}
