package za.co.nico.cms

class Language {
    String languageName
    String internationalization // ISO 639-2 Code

    static constraints = {
        languageName(blank:false, nullable:false, unique:true, maxSize:45)
        internationalization(blank:false, nullable:false, unique:true, maxSize:4)
    }

    String toString(){
        return languageName
    }
}
