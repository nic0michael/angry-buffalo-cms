package za.co.nico.cms

class TextContent {
    static final int NOT_ENCODED=0
    static final int BASE64=1

    String textContentId
    String textContentType
    String textContentText //="Hello this page is under construction <br><br><br>(<b>Default content</b>) "
    int pageOrder
    int homePageOrder
    Page page
    boolean addTofrontPage

    int encoding=NOT_ENCODED;
    Date lastChangedDate
    boolean isLocked=false;

    static final String HTML='HTML'
    static final String XML='XML'
    static final String TEXT='Text'


    static constraints = {
        textContentId(blank:false, nullable:false, unique:true, maxSize:45)
        textContentText(blank:false, nullable:false, maxSize:4096)
        lastChangedDate(blank:false, nullable:false)
        textContentType (blank: false, inList: [  HTML, XML,  TEXT ]    )
        encoding (blank: false, inList: [  BASE64, NOT_ENCODED ]    )
        pageOrder(blank:false, nullable:false)
        homePageOrder(blank:false, nullable:false)
    }

    String toString(){return "${textContentId} | ${textContentType} | add to FrontPage ${addTofrontPage}"}
}
