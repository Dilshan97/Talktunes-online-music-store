package Admin;

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
import javax.servlet.http.HttpSession;

import db.dbconnect;
import pwdSecure.GenerateEncryptionPassword;
import pwdSecure.GeneratePlainPassword;


@WebServlet("/a_login")
public class a_login extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	Connection conn = null;
	
	String userName;
	String Email;
	String Pass;
	String encryptedpwd;
	String OriginalPassword;
	
	String key = "2F92D77C54D38D80844F5A105FE62008";
	
    public a_login() {
        super();
        
         conn = dbconnect.connect();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		
		String mail = request.getParameter("email");
		String pass = request.getParameter("Password");
		
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
		
		
		String query = "SELECT * FROM users WHERE email = '" + mail + "' AND password = '" + encryptedpwd + "'";
		
		if (!(mail.equals(null) || mail.equals("")) && !(pass.equals(null) || pass.equals(""))) {
			
			System.out.println("OK");
			
			try {
				
				Statement stmt  = conn.createStatement();
				ResultSet rs    = stmt.executeQuery(query);
				
				if (rs.next()) {
					userName = rs.getString(2);
					Email = rs.getString("email");
					Pass= rs.getString("password");
					
					session.setAttribute("Uname", userName);
					
				}	
				
				try {
				     String password = Pass;
				        
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
				
				if(mail.equals(Email) && pass.equals(OriginalPassword)) {
						System.out.println("Login Ok");
						response.sendRedirect("admin/home-main.jsp");
				}	
				else {
					System.out.println("Login unsuccessful");
					response.sendRedirect("admin/index.jsp");
				}
			} catch (SQLException e) {
				out.println(e);
				System.out.println(e);
			}
		} else {
			/*response.sendRedirect("admin/index.jsp");*/
			System.out.println("NO");
		}
	}

}
