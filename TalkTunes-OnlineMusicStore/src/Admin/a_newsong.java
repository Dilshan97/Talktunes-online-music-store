package Admin;

import java.io.IOException;
import java.sql.Connection;
import java.io.InputStream;
import java.sql.SQLException;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.Part;

import db.dbconnect;

@WebServlet("/a_newsong")

@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB

public class a_newsong extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   Connection conn = null;
   String message = null;
   
    public a_newsong() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
		String s_id     = request.getParameter("songid");
		String s_cat    = request.getParameter("category");
		String s_title  = request.getParameter("title");
		String s_album  = request.getParameter("album");
		String s_singer = request.getParameter("singer");
		String s_year   = request.getParameter("year");
		Part filePart   = request.getPart("cover");
		String s_price  = request.getParameter("price");
		
		InputStream inputStream = null;
		
		if (filePart != null) {
			System.out.println(filePart.getName());
			System.out.println(filePart.getSize());
			System.out.println(filePart.getContentType());
			
			inputStream = filePart.getInputStream();
		}
		
		String query = "INSERT INTO song(song_id, category, title, album, singer, year, image, price) VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			conn = dbconnect.connect();
			PreparedStatement statement = conn.prepareStatement(query);
			statement.setString(1, s_id);
			statement.setString(2, s_cat);
			statement.setString(3, s_title);
			statement.setString(4, s_album);
			statement.setString(5, s_singer);
			statement.setString(6, s_year);
			statement.setString(8, s_price);
			
			if (inputStream != null) {
				statement.setBlob(7, inputStream);
			}
			
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
