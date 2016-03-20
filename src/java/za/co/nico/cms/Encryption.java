package za.co.nico.cms;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.InputStream;


/**
 * Created by nicom on 3/20/16.
 */
public class Encryption {
    public final static int MEGABYTE=1024*1000;
    public final static int ENCRYPTION_KEY_SIZE=5*MEGABYTE;
    public final static String ENCRYPTION_KEY_1="arsedws.kli";
    public final static String ENCRYPTION_KEY_2="rashdjf.kli";
    byte[] encryptionKey=new byte[ENCRYPTION_KEY_SIZE];

    public String encrypt(String text){
        byte[] bt=new byte[text.length()];
        for (int i = 1; i <= text.length(); ++i){
            int c=text.charAt(i);
            int key=encryptionKey[i];
            int enc=c^key;
            bt[i]=(byte) enc;
        }
        return new String(bt);
    }

    public String decrypt(String text){
        return encrypt(text);
    }

    public void writeEncryptionKey(String fileName) throws Exception{
        makeEncryptionKey();
        writeFile(fileName, encryptionKey);
    }

    public void loadEncryptionKey(String fileName){
        encryptionKey=new byte[ENCRYPTION_KEY_SIZE];
        try {
            encryptionKey=readFile(fileName);
        } catch (Exception e) {
            // do nothing
        }
    }

    private List<Integer> makeEncryptionKey(){
        List<Integer> numbers=new ArrayList<Integer>();
        Random randomGenerator = new Random();
        for (int i = 1; i <= ENCRYPTION_KEY_SIZE; ++i){
            numbers.add(randomGenerator.nextInt(256));
        }
        return  numbers;
    }

    private static void writeFile(String fileName, byte[] fileBytes) throws Exception {

        ByteArrayOutputStream baos = new ByteArrayOutputStream();

        try {
            System.out.println("decoding fileBytes");
            baos.write(fileBytes);
            OutputStream out = new FileOutputStream(fileName);

            System.out.println("writing file " + fileName);
            baos.writeTo(out);
            out.close();
            baos.close();
            System.out.println("file saved");

        } catch (Exception e) {
            System.out.println(" failed to write file  with error "
                    + e.getMessage() + " " + e.getCause());
            e.getStackTrace();
            throw new Exception("failed to write file  with error ", e);
        }

    }

    private byte[] readFile(String fileName) {
        Exception e;

        byte[] fileBytes = null;
        StringBuilder fileString = new StringBuilder();

        InputStream is = null;
        int i;
        char c;

        try {
            // new input stream created
            is = new FileInputStream(fileName);

            System.out.println("reading Characters from file :" + fileName);

            // reads till the end of the stream
            while ((i = is.read()) != -1) {
                // converts integer to character
                c = (char) i;
                fileString.append(c);
            }

            fileBytes = fileString.toString().getBytes();

        } catch (Exception e1) {
            // if any I/O error occurs
            System.out.println("Error caught while reading file "
                    + e1.getMessage() + " " + e1.getCause());
            e1.printStackTrace();

        } finally {

            // releases system resources associated with this stream
            if (is != null)
                try {
                    is.close();
                } catch (IOException e2) {
                    System.out.println("Error caught while closing file "
                            + e2.getMessage() + " " + e2.getCause());
                    e2.printStackTrace();
                }
        }

        return fileBytes;
    }
}
