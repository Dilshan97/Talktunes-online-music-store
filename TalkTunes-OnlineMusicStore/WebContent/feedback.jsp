<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>FeedBack | TalkTunes</title>
<link rel="icon" href="img/storelogo.png">
<link rel="stylesheet" type="text/css" href="css/footer.css">
<link rel="stylesheet" type="text/css" href="css/header.css">
<link rel="stylesheet" type="text/css" href="css/rating.css">
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=PT+Sans" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.10/css/all.css" integrity="sha384-+d0P83n9kaQMCwj8F4RJB66tzIwOKmrdb46+porD/OvrJ+37WqIM7UoBtwHO6Nlg" crossorigin="anonymous">

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<style>
	.content{
		font-family: 'PT Sans', sans-serif;
		font-size: 15px;
	}
	.row{
		margin-left: 500px;
	}
	.row input[type=email], [type=number] {
		width: 400px;
		height: 35px;
		margin-bottom: 15px;
		border-radius: 4px;
		border: 1px solid #eee;
		border-left: 3px solid;
		padding-left: 15px;
		/* -webkit-transition: all 0.30s ease-in-out;
  		-moz-transition: all 0.30s ease-in-out;
  		-ms-transition: all 0.30s ease-in-out;
  		-o-transition: all 0.30s ease-in-out; */
  		transition: border-color .5s ease-out;
	}
	
	.row textarea{
		width: 400px;
		border: 1px solid #eee;
		border-radius: 4px;
		padding-left: 15px;
		border-left: 3px solid; 
		/* -webkit-transition: all 0.30s ease-in-out;
  		-moz-transition: all 0.30s ease-in-out;
 		-ms-transition: all 0.30s ease-in-out;
 		-o-transition: all 0.30s ease-in-out; */
 		transition: border-color .5s ease-out;
 		font-family: 'PT Sans', sans-serif;
		font-size: 15px;
	}

	.row button{
		margin-top: 25px;
		width: 130px;
		height: 40px;
		margin-left: 130px;
		background-color: #1DB954;
		color: #fff;
		border-style: none;
	}
	
	.row button:hover{
		background-color: #000;
		transition: 1s;
	}
	
 	.row input[type=text]:focus, textarea:focus {
  		box-shadow: 0 0 5px rgba(81, 203, 238, 1);
  		padding: 3px 0px 3px 3px;
  		margin: 5px 1px 3px 0px;
  		border: 1px solid rgba(81, 203, 238, 1);
  		transition: border-color .5s ease-out;
	} 
	
	.row input:required{
		border-left-color:#FA8072;	
	}
	
	.row textarea:required{
		border-left-color:#FA8072;	
	} 
	
	.row p{
		font-size: 20px;
		margin-left: 80px;
		font-weight: bold;
		margin-bottom:20px;
	}
	.footer{
		margin-top:20px;
	}
	
	.homecol{
		height: 250px;
	}
	
	.copyright p{
		margin-bottom: 4px;
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
              <li><a class="active" href="feedback.jsp">FeedBack</li></a>
              
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
	
	<div class="row">
			<p>Coustomer FeedBack Form</p>
			<form action="a_feedback" method="POST">
    		
    		<table>
      			<tr>
        			<td><input type="email" name="mail" placeholder="Enter Your E-mail" required></td>
      			</tr>
      
      			<tr>
        			<td><input type="number" name="contact_no" placeholder="Enter Your Mobile Number" required></td>
      			</tr>
      
      			<tr>
        			<td><textarea rows="8" cols="22" name="feedback" placeholder="Enter Your Feedback" required></textarea></td>
      			</tr>
      
      			<tr>
      				
      				<td>
    					<div class="stars"><br>
  							
    							<input class="star star-5" id="star-5" type="radio" name="star"/>
    							<label class="star star-5" for="star-5"></label>
    							<input class="star star-4" id="star-4" type="radio" name="star"/>
    							<label class="star star-4" for="star-4"></label>
    							<input class="star star-3" id="star-3" type="radio" name="star"/>
    							<label class="star star-3" for="star-3"></label>
    							<input class="star star-2" id="star-2" type="radio" name="star"/>
    							<label class="star star-2" for="star-2"></label>
    							<input class="star star-1" id="star-1" type="radio" name="star"/>
    							<label class="star star-1" for="star-1"></label>
  							
						</div><!-- stars -->
					
      				</td>
      			</tr>
      			
      			<tr>
        			<td><button type="submit" value="" >Send Feedback</button></td>
      			</tr>
    		</table>
  			</form>
  			
  			<button type="submit" value="" id="myBtn" style="visibility: hidden"></button>
  			
	</div><!-- row --> 
     
	

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


<!-- <script>
// Get the modal
var modal = document.getElementById('myModal');

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
btn.onclick = function() {
    modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
    modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script> -->
</body>
</html>