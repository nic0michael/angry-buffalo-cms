package za.co.nico.cms

class Categories {
    String categoryId
    String title
    String description
    boolean published

    static constraints = {
        categoryId(blank:false, nullable:false, unique:true, maxSize:45)
    }
    String toString(){return "${categoryId} | ${title} | ${description}"}
}
