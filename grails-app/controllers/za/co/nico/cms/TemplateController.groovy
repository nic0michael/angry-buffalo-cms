package za.co.nico.cms

class TemplateController {

//    def index() { }
    def scaffold = true

    def addTemplate(){
        chain(action: "templateEditor", params: [operation: "ADD"])
    }
    def editTemplate(){
        String templateId  = params.templateId
        Template template= Template.findByTemplateId(templateId)
        chain(action: "templateEditor", params: [operation: "EDIT",templateId:templateId])
    }
    def deleteTemplate(){
        String templateId  = params.templateId
        Template template= Template.findByTemplateId(templateId)
        template.delete(flush: true)
        chain(action: "templateManager")
    }

    def templateManager(){}
    def templateEditor(){

        String operation= params.operation
        String templateId = params.templateId
        Template template =Template.findByTemplateId(templateId)
        [template:template,operation:operation]


    }
    def templateSave(){
        String operation= params.operation
        String templateId = params.templateId
        String templateName = params.templateName
        String templateJspFile = params.templateJspFile
        String cssPath = params.cssPath
        String topBannerId = params.topBannerId
        String bottomBannerId = params.bottomBannerId
        String publishedSt= params.published
        boolean published=false
        if (publishedSt!=null){
            published=publishedSt.equalsIgnoreCase("on")
        }

        if (operation==null){
            chain(action: "templateManager")
        }

        Banner topBanner=Banner.findByBannerId(topBannerId)
        Banner bottomBanner=Banner.findByBannerId(bottomBannerId)

        Template template =Template.findByTemplateId(templateId)

        if (operation.equalsIgnoreCase("EDIT") && template!=null) {
            template.templateName=templateName
            template.templateJspFile=templateJspFile
            template.cssPath=cssPath
            template.topBanner=topBanner
            template.bottomBanner=bottomBanner
            template.published=published
            template.save(flush: true)
            println("EDIT Updated template ${template.toString()}")

        } else if (operation.equalsIgnoreCase("ADD") && template==null) {
            new Template(templateId:templateId,templateName:templateName,templateJspFile:templateJspFile,
                    cssPath:cssPath,topBanner:topBanner,bottomBanner:bottomBanner,published:published).save(flush: true)

            template=Template.findByTemplateId(templateId)
            println("ADD Inserted template ${template.toString()}")
        }

        chain(action: "templateManager")

    }

}
