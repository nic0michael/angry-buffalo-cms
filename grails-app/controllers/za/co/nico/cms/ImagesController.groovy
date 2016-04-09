package za.co.nico.cms

class ImagesController {
    def scaffold = true
//    def index() { }

    def addImage(){
        chain(action: "imageAddChange", params: [operation: "ADD"])
    }
    def editImage(){
        String imageId  = params.imageId
//        Images image= Images.findByImageId(imageId)
        chain(action: "imageAddChange", params: [operation: "EDIT",imageId:imageId])
    }
    def deleteImage(){
        String imageId  = params.imageId
        Images image= Images.findByImageId(imageId)
        image.delete(flush: true)
        chain(action: "imageManager")
    }

    def imageManager(){}
    def imageAddChange(){

        String operation=  params.operation
        String imageId= params.imageId
        println("imageId :->${imageId}<- | operation :${operation}")
        Images image= Images.findByImageId(imageId)

        [image:image,operation:operation]
    }

    def imageSave(){

        String operation=  params.operation
        String imageId= params.imageId
        String imageFileName=params.imageFileName
        String imagePath=params.imagePath
        String imageTitle=params.imageTitle
        String publishedSt=params.published
        boolean published=false
        if (publishedSt!=null){
            published=publishedSt.equalsIgnoreCase("on")
        }
        println("imageId :->${imageId}<- | operation :${operation}")
        Images image= Images.findByImageId(imageId)

        if (operation.equalsIgnoreCase("EDIT") && image!=null) {
            image.imageTitle=imageTitle
            image.imageFileName=imageFileName
            image.imagePath=imagePath
            image.published=published
            image.save(flush: true)
            println("EDIT Updated image ${image.toString()}")

        } else if (operation.equalsIgnoreCase("ADD") && image==null) {
            new Images(imageId:imageId,imageTitle:imageTitle,imageFileName:imageFileName,imagePath:imagePath,published:published).save(flush: true)
            image =Images.findByImageId(imageId)
            println("ADD Inserted image ${image.toString()}")
        }

        chain(controller: "images", action: "imageManager")

    }
    def imageDelete(){}
}
