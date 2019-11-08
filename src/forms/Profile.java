package forms;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

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


@WebServlet("/Profile")
public class Profile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	String password;
	String encryptedpwd;
	
	String key = "2F92D77C54D38D80844F5A105FE62008";
	
    public Profile() {
        super();
    
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
		HttpSession session = request.getSession();
		
		String p_name = request.getParameter("name");
		String p_mail = request.getParameter("mail");
		String n_cpass = request.getParameter("newpass");
		String r_cpass = request.getParameter("rnewpass");
		
		
		String id =  session.getAttribute("mem_id").toString();
		
		System.out.println("User : "+ id);
		
		//System.out.println("User id : " + id);
		
		if(n_cpass.equals(r_cpass)) {
			password = n_cpass;
			
			System.out.println("Password : " + password);
			
			try {
				
			    byte[] bytekey = GenerateEncryptionPassword.hexStringToByteArray(key);
			    SecretKeySpec sks = new SecretKeySpec(bytekey, GenerateEncryptionPassword.AES);
			    Cipher cipher = Cipher.getInstance(GenerateEncryptionPassword.AES);
			    cipher.init(Cipher.ENCRYPT_MODE, sks, cipher.getParameters());
			    byte[] encrypted = cipher.doFinal(password.getBytes());
			    encryptedpwd = GenerateEncryptionPassword.byteArrayToHexString(encrypted);
			  
			    System.out.println("Encrypted Password : " + encryptedpwd);
		        
			} catch (Exception e) {
				System.out.println(e);
			}
		}
		
		String query = "UPDATE member SET fullName='"+p_name+"', email='"+p_mail+"', password='"+ encryptedpwd +"' WHERE memID='"+id+"'";
		
		try {
			Connection conn = dbconnect.connect();
			PreparedStatement stmt = conn.prepareStatement(query);
			stmt.executeUpdate();
			
			response.sendRedirect("login.jsp");
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
	}

}
