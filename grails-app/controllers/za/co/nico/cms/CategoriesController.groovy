package za.co.nico.cms

class CategoriesController {

//    def index() { }
    def scaffold = true

    def add(){
        chain(action: "categoryEditor", params: [operation: "ADD"])
    }
    def editText(){
        String categoryId  = params.categoryId
        chain(action: "categoryEditor", params: [operation: "EDIT",categoryId:categoryId])
    }
    def delete(){
        String categoryId  = params.categoryId
        Categories category= Categories.findByCategoryId(categoryId)
        category.delete(flush: true)
        chain(action: "categoryManager")
    }

    def categoryManager(){}
    def categoryEditor(){

        String operation=  params.operation
        String categoryId= params.categoryId
        println("categoryId :->${categoryId}<- | operation :${operation}")
        Categories category= Categories.findByCategoryId(categoryId)

        [category:category,operation:operation]
    }
    def categorySave(){
        String operation=  params.operation
        String categoryId = params.categoryId
        String title      = params.title
        String description= params.description
        String publishedStr = params.published
        boolean published=false
        if(params.published!=null){
            published=publishedStr.equalsIgnoreCase("TRUE")
        }
        Categories category=Categories.findByCategoryId(categoryId)

        if (operation!=null && operation.equalsIgnoreCase("ADD")){
            category= new Categories(categoryId:categoryId,title:title,description:description,published:published).save(flush: true)
            println("Saved new new category ${category.categoryId}")

        } else if (category!=null){
            category.title=title
            category.description=description
            category.published=published
            category.save(flush: true)
            println("Saved existing category ${category.categoryId}")

        }  else{
            category= new Categories(categoryId:categoryId,title:title,description:description,published:published).save(flush: true)
            println("Saved new category ${category.categoryId}")

        }

        chain(action: "categoryManager")
    }
}
