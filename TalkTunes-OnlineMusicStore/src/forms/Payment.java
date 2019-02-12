package forms;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.dbconnect;
import email.sendMail;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import java.text.SimpleDateFormat;
import java.util.Date; 
import java.util.Random;

@WebServlet("/Payment")
public class Payment extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	Statement stmt = null;
	ResultSet rs = null; 
	String user_email;
	int paymentID;
	
    public Payment() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
		Random r = new Random( System.currentTimeMillis());
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
		Date date = new Date();
		
		HttpSession session = request.getSession();
	    String date_now = formatter.format(date);
	    
	    String payID      = "TTOMS"+ (1 + r.nextInt(2)) * 10000 + r.nextInt(10000);
	    String songID     = (String) session.getAttribute("song_id");
	    String userName   = (String) session.getAttribute("name");
	    String crd_holder = request.getParameter("card_holder");
	    String crd_number = request.getParameter("card_number");
	    String price      = "Rs." + session.getAttribute("Price");
	    
	    String sales = (String) session.getAttribute("Price");
	    
	    System.out.println("SID : " + session.getAttribute("song_id"));
	   
	    session.setAttribute("PID", payID);
	    user_email = (String) session.getAttribute("email");
	    String query = "INSERT INTO payments(paymentID, date, songID, userName, acc_holder, cardNo, Price, profit) VALUES('"+ payID +"', '"+ date_now +"', '"+ songID +"', '"+ userName +"', '"+ crd_holder +"', '"+ crd_number +"', '"+ price +"', '"+sales+"' )";
	    
	    
	    try {
	    	Connection conn = dbconnect.connect();
	    	stmt = conn.createStatement();
	    	stmt.executeUpdate(query);
	    	
	    	sendMail m1 = new sendMail();
	    	
	    	m1.setReceiver(user_email);
	    	m1.setSubject("Thank you for Your Payment");
	    	m1.setContent("You made the Payment successfully. \n "
	    				+ "Payment ID : " + payID 
	    				+ "\nDate     : " + date_now 
	    				+ "\nPrice    : " + price);
	    	
	    	m1.getReceiver();
	    	m1.getSubject();
	    	m1.getContent();
	    	
	    	m1.send_email();
	    	
	    	System.out.println("Payment Successfull");
	    	response.sendRedirect("paymentSuccessful.jsp");
	    	
		} catch (SQLException e) {
			System.out.println(e);
		}
	}

}
