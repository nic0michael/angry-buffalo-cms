package za.co.nico.cms

class EditorController {

    def index() { }
    def old() { }
    def landingPage(){ }
    def save(){
        String pageText =params.myeditor
        println(pageText)

        chain(controller: "editor", action: "landingPage")
    }
}
