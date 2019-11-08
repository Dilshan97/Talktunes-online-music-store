package Admin;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import db.dbconnect;

 
@WebServlet("/a_updatesongcover")

@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB

public class a_updatesongcover extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	Connection conn = null;
	 String message = null;
	
    public a_updatesongcover() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
		String s_id 	= request.getParameter("song_list1");
		Part filePart   = request.getPart("cover");
		
		System.out.println("Song id : " + s_id);
		
		InputStream inputStream = null;
		
		if (filePart != null) {
			System.out.println(filePart.getName());
			System.out.println(filePart.getSize());
			System.out.println(filePart.getContentType());
			
			inputStream = filePart.getInputStream();
		}
		
		String query = "UPDATE song SET image = '" + inputStream +"' WHERE song_id = '" + s_id +"' ";
		
		try {
			conn = dbconnect.connect();
			PreparedStatement statement = conn.prepareStatement(query);
			int row = statement.executeUpdate();
			
			response.sendRedirect("admin/home-main.jsp");
			
			
			if (row > 0) {
				message = "File uploaded and saved into database";
			}
			
		} catch (SQLException e) {
			message = "ERROR: " + e.getMessage();
			e.printStackTrace();
		}finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e2) {
					e2.printStackTrace();
				}
			}
			
			System.out.println(message);
		}
		
	}

}
