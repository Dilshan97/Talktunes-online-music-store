package Admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.dbconnect;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random; 

@WebServlet("/a_feedback")
public class a_feedback extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	Statement stmt = null;
	ResultSet rs = null; 
	
    public a_feedback() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
		
		Random r = new Random( System.currentTimeMillis());
		
		Format formatter = new SimpleDateFormat("dd MMM yyyy");
		String date_now = formatter.format(new Date());
		 
		String  email  = request.getParameter("mail");
		String  con_no = request.getParameter("contact_no");
		String f_back  = request.getParameter("feedback");
		String id      = "TTOMS_FEED" + (1 + r.nextInt(2)) * 10000 + r.nextInt(10000);
		
		String query = "INSERT INTO feedback(date, unique_ID, email, contact_no, feedback)VALUES('" + date_now +"', '" + id +"', '"+ email +"', '"+ con_no +"', '"+ f_back +"')";
		
		try {
			Connection conn = dbconnect.connect();
			stmt = conn.createStatement();
			stmt.executeUpdate(query);
			
			System.out.print("Feedback Successfull");
			response.sendRedirect("feedback.jsp");
			
		} catch (SQLException e) {
			System.out.println(e);
		}
	}

}
