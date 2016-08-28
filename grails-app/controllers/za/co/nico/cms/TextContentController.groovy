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
        String languageIdSt=params.language
        Language language=Language.findByLanguageName(languageIdSt)
        println("Language :"+languageIdSt)
        if(languageIdSt.equalsIgnoreCase("GREEK")){
            println("Processing Greek text")
            textContentText=fixGreekCharacterUnicodes(textContentText)
        }
        String isLockedSt=params.isLocked
        int encoding  =BASE64

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
        boolean isLocked=false
        if(addTofrontPageSt!=null){
            addTofrontPage=addTofrontPageSt.equalsIgnoreCase("on")
        }

        if(isLockedSt!=null){
            isLocked=isLockedSt.equalsIgnoreCase("on")
        }

        println("textContentId :->${textContentId}<- | operation :${operation} addTofrontPageSt:${addTofrontPageSt}")

        TextContent textContent= TextContent.findByTextContentId(textContentId)


        if (operation.equalsIgnoreCase("EDIT")&& textContent!=null){
            textContent.textContentType=textContentType
            textContent.pageOrder=pageOrder
            textContent.homePageOrder=homePageOrder
            textContent.page=page
            textContent.language=language
            textContent.encoding=BASE64
            if (textContent.encoding==BASE64){
                textContent.textContentText=HomepageController.encryptEncode(textContentText)
            } else{
                textContent.textContentText= textContentText
            }

            textContent.addTofrontPage=addTofrontPage
            textContent.isLocked=isLocked
            textContent.encoding=1
            textContent.lastChangedDate=new Date()
            textContent.save(flush: true)
            println("Saved EDIT ${textContentId}")

        } else if (operation.equalsIgnoreCase("ADD")){
            textContent = new TextContent()
            textContent.textContentType=textContentType
            textContent.pageOrder=pageOrder
            textContent.homePageOrder=homePageOrder
            textContent.page=page
            textContent.language=language
            textContent.encoding=BASE64
            textContent.textContentId=textContentId
            if (textContent.encoding==BASE64){
                textContent.textContentText=HomepageController.encryptEncode(textContentText)
            } else{
                textContent.textContentText= textContentText
            }

            textContent.addTofrontPage=addTofrontPage
            textContent.encoding=1
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
            textContentText=HomepageController.decryptDecode(textContent?.textContentText)
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
        String isLockedSt=params.isLocked
        String languageIdSt=params.language
        Language language=Language.findByLanguageName(languageIdSt)


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

        textContent.language=language

        String textContentText
        if (textContent.encoding==BASE64){
            textContentText= HomepageController.decryptDecode(textContent?.textContentText)
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
        String isLockedSt=params.isLocked
        String languageIdSt=params.language
        Language language=Language.findByLanguageName(languageIdSt)
        println("Language :"+languageIdSt)
        if(language.languageName.equalsIgnoreCase("GREEK")){
            textContentText=fixGreekCharacterUnicodes(textContentText)
        }

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
                textCt.textContentText=HomepageController.encryptEncode(textContentText)
            } else{
                textCt.textContentText=textContentText
            }

            textCt.language=language
            textCt.lastChangedDate=new Date()
            textCt.save(flush: true)
            println(""+textCt?.textContentText+" "+textCt?.textContentId+"\n"+textCt.errors)
        }
        chain(action: "textContentManager")
    }


    String fixGreekCharacterUnicodes(String textContentText){

        if (textContentText==null){return null}

        StringBuilder text=new StringBuilder()
        for(int i=0;i<textContentText.length();i++){
            char ch=textContentText.charAt(i)
            text.append(getGreekOxiCharacters(ch))
        }
        return text.toString();
    }

    String getGreekOxiCharacters(char ch){
        if(ch=='ά') return "&#7936;"
        if(ch=='έ') return "&#7952;"
        if(ch=='ύ') return "&#8016;"
        if(ch=='ή') return "&#7968;"
        if(ch=='ό') return "&#8000;"
        if(ch=='ί') return "&#7984;"
        if(ch=='ώ') return "&#8032;"

        if(ch=='Ά') return "&#902;"
        if(ch=='Έ') return "&#904;"
        if(ch=='Ή') return "&#905;"
        if(ch=='Ί') return "&#906;"
        if(ch=='Ύ') return "&#910;"
        if(ch=='Ώ') return "&#911;"

        return ""+ch;
    }
}
