package za.co.nico.cms

class User {

    String userId
    String password
    String fullName
    String emailAddress
    String cellPhone
    UserGroups userGroup
    Date lastChanged

    static constraints = {
        userId(blank:false, nullable:false, unique:true, maxSize:45)
        password(blank:false, nullable:false, password:true, maxSize:15)
        fullName(blank:false, nullable:false, maxSize:25)
        cellPhone(blank:false, nullable:false, maxSize:12)
        emailAddress(email: true,blank:false, nullable: false)
    }

    String toString(){return "${userId} | ${fullName}"}
}
