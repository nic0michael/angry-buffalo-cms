package za.co.nico.cms

class Images {

    String imageId
    String imageTitle
    String imageFileName
    String imagePath
    boolean published

    static constraints = {
        imageId(blank:false, nullable:false, unique:true, maxSize:45)
    }
    String toString(){return "${imageId} | ${imageTitle} | ${imageFileName}"}
}
