package email;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Email {

	public static void main(String ar[]) {
		
		try {   
	        
	        String sender    = "talktunesonline@gmail.com"; // Sender's email address
	        String recipient = "dilshanramesh81@gmail.com"; // Recever's email address
	        
	        String sub = "E-mail Testing with Java";
	        String content = "You have successfull Created Accout.\n Thank you !!!\n Team Talktunes";
	        
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	        String date = sdf.format(new Date());
	          
	        final String username = "talktunesonline@gmail.com";
	        final String password = "it17135412";
	        
	        Properties props = new Properties();
	        props.put("mail.smtp.auth", true);
	        props.put("mail.smtp.starttls.enable", true);
	        props.put("mail.smtp.host", "smtp.gmail.com");
	        props.put("mail.smtp.port", "587");
	              
	        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
	           protected PasswordAuthentication getPasswordAuthentication() {
	              return new PasswordAuthentication(username, password);
	           }
	         });
	        
	         try {
	        	 Message message = new MimeMessage(session);
	        	 message.setFrom(new InternetAddress(sender,"Talk tunes"));
	        	 message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipient));
	          
	        	 message.setSubject(sub + " " + date);
	        	 message.setText(content);
	          
	        	 System.out.println("Sending Message ...");
	        	 Transport.send(message);
	        	 System.out.println("Message Sent");
	          
	         } catch (Exception e) {
	          System.out.println(e);
	        }
	      } catch (Exception e) {
	    	  System.out.println(e);
	      }
	}
}
