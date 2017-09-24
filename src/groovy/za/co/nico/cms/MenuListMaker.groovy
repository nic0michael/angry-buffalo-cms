package za.co.nico.cms

/**
 * Created by nickm on 2017/08/21.
 */
class MenuListMaker {

    static void setAllMenuUrls() {
        List<Menu> menus = makeMenuList()
        for (Menu menu : menus) {
            menu.menuURL = menu.showUrl()
            menu.save(flush: true)
        }
    }

    public static makeMenuList() {
        List<Menu> menus = Menu.findAll([sort: "menuOrder", order: "asc"]);
        return menus;
    }

    public static makeTopMenuList(String siteIdLc) {
        String siteId = siteIdLc.toUpperCase()
        List<Menu> menus = new ArrayList<>()
        List<Menu> allMenus = Menu.findAll([sort: "menuOrder", order: "asc"]);
        for (Menu menu : allMenus) {
            if (menu.isTopMenu && menu.site.siteId.equals(siteId)) {
                menus.add(menu)
            }
        }
        return menus;
    }


    public static makeSideMenuList() {
        List<Menu> menus = new ArrayList<>()
        List<Menu> allMenus = Menu.findAll([sort: "menuOrder", order: "asc"]);
        for (Menu menu : allMenus) {
            if (menu.isSideMenu) {
                menus.add(menu)
            }
        }
        return menus;
    }

    public static Menu findMenu(String pageId, String siteIdLC) {
        String htmlPage
        try {
            htmlPage = Site.findBySiteId(siteIdLC.toUpperCase()).htmlPage
        } catch (Exception e) {
        }
        String menuURL = makeMenuURL(htmlPage, pageId, siteIdLC)
        if(menuURL.equals("index")){
            List<Menu>menus=Menu.findAll()
            Menu menu= menus.get(0)
            if(menu==null){
                menu=new Menu()
            }
            return menu
        }
        Menu menu = Menu.findByMenuURL(menuURL)
        return menu
    }

    public static String makeMenuURL(String pageId, String siteIdLC) {
        Site site = Site.findBySiteId(siteIdLC.toUpperCase())
        if (site == null) {
            return "index"
        }
        String htmlPage = site.htmlPage
        String menuURL = htmlPage + "?page_id=" + pageId + "&site_id=" + siteIdLC
        return menuURL
    }

    public static List<Menu> getBootstrapMenuItemChildren(Menu parentMenu) {
        List<MenuHierarchy> menuitems = MenuHierarchy.findAll();
        List<Menu> children = new ArrayList<>()
        for (MenuHierarchy menuitem : menuitems) {
            if(menuitem?.parent?.menuURL.equals(parentMenu?.menuURL))
            children.add(menuitem.child)
        }

        return children
    }


}
