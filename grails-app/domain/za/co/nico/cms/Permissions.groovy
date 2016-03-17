package za.co.nico.cms

class Permissions {
    String permissionId
    int accessLevel
    String description
    boolean isAdministrator
    boolean isEditor
    boolean isPublisher
    boolean isVisitor
    boolean disabled

    static constraints = {
        permissionId(blank:false, nullable:false, unique:true, maxSize:25)
        description(blank:false, nullable:false)
    }

    String toString(){return "${permissionId} | ${description}"}
}
