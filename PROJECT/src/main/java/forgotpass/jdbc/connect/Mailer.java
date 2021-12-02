package forgotpass.jdbc.connect;

import java.util.Properties;  

import javax.mail.*;  
import javax.mail.internet.InternetAddress;  
import javax.mail.internet.MimeMessage;  
  
public class Mailer {  
	private static String mailHost="smtp.gmail.com";
public static void send(String to,String subject,String msg){  
  
final String user="c8.smartgracemarkcalculator@gmail.com";//change accordingly  
final String pass="ffuueutqolarjqxd";  
  
//1st step) Get the session object    
Properties props = new Properties();
props.put("mail.smtp.starttls.enable", "true");
props.put("mail.transport.protocol", "smtp");
props.put("mail.smtp.host", mailHost);
props.put("mail.smtp.port", "587");
props.put("mail.smtp.auth", "true");  
  
Session session = Session.getDefaultInstance(props,  
 new javax.mail.Authenticator() {  
  protected PasswordAuthentication getPasswordAuthentication() {  
   return new PasswordAuthentication(user,pass);  
   }  
});  
//2nd step)compose message  
try {  
 MimeMessage message = new MimeMessage(session);  
 message.setFrom(new InternetAddress(user));  
 message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));  
 message.setSubject(subject);  
 message.setText(msg);  
   
 //3rd step)send message 
 
 Transport.send(message);  
  
 System.out.println("SENT");  
  
 } catch (MessagingException e) {  
    throw new RuntimeException(e);  
 }  
      
}  
}  