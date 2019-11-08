package Admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.dbconnect;
import pwdSecure.GenerateEncryptionPassword;


@WebServlet("/a_newuser")
public class a_newuser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	GenerateEncryptionPassword gep= null;
	Statement stmt = null;
	ResultSet rs = null; 
	String  encryptedpwd;
	
    public a_newuser() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
		PrintWriter out = response.getWriter();
		
		String name = request.getParameter("fullname");
		String mail = request.getParameter("email");
		String pass = request.getParameter("Password");
		String Rpass = request.getParameter("RPassword");
		
		try {
			
			if (pass.equals(Rpass)) {	
				System.out.println("OK");
				gep = new GenerateEncryptionPassword();
				
				String key = "2F92D77C54D38D80844F5A105FE62008";
				String password = pass;
				
			    byte[] bytekey = GenerateEncryptionPassword.hexStringToByteArray(key);
			    SecretKeySpec sks = new SecretKeySpec(bytekey, GenerateEncryptionPassword.AES);
			    Cipher cipher = Cipher.getInstance(GenerateEncryptionPassword.AES);
			    cipher.init(Cipher.ENCRYPT_MODE, sks, cipher.getParameters());
			    byte[] encrypted = cipher.doFinal(password.getBytes());
			    encryptedpwd = GenerateEncryptionPassword.byteArrayToHexString(encrypted);
			    
			    System.out.println("Encrypted Password : " + encryptedpwd);
				
			}
		} catch (Exception e) {
			out.println(e);
		}
		
		String query = "INSERT INTO users(firstName, email, password) VALUES('" + name +"', '"+ mail +"', '" + encryptedpwd + "')";
		
		try {
			Connection conn = dbconnect.connect();
			stmt = conn.createStatement();
			stmt.executeUpdate(query);
			
			out.println("Data Inserted Successfull");
			response.sendRedirect("admin/home-main.jsp");
			
		} catch (SQLException e) {
			e.printStackTrace();
			out.println(e);
		}
	}

}
