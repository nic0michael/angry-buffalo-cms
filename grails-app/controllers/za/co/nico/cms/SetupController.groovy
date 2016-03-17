package za.co.nico.cms

import za.co.nico.cms.constants.BannerURL

class SetupController {
    Base64Wrapper base64=new Base64Wrapper()


//    def index() { }
    def scaffold = true
    def presetTheData(){

        def thePermissions = [
                [permissionId: "UNASSIGNED", accessLevel: 0, description: 'loggedin user', isAdministrator: false, isEditor: false, isPublisher: false, isVisitor: false, disabled: true],
                [permissionId: "DISABBLED", accessLevel: 0, description: 'loggedin user', isAdministrator: false, isEditor: false, isPublisher: false, isVisitor: false, disabled: true],
                [permissionId: "VISITOR", accessLevel: 1, description: 'loggedin user', isAdministrator: false, isEditor: false, isPublisher: false, isVisitor: true, disabled: false],
                [permissionId: "USER", accessLevel: 1, description: 'loggedin user', isAdministrator: false, isEditor: false, isPublisher: false, isVisitor: true, disabled: false],
                [permissionId: "EDITOR", accessLevel: 2, description: 'loggedin user', isAdministrator: false, isEditor: false, isPublisher: true, isVisitor: false, disabled: false],
                [permissionId: "PUBLISHER", accessLevel:3, description: 'loggedin user', isAdministrator: false, isEditor: true, isPublisher: true, isVisitor: false, disabled: false],
                [permissionId: "ADMIN", accessLevel: 9, description: 'loggedin user', isAdministrator: true, isEditor: true, isPublisher: true, isVisitor: false, disabled: false]
        ]
        thePermissions.each {
            new Permissions(it).save(flush: true)
        }

        Permissions  unassignedP=Permissions.findByPermissionId("UNASSIGNED")
        Permissions  editorsP=Permissions.findByPermissionId("EDITOR")
        Permissions  administratorsP=Permissions.findByPermissionId("ADMIN")
        if(unassignedP==null){
            println("no data in unassignedP")
        } else{
            println(" unassignedP =${unassignedP.toString()}")
        }

        UserGroups unassignedUG =new UserGroups(
            userGroupId:'UNASSIGNED_UG'
            ,access:unassignedP
            ,lastChanged :new Date()  ).save(flush: true)

        UserGroups editorsUG =new UserGroups(
                userGroupId:'EDITORS_UG'
                ,access:editorsP
                ,lastChanged :new Date()  ).save(flush: true)

        UserGroups administratorsUG =new UserGroups(
                userGroupId:'ADMINISTRATORS_UG'
                ,access:administratorsP
                ,lastChanged :new Date()  ).save(flush: true)

        unassignedUG=UserGroups.findByUserGroupId('UNASSIGNED_UG')

        User unassignedU =new User(userId: "UNASSIGNED", password: "*******", fullName: "unassigned", emailAddress: "unassigned@unassigned.co.za", cellPhone: "0000", userGroup: unassignedUG,lastChanged:new Date()).save(flush: true)

        User klidi2U =new User(userId: "klidi", password: "P@55w0rd", fullName: "admin kl", emailAddress: "unassigned@unassigned.co.za", cellPhone: "0000", userGroup: administratorsUG,lastChanged:new Date()).save(flush: true)

        User adminU =new User(userId: "admin", password: "P@55w0rd", fullName: "admin kl", emailAddress: "unassigned@unassigned.co.za", cellPhone: "0000", userGroup: administratorsUG,lastChanged:new Date()).save(flush: true)

        User editorU =new User(userId: "editor", password: "P@55w0rd", fullName: "editor", emailAddress: "unassigned@unassigned.co.za", cellPhone: "0000", userGroup: editorsUG,lastChanged:new Date()).save(flush: true)

        unassignedU=User.findByUserId("UNASSIGNED")

        new Categories(categoryId:'DEFAULT',title:'Default Categories',description:'Default Categories',published: true).save(flush: true)
        Categories defaultC=Categories.findByCategoryId('DEFAULT')


        Images a1= new Images(imageId:'UNASSIGNED'         ,imageTitle:'bottom banner image' ,imageFileName:'unassignedBannerImage.jpg'          ,imagePath:'/cmscontent/images/'             ,published:true).save(flush: true)
        a1= new Images(imageId:'DARK_RED720X220'    ,imageTitle:'top banner image'    ,imageFileName:BannerURL.DARK_RED720X220_FILE       ,imagePath:BannerURL.DARK_RED720X220_URL     ,published:true).save(flush: true)
        a1= new Images(imageId:'DARK_RED720X90'     ,imageTitle:'bottom banner image' ,imageFileName:BannerURL.DARK_RED720X90_FILE        ,imagePath:BannerURL.DARK_RED720X90_URL      ,published:true).save(flush: true)
        a1= new Images(imageId:'DARK_GREEN720X220'  ,imageTitle:'top banner image'    ,imageFileName:BannerURL.DARK_GREEN720X220_FILE     ,imagePath:BannerURL.DARK_GREEN720X220_URL   ,published:true).save(flush: true)
        a1= new Images(imageId:'DARK_GREEN720X90'   ,imageTitle:'bottom banner image' ,imageFileName:BannerURL.DARK_GREEN720X90_FILE      ,imagePath:BannerURL.DARK_GREEN720X90_URL    ,published:true).save(flush: true)
        a1= new Images(imageId:'DARK_BLUE720X220'   ,imageTitle:'top banner image'    ,imageFileName:BannerURL.DARK_BLUE720X220_FILE      ,imagePath:BannerURL.DARK_BLUE720X220_URL    ,published:true).save(flush: true)
        a1= new Images(imageId:'DARK_BLUE720X90'    ,imageTitle:'bottom banner image' ,imageFileName:BannerURL.DARK_BLUE720X90_FILE       ,imagePath:BannerURL.DARK_BLUE720X90_URL     ,published:true).save(flush: true)
        a1= new Images(imageId:'LIGHT_RED_720X220'  ,imageTitle:'top banner image'    ,imageFileName:BannerURL.LIGHT_RED_720X220_FILE     ,imagePath:BannerURL.LIGHT_RED_720X220_URL   ,published:true).save(flush: true)
        a1= new Images(imageId:'LIGHT_RED_720X90'   ,imageTitle:'bottom banner image' ,imageFileName:BannerURL.LIGHT_RED_720X90_FILE      ,imagePath:BannerURL.LIGHT_RED_720X90_URL    ,published:true).save(flush: true)
        a1= new Images(imageId:'LIGHT_GREEN_720X220',imageTitle:'top banner image'    ,imageFileName:BannerURL.LIGHT_GREEN_720X220_FILE   ,imagePath:BannerURL.LIGHT_GREEN_720X220_URL ,published:true).save(flush: true)
        a1= new Images(imageId:'LIGHT_GREEN_720X90' ,imageTitle:'bottom banner image' ,imageFileName:BannerURL.LIGHT_GREEN_720X90_FILE    ,imagePath:BannerURL.LIGHT_GREEN_720X90_URL  ,published:true).save(flush: true)
        a1= new Images(imageId:'iLIGHT_BLUE_720X220',imageTitle:'top banner image'    ,imageFileName:BannerURL.iLIGHT_BLUE_720X220_FILE   ,imagePath:BannerURL.iLIGHT_BLUE_720X220_URL ,published:true).save(flush: true)
        a1= new Images(imageId:'iLIGHT_BLUE_720X90' ,imageTitle:'bottom banner image' ,imageFileName:BannerURL.iLIGHT_BLUE_720X90_FILE    ,imagePath:BannerURL.iLIGHT_BLUE_720X90_URL  ,published:true).save(flush: true)
        a1= new Images(imageId:'GOLD_720X220'       ,imageTitle:'top banner image'    ,imageFileName:BannerURL.GOLD_720X220_FILE          ,imagePath:BannerURL.GOLD_720X220_URL        ,published:true).save(flush: true)
        a1= new Images(imageId:'GOLD_720X90'        ,imageTitle:'bottom banner image' ,imageFileName:BannerURL.GOLD_720X90_FILE           ,imagePath:BannerURL.GOLD_720X90_URL         ,published:true).save(flush: true)
        a1= new Images(imageId:'ORANGE_720X220'     ,imageTitle:'top banner image'    ,imageFileName:BannerURL.ORANGE_720X220_FILE        ,imagePath:BannerURL.ORANGE_720X220_URL      ,published:true).save(flush: true)
        a1= new Images(imageId:'ORANGE_720X90'      ,imageTitle:'bottom banner image' ,imageFileName:BannerURL.ORANGE_720X90_FILE         ,imagePath:BannerURL.ORANGE_720X90_URL       ,published:true).save(flush: true)
        a1= new Images(imageId:'PINK_720X220'       ,imageTitle:'top banner image'    ,imageFileName:BannerURL.PINK_720X220_FILE          ,imagePath:BannerURL.PINK_720X220_URL        ,published:true).save(flush: true)
        a1= new Images(imageId:'PINK_720X90'        ,imageTitle:'bottom banner image' ,imageFileName:BannerURL.PINK_720X90_FILE           ,imagePath:BannerURL.PINK_720X90_URL         ,published:true).save(flush: true)
        a1= new Images(imageId:'GOLD_720X220'       ,imageTitle:'top banner image'    ,imageFileName:BannerURL.GOLD_720X220_FILE          ,imagePath:BannerURL.GOLD_720X220_URL        ,published:true).save(flush: true)
        a1= new Images(imageId:'GOLD_720X90'        ,imageTitle:'bottom banner image' ,imageFileName:BannerURL.GOLD_720X90_FILE           ,imagePath:BannerURL.GOLD_720X90_URL         ,published:true).save(flush: true)
        a1= new Images(imageId:'LIGHT_BLUE_1024X220',imageTitle:'top banner image'    ,imageFileName:BannerURL.LIGHT_BLUE_1024X220_FILE   ,imagePath:BannerURL.LIGHT_BLUE_1024X220_URL ,published:true).save(flush: true)
        a1= new Images(imageId:'LIGHT_BLUE_1024X90' ,imageTitle:'bottom banner image' ,imageFileName:BannerURL.LIGHT_BLUE_1024X90_FILE    ,imagePath:BannerURL.LIGHT_BLUE_1024X90_URL  ,published:true).save(flush: true)

        a1= new Images(imageId:'USERBANNER_1_720X220',imageTitle:'top banner image'    ,imageFileName:BannerURL.USERBANNER_1_720X220_FILE   ,imagePath:BannerURL.USERBANNER_1_720X220_URL ,published:true).save(flush: true)
        a1= new Images(imageId:'USERBANNER_1_720X90' ,imageTitle:'bottom banner image' ,imageFileName:BannerURL.USERBANNER_1_720X90_FILE    ,imagePath:BannerURL.USERBANNER_1_720X90_URL  ,published:true).save(flush: true)
        a1= new Images(imageId:'USERBANNER_2_720X220',imageTitle:'top banner image'    ,imageFileName:BannerURL.USERBANNER_2_720X220_FILE   ,imagePath:BannerURL.USERBANNER_2_720X220_URL ,published:true).save(flush: true)
        a1= new Images(imageId:'USERBANNER_2_720X90' ,imageTitle:'bottom banner image' ,imageFileName:BannerURL.USERBANNER_2_720X90_FILE    ,imagePath:BannerURL.USERBANNER_2_720X90_URL  ,published:true).save(flush: true)
        a1= new Images(imageId:'USERBANNER_3_720X220',imageTitle:'top banner image'    ,imageFileName:BannerURL.USERBANNER_3_720X220_FILE   ,imagePath:BannerURL.USERBANNER_3_720X220_URL ,published:true).save(flush: true)
        a1= new Images(imageId:'USERBANNER_3_720X90' ,imageTitle:'bottom banner image' ,imageFileName:BannerURL.USERBANNER_3_720X90_FILE    ,imagePath:BannerURL.USERBANNER_3_720X90_URL  ,published:true).save(flush: true)
        a1=  new Images(imageId:'NICOS_CMS_BANNER'     ,imageTitle:'bottom banner image',imageFileName:BannerURL.NICOSCMSBANNER_FILE  ,imagePath:BannerURL.NICOSCMSBANNER_URL  ,published:true).save(flush: true)

//        Images TOP_BANNER_IMAGE =Images.findByImageId('LIGHT_GREEN_720X220')
//        Images BOTTOM_BANNER_IMAGE =Images.findByImageId('LIGHT_GREEN_720X90')
        Images TOP_BANNER_IMAGE =Images.findByImageId('NICOS_CMS_BANNER')
        Images BOTTOM_BANNER_IMAGE =Images.findByImageId('iLIGHT_BLUE_720X90')
        Images UNASSIGNED_BANNER =Images.findByImageId('UNASSIGNED')

        Banner TOP_BANNER= new Banner(bannerId:'TOP_BANNER',bannerTitle:'Default Banner',bannerCssClass:'defaultBanner',image:TOP_BANNER_IMAGE,useSiteTitle:true,published:true).save(flush: true)
        Banner BOTTOM_BANNER=new Banner(bannerId:'BOTTOM_BANNER',bannerTitle:'Default Banner',bannerCssClass:'defaultBanner',image:BOTTOM_BANNER_IMAGE,useSiteTitle:true,published:true).save(flush: true)
        new Banner(bannerId:'UNASSIGNED',bannerTitle:'Default Banner',bannerCssClass:'defaultBanner',image:UNASSIGNED_BANNER,useSiteTitle:true,published:true).save(flush: true)
        Banner unassignedB=Banner.findByBannerId('UNASSIGNED')

        println("author:${unassignedU.userId}")
        println("category: ${defaultC.categoryId}")
        println("topBanner:${unassignedB.bannerId},bottomBanner:${unassignedB.bannerId}")
        println("access:${unassignedP.permissionId}")

        Template tmp= new Template( templateId :'DEFAULT_TEMPLATE' ,templateName :'The default template',templateJspFile:'tableTemplate',
                cssPath:'url' ,topBanner:TOP_BANNER,bottomBanner :BOTTOM_BANNER,published:true )
        tmp.save(flush: true)
        println(tmp.errors)
        new Template(templateId:'USER_TEMPLATE1',templateName:'The user template 1',templateJspFile:'tableTemplateRed',
                cssPath:'url',topBanner:TOP_BANNER,bottomBanner:BOTTOM_BANNER,published:true).save(flush: true)

        new Template(templateId:'USER_TEMPLATE2',templateName:'The user template 2',templateJspFile:'tableTemplateGold',
                cssPath:'url',topBanner:TOP_BANNER,bottomBanner:BOTTOM_BANNER,published:true).save(flush: true)

        Template template=Template.findByTemplateId('DEFAULT_TEMPLATE')

        Page pg= new Page(
                pageId    :'DEFAULT_PAGE'
                ,title     :'Default Page'
                ,pageUrl   :'url'
                ,author    :unassignedU
                ,category  :defaultC
                ,template  :template
                ,access    :unassignedP
                ,published :true
        ).save(flush: true)
        Page defaultP=Page.findByPageId('DEFAULT_PAGE')


        Page homPg= new Page(
                pageId    :'HOME_PAGE'
                ,title     :'Home Page'
                ,pageUrl   :'url'
                ,author    :unassignedU
                ,category  :defaultC
                ,template  :template
                ,access    :unassignedP
                ,published :true
        ).save(flush: true)
        Page homePg=Page.findByPageId('HOME_PAGE')

        println("defaultP: ${defaultP?.pageId}")
//        String testContent="Hello this page is under construction <br><br><br>(<b>Default content</b>) "
        String textContent="""<p>This is a <span style=\"font-size:14px\"><span style=\"font-family:comic sans ms,cursive\"><strong>Content Managed&nbsp;Server</strong></span></span>&nbsp; (CMS) all the web pages displayed on this website are not hand written by a human but&nbsp;are generated from content stored in the database</p>\n""" +
                "\n" +
                "<h1>Congratulations you have successfully installed Angry BuffaloCMS</h1>\n" +
                "\n<br><br>Now you need to log in and add content to the site<br><br>"+
                "<p>Today we will be going to demonstrate the Grails CMS web server we have been developing to the CMS user Community<br />\n" +
                "&nbsp;</p><br><br><a href='../admin' target='_blank'>Login</a>"

        TextContent defaultText=new TextContent(textContentId:'DEFAULT_CONTENT',textContentType:'HTML',textContentText:textContent,lastChangedDate:new Date(),encoding:0,pageOrder:1, homePageOrder:1,page:defaultP,addTofrontPage:true).save(flush: true)

        defaultText=TextContent.findByTextContentId('DEFAULT_CONTENT')
        TextContent homepageText=new TextContent(textContentId:'HOMEPAGE_CONTENT',textContentType:'HTML',textContentText:textContent,lastChangedDate:new Date(),encoding:0,pageOrder:1, homePageOrder:1,page:homePg,addTofrontPage:true).save(flush: true)

        homepageText=TextContent.findByTextContentId('HOMEPAGE_CONTENT')

        println("defaultText: ${defaultText.textContentId}")

        new Setup(setupId:'MASTER_RECORD',siteTemplate:template,homePageText: homepageText,homePageTitle:'My Website | Home Page',siteTitle :'My CMS WebSite',siteCopyright:'Copyright@AngryBuffaloCMS 2016',siteCSSCode:'empty'
                ,menuBackgroundColour:"#6CA3FF",menuHoverColour:"#ffffff",menuSelectedColour:"#000088",menuColour:"#8aa3ff",enabled:true).save(flush: true)
        Setup setup =Setup.findBySetupId("MASTER_RECORD")

        new Menu(menuId:'MENU_ITEM_PAGE1',label:'Page 1',urlPageIdParameter:'page1',page:defaultP,isTopMenu:true,isSideMenu:true).save(flush: true)
        new Menu(menuId:'MENU_ITEM_PAGE2',label:'Page 2',urlPageIdParameter:'page2',page:defaultP,isTopMenu:true,isSideMenu:true).save(flush: true)

        Menu menu=Menu.findByMenuId('MENU_ITEM_PAGE1')



        chain(controller: "user", action: "Administration")
    }
}
