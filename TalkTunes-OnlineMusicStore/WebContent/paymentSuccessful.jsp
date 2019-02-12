<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.io.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Payment | TalkTunes</title>
<link rel="icon" href="img/storelogo.png">
<link rel="stylesheet" href="css/pay1.css">
<link rel="stylesheet" type="text/css" href="css/footer.css">
<link rel="stylesheet" type="text/css" href="css/header.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.10/css/all.css" integrity="sha384-+d0P83n9kaQMCwj8F4RJB66tzIwOKmrdb46+porD/OvrJ+37WqIM7UoBtwHO6Nlg" crossorigin="anonymous">
<style>
		#col3 input[type=text]{
			width: 242px;
			height: 26px;
			margin-bottom: 14px;
			border-radius: 4px;
			border: solid #F5F7F9;
			padding-left: 6px;
			color: #F5F7F9;
			font-family: 'Roboto' sans-serif;
			transition: 1s;
		}
		
		#col3 img{
			height: 150px;
			margin-top: 60px;
			float: left;
			margin-left: -50px;
		}

		#col3 label{
			float: left;
			margin-left: 40px;
			font-size: 13px;
			margin-top: 6px;
			color: #666764;
		}
		
	 	#footer{
      		margin-top: 50px;
    	}
		
		.payment{
			height: 510px;
		}
		.Mcol{
			height: 460px;
		}
		
		.col2{
			height: 300px;
		}
		
		button{
			width: 100px;
			padding: 8px;
			border-radius: 4px;
			border-style: none;
			margin-top: -50px;
			margin-bottom: 7px;
			margin-left: 105px;
			background-color: #E61A25;
			color: #fff; 
		}
		
		button a{
			text-decoration: none;
			color: #fff;
		}
		
		button:hover{
			background-color: #C2242D;
			transition: 1s;
		}
		
		.navibar{
			margin-left: -70px;
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
              <li><a href="#">Comming Soon</li></a>
              <li><a href="#">About us</li></a>
              <li><a href="#">FeedBack</li></a>
              
			  <%
			  	if(session.getAttribute("email") == null){
			  		response.sendRedirect("login.jsp");
			  		%>
			  			<li id="login_link">Wellcome ! <a href="login.jsp">Login</a></li>
			  		<% 
			  	}
			  	else{
			  		%>
			  			<li id="login_link">Wellcome ! <% out.print((String)session.getAttribute("name")); %><a href="logout.jsp">Logout</a></li>
			  		<% 
			  	}
			  
			  %>
            </ul>
          </nav>
        </div><!-- navigation -->
      </div><!-- top -->
    </header>

    <div class="content">
    <br><br><br><br><br><br><br><br><br>
	<div class="payment" id="third">
			<div class="Mcol">
				<div class="col1">
					<p>Pay for</p>
					
					<%	
						String s_price = request.getParameter("price");
						session.setAttribute("Price", s_price);
						
						%>
							<%-- <label>LKR&nbsp;<%out.print(s_price);%></label>	 --%>
						<%
					%>
				</div><!-- col1 -->

			
				<div class="col2" id="col3">
					<p>Thank You !</p>
						
					 <img src="img/icons/ok.png" alt="">
					 <label for="">You made the payment successfully<br><center>Payment ID : <% out.print((String)session.getAttribute("PID")); %></center></label>
				</div><!-- col2 -->

				<div class="Button">
					<form action="Download" method="get">
						<input type="hidden" name="DownloadName" value="<%out.print(session.getAttribute("song_name"));%>">
						<button><i class="fas fa-download">&nbsp;&nbsp;Download</i></button> 
					</form>
					<a href="index.html"><input type="submit" value="Back to Store" <% session.invalidate();%>></a>
				</div><!-- Button -->
			
			</div><!-- Mcol1 -->
	</div><!-- payment -->
<div><!-- content -->

<div class="footer" id="footer">
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
	function Redirect() {
    	window.location="index.jsp";
	 }
</script>
</body>
</html>