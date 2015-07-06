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
//        System.out.println(sendMail);
//        }
    private String Part;
    private String product;
    private String from;
    private String type;
    private String use;
    private String password;
    private String smtpServ;
    private String to;
    

    /**
     * @return the Part
     */
    public String getPart() {
        return Part;
    }
    String email = "mapmyindia123.gmail.com";
    public void setPart(String Part) {
        this.Part = Part;
    }
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
    
    /**
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
              props.put("mail.transport.protocol", "smtp" );
              System.out.println(Part);
              props.put("mail.smtp.starttls.enable","true" );
              props.put("mail.smtp.host",smtpServ);
              props.put("mail.smtp.auth", "true" );
              Authenticator auth = new SMTPAuthenticator();
              Session session = Session.getInstance(props, auth);
              // -- Create a new message --
              Message msg = new MimeMessage(session);
              // -- Set the FROM and TO fields --
              msg.setFrom(new InternetAddress(from));
              
              msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));
              msg.setSubject("New Order by Mr Abhinay");
              msg.setText("Here are the details of the order" + Part + product + type + use);
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
          System.out.println("Exception "+ex);
          return -1;
        }
  }

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
