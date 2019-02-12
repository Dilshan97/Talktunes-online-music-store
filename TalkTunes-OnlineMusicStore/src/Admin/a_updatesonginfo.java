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

@WebServlet("/a_updatesonginfo")
public class a_updatesonginfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	Statement stmt = null;
	ResultSet rs = null; 
	
    public a_updatesonginfo() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
		String s_id     = request.getParameter("song_list2");
		String s_title  = request.getParameter("title");
		String s_album  = request.getParameter("album");
		String s_singer = request.getParameter("singer");
		String s_year   = request.getParameter("year");
		
		String query = "UPDATE song SET title = '" + s_title +"', album = '" +s_album +"', singer = '" + s_singer +"', year = '" + s_year +"' WHERE song_id = '"+ s_id +"'";
		
		try {
			Connection conn = dbconnect.connect();
			stmt = conn.createStatement();
			stmt.executeUpdate(query);
			
			System.out.println("Details Update Successfully");
			response.sendRedirect("admin/home-main.jsp");
			
		} catch (Exception e) {
			System.out.println(e);
		}
	}

}
