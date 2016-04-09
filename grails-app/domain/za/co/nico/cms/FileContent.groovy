package za.co.nico.cms

class FileContent {
    String fileContentId
    String fileCode
    String fileName
    String description
    String filePath
    String fileUrl
    String fileType

    static final String IMAGE='ImageFile'
    static final String BINARY_FILE='BinaryFile'
    static final String TEXT_FILE='TextFile'
    static final String STYLE_SHEET_FILE='styleSheetFile'

    static constraints = {
        fileContentId(blank:false, nullable:false, unique:true, maxSize:15)
        fileType (blank: false, inList: [  IMAGE, BINARY_FILE,  TEXT_FILE , STYLE_SHEET_FILE]    )
    }
}
