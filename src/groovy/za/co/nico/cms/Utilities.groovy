package za.co.nico.cms

import java.text.DateFormat
import java.text.SimpleDateFormat
import static groovy.io.FileType.FILES

/**
 * Created by nickm on 2017/08/27.
 */
class Utilities {


    public static String swapSpacesWithUnderscore(String text) {
        if(text==null){
            return ""
        }
        text.replaceAll(" ", "_")
        return text
    }



    public static void writeEncodedPage(String filename, String text){
        Base64Wrapper base64 = new Base64Wrapper()
        String theFilename
        if (filename == null) {
            theFilename = "homepage.bin"
        } else {
            theFilename = Utilities.makePageFileName(filename, ".bin")
        }
        String theText = base64.encode(text)
        writeToFile(theFilename, theText)
    }

    public static void deleteFile(String filename){
        new File(filename).delete()
    }

    public static void deleteAllFilesWithExtension(String fileExtension){
        new File('.').eachFileRecurse(FILES) {
            if(it.name.endsWith('.'+fileExtension)) {
                println it
                deleteFile(it)
            }
        }
    }

    public static void writeQtrFile(String filename, Date date){
        String theFilename

        if (filename == null) {
            theFilename = "homepage.qtr"
        } else {
            theFilename = Utilities.makePageFileName(filename,".qtr")
        }
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String dateText = dateFormat.format(date);
        writeToFile(theFilename, dateText)
    }

    public static String makePageFileName(String fileName,String fileExtension){
            return swapSpacesWithUnderscore(fileName) + fileExtension
    }

    public static void writeToFile(String filename, String text) {
        def file = new File(filename)
        file.text = text
        file.withWriter('UTF-8') { writer ->
            writer.write(text)
        }
        println(file.path + " was saved")
    }

    public static String readFile(String filename) {
        def file = new File(filename)
        String fileContents = file.getText('UTF-8')
        return fileContents
    }


    public static boolean fileExists(String filename) {
        File file = new File(filename)
        return file.exists()
    }
}
