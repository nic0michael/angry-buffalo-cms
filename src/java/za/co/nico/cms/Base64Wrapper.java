package za.co.nico.cms;
import org.apache.commons.codec.binary.Base64;

/**
 * Created with IntelliJ IDEA.
 * User: NMichael
 * Date: 2014/08/17
 * Time: 8:48 PM
 * To change this template use File | Settings | File Templates.
 */
public class Base64Wrapper {
    public String encode(String message){
        if(message==null || message.length()<1){
            return "";
        }
        byte[] encoded = Base64.encodeBase64(message.getBytes());
        return new String(encoded);
    }

    public String decode(String message){
        if(message==null || message.length()<1){
            return "";
        }
        byte[] decoded = Base64.decodeBase64(message.getBytes());
        return new String(decoded);
    }
}
