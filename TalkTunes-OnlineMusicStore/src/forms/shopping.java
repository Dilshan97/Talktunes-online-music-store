package forms;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.PreparedStatement;

import db.dbconnect;

@WebServlet("/shopping")
public class shopping extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	Connection conn = null;
	
    public shopping() {
        super();
        
        //database connection
        conn=dbconnect.connect();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		PrintWriter out = response.getWriter();
		
		try {
			
			String query = "SELECT * FROM member ORDER BY memID ASC";
			PreparedStatement ps=conn.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				out.print(rs.getString(1));
				out.print(rs.getString(2));
				out.print(rs.getString(3));
				out.print(rs.getString(4));
			}
		} 
		catch (SQLException e) {
			 out.println(e);
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
	}

}
