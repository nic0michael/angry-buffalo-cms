package za.co.nico.cms

class EditParameters {
    String textContentId
    String textContentType
    String textContentText


    String menuId
    String menuLabel
    Page menuPage
    boolean isTopMenu
    boolean isSideMenu


    String catgoryId
    String title
    String description
    boolean published

    static constraints = {
        textContentText(blank:true, nullable:true, maxSize:1000)
    }
}
