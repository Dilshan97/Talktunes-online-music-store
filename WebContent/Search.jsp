<%@page import="com.sun.crypto.provider.RSACipher"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="db.dbconnect" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search | Talktunes</title>
<link rel="icon" href="img/storelogo.png">
  <link rel="stylesheet" type="text/css" href="css/footer.css">
  <link rel="stylesheet" type="text/css" href="css/header.css">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.10/css/all.css" integrity="sha384-+d0P83n9kaQMCwj8F4RJB66tzIwOKmrdb46+porD/OvrJ+37WqIM7UoBtwHO6Nlg" crossorigin="anonymous">
  <style>
	table {
    	font-family: arial, sans-serif;
    	border-collapse: collapse;
    	width: 800px;
	}

	td, th {
    	border: 1px solid #dddddd;
    	text-align: left;
    	padding: 8px;
	}

	tr:nth-child(even) {
    	/* background-color: #dddddd; */
	}
	
	#btn_play{
       width: 60px;
       height: 30px;
       border-radius: 4px;
       border-style: none;
       background-color: #1DB954;
       color: #fff;
    }

    #btn_play:hover{
      background-color: #000;
      transition: 1s;
    }

    #btn_download{
      width: 90px;
      height: 30px;
      border-radius: 4px;
      border-style: none;
      background-color: #CA4638;
      color: #fff;
    }

    #btn_download:hover{
      background-color: #000;
      transition: 1s;
    }
    
    .content table{
    	margin-left: 250px;
    }
    .footer{
		margin-top:20px;
	}
	
	.navibar{
		margin-left:-23px;
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
              <li><a class="active" href="index.jsp">Home</li></a>
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
			  			<li><a href="Profile.jsp">Profile</a></li>
			  		<% 
			  	}
			  
			  %>
            </ul>
          </nav>
        </div><!-- navigation -->
      </div><!-- top -->
    </header>


<div class="content">
	<table>
		  <tr>
		  	<th>Image</th>
    		<th>Title</th>
    		<th>Album/Movie</th>
    		<th>Play</th>
    		<th>Download</th>
  		</tr>
	<%
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		String search_btn = request.getParameter("searchbar");
	
		System.out.println("search_btn : " + search_btn);
		
		String query = "SELECT * FROM song WHERE title LIKE'%"+search_btn+"%'";
		
		try {
			Connection conn = dbconnect.connect();
			stmt = conn.prepareStatement(query);
			rs = stmt.executeQuery();
			
			while(rs.next()){
				%>
					<tr>
						<td><img src="img/song_cover/<%out.print(rs.getString(3));%>.jpg" alt="" width="150"></td>
						<td><%out.print(rs.getString(3)); %></td>
						<td><%out.print(rs.getString(4)); %></td>
						<td>
							<form action="product.jsp">
								<input type="hidden" name="song_id" value="<%out.print(rs.getString(1));%>">
								<button type="submit" id="btn_play"><i class="fas fa-play-circle">&nbsp;Play</i></button>
							</form>
						</td>
						
						<td>
							<form action="product.jsp">
								<input type="hidden" name="song_id" value="<%out.print(rs.getString(1));%>">
								<button type="submit" id="btn_download"><i class="fas fa-download">&nbsp;&nbsp;Download</i></button>
							</form>
						</td>
					</tr>
				<% 
			}
		} catch (SQLException e) {
			System.out.println(e);
		}

	%> 
</table>
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

</body>
</html>