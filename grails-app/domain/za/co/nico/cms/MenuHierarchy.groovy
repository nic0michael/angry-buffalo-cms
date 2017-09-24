package za.co.nico.cms

class MenuHierarchy {
    Menu parent
    Menu child

    static constraints = {
        parent(blank:false, nullable:false)
        child(blank:false, nullable:false,unique:true)
    }



    public MenuHierarchy(Menu parent,Menu child){
        this.parent=parent
        this.child=child
    }

    String toString(){
        return "Child: "+child.menuId+" parent: "+parent.menuId
    }

}
