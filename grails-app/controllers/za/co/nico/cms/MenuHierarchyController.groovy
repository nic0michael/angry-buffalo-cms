package za.co.nico.cms

class MenuHierarchyController {

    def scaffold = true
//    def index() { }
    def insert(){
        List<Menu>menus=Menu.findAll()
        List<MenuHierarchy>menuHierarchies=MenuHierarchy.findAll()
        [menus:menus,menuHierarchies:menuHierarchies]
    }

    def menuSave(){
        String parentPageId=  params.parentPageId
        String menuIdStr= params.childId
        if (parentPageId!=null && menuIdStr!=null){
            int menuId = menuIdStr.toInteger()
            Menu child =Menu.findById(menuId)
            MenuHierarchy menuHierarchy=new MenuHierarchy( parentPageId,child).save(flush: true)
        }
        chain(controller: "menuHierarchy", action: "insert")
    }
}
