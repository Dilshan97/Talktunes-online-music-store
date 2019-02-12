package Admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.dbconnect;

@WebServlet("/a_deletesong")
public class a_deletesong extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	Statement stmt = null;
	ResultSet rs = null; 
	
    public a_deletesong() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
		
		String value = request.getParameter("song_list");
		
		String query  = "DELETE FROM song WHERE song_id = '" + value +"'";
		
		System.out.println("Song ID : " + value);
		
		try {
			Connection conn = dbconnect.connect();
			stmt = conn.createStatement();
			stmt.executeUpdate(query);
			
			System.out.println("Succefully Delete Song");
			response.sendRedirect("admin/home-main.jsp");
			
		} catch (Exception e) {
			System.out.println(e);
		}
	}

}
