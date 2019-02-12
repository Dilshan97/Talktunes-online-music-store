package forms;

import pwdSecure.*;
import db.dbconnect;
import email.sendMail;

import java.sql.ResultSet;
import java.sql.Statement;
import javax.crypto.Cipher;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/newUser")

public class newUser extends HttpServlet {
	
	public static final String AES = "AES";
	
	private static final long serialVersionUID = 1L;
   
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null; 
	GenerateEncryptionPassword  gep = null;
	String cpass;
	String encryptedpwd;
	
    public newUser() {
        super();
        
        //connect database
        conn = dbconnect.connect();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
		PrintWriter out = response.getWriter();
		
		String Name = request.getParameter("fullName");
		String mail = request.getParameter("email");
		String pass = request.getParameter("password");
		String Rpas = request.getParameter("Rpassword");
		
		try {
			
			if (pass.equals(Rpas)) {
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
			out.print(e);
		}
	
	
		String query = "INSERT INTO member (fullName, email, password) VALUES('"+ Name +"', '"+ mail +"', '"+ encryptedpwd + "')";
		
		try {
			stmt = conn.createStatement();
			stmt.executeUpdate(query);
			
			out.println("Data Inserted Successfull");
			
			sendMail m1 = new sendMail();
			
			m1.setSubject("Welcome to the Talktunes");
			m1.setReceiver(mail);
			m1.setContent("You have sucessfully Created Account. \n \n Thank You ! \n Team Talktunes");
			
			m1.getSubject();
			m1.getContent();
			m1.getReceiver();
			
			m1.send_email();
			
			response.sendRedirect("login.jsp");
		} 
		catch (SQLException e) {
			e.printStackTrace();
			out.println(e);
		}
		
	}

}
