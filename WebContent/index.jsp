


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>Home | TalkTunes</title>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="icon" href="img/storelogo.png">
  <link rel="stylesheet" type="text/css" href="css/footer.css">
  <link rel="stylesheet" type="text/css" href="css/header.css">
  <link rel="stylesheet" type="text/css" href="css/song-table.css">
  <link rel="stylesheet" type="text/css" href="css/song-col.css">
  <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.10/css/all.css" integrity="sha384-+d0P83n9kaQMCwj8F4RJB66tzIwOKmrdb46+porD/OvrJ+37WqIM7UoBtwHO6Nlg" crossorigin="anonymous">
<style>
		.searchbar input[type=text]{
	 		width: 300px;
	 		height: 30px;
	 		padding-left: 12px;
	 		border-left: 20px solid ;
	 		border-radius: 4px;
	 		border: 2px solid #eee;
	 		border-left-color: #1DB954;
	 	} 
	 	
	 	#submit_btn{
	 		background-color: #1DB954;
	 		width: 45px;
	 		height: 30px;
	 	}
	 	
	 	#submit_btn:hover{
	 		background-color:#000;
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
  		
  		<center>	
  			<div class="searchbar">
  			<table>
  				<form action="Search.jsp" method="get">
  					<tr>
  						<td><input type="text" name="searchbar" id="" placeholder="Search song..."></td>
  						<td><button type="submit" id="submit_btn"><i class="fas fa-search"></i></button></td>
  					</tr>
  				</form>
  			</table>
				
					
					
				
			</div><!-- searchbar -->
  		</center>
  	 		<div class="vertical-menu">
  		  <table>
  			<tr>
  				<td>
  					<form action="category.jsp">
  						<input type="hidden" name="category" value="English"/>
  						<!-- <label>Hollywood</label> -->
  						<input type="submit" value="English">
  					</form>
  				</td>
  			</tr>
  			
  			<tr>
  				<td>
  					<form action="category.jsp">
  						<input type="hidden" name="category" value="Sinhala"/>
  						<input type="submit" value="Sinhala">
  					</form>
  				</td>
  			</tr>
  			
  			<tr>
  				<td>
  					<form action="category.jsp">
  						<input type="hidden" name="category" value="Hindi"/>
  						<input type="submit" value="Hindi">
  					</form>
  				</td>
  			</tr>
  			
  			
  			<tr>
  				<td>
  					<form action="category.jsp">
  						<input type="hidden" name="category" value="Tamil"/>
  						<input type="submit" value="Tamil">
  					</form>
  				</td>
  			</tr>
  			
  			<tr>
  				<td>
  					
  				</td>
  			</tr>
  		 </table>
  		 
  		 
  		</div><!-- vertical-menu -->
  	
  		
  	
 
  	<div class = "song-table">
  	<br><br><br>
  		<table>
  			<tr>
  				<td>
  					 <div class="songTray">
						<div class="scol1">
							<img src="img/song_cover/Despacito.jpg" alt="" width="208">
					</div><!-- col1 -->

					<div class="scol">
						<table>
							<tr><td>Title :<b>&nbsp;DESPACITO</b></td></tr>
							<tr><td>Movie/Album :<b>&nbsp;Daddy K - The Mix 11</b></td></tr>
							<tr><td>Singer(s) :<b>&nbsp;Luis Fonsi</b></td></tr>
							<br>
							<tr>
								<td>
									<form action="product.jsp" >
									<input type="hidden" name="song_id" value="S001"><br>
									<button type="submit"><i class="fas fa-play-circle">&nbsp;&nbsp;&nbsp;Play</i></button>
									</form>
								</td>
							</tr>
						</table>
					</div><!-- scol -->
  				</td>
  				
  				
  				<td>
  					<div class="songTray">
						<div class="scol1">
							<img src="img/song_cover/See You Again.jpg" alt="" width="208">
					</div><!-- col1 -->

					<div class="scol">
						<table>
							<tr><td>Title :<b>&nbsp;SEE YOU AGAIN</b></td></tr>
							<tr><td>Movie/Album :<b>&nbsp;Furious 7</b></td></tr>
							<tr><td>Singer(s) :<b>&nbsp;Wiz Khalifa</b></td></tr>
							<tr>
								<td>
									<form action="product.jsp" method="get">
									<input type="hidden" name="song_id" value="S002"><br><br>
									<button type="submit" value="despacito"><i class="fas fa-play-circle" id="btn_icon">&nbsp;&nbsp;&nbsp;Play</i></button>
									</form>
								</td>
							</tr>
						</table>
					</div><!-- scol -->
  				
  				</td>
  				
  				
  				<td>
  					<div class="songTray">
						<div class="scol1">
							<img src="img/song_cover/Bulleya.jpg" alt="" width="208">
					</div><!-- col1 -->

					<div class="scol">
						<table>
							<tr><td>Title :<b>&nbsp;Bulleya</b></td></tr>
							<tr><td>Movie/Album :<b>&nbsp;Ae Dil Hai Mushkil</b></td></tr>
							<tr><td>Singer(s) :<b>&nbsp;Shilpa Rao, Amit Mishra</b></td></tr>
							<tr>
								<td>
									<form action="product.jsp" >
									<input type="hidden" name="song_id" value="S003">
									<button type="submit" value="despacito"><i class="fas fa-play-circle" id="btn_icon">&nbsp;&nbsp;&nbsp;Play</i></button>
									</form>
								</td>
							</tr>
						</table>
					</div><!-- scol -->
  				</td>
  				
  				
  				
  				<td>
  					 <div class="songTray">
						<div class="scol1">
							<img src="img/song_cover/Shape of You.jpg" alt="" width="208">
					</div><!-- col1 -->

					<div class="scol">
						<table>
							<tr><td>Title :<b>&nbsp;Shape of You</b></td></tr>
							<tr><td>Movie/Album :<b>&nbsp;÷</b></td></tr>
							<tr><td>Singer(s) :<b>&nbsp;Ed Sheeran</b></td></tr>
							<tr>
								<td>
									<form action="product.jsp" method="get">
									<input type="hidden" name="song_id" value="S004"><br><br>
									<button type="submit" value="despacito"><i class="fas fa-play-circle" id="btn_icon">&nbsp;&nbsp;&nbsp;Play</i></button>
									</form>
								</td>
							</tr>
						</table>
					</div><!-- scol -->
  				</td>
  			</tr><br>
  				
  			
  			<tr>
  				<td>
  					 <div class="songTray">
						<div class="scol1">
							<img src="img/song_cover/kadhal devatha.jpg" alt="" width="208">
					</div><!-- col1 -->

					<div class="scol">
						<table>
							<tr><td>Title :<b>&nbsp;Kadhal devathai</b></td></tr>
							<tr><td>Movie/Album :<b>&nbsp;Sakka Podu Podu Raja</b></td></tr>
							<tr><td>Singer(s) :<b>&nbsp;Yuvan Shankar Raja</b></td></tr>
							<tr>
								<td>
									<form action="product.jsp" method="get">
									<input type="hidden" name="song_id" value="S007"><br>
									<button type="submit" value="despacito"><i class="fas fa-play-circle" id="btn_icon">&nbsp;&nbsp;&nbsp;Play</i></button>
									</form>
								</td>
							</tr>
						</table>
					</div><!-- scol -->
  				</td>
  				
  				
  				<td>
  					<div class="songTray">
						<div class="scol1">
							<img src="img/song_cover/Kaanamal Pona Kathal.jpg" alt="" width="208">
					</div><!-- col1 -->

					<div class="scol">
						<table>
							<tr><td>Title :<b>&nbsp;KAANAMAL PONA KADHAL</b></td></tr>
							<tr><td>Movie/Album :<b>&nbsp;Dhilluku Dhuddu</b></td></tr>
							<tr><td>Singer(s) :<b>&nbsp;Sanjana Divaker Kalmanje, Nivas</b></td></tr>
							<tr>
								<td>
									<form action="product.jsp" method="get">
									<input type="hidden" name="song_id" value="S008">
									<button type="submit" value="despacito"><i class="fas fa-play-circle" id="btn_icon">&nbsp;&nbsp;&nbsp;Play</i></button>
									</form>
								</td>
							</tr>
						</table>
					</div><!-- scol -->
  				
  				</td>
  				
  				
  				<td>
  					 <div class="songTray">
						<div class="scol1">
							<img src="img/song_cover/Haseeno Ka Deewana.jpg" alt="" width="208">
					</div><!-- col1 -->

					<div class="scol">
						<table>
							<tr><td>Title :<b>&nbsp;HASEENO KA DEEWANA</b></td></tr>
							<tr><td>Movie/Album :<b>&nbsp;Kaabil</b></td></tr>
							<tr><td>Singer(s) :<b>&nbsp;Raftaar, Payal Dev</b></td></tr>
							<tr>
								<td>
									<form action="product.jsp" method="get">
									<input type="hidden" name="song_id" value="S009"><br><br>
									<button type="submit" value="despacito"><i class="fas fa-play-circle" id="btn_icon">&nbsp;&nbsp;&nbsp;Play</i></button>
									</form>
								</td>
							</tr>
						</table>
					</div><!-- scol -->
  				</td>
  				
  				
  				
  				<td>
  					<div class="songTray">
						<div class="scol1">
							<img src="img/song_cover/Sunn Raha Hai Na Tu.jpg" alt="" width="208">
					</div><!-- col1 -->

					<div class="scol">
						<table>
							<tr><td>Title :<b>&nbsp;SUNN RAHA HAI NA TU</b></td></tr>
							<tr><td>Movie/Album :<b>&nbsp;Aashiqui 2</b></td></tr>
							<tr><td>Singer(s) :<b>&nbsp;Ankit Tiwari</b></td></tr>
							<tr>
								<td>
									<form action="product.jsp" method="get">
									<input type="hidden" name="song_id" value="S010"><br><br>
									<button type="submit" value="despacito"><i class="fas fa-play-circle" id="btn_icon">&nbsp;&nbsp;&nbsp;Play</i></button>
									</form>
								</td>
							</tr>
						</table>
					</div><!-- scol -->
  				</td>	 
  			</tr><br>
  			
  			
  			 <tr>
  				  <td>
  					 <div class="songTray">
						<div class="scol1">
							<img src="img/song_cover/Saree Ke Fall Sa.jpg" alt="" width="208">
					</div><!-- col1 -->

					<div class="scol">
						<table>
							<tr><td>Title :<b>&nbsp;SAREE KE FALL SA</b></td></tr>
							<tr><td>Movie/Album :<b>&nbsp;R.Rajkumar</b></td></tr>
							<tr><td>Singer(s) :<b>&nbsp;Nakash Aziz, Antara Mitra</b></td></tr>
							<tr>
								<td>
									<form action="product.jsp" method="get">
									<input type="hidden" name="song_id" value="S011">
									<button type="submit" value="despacito"><i class="fas fa-play-circle" id="btn_icon">&nbsp;&nbsp;&nbsp;Play</i></button>
									</form>
								</td>
							</tr>
						</table>
					</div><!-- scol -->
  				</td>
  				
  				
  				<td>
  					<div class="songTray">
						<div class="scol1">
							<img src="img/song_cover/Saragaye.jpg" alt="" width="208">
					</div><!-- col1 -->

					<div class="scol">
						<table>
							<tr><td>Title :<b>&nbsp;SARAGAYE</b></td></tr>
							<tr><td>Movie/Album :<b>&nbsp;-</b></td></tr>
							<tr><td>Singer(s) :<b>&nbsp;Sanuka Wickramasinghe</b></td></tr>
							<tr>
								<td>
									<form action="product.jsp" method="get">
									<input type="hidden" name="song_id" value="S005">
									<button type="submit" value="despacito"><i class="fas fa-play-circle" id="btn_icon">&nbsp;&nbsp;&nbsp;Play</i></button>
									</form>
								</td>
							</tr>
						</table>
					</div><!-- scol -->
  				
  				</td>
  				
  				
  				<td>
  					<div class="songTray">
						<div class="scol1">
							<img src="img/song_cover/Marunu Hithe.jpg" alt="" width="208">
					</div><!-- col1 -->

					<div class="scol">
						<table>
							<tr><td>Title :<b>&nbsp;MARUNU HITHE</b></td></tr>
							<tr><td>Movie/Album :<b>&nbsp;Daddy K - The Mix 11</b></td></tr>
							<tr><td>Singer(s) :<b>&nbsp;Anushka Udana</b></td></tr>
							<tr>
								<td>
									<form action="product.jsp" method="get">
									<input type="hidden" name="song_id" value="S012">
									<button type="submit" value="despacito"><i class="fas fa-play-circle" id="btn_icon">&nbsp;&nbsp;&nbsp;Play</i></button>
									</form>
								</td>
							</tr>
						</table>
					</div><!-- scol -->
  				</td>
  				
  				
  				
  				<td>
  					<div class="songTray">
						<div class="scol1">
							<img src="img/song_cover/Yami Pain Yami.jpg" alt="" width="208">
					</div><!-- col1 -->

					<div class="scol">
						<table>
							<tr><td>Title :<b>&nbsp;YAMI PAIN YAMI</b></td></tr>
							<tr><td>Movie/Album :<b>&nbsp;Da</b></td></tr>
							<tr><td>Singer(s) :<b>&nbsp;Anushka Udana</b></td></tr>
							<tr>
								<td>
									<form action="product.jsp" method="get">
									<input type="hidden" name="song_id" value="S006"><br>
									<button type="submit" value="despacito"><i class="fas fa-play-circle" id="btn_icon">&nbsp;&nbsp;&nbsp;Play</i></button>
									</form>
								</td>
							</tr>
						</table>
					</div><!-- scol -->
  				</td>	 
  			</tr>
  		</table>
 
		</div><!-- songTray -->	
		
  	</div><!-- song-tabel -->
  		
 
  		
  		
  		
  	<div><!-- content -->

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
        <form action="Newslatter" method="POST">
          <tr><td><input type="email" name="email" id="" placeholder="Email*"></td><br></tr>
          <tr><td><textarea name="message" id="" cols="50" rows="5" placeholder="Message"></textarea></td><br></tr>
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