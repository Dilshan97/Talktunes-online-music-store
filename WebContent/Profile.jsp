<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="db.dbconnect" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="pwdSecure.GenerateEncryptionPassword" %>
<%@ page import="pwdSecure.GeneratePlainPassword" %>
<%@ page import="javax.crypto.spec.SecretKeySpec" %>
<%@ page import="javax.crypto.Cipher" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Profile | TalkTunes</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="icon" href="img/storelogo.png">
  <link rel="stylesheet" type="text/css" href="css/footer.css">
  <link rel="stylesheet" type="text/css" href="css/header.css">
  
  <style>
  	.content img{
  	   border-radius: 50%;
  	   width:200px;
  	   height:200px;
  	   float: right;
  	   margin-right: 200px;
  	}
  	
  	.profile{
  		background-color:#282828;;
  		margin-left: 80px;
  		width: 1000px;
  		height:460px;
  		border-radius: 4px;
  		color: #D7D7D7;
  		box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.55), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
  	}
  	
  	.profile table tr td{
  		font-size: 20px;
  		padding-bottom: 15px;
  	}
  	
  	.profile table tr{
  		margin-left:10px;
  		padding-left: 20px;
  	}
  	
  	.profile  p{
		color: #fff;
		font-weight: bold;
  	}
  	
  	.profile input[type=password],[type=text], [type=email]{
  		width: 200px;
  		height: 30px;
  		padding-left: 10px;
  		border-radius: 4px;
  		border-left: 3px solid;
  		border-left: 3px solid #1DB954;
  	}
  	
  	.profile input[type=submit], [type=reset]{
  		width: 100px;
  		height: 35px;
  		background-color: #1DB954;
  		color: #fff;
  		border-style: none;
  	}
  	
  	.profile [type=reset]{
  		background-color: #DE5347;
  	}
  	.profile input[type=submit]:hover, [type=reset]:hover{
  		background-color: #000;
  		transition: 1s;
  	}
  	
  	#head1{
  		font-size: 25px;
  		margin-left: 10px;
  		font-family: monospace;
  		color: #1DB954;
  		padding-top: 20px;
  	}
  	#head2 {
  		font-size: 25px;
  		margin-left: -90px;
  		font-family: monospace;
  		color: #1DB954;
  	}
  	table{
  		margin-left: 100px;
  	}
  	.footer{
  		margin-top: 60px;
  		
  	}
  	.navibar{
  		margin-left: -23px;
  	}
  </style>
</head>
<body>
	<div class="wrapper">
    <header>
      <div class="top" id="navbar">
        <div class="logo">
          <img src="img/storelogo.png" alt="">
          <p><b>TALK</b>&nbsp;TUNES</a></p>
        </div><!-- logo -->

        <div class="navibar">
          <nav>
            <ul>
              <li><a  href="index.jsp">Home</li></a>
              <li><a href="newuser.jsp">Sign Up</li></a>
              <li><a href="aboutus.jsp">About us</li></a>
              <li><a href="feedback.jsp">FeedBack</li></a>
              <li><a class="active" href="Profile.jsp">Profile</a></li>
			  <%
			  	if(session.getAttribute("email") == null){
			  		%>
			  			<li id="login_link">Welcome ! <a href="login.jsp">Login</a></li>
			  		<% 
			  	}
			  	else{
			  		%>
			  			<li id="login_link">Welcome ! <% out.print((String)session.getAttribute("name")); %><a href="logout.jsp">Logout</a></li>
			  		<% 
			  	}
			  
			  %>
            </ul>
          </nav>
        </div><!-- navigation -->
      </div><!-- top -->
    </header>
	
	<div class="content">

	 <div class="profile">
	 	
	 	<form action="Profile" method="POST">
	 	
	 		<table>
	 			<p id="head1">Personal Details</p>
	 		
	 			<img src="img/members/<% out.print((String)session.getAttribute("name")); %>.jpg">
	 		
	 		<%
	 			PreparedStatement stmt = null;
				ResultSet rs = null;
				
				
				String OriginalPassword;
		
				
				String key = "2F92D77C54D38D80844F5A105FE62008";
				
				String user = session.getAttribute("email").toString();
				
				//System.out.println("USer : " + user);
				
				String query = "SELECT * FROM member WHERE email = '"+user+"'";
				
				try{
					Connection conn = dbconnect.connect();
					stmt = conn.prepareStatement(query);
					rs = stmt.executeQuery();
					
					while(rs.next()){
						String id  = rs.getString(1).toString();
						String password = rs.getString(4);
				        
						session.setAttribute("memID", id);
						
					     byte[] bytekey = GeneratePlainPassword.hexStringToByteArray(key);
					     SecretKeySpec sks = new SecretKeySpec(bytekey, GeneratePlainPassword.AES);
					     Cipher cipher = Cipher.getInstance(GeneratePlainPassword.AES);
					     cipher.init(Cipher.DECRYPT_MODE, sks);
					     byte[] decrypted = cipher.doFinal(GeneratePlainPassword.hexStringToByteArray(password));
					     OriginalPassword = new String(decrypted);
					     
					     //System.out.println("Original Password : " + OriginalPassword);
						%>
							<tr>
								<td>Name :&nbsp;</td>
								<td><input type="text" name="name" value="<% out.print(rs.getString(2));%>"></td>
							</tr>
							
							<tr>
								<td>E-mail :&nbsp;</td>
								<td><input type="email" name="mail" value="<% out.print(rs.getString(3));%>"></td>
							</tr>
							

							<tr><td><p id="head2">Update Details</p></td></tr>
							
						
							<tr>
								<td>Current Password : </td>
								<td><input type="Password" name="pass" id="myPass" value="<%out.print(OriginalPassword);%>">
									<input type="checkbox" onclick="myPassShow()"></td>
							</tr>
							
							<tr>
	 							<td>New Password : </td>
	 							<td><input type="Password" name="newpass" placeholder="New Password"> </td>
	 						</tr>
	 			
	 						<tr>
	 							<td>Re-type Password : </td>
	 							<td><input type="Password"  name="rnewpass" placeholder="Re-type Password"> </td>
	 						</tr>
	 						<br><br>
						<% 
						
					}
				}
				catch(Exception e){
					out.print(e);
				}
	 		%>
	 			<tr>
	 				<td><input type="submit" value="Update Profile">&nbsp;&nbsp;
	 					<input type="reset" value="Reset">
	 				</td>
	 			</tr>
	 		</table>
	 	</form>
	 </div><!-- profile -->
	 
	 </div><!-- content -->	
	 
<div class="footer">
<br>
      <div class="homecol">
        <div class="contact">
          <label><strong><!-- ADDRESS --></strong></label>
        <div id="space">
        <p>
          <strong>CONTACTS</strong><br><br>
          <p id="con">Email: support@talktunes.com</p>
          <p id="con">Phone: +94 77 185 4709</p>
          <p id="con">Fax&nbsp;&nbsp;: +11 27 425 7854</p><br>
          <img src="img/icons/whatsapp.ico" id="whatsapp" alt="">
          <img src="img/icons/viber.ico" id="viber" alt="" >
          <p id="text"><b>Get</b> Started !</p> 
        </p>
        </div>
        </div><!-- contact -->
        
        <div class="copyright">
          <center>
            <hr>
          </center>
          <p>Copyright &copy; 2018 <a href="">TalkTunes.com</a> | All Rights Reserved.</p>
          <img src="img/payment-logo.png">
        </div><!-- copright -->
      </div><!-- homecol -->

      <div class="homecol">
        <label><!-- Fallow Us  --></label>
        <div class="social">
          <tr>
            <td><a href="#"><img src="img/icons/facebook.ico" alt=""  ></a></td>
            <td><a href="#"><p class="icon_name" id="fb">Like us on Facebook</p></a></td><br>
          </tr>

          <tr>
            <td><a href="#"><img src="img/icons/twitter.ico" alt=""  ></a></td>
            <td><a href="#"><p class="icon_name" id="tw">Fallow us on Twitter</p></a></td><br>
          </tr>
          
          <tr>
            <td><a href="#"><img src="img/icons/instagram.ico" alt=""></a></td>
            <td><a href="#"><p class="icon_name" id="in">Fallow us on Instagram</p></a></td><br>
          </tr>
            
          <tr>
            <td><a href="#"><img src="img/icons/youtube.ico" alt=""  ></a></td>
            <td><a href="#"><p class="icon_name" id="you">Subscribe us on Youtube</p></a></td><br>
          </tr>
            
        </div><!-- social -->

      </div><!-- homecol -->

      <div class="homecol">
        <label><!-- News Latter --></label>
        <form action="#" method="POST">
          <tr><td><input type="email" name="" id="" placeholder="Email*"></td><br></tr>
          <tr><td><textarea name="" id="" cols="50" rows="5" placeholder="Message"></textarea></td><br></tr>
          <tr><td><input type="submit" value="CONTACT US"></td></tr>
        </form>
      </div><!-- homecol -->  
    </div><!-- footer -->
  </div><!-- wrapper -->

<script>
  window.onscroll = function() {myFunction()};

  var navbar = document.getElementById("navbar");
  var sticky = navbar.offsetTop;

function myFunction() {
  if (window.pageYOffset >= sticky) {
    navbar.classList.add("sticky")
  } else {
    navbar.classList.remove("sticky");
  }
}
</script>

<script>
  document.getElementById('whatsapp').title='+94 77 185 4709';
  document.getElementById('viber').title='+94 77 185 4709'
</script>

<script>
function myPassShow() {
    var x = document.getElementById("myPass");
    if (x.type === "password") {
        x.type = "text";
    } else {
        x.type = "password";
    }
}
</script>
</body>
</html>