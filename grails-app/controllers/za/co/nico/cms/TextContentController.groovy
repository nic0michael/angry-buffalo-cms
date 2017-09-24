package za.co.nico.cms

class TextContentController {
    static final int NOT_ENCODED=0
    static final int BASE64=1
    def scaffold = true
    Base64Wrapper base64= new Base64Wrapper()

    def test(){

    }

    def cancelTextContentDetails(){
        chain(action: "textContentManager")
    }

    def saveTextContentDetails(){
        String operation=  params.operation
        String textContentId= params.textContentId
        String textContentType= params.textContentType
        String pageId         = params.pageId
        String addTofrontPageSt= params.addTofrontPage
        String textContentText= params.textContentText
        int encoding  =NOT_ENCODED

        int pageOrder         = 0
        int homePageOrder     = 0
        if (params.pageOrder!=null){
            pageOrder=params.int('pageOrder')
        }
        if (params.homePageOrder!=null){
            homePageOrder = params.int('homePageOrder')
        }
        Page page= Page.findByPageId(pageId)
        boolean addTofrontPage=false
        if(addTofrontPageSt!=null){
            addTofrontPage=addTofrontPageSt.equalsIgnoreCase("on")
        }

        println("textContentId :->${textContentId}<- | operation :${operation} addTofrontPageSt:${addTofrontPageSt}")

        TextContent textContent= TextContent.findByTextContentId(textContentId)


        if (operation.equalsIgnoreCase("EDIT")&& textContent!=null){
            textContent.textContentType=textContentType
            textContent.pageOrder=pageOrder
            textContent.homePageOrder=homePageOrder
            textContent.page=page
            textContent.encoding=NOT_ENCODED
            textContent.textContentText= textContentText
            textContent.addTofrontPage=addTofrontPage
            textContent.lastChangedDate=new Date()
            textContent.save(flush: true)
            println("Saved EDIT ${textContentId}")

        } else if (operation.equalsIgnoreCase("ADD")){
            textContent = new TextContent()
            textContent.textContentType=textContentType
            textContent.pageOrder=pageOrder
            textContent.homePageOrder=homePageOrder
            textContent.page=page
            textContent.encoding=NOT_ENCODED
            textContent.textContentId=textContentId
            textContent.textContentText= textContentText
            textContent.addTofrontPage=addTofrontPage
            textContent.lastChangedDate=new Date()
            textContent.save(flush: true)
            println("Saved ADD ${textContentId}")
        }

        chain(action: "textContentManager")
    }


    def cancelText(){
        String operation      = params.operation
        String textContentId  = params.textContentId
        String textContentType= params.textContentType
        String textContentText= params.textContentText

        chain(action: "textContentDetailsEditor", params: [operation: operation,textContentId:textContentId,textContentType:textContentType,textContentText:textContentText])
    }

    def saveText(){
        String textContentId  = params.textContentId
        String textContentType= params.textContentType
        String textContentText= params.myeditor

        TextContent textContent= TextContent.findByTextContentId(textContentId)
        chain(action: "textContentSave", params: [operation: "SAVE",textContentId:textContentId,textContentType:textContentType,textContentText:textContentText])
    }

    def add(){
        chain(action: "textContentDetailsEditor", params: [operation: "ADD"])
    }
    def editText(){
        String textContentId  = params.textContentId
        TextContent textContent= TextContent.findByTextContentId(textContentId)
        chain(action: "textContentDetailsEditor", params: [operation: "EDIT",textContentId:textContentId])
    }
    def delete(){
        String textContentId  = params.textContentId
        TextContent textContent= TextContent.findByTextContentId(textContentId)
        textContent.delete(flush: true)
        chain(action: "textContentManager")
    }
    def cacheContent(){
        new HomepageController().cacheContent();
        chain(action: "textContentManager")
    }
    def textContentManager(){

    }
    def textContentDetailsEditor(){
        String operation      = params.operation
        String textContentId  = params.textContentId
        println("textContentId :->${textContentId}<- | operation :${operation}")
        TextContent textContent= TextContent.findByTextContentId(textContentId)
        String textContentText

        if (textContent?.encoding==BASE64){
            textContentText= base64.decode(textContent?.textContentText)
        } else{
            textContentText= textContent?.textContentText
        }

        [textContent:textContent,operation:operation,textContentText:textContentText]

    }
    def textContentEditor(){
        String operation=  params.operation
        String textContentId= params.textContentId
        String textContentType= params.textContentType
        String pageId         = params.pageId
        String addTofrontPageSt= params.addTofrontPage

        int pageOrder         = 0
        int homePageOrder     = 0
        if (params.pageOrder!=null){
            pageOrder=params.int('pageOrder')
        }
        if (params.homePageOrder!=null){
            homePageOrder = params.int('homePageOrder')
        }
        Page page= Page.findByPageId(pageId)
        boolean addTofrontPage=addTofrontPageSt.equals("true")

        println("textContentId :->${textContentId}<- | operation :${operation} addTofrontPageSt:${addTofrontPageSt}")

        TextContent textContent= TextContent.findByTextContentId(textContentId)

        String textContentText
        if (textContent.encoding==BASE64){
            textContentText= base64.decode(textContent?.textContentText)
        } else{
            textContentText= textContent?.textContentText
        }
        if (operation.equalsIgnoreCase("SAVE")&& textContent!=null){
            textContent.textContentType=textContentType
            textContent.pageOrder=pageOrder
            textContent.homePageOrder=homePageOrder
            textContent.page=page
            textContent.addTofrontPage=addTofrontPage
            textContent.lastChangedDate=new Date()
            textContent.save(flush: true)
            println("Saved EDIT ${textContentId}")

        }
        [textContent:textContent,operation:operation,textContentText:textContentText]
    }

    def textContentSave(){

        String operation      = params.operation
        String textContentId  = params.textContentId
        String textContentType= params.textContentType
        String textContentText= params.textContentText

        println("textContentId :->${textContentId}<- | operation :${operation}")
        TextContent textCt= TextContent.findByTextContentId(textContentId)

        if (textCt!=null){
            if (textContentType!=null){
                textCt.textContentType=textContentType
            } else {
                textCt.textContentType="HTML";
            }
            textCt.encoding=BASE64

            if (textCt.encoding==BASE64){
                textCt.textContentText=base64.encode(textContentText)
            } else{
                textCt.textContentText=textContentText
            }

            textCt.lastChangedDate=new Date()
            textCt.save(flush: true)
            println(""+textCt?.textContentText+" "+textCt?.textContentId+"\n"+textCt.errors)
        }

        chain(action: "textContentManager")
    }
}
