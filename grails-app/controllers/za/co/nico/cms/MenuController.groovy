package za.co.nico.cms

class MenuController {
//    def index() { }
    def scaffold = true

    def cancelMenuDetails(){
        chain(controller: "menu", action: "menuManager")
    }
    def saveMenuDetails(){
        String operation=  params.operation
        String menuId= params.menuId
        String label= params.label
        String isSideMenuSt= params.isSideMenu
        String isTopMenuSt= params.isTopMenu
        String pageId= params.pageId
        String siteId=params.siteId
        String menuOrderSt=params.menuOrder
        String menuURL=params.menuURL
        String pageFileName=params.pageFileName



        int menuOrder=menuOrderSt.toInteger()
        Site site=Site.findBySiteId(siteId)
        Page page=Page.findByPageId(pageId)
        boolean isTopMenu =false
        boolean isSideMenu=false
        if(isSideMenuSt!=null){
            isSideMenu=isSideMenuSt.equals("on")
        }
        if(isTopMenuSt!=null){
            isTopMenu=isTopMenuSt.equals("on")
        }

        println("menuId :->${menuId}<- | operation :${operation}")
        Menu menu= Menu.findByMenuId(menuId)


        if (operation.equalsIgnoreCase("EDIT")&& menu!=null){
            menu.menuOrder=menuOrder
            menu.site=site
            menu.label= label
            menu.page= page
            menu.isTopMenu= isTopMenu
            menu.isSideMenu= isSideMenu
            if(menuURL!=null && menuURL.length()>3){
                menu.menuURL=menuURL
            }else {
                menu.makeMenuUrl()
            }
            menu.makePageFileName()
            menu.save(flush: true)
            println("saved EDITED menuId ${menuId}")

        } else if (operation.equalsIgnoreCase("ADD")&& menu==null){
            Menu nmu= new Menu(
                    menuOrder: menuOrder
                    ,site: site
                    , menuId            :menuId
                    , label             :label
                    , page              :page
                    , isTopMenu         :isTopMenu
                    , isSideMenu        :isSideMenu
                    ,urlPageIdParameter :'index'
            )

            nmu.makeMenuUrl( )
            nmu.makePageFileName()
            nmu.save(flush: true)
            println("saved NEW menuId ${nmu?.menuId}")
        }

        chain(controller: "menu", action: "menuManager")

    }

    def add(){
        chain(action: "menuEditor", params: [operation: "ADD"])
    }
    def editText(){
        String menuId  = params.menuId
        Menu menu=Menu.findByMenuId(menuId)

        String textContentId  = params.textContentId
        TextContent textContent= TextContent.findByTextContentId(textContentId)
        chain(action: "menuEditor", params: [operation: "EDIT",menuId:menuId])
    }
    def delete(){
        String menuId  = params.menuId
        Menu menu=Menu.findByMenuId(menuId)
        menu.delete(flush: true)
        chain(action: "menuManager")
    }


    def menuManager(){

    }
    def menuEditor(){

        String operation=  params.operation
        String menuId= params.menuId
        println("menuId :->${menuId}<- | operation :${operation}")
        Menu menu= Menu.findByMenuId(menuId)

        [menu:menu,operation:operation]

    }

    def menuSave(){

        String operation=  params.operation
        String menuId= params.menuId
        String label= params.label
        String isSideMenuSt= params.isSideMenu
        String isTopMenuSt= params.isTopMenu
        String pageId= params.pageId
        String siteId=params.siteId
        String menuURL=params.menuURL

        Site site=Site.findBySiteId(siteId)
        Page page=Page.findByPageId(pageId)
        boolean isTopMenu =false
        boolean isSideMenu=false
        if(isSideMenuSt!=null){
            isSideMenu=isSideMenuSt.equals("on")
        }
        if(isTopMenuSt!=null){
            isTopMenu=isTopMenuSt.equals("on")
        }

        println("menuId :->${menuId}<- | operation :${operation}")
        Menu menu= Menu.findByMenuId(menuId)

        if (operation.equalsIgnoreCase("EDIT")&& menu!=null){
            menu.label= label
            menu.page= page
            menu.isTopMenu= isTopMenu
            menu.isSideMenu= isSideMenu
            menu.menuURL=menuURL
            menu.save(flush: true)
            println("saved EDITED menuId ${menuId}")

        } else if (operation.equalsIgnoreCase("ADD")&& menu==null){
            new Menu(menuId: menuId,label: label,page: page,isTopMenu: isTopMenu,isSideMenu: isSideMenu).save(flush: true)
            menu= Menu.findByMenuId(menuId)
            println("saved NEW menuId ${menuId}")
        }

        chain(controller: "menu", action: "menuManager")

    }
}
