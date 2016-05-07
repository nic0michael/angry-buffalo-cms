package za.co.nico.cms

import java.text.SimpleDateFormat
import java.text.DateFormat

class HomepageController {
    static encryptionKeyLoaded=false

    Setup setup
    List<Setup> setups = Setup.findAllByEnabled(true)
    static final int NOT_ENCODED=0
    static final int BASE64=1



    def cacheContent(){
        cacheAllContent()
        chain(controller: "user", action: "Administration")
    }



    def index() {
//        if(!encryptionKeyLoaded){
//            Encryption encryption=new Encryption()
////            encryption.writeEncryptionKey(Encryption.ENCRYPTION_KEY_1)
//            encryption.loadEncryptionKey(Encryption.ENCRYPTION_KEY_1)
//            encryptionKeyLoaded=true
//        }


        String thePageId=params.page_id;
        String templateGspFile=templateGspFile()
        String bottomBanner =getBottomBannerUrl( thePageId)
        String topBanner =getTopBannerUrl( thePageId)
        String siteTitle=siteTitle()
        String pageContent=pageContent(thePageId)
        String siteCopyright=siteCopyright()
        int len=0;
        if(pageContent!=null){
            len=pageContent.length()
        }

        Map<String,String> hc=new HashMap<>()
        hc.put("topBanner",topBanner)
        hc.put("bottomBanner",bottomBanner)
        hc.put("siteTitle",siteTitle)
        hc.put("pageContent",pageContent)
        hc.put("siteCopyright",siteCopyright)
        hc.put("pageId",thePageId)
        hc.put("templateGspFile",templateGspFile)
        if(setups!=null && setups.size()>0){
            setup=setups.get(0)

            hc.put("menuBackgroundColour",setup.menuBackgroundColour)
            hc.put("menuHoverColour"     ,setup.menuHoverColour     )
            hc.put("menuSelectedColour"  ,setup.menuSelectedColour  )
            hc.put("menuColour"          ,setup.menuColour          )
        }   else{
            hc.put("menuBackgroundColour","#FFA500") //,"#6f82aa")
            hc.put("menuHoverColour"     ,"#ffffff")
            hc.put("menuSelectedColour"  ,"#000088")
            hc.put("menuColour"          ,"#8aa3ff")

        }

        [templateGspFile:templateGspFile,hc:hc,homePageTitle:homePageTitle()]
    }

    String siteTitle(){
        if (setups!=null && setups.size()>0){
            return  setups.get(0).siteTitle
        }
        return " "
    }


    String homePageTitle(){
        if (setups!=null && setups.size()>0){
            return  setups.get(0).homePageTitle
        }
        return " "
    }

    String siteCopyright(){
        if (setups!=null && setups.size()>0){
            return  setups.siteCopyright
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
    String pageContent(String pageId){
        println("Render content for page :  pageId : "+pageId)
        StringBuilder sb=new StringBuilder()
        char qu='"'
        String homePageTitle=""
        String filename
        String text

        if (pageId==null||pageId.length()<2 || pageId.equalsIgnoreCase("HOME_PAGE")){   // no parameters passed ?page_id="page1"
            filename="homepage.bin"
            if(fileExists(filename)){
                text=readFile(filename)
                println("Render content from file :"+filename)
                return decryptDecode(text);

            }
            println("Render Homepage : pageId : null : Home Page")
            sb.append(homePageContent())

        } else if(isPageOnMenu( pageId)){                     // http://localhost:8080/NicosCMS/homepage/index?page_id=page1
            filename=swapSpacesWithUnderscore(pageId)+".bin"
            if(fileExists(filename)){
                text=readFile(filename)
                println("Render content from file :"+filename)
                return decryptDecode(text)
            }

            sb.append(contentForPageOnMenu( pageId))

        }else{
            sb.append(homePageContent())
        }

        if (pageId==null){
            filename="homepage.bin"
        } else{
            filename=pageId+".bin"
        }


        text=sb.toString()
        text=encryptEncode(text)
        writeToFile(filename,text)

        return sb.toString()
    }

    String fileReadPageContent(String pageId){
        String filename

        if (pageId==null){
            filename="homepage.bin"
        } else{
            filename=pageId+".bin"
        }
        return readFile(filename)
    }

    Date getDateInPageContentFile(String pageId){
        Date date
        String filename

        if (pageId==null){
            filename="homepage.qtr"
        } else{
            filename=pageId+".qtr"
        }

        String dateStr=readFile(filename)
        date =new Date().parse("yyyy-MM-dd HH:mm:ss", dateStr)
        return date
    }

    Date pageContentDate(String pageId){
        Date date =new Date()

        if (pageId==null){
            Setup setup= setups?.get(0)
            date=setup?.homePageText?.lastChangedDate
        } else{
            Menu menu =Menu.findByUrlPageIdParameter(stripQuotes(pageId))
            if (menu!=null){
                Page page=menu.page
                if (page!=null){
                    List<TextContent> pageContents = TextContent.findAllByPage(page)
                    if (pageContents!=null){
                        TextContent content=pageContents.get(0)
                        date=content.lastChangedDate
                    }
                }
            }

            return date
        }
    }

    String contentForPageOnMenu(String pageId){
        StringBuilder sb=new StringBuilder()
        Menu menu =Menu.findByUrlPageIdParameter(stripQuotes(pageId))
        if (menu!=null){
            sb.append("<h2>${menu?.label}</h2> ")
            Page page=menu.page

            if (page!=null){
                List<TextContent> pageContents = TextContent.findAllByPage(page)
                if (pageContents!=null){
                    int count=0
                    for (TextContent content:pageContents){
                        println("Display content from :  pageId : "+page.pageId+" textContentId: "+content.textContentId)
                        String textContentText //=homePageText?.textContentText
                        if (content?.encoding==BASE64){
                            textContentText= decryptDecode(content?.textContentText)
                        } else{
                            textContentText= content?.textContentText
                        }
                        if (textContentText!=null){
                            sb.append(textContentText)
                        }
                        if (count ==0){
                            Date date=content.lastChangedDate
                            String filename=swapSpacesWithUnderscore(pageId)+".qtr"
                            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                            String text = dateFormat.format(date);
                            writeToFile(filename,text)
                        }
                        count++
                    }
                }
            }
        }

        return sb.toString()
    }

    private String homePageContent(){
        StringBuilder sb=new StringBuilder()
        if(setups==null||setups.size()<1){
            println("No home page content in database")
            sb.append("<h2>${homePageTitle()}</h2> ")
            sb.append("<strong>Under Construction :</strong>  <br>No content defined yet <br><br> please visit this site again <br><br><a href='../admin' target='_blank'>Login</a>")
            return sb.toString()
        }
        Setup setup= setups?.get(0)
        TextContent homePageText=setup?.homePageText
        String textContentText //=homePageText?.textContentText
        if (homePageText?.encoding==BASE64){
            textContentText= decryptDecode(homePageText?.textContentText)
        } else{
            textContentText= homePageText?.textContentText
        }
        sb.append( textContentText)
        Date date=homePageText.lastChangedDate

        String filename="homepage.bin"
        String text=sb.toString()
        text=encryptEncode(text)
        writeToFile(filename,text)

        filename=swapSpacesWithUnderscore("homepage.qtr")
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        text = dateFormat.format(date);
        writeToFile(filename,text)

//        sb.append("<br>xxXHOME PAGEXxx ")
        return sb.toString()
    }

    boolean isPageOnMenu(String pageId){
        Menu menu =Menu.findByUrlPageIdParameter(stripQuotes(pageId))
        return menu!=null
    }

    Banner getDefaultTopBanner(){
        Banner banner=Banner.findByBannerId('TOP_BANNER')
        return  banner
    }


    Banner getDefaultBottomBanner(){
        Banner banner=Banner.findByBannerId('BOTTOM_BANNER')
        return  banner
    }

    Banner getTopBanner(String pageId){
        Page page
        Banner banner=null
        Template template

        Menu menu =Menu.findByUrlPageIdParameter(stripQuotes(pageId))
        if (menu!=null){
            page=menu.page
            if (page!=null){
                template=page.template
                if (template!=null){
                    banner=template.topBanner
                }
            }
        }
        if (banner==null){
            banner=getDefaultTopBanner()
        }
        return banner
    }



    Banner getBottomBanner(String pageId){
        Page page
        Banner banner=null
        Template template

        Menu menu =Menu.findByUrlPageIdParameter(stripQuotes(pageId))
        if (menu!=null){
            page=menu.page
            if (page!=null){
                template=page.template
                if (template!=null){
                    banner=template.bottomBanner
                }
            }
        }
        if (banner==null){
            banner=getDefaultBottomBanner()
        }
        return banner
    }

    String getTopBannerUrl(String pageId){
        if (pageId==null){
            Banner banner=getDefaultTopBanner()
            if (banner!=null){
                return banner.image.imagePath
            } else{
                return ""
            }
        }
        Images image
        String bannerUrl=" "
        Banner banner=getTopBanner( pageId)
        if (banner!=null){
            image =banner.image
            if (image!=null){
                bannerUrl=image.imagePath
            }
        }
        return bannerUrl;
    }

    String getBottomBannerUrl(String pageId){
        if (pageId==null){
            Banner banner=getDefaultBottomBanner()
            if (banner!=null){
                return banner.image.imagePath
            } else{
                return ""
            }
        }
        Images image
        String bannerUrl=" "
        Banner banner=getBottomBanner( pageId)
        if (banner!=null){
            image =banner.image
            if (image!=null){
                bannerUrl=image.imagePath
            }
        }
        return bannerUrl;
    }





    String homePageMenu(){
        if (setups!=null && setups.size()>0){
            return " "
        }
        return " "
    }

    String templateGspFile(){
        Setup setup =Setup.findBySetupId("MASTER_RECORD")
        String templateGspFile= setup?.siteTemplate?.templateJspFile
        if (templateGspFile==null||templateGspFile.length()<1){
            templateGspFile=""
        }
        return templateGspFile
    }

    String stripQuotes(String line){
        return line.replace("\"", "").trim()
    }


    void cacheContentForPageOnMenu(String pageId){
        if (pageId==null){
            return
        }
        StringBuilder sb=new StringBuilder()
        Menu menu =Menu.findByUrlPageIdParameter(stripQuotes(pageId))
        Date date=new Date()
        if (menu!=null){
            sb.append("<h2>${menu?.label}</h2> ")
            Page page=menu.page
            if (page!=null){
                List<TextContent> pageContents = TextContent.findAllByPage(page)
                if (pageContents!=null){
                    for (TextContent content:pageContents){
                        sb.append(decryptDecode(content.textContentText))
                        content.lastChangedDate=date
                        content.save(flush: true)
                    }
                }
            }
        }


        String filename=swapSpacesWithUnderscore(pageId)+".bin"
        String text=sb.toString()
        text=encryptEncode(text)
        writeToFile(filename,text)

        filename=swapSpacesWithUnderscore(pageId)+".qtr"
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        text = dateFormat.format(date);
        writeToFile(filename,text)
    }



    String readCachedFileContent(String pageId){
        String filename=swapSpacesWithUnderscore(pageId)+".bin"
        String text=readFile( filename)
        return decryptDecode(text)
    }


    String readCachedFile(String filename){
        String text=readFile( filename)
        return decryptDecode(text)
    }

    private void cacheAllContent(){
        homePageContent()

        List<Menu> menuItems=Menu.findAll()

        for (Menu menuItem:menuItems){
            String pageId =menuItem?.urlPageIdParameter
            println(pageId)
            cacheContentForPageOnMenu(pageId)
        }

    }

    void writeToFile(String filename,String text){
        def file = new File(filename)
        file.text = text
        file.withWriter('UTF-8') { writer ->
            writer.write(text)
        }
        println(file.path+" was saved")
    }

    String readFile(String filename){
        def file = new File(filename)
        String fileContents = file.getText('UTF-8')
        return fileContents
    }


    boolean fileExists(String filename){
        File file = new File(filename)
        return file.exists()
    }

    String swapSpacesWithUnderscore(String text){
        text.replaceAll(" ","_")
        return text
    }

    public static String decryptDecode(String text){
        Base64Wrapper base64= new Base64Wrapper()
        return base64.decode(text)
    }

    public static String encryptEncode(String text){
        Base64Wrapper base64= new Base64Wrapper()
        return base64.encode(text);
    }
}
