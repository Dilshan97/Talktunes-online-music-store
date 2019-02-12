package forms;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.dbconnect;
import email.sendMail;
import pwdSecure.*;

@WebServlet("/ResetPassword")
public class ResetPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	GenerateEncryptionPassword  gep = null;
	String cpass;
	String encryptedpwd;
	
    public ResetPassword() {
        super();
       
        //database connect
         conn = dbconnect.connect();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
		PrintWriter out = response.getWriter();
		
		String mail = request.getParameter("email");
		String pass = request.getParameter("password");
		String rpas = request.getParameter("rpassword");
		
		
		try {
			if (pass.equals(rpas)) {
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
			System.out.println(e);
		}
		
		
		String query = "UPDATE member SET password = '"+ encryptedpwd +"' WHERE email = '"+ mail +"'";
		
		try {
			stmt = conn.createStatement();
			stmt.executeUpdate(query);
			
			out.println("Password Reset Successfull");
			
			sendMail m1 = new sendMail();
			
			m1.setSubject("Account Reset");
			m1.setReceiver(mail);
			m1.setContent("You have sucessfuly reset Your account. \n login - www.talktunes.com \n \n Thank You ! \n  Team Talktunes");
			
			m1.getSubject();
			m1.getReceiver();
			m1.getContent();
			
			m1.send_email();
			
			//page redirection
			response.sendRedirect("login.jsp");
		} 
		catch (SQLException e) {
			e.printStackTrace();
			out.println(e);
		}
	}

}
