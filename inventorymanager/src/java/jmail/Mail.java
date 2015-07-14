/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jmail;
import javax.mail.*;
import javax.mail.internet.*;
import java.util.*;
/**
 *
 * @author agupta
 */
public class Mail {

    /**
     *
     * @param sendMail
     * @param args
     */
//    public void main(int sendMail){
//        sendMail = sendMail();

//        }
    private String part;
    private String product;
    private String from;
    private String type;
    private String use;
    private String Status;
    private String password;
    private String smtpServ;
    private String to;
    private String quantity;
    

    /**
     * @return the Part
     */
    public String getPart() {
        return part;
    }
    public void setPart(String part) {
        this.part = part;
    }

    
    
    String email = "bsingh@mapmyindia.com";
    public void setto(String email) {
        this.email = to;
    }
    
    
    public String getFrom() {
        return from;
    }
    public void setFrom(String from) {
        this.from = from;
    }
    /**
     * @return the product
     */
    public String getProduct() {
        return product;
    }

    /**
     * @param product the product to set
     */
    public void setProduct(String product) {
        this.product = product;
    }

    /**
     * @return the type
     */
    public String getType() {
        return type;
    }

    /**
     * @param type the type to set
     */
    public void setType(String type) {
        this.type = type;
    }
    
    /**
     * @return the use
     */
    public String getUse() {
        return use;
    }
    /**
     * @param use the use to set
     */
    public void setUse(String use) {
        this.use = use;
    }

    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * @return the smtpServ
     */
    public String getSmtpServ() {
        return smtpServ;
    }
    
    public String getQuantity() {
        return quantity;
    }
        /**
     * @return the Status
     */
    public String getStatus() {
        return Status;
    }

    /**
     * @param Status the Status to set
     */
    public void setStatus(String Status) {
        this.Status = Status;
    }

    /**
     * @param quantity the quantity to set
     */
    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }
    
    /**
     * 
     
     * @param smtpServ the smtpServ to set
     */
    public void setSmtpServ(String smtpServ) {
        this.smtpServ = smtpServ;
    }
    public int sendMail(){
        try
        {
            Properties props = System.getProperties();
            
              // -- Attaching to default Session, or we could start a new one --
//              props.put("mail.transport.protocol", "smtp" );
//              props.put("mail.smtp.starttls.enable","true" );
//              props.put("mail.smtp.host","smtp.gmail.com");
//              props.put("mail.smtp.port", "587");
//              props.put("mail.smtp.auth", "true" );
              
              
              props.put("mail.smtp.host", "smtp.gmail.com");
              props.put("mail.smtp.socketFactory.port", "465");
              props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
              props.put("mail.smtp.auth", "true");
              props.put("mail.smtp.port", "465");
              
              Authenticator auth = new SMTPAuthenticator();
              Session session = Session.getInstance(props, auth);
              // -- Create a new message --
              Message msg = new MimeMessage(session);
              // -- Set the FROM and TO fields --
              msg.setFrom(new InternetAddress("mapmyindia123@gmail.com"));
              
              msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse("bsingh@mapmyindia.com", false));
              msg.setSubject("New Order by Mr Abhinay");
              msg.setText("Here are the details of the order" + "\n" + "The part number is " + part + "\n" + "The category is " + product + "\n" +"The Model Number is " + type + "\n" + "The order is " +  use + "\n" + "The order is " +  Status + "\n" +" The Quantity is " + quantity+ ". \n");
              // -- Set some other header information --
              msg.setHeader("MyMail", "Mr. XYZ" );
              msg.setSentDate(new Date());
              // -- Send the message --
              Transport.send(msg);
              return 0;
        }
        catch (Exception ex)
        {
          ex.printStackTrace();
          return -1;
        }
  }


    /**
     * @return the quantity
     */
    

    // Also include an inner class that is used for authentication purposes

    private class SMTPAuthenticator extends javax.mail.Authenticator {
            @Override
            public PasswordAuthentication getPasswordAuthentication() {
                String username =  "mapmyindia123@gmail.com";           // specify your email id here (sender's email id)
                String password = "mapmy123";                                      // specify your password here
                return new PasswordAuthentication(username, password);
            }
      }
    
    
}
