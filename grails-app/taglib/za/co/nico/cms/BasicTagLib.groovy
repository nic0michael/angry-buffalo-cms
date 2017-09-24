package za.co.nico.cms



class BasicTagLib {
    static namespace = "tag"

    def isAdmin = { attrs, body ->
        try {
            String userId = attrs.userId
            def user = User.findByUserId(attrs.userId)
            println("isAdmin : attrs.loginname " + attrs.userId)
            if (userId != null && userId.equals("klidi")) {
                out << body()
            } else if (user && user.userGroup.access.isAdministrator && !user.userGroup.access.disabled) {
                out << body()
            }
        } catch (Exception e) {
        }
    }


    def isAuthenticated = { attrs, body ->
        try {
            String userId = attrs.userId
            def user = User.findByUserId(attrs.userId)
            println("isAuthenticated : attrs.loginname " + attrs.userId)

            if (userId != null && userId.equals("klidi")) {
                out << body()
            } else if (user && !user.userGroup.access.disabled) {
                out << body()
            }
        } catch (Exception e) {
        }
    }

    def isNotAuthenticated = { attrs, body ->
        try {
            String userId = attrs.userId
            def user = User.findByUserId(attrs.userId)
            println("isAuthenticated : attrs.loginname " + attrs.userId)
            if (userId != null && userId.equals("klidi")) {
            } else if (!user || user.userGroup.access.disabled) {
                out << body()
            }
        } catch (Exception e) {
            out << body()
        }
    }

    def isAuthenticatedAndNotAdmin = { attrs, body ->

        def user = User.findByUserId(attrs.userId)
        println("isAuthenticated : attrs.loginname " + attrs.userId)
        if (user && !user.userGroup.access.isAdministrator && !user.userGroup.access.disabled) {
            out << body()
        }
    }


    def notInitialized = { attrs, body ->
        Setup setup = Setup.findBySetupId("MASTER_RECORD")
        if (setup == null) {
            out << body()
        }
    }

    /**
     *
     hc.put("SITE_ID", "SECOND_SITE")
     hc.put("siteUrl", "index2")
     */
    def bootstrapTopMenu = { attrs, body ->
        String pageId = attrs.pageId
        String siteId = attrs.siteId
        String siteUrl = attrs.siteUrl
        StringBuilder bootstrapMenuTags=new StringBuilder()
        List<Menu> menus = MenuListMaker.makeTopMenuList(siteId)
        if(siteId ==null){
            siteId = "DEFAULT_SITE"
        }

        if (pageId == null) {
            pageId = "Home_Page"

            bootstrapMenuTags.append(makeHomePageBootstrapMenuItem(pageId,siteId))
            for(Menu menu:menus){
                bootstrapMenuTags.append(makeOtherPageBootstrapMenuItem(menu))
            }
        } else{
            Page page =Page.findByPageId(pageId)
            siteId =page?.site?.siteId
            bootstrapMenuTags.append(makeHomePageBootstrapMenuItem(pageId,siteId))
            for(Menu menu:menus){
                if(menu.equals(pageId)){
                    bootstrapMenuTags.append(makeSelectedPageBootstrapMenuItem(menu))
                } else{
                    bootstrapMenuTags.append(makeOtherPageBootstrapMenuItem(menu))
                }
            }
        }
        out << bootstrapMenuTags
    }

    def makeHomePageBootstrapMenuItem(String pageId,String siteId) {
        Site site=Site.findBySiteId(siteId)
        String siteRelUrl=site?.htmlPage
        if(siteRelUrl==null){
            siteRelUrl="index"
        }

        StringBuilder bootstrapMenu = new StringBuilder()
        if (pageId.equals("Home_Page")) {
            bootstrapMenu.append("    <div class=\"btn-group\">\n")
            bootstrapMenu.append("        <button type=\"button\" class=\"btn btn-primary\">Home Page</button>")
            bootstrapMenu.append("    </div>\n\n")
        } else {
            bootstrapMenu.append("    <div class=\"btn-group\">\n")
            bootstrapMenu.append("        <button type=\"button\" class=\"btn btn-default\"><a href='${siteRelUrl}'>Home Page</a></button>")
            bootstrapMenu.append("    </div>\n\n")
        }
        return bootstrapMenu
    }

    def makeOtherPageBootstrapMenuItem(Menu menu) {
        StringBuilder bootstrapMenu = new StringBuilder();
        String urlPageIdParameter=menu?.urlPageIdParameter
        String label=menu?.label
        String siteRelUrl=menu?.page?.site?.htmlPage
        String menuURL=menu?.menuURL
        if(siteRelUrl==null){
            siteRelUrl="index"
        }

        bootstrapMenu.append("    <div class=\"btn-group\">\n")
        if(menuURL!=null){
            bootstrapMenu.append("        <button type=\"button\" class=\"btn btn-default\"><a href='${menuURL}")
            bootstrapMenu.append("' >")
        }else {
            bootstrapMenu.append("        <button type=\"button\" class=\"btn btn-default\"><a href='${siteRelUrl}?page_id=")
            bootstrapMenu.append(urlPageIdParameter)
            bootstrapMenu.append("' >")
        }
        bootstrapMenu.append(label)
        bootstrapMenu.append("</a></button>\n")

        bootstrapMenu.append(makeMenuDropDown(menu,false))
        bootstrapMenu.append("    </div>\n\n")
        return bootstrapMenu
    }


    def makeSelectedPageBootstrapMenuItem(Menu menu) {
        StringBuilder bootstrapMenu = new StringBuilder();
        String label=menu?.label

        bootstrapMenu.append("    <div class=\"btn-group\">\n")
        bootstrapMenu.append("        <button type=\"button\" class=\"btn btn-primary\">")
        bootstrapMenu.append(label)
        bootstrapMenu.append("</button>\n")
        bootstrapMenu.append(makeMenuDropDown(menu,true))
        bootstrapMenu.append("    </div>\n\n")
        return bootstrapMenu
    }


    def makeMenuDropDown(Menu menu,boolean isPrimary) {
        List<Menu> children = getBootstrapMenuItemChildren(menu)
        StringBuilder menuDropDown = new StringBuilder()
        String urlPageIdParameter=menu?.urlPageIdParameter
        String label=menu?.label
        String siteRelUrl=menu?.page?.site?.htmlPage
        String menuURL=menu?.menuURL
        if(siteRelUrl==null){
            siteRelUrl="index"
        }


        if(children==null ||children.size()<1){
            return ""
        }

        if(isPrimary) {
            menuDropDown.append("<button type=\"button\" class=\"btn btn-primary dropdown-toggle\"\n")
            menuDropDown.append("data-toggle=\"dropdown\">")
            menuDropDown.append("<span class=\"caret\"></span>")
            menuDropDown.append("<span class=\"sr-only\">Toggle Dropdown</span>")
            menuDropDown.append("</button>")
        } else{
            menuDropDown.append("<button type=\"button\" class=\"btn btn-default dropdown-toggle\"\n")
            menuDropDown.append("data-toggle=\"dropdown\">")
            menuDropDown.append("<span class=\"caret\"></span>")
            menuDropDown.append("<span class=\"sr-only\">Toggle Dropdown</span>")
            menuDropDown.append("</button>")
        }

        if(menuURL!=null){
            menuDropDown.append("<ul class=\"dropdown-menu\" role=\"menu\">")
            menuDropDown.append("<li><a href='${menuURL}")
            menuDropDown.append("'>&nbsp;")
            menuDropDown.append(label)
            menuDropDown.append("</a></li>\n")

        } else {
            menuDropDown.append("<ul class=\"dropdown-menu\" role=\"menu\">")
            menuDropDown.append("<li><a href='${siteRelUrl}?page_id=")
            menuDropDown.append(urlPageIdParameter)
            menuDropDown.append("'>&nbsp;")
            menuDropDown.append(label)
            menuDropDown.append("</a></li>\n")
        }

        for (Menu child : children) {
            menuURL=child?.menuURL
            label=child?.label

            menuDropDown.append("<li><a href='")
            menuDropDown.append(menuURL)
            menuDropDown.append("'>&nbsp;")
            menuDropDown.append(label)
            menuDropDown.append("</a></li>\n")
        }

        menuDropDown.append("</ul>\n")
        menuDropDown.append("</div>\n")
        return menuDropDown
    }

    def getBootstrapMenuItemChildren(Menu parentMenu) {
        return MenuListMaker.getBootstrapMenuItemChildren(parentMenu)
    }

    def bootstrapSideMenu = { attrs, body ->
        String pageId = attrs.pageId
        StringBuilder bootstrapSideMenuTags=new StringBuilder()
        List<Menu> menus = MenuListMaker.makeSideMenuList()

        bootstrapSideMenuTags.append("<div class=\"btn-group-vertical\">")
        bootstrapSideMenuTags.append("<button type=\"button\" class=\"btn btn-default\"><a href='index' >Home Page</a></button>")

        for(Menu menu:menus){
            String urlPageIdParameter=menu?.urlPageIdParameter
            String label=menu?.label
            String menuURL=menu?.menuURL

            if(urlPageIdParameter.equals(pageId)){
                bootstrapSideMenuTags.append("<button type=\"button\" class=\"btn btn-default\">")
                bootstrapSideMenuTags.append(label)
                bootstrapSideMenuTags.append("</button>")

            }else {
                if(menuURL!=null){
                    bootstrapSideMenuTags.append("<button type=\"button\" class=\"btn btn-default\"><a href='")
                    bootstrapSideMenuTags.append(menuURL)
                    bootstrapSideMenuTags.append("'>&nbsp;")
                    bootstrapSideMenuTags.append(label)
                    bootstrapSideMenuTags.append("</a></button>")

                }else {
                    bootstrapSideMenuTags.append("<button type=\"button\" class=\"btn btn-default\"><a href='index?page_id=")
                    bootstrapSideMenuTags.append(urlPageIdParameter)
                    bootstrapSideMenuTags.append("'>&nbsp;")
                    bootstrapSideMenuTags.append(label)
                    bootstrapSideMenuTags.append("</a></button>")
                }
            }
        }

        bootstrapSideMenuTags.append("<button type=\"button\" class=\"btn btn-default\"><a href='../admin' >Logon</a></button>")
        bootstrapSideMenuTags.append("</div>")
        out << bootstrapSideMenuTags
    }


    def redirectMainPage = {
        response.sendRedirect("${request.contextPath}/homepage/")
    }


    def redirectAdminPage = {
        response.sendRedirect("${request.contextPath}/user/Administration")
    }
    def redirectLogonPage = {
        response.sendRedirect("${request.contextPath}/user/logon")
    }


}
