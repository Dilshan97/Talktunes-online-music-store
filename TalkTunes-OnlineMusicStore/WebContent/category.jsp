<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="db.dbconnect" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Category | TalkTunes</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="icon" href="img/storelogo.png">
  <link rel="stylesheet" type="text/css" href="css/footer.css">
  <link rel="stylesheet" type="text/css" href="css/header.css">
  
  <link rel="stylesheet" type="text/css" href="css/song-table.css">
  <link rel="stylesheet" type="text/css" href="css/song-col.css">
  
  <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.10/css/all.css" integrity="sha384-+d0P83n9kaQMCwj8F4RJB66tzIwOKmrdb46+porD/OvrJ+37WqIM7UoBtwHO6Nlg" crossorigin="anonymous">
  <link href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" rel="stylesheet"/>
  <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
  <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
  
  <style>
  	/* .inline { 
    	display: inline-block;
	} */
	
	.song-table table{
		display: grid;
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
              <li><a href="index.jsp">Home</li></a>
              <li><a href="newuser.jsp">Sign Up</li></a>
              <li><a href="aboutus.jsp">About us</li></a>
              <li><a href="feedback.jsp">FeedBack</li></a>
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
<!-- ************************************************************************************************************************ -->


    
    <div class="content">
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    	<div class = "song-table">
    	
    		<table>
    			<tr>  
    				<td> 
    					<%
    						String cat_name = request.getParameter("category");
    					
    						Statement stmt = null;
    						ResultSet rs = null;
    						Connection conn = null;
    				
    						String query = "SELECT * FROM song WHERE category = '"+cat_name+"'";
    						
    						try{
    							conn = dbconnect.connect();
    							stmt = conn.createStatement();
    							rs = stmt.executeQuery(query);
    							
    							while(rs.next()){
    								%>
    								
    								<div class="songTray">
    									<div class="scol1">
    										<img src="img/song_cover/<%out.print(rs.getString(3));%>.jpg" alt="" width="208">
    									</div><!-- scol1 -->
    						
    								<div class="scol">
										<table>
											<tr><td>Title :<b>&nbsp;<%out.print(rs.getString(3));%></b></td></tr>
											<tr><td>Movie/Album :<b>&nbsp;<%out.print(rs.getString(4));%></b></td></tr>
											<tr><td>Singer(s) :<b>&nbsp;<%out.print(rs.getString(5));%></b></td></tr>
											<tr><td>												
													<form action="product.jsp" >
														<input type="hidden" name="song_id" value="<%out.print(rs.getString(1));%>">
														<button type="submit"><i class="fas fa-play-circle">&nbsp;&nbsp;&nbsp;Play</i></button>
													</form>
												</td>
											</tr>
										</table>
									</div><!-- scol -->
    								</div><!-- songTray -->
    								<%
    							}
    							
    							
    						}catch(Exception e){
    							System.out.println(e);
    						}
    					%>
    		
    				</td> 
    			</tr>
    		</table>
    	</div><!-- song-table -->
    </div><!-- content -->

<!-- ************************************************************************************************************************ -->
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
</body>
</html>