 package forms;
 
import db.dbconnect;

import java.sql.Statement;
import java.sql.ResultSet;
import javax.crypto.Cipher;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import javax.servlet.http.HttpServlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;
import pwdSecure.GeneratePlainPassword;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.annotation.WebServlet;
import pwdSecure.GenerateEncryptionPassword;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	Connection conn = null;
	String userPass;
	String userEmail;
	String userName;
	String userID;
	String encryptedpwd;
	String OriginalPassword;
	
	String key = "2F92D77C54D38D80844F5A105FE62008";
	
    public login() {
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
		
		String mail = request.getParameter("email");
		String pass = request.getParameter("password");
		
		try {
			
		    String password = pass;

		    byte[] bytekey = GenerateEncryptionPassword.hexStringToByteArray(key);
		    SecretKeySpec sks = new SecretKeySpec(bytekey, GenerateEncryptionPassword.AES);
		    Cipher cipher = Cipher.getInstance(GenerateEncryptionPassword.AES);
		    cipher.init(Cipher.ENCRYPT_MODE, sks, cipher.getParameters());
		    byte[] encrypted = cipher.doFinal(password.getBytes());
		    encryptedpwd = GenerateEncryptionPassword.byteArrayToHexString(encrypted);
		  
		    System.out.println("Encrypted Password : " + encryptedpwd);
	        
		} catch (Exception e) {
			out.println(e);
		}
		
		
		String query = "SELECT * FROM member WHERE email = '"+ mail +"' AND password= '"+ encryptedpwd +"'";
		
		
		if (!(mail.equals(null) || mail.equals("")) && !(pass.equals(null) || pass.equals(""))) {
			
			System.out.println("OK");
			
			try {
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(query);
				
				if (rs.next()) {
					userEmail = rs.getString("email");
					userPass  = rs.getString("password");
				    userName  = rs.getString("fullName");
				    userID    = rs.getString("memID");
				} 
				
				try {
				     String password = userPass;
				        
				     byte[] bytekey = GeneratePlainPassword.hexStringToByteArray(key);
				     SecretKeySpec sks = new SecretKeySpec(bytekey, GeneratePlainPassword.AES);
				     Cipher cipher = Cipher.getInstance(GeneratePlainPassword.AES);
				     cipher.init(Cipher.DECRYPT_MODE, sks);
				     byte[] decrypted = cipher.doFinal(GeneratePlainPassword.hexStringToByteArray(password));
				     OriginalPassword = new String(decrypted);
				     
				     System.out.println("Original Password : " + OriginalPassword);
				     
				} catch (Exception e) {
					out.print(e);
				}
				
				
				if(mail.equals(userEmail) && pass.equals(OriginalPassword)){
					HttpSession session = request.getSession();
					session.setAttribute("email", userEmail);
					session.setAttribute("name", userName);
					session.setAttribute("mem_id", userID);
					
					response.sendRedirect("index.jsp");
				}
				else {
					response.sendRedirect("login.jsp");
					
					rs.close();
					stmt.close();
				}
				
			} catch (SQLException e) {
				out.println(e);
			}
			
		} else { 
			response.sendRedirect("login.jsp");
			System.out.println("NO");
		}
	}

}
