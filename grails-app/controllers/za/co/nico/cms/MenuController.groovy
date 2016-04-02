package za.co.nico.cms

import groovy.xml.Entity

class MenuController {
//    def index() { }

    def cancelMenuDetails(){
        chain(controller: "menu", action: "menuManager")
    }
    def saveMenuDetails(){
        String operation=  params.operation
        String menuId= params.menuId
        String label= params.label
        String pageId= params.pageId
        boolean isSideMenu= params.isSideMenu
        boolean isTopMenu= params.isTopMenu

        Page page=Page.findByPageId(pageId)
        println("menuId :->${menuId}<- | operation :${operation}")
        Menu menu= Menu.findByMenuId(menuId)

        if (operation.equalsIgnoreCase("EDIT")&& menu!=null){
            menu.label= label
            menu.page= page
            menu.isTopMenu= isTopMenu
            menu.isSideMenu= isSideMenu
            menu.save(flush: true)
            println("saved EDITED menuId ${menuId}")

        } else if (operation.equalsIgnoreCase("ADD")&& menu==null){
            Menu nmu= new Menu(
                    menuId            :menuId
                    , label             :label
                    , page              :page
                    , isTopMenu         :isTopMenu
                    , isSideMenu        :isSideMenu
                    ,urlPageIdParameter :menuId
            )
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

    def scaffold = true
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
        String menuId= params.menuId // menuId
        String label= params.label
        boolean isSideMenu= params.isSideMenu
        boolean isTopMenu= params.isTopMenu
        String pageId= params.pageId
        String urlPageIdParameter=params.label

        Page page=Page.findByPageId(pageId)
        println("persisting Menu | menuId :->${menuId}<- | operation :${operation}")


        if (operation.equalsIgnoreCase("EDIT")){
            Menu menu= Menu.findByMenuId(menuId)
            menu.label= label
            menu.page= page
            menu.isTopMenu= isTopMenu
            menu.isSideMenu= isSideMenu
            menu.urlPageIdParameter=urlPageIdParameter
            menu.save(flush: true)
            println("saved EDITED menu: ${menu.toString()}")

        } else if (operation.equalsIgnoreCase("ADD")){
            new Menu(menuId: menuId,urlPageIdParameter:urlPageIdParameter,label: label,page: page,isTopMenu: isTopMenu,isSideMenu: isSideMenu).save(flush: true)
            Menu menu= Menu.findByMenuId(menuId)
            println("saved NEW menu: ${menu.toString()}")
        } else{
            println("Unknown menu Opreation : ${operation}")
        }

        chain(controller: "menu", action: "menuManager")

    }
}
