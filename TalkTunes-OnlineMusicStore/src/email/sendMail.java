package email;

import java.util.Date;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import java.util.Properties;
import java.text.SimpleDateFormat;
import javax.mail.internet.MimeMessage;

import javax.mail.PasswordAuthentication;
import javax.mail.internet.InternetAddress;

public class sendMail {
	
	public String content;
	public String subject;
	public String receiver;
	
	public void setSubject(String subject) {
		this.subject = subject;
	}
	
	public void setContent(String content) {
		this.content = content;	
	}
	
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getSubject() {
		return subject;
	}
	
	public String getContent() {
		return content;
	}
	
	public String getReceiver() {
		return receiver;
	}
	
	public void send_email() {
		
	    try {  
	    	
	    	System.out.println("Subject : " + subject);
	    	System.out.println("Content : " + content);
	    	System.out.println("recipient : " + receiver);
	    	
	    	String sender    = "talktunesonline@gmail.com"; // Sender's email address
	        String recipient = receiver; // Recever's email address
	        
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
	          
	        	 message.setSubject(subject + " " + date);
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


		
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

