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
        String parentMenuId=  params.parentMenuId
        String childMenuId= params.childMenuId
        if (parentMenuId!=null && childMenuId!=null){
            Menu parent= Menu.findByMenuId(parentMenuId)
            Menu child =Menu.findByMenuId(childMenuId)
            MenuHierarchy menuHierarchy=new MenuHierarchy( parent,child).save(flush: true)
        }
        chain(controller: "menuHierarchy", action: "insert")
    }
}
