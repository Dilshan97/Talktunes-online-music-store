package forms;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Newslatter")
public class Newslatter extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public Newslatter() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
		String mail 	= request.getParameter("email");
		String content  = request.getParameter("message");
		
		String sub = "News Latter | Talktunes";
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    String date = sdf.format(new Date());
	    
		try {
			
			String sender    = mail; // Sender's email address
	        String recipient = "talktunesonline@gmail.com"; // Recever's email address
			
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
