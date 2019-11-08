<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Payments | TalkTunes</title>
<link rel="icon" href="img/storelogo.png">
<link rel="stylesheet" href="css/pay1.css">
<link rel="stylesheet" type="text/css" href="css/footer.css">
<link rel="stylesheet" type="text/css" href="css/header.css">
<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
	 #footer{
      	margin-top: 50px;
    }
    
    .navibar{
    	margin-left:-70px;
    }
</style>
<script>
		function showhide(x){
			
			if(x == 1){
				document.getElementById("Second").style.display = "block";
				document.getElementById("first").style.display = "none";
				return;
			}
			else{
				document.getElementById("Second").style.display = "none";
				return;
			}
		}
</script>

<script>
 $(document).ready (function (){
    $("#btn_pay").click(function () {
             $("#third").show();
             $("#Second").hide();
     });
});
</script>

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
    
	<div class="payment" id="first">
			<div class="Mcol">
				<div class="col1">
					<p>Pay for</p>
					
					<%	
						String s_price = request.getParameter("price");
						session.setAttribute("Price", s_price);
						
						%>
							<label>LKR&nbsp;<%out.print(s_price);%></label>	
						<%
					%>
				</div><!-- col1 -->

			<form action="" method="post">
				<div class="col2">
					<p>Pay with</p>
						<label for="">Credit/Debit Card</label>
					 <table>
					 	<tr>
					 		<td></td>
					 		<td><input type="radio" name="Credit" id="" onclick="showhide(1)"></td>
					 		<td><img src="img/icons/visa.png" alt=""></td>

					 		<td><input type="radio" name="Credit" id="" onclick="showhide(1)"></td>
					 		<td><img src="img/icons/master.png" alt=""></td>

					 		<td><input type="radio" name="Credit" id="" onclick="showhide(1)"></td>
					 		<td><img src="img/icons/americanexpress.png" alt=""></td>
					 	</tr>
					 </table>
						
					<label id="col2-1">Mobile Wallet</label>
					 <table>
					 	<tr id="col2-s">
					 		<td><input type="radio" name="Credit" id=""></td>
					 		<td><img src="img/icons/ezCash.png" alt="" id="mobile-pay"></td>

					 		<td><input type="radio" name="Credit" id=""></td>
					 		<td><img src="img/icons/mCash.png" alt="" id="mobile-pay"></td>
					 	</tr>
					 </table>
				</div><!-- col2 -->

				<div class="Button">
					<input type="submit" value="Next">
				</div><!-- Button -->
			</form>
			</div><!-- col1 -->
		</div><!-- payment -->
		
		
<!-- ************************************************************************************************************************ -->

	<div class="payment" id="Second">
			<div class="Mcol">
				<div class="col1">
					<p>Pay for</p>
						<%
							%>
								<label>$&nbsp;<%out.print(s_price);%></label>
							<%
						%>
				</div><!-- col1 -->

			<form action="Payment" method="post">
				<div class="col2" id="col3">
					<p>Pay with</p>
						<label for="">Credit/Debit Card</label>
					 <table>
					 	
					 		<tr><td><input type="text" name="card_holder" id="" placeholder="Name on Card" required></td></tr>

					 		<tr><td><input type="text" name="card_number" id="" placeholder="Credit Card Number" maxlength="16" required></td></tr>

					 		<tr><td><input type="text" name="Credit" id="" placeholder="CVV" maxlength="3" required></td></tr>

					 		<tr><td><input type="text" name="Credit" id="" placeholder="Expiry MM/YY" maxlength="4" required></td></tr>
					 	
					 </table>
				</div><!-- col2 -->

				<div class="Button">
					<input type="submit" value="Pay LKR <%out.print(s_price); %>" id="btn_pay">
				</div><!-- Button -->
			</form>
			</div><!-- col1 -->
		</div><!-- payment -->	
		
		
<!-- ************************************************************************************************************************ -->
	
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

</body>
</html>