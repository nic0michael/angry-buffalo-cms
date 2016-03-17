package za.co.nico.cms

class AdminController {

    def index() {
        chain(controller:"user" , action: "Administration")
    }
}
