package za.co.nico.cms

class MenuHierarchy {
    String parentPageId
    Menu child

    static constraints = {
        parentPageId(blank:false, nullable:false) //, unique:true)
        child(blank:false, nullable:false,unique: ['parentPageId'])
    }

    public MenuHierarchy(String parentPageId,Menu child){
        this.parentPageId=parentPageId
        this.child=child
    }

    public MenuHierarchy(Menu parent,Menu child){
        this.parentPageId=parent?.page?.pageId
        this.child=child
    }
}
