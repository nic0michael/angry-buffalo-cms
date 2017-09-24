package za.co.nico.cms

class PageController {


//    def index() { }
    def scaffold = true
//    def categoryManager(){}

    def frontPageAdd(){

        String textContentId= params.textContentId
        chain(action: "frontpageAddRemove", params: [operation: "ADD",textContentId:textContentId])
    }

    def frontPageDelete(){
        String textContentId  = params.textContentId
        TextContent textContent= TextContent.findByTextContentId(textContentId)
        chain(action: "frontpageAddRemove", params: [operation: "DELETE",textContentId:textContentId])
    }

    def add(){
        chain(action: "articleDetailsEditor", params: [operation: "ADD"])
    }
    def editText(){
        String pageId  = params.pageId
        Page page= Page.findByPageId(pageId)
        chain(action: "articleDetailsEditor", params: [operation: "EDIT",pageId:pageId])
    }
    def delete(){
        String pageId  = params.pageId
        Page page= Page.findByPageId(pageId)
        page.delete(flush: true)
        chain(action: "articleManager")
    }

    def controlPannel(){}

    def articleManager(){}
    def articleDetailsEditor(){
        String operation= params.operation
        String pageId = params.pageId
        println("pageId :->${pageId}<- | operation :${operation}")

        Page page= Page.findByPageId(pageId)
        [page:page,operation:operation]

    }
    def articleSave(){
        String operation= params.operation
        String pageId = params.pageId
        String title  = params.title
        String pageUrl  = params.pageUrl
        String templateId   = params.templateId
        String siteId =params.siteId

        String userId   = params.userId
        String categoryId= params.categoryId
        String permissionId=params.permissionId
        String publishedSt=params.published

        println("pageId : ${pageId} operation : ${operation} published: ${publishedSt}")

        Page page=Page.findByPageId(pageId)
        User author = User.findByUserId(userId)
        Categories category=Categories.findByCategoryId(categoryId)
        Permissions access=Permissions.findByPermissionId(permissionId)
        Template template=Template.findByTemplateId(templateId)
        Site site=Site.findBySiteId(siteId)

        boolean published =false;
        if (publishedSt!=null){
            published=publishedSt.equalsIgnoreCase("on")
        }

        if (operation.equalsIgnoreCase("EDIT") && page!=null) {
            page.site=site
            page.title=title
            page.pageUrl=pageUrl
            page.published=published
            page.author=author
            page.category=category
            page.template=template
            page.access=access
            page.save(flush: true)
            println("Saved existing page ${page.pageId}")

        }  else if (operation.equalsIgnoreCase("ADD") && page==null) {
            Page pg=new Page(site: site, pageId:pageId,title:title,pageUrl:pageUrl,author:author,category:category,template:template,access:access,published:published).save(flush: true)
            println("Saved new new page ${pageId}")
            println("Verified new new page ${pg?.pageId}")
        }
        chain(controller: "page", action: "articleManager")
    }

    def frontPageManager(){
        List<TextContent> textContents=TextContent.findAll([sort: "textContentId", order: "asc"]) ;
        List<Template>templates=Template.findAll([sort: "templateId", order: "asc"])
        Setup setup =Setup.findBySetupId("MASTER_RECORD")
        [textContents:textContents,templates:templates,setup:setup]
    }
    def frontpageAddRemove(){
        String operation=  params.operation
        String textContentId= params.textContentId
        String templateId= params.templateId
        println("textContentId :->${textContentId}<- | operation :${operation}")
        TextContent textContent= TextContent.findByTextContentId(textContentId)
        Template template=Template.findByTemplateId(templateId)
        Setup setup =Setup.findBySetupId("MASTER_RECORD")

        if (operation==null){
            println("operation is null")
        } else if(operation.equalsIgnoreCase("SET_TEMPLATE") && template!=null){
            setup.siteTemplate=template
            setup.save(flush: true)
        } else if (textContent==null){      // the following operations need a textContent
            println("textContent is null")
        } else if(operation.equalsIgnoreCase("DELETE")){
            textContent.addTofrontPage=false
            textContent.save(flush: true)

        } else if(operation.equalsIgnoreCase("ADD")){
            textContent.addTofrontPage=true
            textContent.save(flush: true)
        }
        chain(controller: "page", action: "frontPageManager")
    }

}
