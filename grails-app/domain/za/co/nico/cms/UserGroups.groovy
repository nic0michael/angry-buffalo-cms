package za.co.nico.cms

class UserGroups {
    String userGroupId
    Permissions access
    Date lastChanged

    static constraints = {
        userGroupId(blank:false, nullable:false, unique:true, maxSize:45)
    }

    String toString(){return "${userGroupId} | ${access.toString()}"}
}
