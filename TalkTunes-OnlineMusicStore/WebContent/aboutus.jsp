<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>TalkTunes | About Us</title>
<link rel="icon" href="img/storelogo.png">
<link rel="stylesheet" type="text/css" href="">
<link rel="stylesheet" type="text/css" href="css/header.css">
<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.10/css/all.css" integrity="sha384-+d0P83n9kaQMCwj8F4RJB66tzIwOKmrdb46+porD/OvrJ+37WqIM7UoBtwHO6Nlg" crossorigin="anonymous">
</head>

<style>
	.content{
		background-color: #282828;
	}
	
	.details{
		background-color: #B1B0B0;
		width: 600px;
		height: 500px;
		margin-left: 20px;
	}
	
    .c_title{
    	font-size: 21px;
		margin-left: 40px;
		padding-top: 20px;
		font-weight: bold;
		font-family: "Verdana" Sans-serif;
    }
    .c_details{
		font-family: "Verdana", Sans-serif;
		font-size: 13px;
		margin-left: 40px;
	}
	
	.side-menu{
		float:right;
		width:450px;
		height:600px;
		/* background-color: #A1755C; */
		color: #fff;
		margin-top: -500px;
		margin-right: 180px;
		font-family: monospace;	
	}
	
	.side-col{
		/* background-color: #DFD1C8; */
		height: 150px;
		margin-left: 12px;
		margin-top: 12px;
		margin-right: 12px;
	}
	
	.social ul li{
		display: inline-block;
		margin-right:-20px;
	}
	
	.social img{
      width: 50px;
      margin-left: 20px;
      transition: transform .2s; /* Animation */
    }
    
    .social img:hover{
      transform: scale(1.4);
    }
	.side-col input[type=email]{
      width: 50%;
      padding: 8px;
      margin-bottom: 10px;
      font-family: sans-serif;
      padding-left: 10px; 
      background: #fff;
      border-style: none;
      color: #9C9C9C;
      transition: 1s;
    }
    
     .side-col input[type=submit]{
      float: right;
      margin-right: 60px;
      padding: 10px 20px 10px 20px;
      background: #1DB954;
      border-style: none;
      color: #fff;
      font-weight: bold;
      font-family: sans-serif;
      
    }

    .side-col input[type=submit]:hover{
      background: #000000;
      color: #fff;
      transition: 0.8s;
    }
    
    <!--*************************-->
    
     #text{
      float: right;
      margin-top: 10px;
      margin-right: 190px;
      font-family: monospace; 
      font-weight: 300;
      font-size: 14px;

    }
    .copyright p{
      margin-left: 25px;
      margin-top: 15px;
      color: #9C9C9C;
      font-size: 12px;
      margin-bottom: 6px;
      font-family: monospace;
    }

    .copyright p a{
      text-decoration: none;
      color: #1DB954;
    }

    .copyright p a:hover{
      color: #fff;
      transition: 1s;
    }
    .copyright hr{
      display: block;
      margin-top: 15px;
      width: 1300px;
      border: none;
      height: 0.9px;
      background-color: #9C9C9C;
    }
    
    .copyright img{
    	width: 150px;
    	margin-left: 1000px;
    	margin-top: -25px;
    }
    
    .footer{
      width: 1349px;
      /*background-color: #3C3C3C;*/
      background-color: #1a1a1a;
      overflow: auto;
      margin: 0;
      padding: 0;
      margin-top: 70px;

    }
    .homecol{
      width: 420px;
      float: left;
      height: 70px;
      /* background: #ffffffff; */
      margin-left: 15px;
      font-family: monospace;
    }
    
    .side-col h2{
    	margin-bottom: 15px;
    	font-size: 23px;
    	/* color: #1DB954; */
    }
  
    .Logo img{
    	margin-top: 25px;
    	width: 80px;
    	height: 80px;
    }
    
    .c_details ul li{
		display: inline-block;
		margin-right:-20px;
	}
	
	.c_details img{
      width: 50px;
      margin-left: 30px;
      transition: transform .2s; /* Animation */
    }

	.c_details img:hover{
		transform: scale(1.4);
	}
</style>
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
              <li><a class="active" href="aboutus.jsp">About us</li></a>
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
			  			<li id="profile"><a href="Profile.jsp">Profile</a></li>
			  		<% 
			  	}
			  
			  %>
            </ul>
          </nav>
        </div><!-- navigation -->
      </div><!-- top -->
    </header>
    
<div class="content">
	
	 <div class="details">
        	<p class="c_title">Contact Us</p>
        	<br>
        	<div class="c_details">
      			<strong>TO ADVERTISE ON THE WEBSITE - </strong><br>
       			 	&nbsp;&nbsp;Elit Labs (Pvt) Ltd.<br>
        			&nbsp;&nbsp;Homagama,<br>
        			&nbsp;&nbsp;Sri Lanka.<br>
        			<br>
        			&nbsp;&nbsp;Tel : &nbsp;+94&nbsp;112 253 579 &nbsp;<br>
        			&nbsp;&nbsp;E-Mail : <a href="#">info@elitlabs.com</a><br><br>
        			<br>
        			<strong>HEAD OFFICE -</strong> <br>
        			&nbsp;&nbsp;TalkTunes Music (Pvt) Ltd.<br>
        			&nbsp;&nbsp;Colombo - 05<br>
        			&nbsp;&nbsp;Sri Lanka.<br>
        			<br>
        			&nbsp;&nbsp;Tel : +94 772 313 438<br>
        			&nbsp;&nbsp;E-Mail : <a href="#">info@Talktunes.lk</a><br><br>
        			<br>
        			<strong>ALL INQURIES -</strong> <br>
        			&nbsp;&nbsp;Tel : +94 772 313 438 / 771 854 709&nbsp;(Hotline)<br>
       				<br><br>
       				
         
       				<ul>
       					<li><img src="img/icons/whatsapp.ico" id="whatsapp" alt=""></li>
       					<li><img src="img/icons/viber.ico" id="viber" alt="" ></li>
       				</ul>
     		</div><!-- c_details -->
	</div><!-- details -->
	
	
	<div class="side-menu">
	
	  <div class="side-col">
        <h2>More About Company</h2>
        <p id="quate">We are Sri Lanka`s largest distribution group for music products, professional audio equipment and home theatre 
        systems under the name of We Love Music, in collaboration with Talk Tunes Music Store. <br></p>
        <p id="quate">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Our mission is to consistently provide high quality  services which are affordable and 
        exceeding the expectations of our customers.</p>
      </div> <!-- side-col -->
      
      <div class="side-col">
      <br><br>
      	<h2>Keep Connected</h2>
      	 <div class="social">
      		<ul>
      			<li><a href="#"><img src="img/icons/facebook.ico" alt=""  ></a></li>
      			<li><a href="#"><img src="img/icons/twitter.ico" alt=""  ></a></li>
      			<li><a href="#"><img src="img/icons/instagram.ico" alt=""></a></li>
      			<li><a href="#"><img src="img/icons/google+.ico" alt=""></a></li>
      			<li><a href="#"><img src="img/icons/youtube.ico" alt=""  ></a></li>
      			<li></li>
      		</ul>
      	</div>
      </div><!-- side-col -->
      
       <div class="side-col">
      	<h2>Subscribe to our newsletter</h2>
      	Sign up here to get the latest news, updates and special offers delivered directly to your inbox.<br><br>
      	
      	<label><!-- News Latter --></label>
        <form action="#" method="POST">
          <tr><td><input type="email" name="" id="" placeholder="Email Here*"></td>
          <input type="submit" value="SUBSCRIBE"></td></tr>
        </form><br>
        
      	<h4><span style="color:red;">*</span>&nbsp;We will not share your information with<br>&nbsp;&nbsp;anyone.</h4>
      </div><!-- side-col -->
      
      <div class="side-col">
      	<div class="Logo">
      		<!-- <img src="img/storelogo.png"> -->
      	</div>
      </div><!-- side-col -->
      
	</div><!-- side-menu -->
<div><!-- content -->

<div class="footer">
<br>
      <div class="homecol">
        <div class="copyright">
          <center>
            <hr>
          </center>
          <p>Copyright &copy; 2018 <a href="">TalkTunes.com</a> | All Rights Reserved.</p>
          <img src="img/payment-logo.png">
        </div><!-- copright -->
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