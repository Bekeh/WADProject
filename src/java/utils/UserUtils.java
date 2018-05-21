/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import javax.xml.bind.DatatypeConverter;

/**
 *
 * @author Alex Admin
 */
public class UserUtils {
    
    public static String encryptPass(String data) {
        String result = null;
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] hash = digest.digest(data.getBytes("UTF-8"));
            return bytesToHex(hash); // make it printable
        }catch(UnsupportedEncodingException | NoSuchAlgorithmException ex) {
        }
        return result;
    }
     
    private static String  bytesToHex(byte[] hash){
        return DatatypeConverter.printHexBinary(hash);
    }
}
