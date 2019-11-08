<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="db.dbconnect" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>TalkTunes | Category</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="icon" href="img/storelogo.png">
  <link rel="stylesheet" type="text/css" href="css/footer.css">
  <link rel="stylesheet" type="text/css" href="css/header.css">
  
  <link rel="stylesheet" type="text/css" href="css/player.css">
  <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.10/css/all.css" integrity="sha384-+d0P83n9kaQMCwj8F4RJB66tzIwOKmrdb46+porD/OvrJ+37WqIM7UoBtwHO6Nlg" crossorigin="anonymous">
  <link href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" rel="stylesheet"/>
  <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
  <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
  <script src="js/player.js"></script>
  
  <style>
  	.footer{
  			margin-top:auto;
  		}
  		
  	.content{
  		padding-top: 100px;
  	}
  	.scol1{
			width: 320px;
			height: 320px;
			margin-left: 100px;
			float: left;
			
			margin-bottom: 8px;
			box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.55), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
			
		}
		
		.scol1 img{
			width: 308px;
      		margin-top: -200px;
		}
  		
  	.scol1 img{
			margin: 7px 7px 7px 7px;
		}
		
	.data{
			margin-top: 50px;
			height:350px;
			margin-bottom: 200px;
			font-size: 15px;
			font-family: 'Source Sans Pro', 'Helvetica Neue', Helvetica, Arial, sans-serif;	
		}
		
		.data table{
			margin-left: 500px;
			background-color: #F2F1EF; 
      width: 500px;	
      border-radius: 4px;
      padding-top: 30px;
      
		}
		
    .data table tr{
      margin-top: 25px
    }
	.data button[type=submit]{
	  width: 100px;
	  padding: 15px;
	  background: #CA4638;
	  color: #fff;
	  border-style: none;
	  border-radius: 4px;
	  margin-bottom: 50px;
      margin-left: 25px;
	}
		
	.data table button{
		margin-top: 25px;
		margin-bottom: 25px;
		
	}
	.data button[type=submit]:hover{
		background: #000;
		transition: 1s;
	}
		
	.data table tr td{
	  padding-left: 25px;
      padding-bottom: 10px;
      padding-top: 8px;
      font-size: 18px;
	}

    .related_song{
      margin-left: 250px;
      margin-top:35px;
    }
    .related_song table{
      font-family: arial, sans-serif;
      border-collapse: collapse;
      width: 800px;
      margin-top: 25px;
    }

    .related_song td, th {
      border: 1px solid #dddddd;
      text-align: left;
      padding: 18px;
    }

    .related_song tr:nth-child(even) {
      background-color: #dddddd;
    }

    .related_song label{
      font-size: 20px;
      font-weight: bold;
      font-family: monospace;
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
    
    #price img{
    	width: 200px;
    }
    
	#amount p{
		margin-left: -365px;
		font-size:25px;
		font-weight: bold;
		color: #fff;
	}
 
  </style>
  
</head>
<body>

<%
	Statement stmt = null;
	ResultSet rs = null;
	Connection conn = null;
	String cat = null;
%>
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
    
    <div class="content">
    		
    		<div class="data">
    			<table>
    					<%
    						String id = request.getParameter("song_id");
    						
    						session.setAttribute("song_id", id);
    						
    						System.out.println("Song ID : " + id);
    						
    						String query = "SELECT * FROM song WHERE song_id = '"+ id +"'";
    					
    						try{
    							conn = dbconnect.connect();
    							stmt = conn.createStatement();
    							rs = stmt.executeQuery(query);
    							
    							if(rs.next()){
    								
    								%>	<div class="scol1">
											<img src="img/song_cover/<%out.print(rs.getString(3));%>.jpg">
										</div><!-- col1 -->
    								
    									<tr>
    										<td>Title&nbsp;&nbsp;:&nbsp;&nbsp;<b><%out.print(rs.getString(3)); %></b></td>
    									</tr>
    									
    									<tr>
    										<td>Movie/Album&nbsp;&nbsp;:&nbsp;&nbsp;<b><%out.print(rs.getString(4)); %></b></td>
    									</tr>
    									
    									<tr>
    										<td>Artist(s)&nbsp;&nbsp;:&nbsp;&nbsp;<b><%out.print(rs.getString(5)); %></b></td>
    									</tr>
    									
    									<tr>
    										<td>Category&nbsp;&nbsp;:&nbsp;&nbsp;<b><%out.print(rs.getString(2)); %></b></td>
    									</tr>
    									
    									<tr>
    										<td>Year&nbsp;&nbsp;:&nbsp;&nbsp;<b><%out.print(rs.getString(6)); %></b></td>
    									</tr>
    									
    									<tr>
    										<td id="price"><img src="img/icons/price.png"></td>
    										<td id="amount"><p>Rs.<%out.print(rs.getInt(8)); %></p></td>
    									</tr>
    								<%
    							}
    							
    							cat = rs.getString(2);
    							System.out.println("Name : " + rs.getString(3) +".mp3");
    							
    							session.setAttribute("song_name", rs.getString(3));
    	
    						}
    						catch(Exception e){
    							response.sendRedirect("notfound.jsp");
    							
    						}
    					%>
    					
    				
    					<tr>
    						<td>
								<audio id="player" onload="select_song()">
    								<source src="song/<%out.print(rs.getString(3));%>.mp3" type="audio/mpeg" id="surl"/>
								</audio>

								<div id="audio-player">
    								<div id="controls">
        								<i id="play" class="fa fa-play"></i>
        								<span id="start-time" class="time">00:00</span>
        								<div id="progressbar"></div>
        								<span id="time" class="time">00:00</span>
        								<i id="mute" class="fa fa-volume-up"></i>
        								<div id="volume"></div>    
   									 </div><!--controls -->
								</div><!--audio-player-->
							</td>
						</tr>
    				<tr>
    					<td>
    						<form action="payment.jsp" method="get">
    							<input type="hidden" name="price" value="<%out.print(rs.getInt(8));%>">
    							<button type="submit" onclick="myDown()"><i class="fas fa-download" id="btn_icon">&nbsp;&nbsp;&nbsp;Download</i></button>
    						</form>
    					</td>
    				</tr>
    			</table>
    		</div><!-- data -->
    		
    	<div class="related_song">
      <label for="">Related Songs</label> 
        <table>
          <tr>
            <th>Title</th>
            <th>Album/Movie</th>
            <th>Play</th>
            <th>Download</th>
          </tr>
		
			<% 
				String sql1 ="SELECT * FROM song WHERE category = '"+ cat +"' LIMIT 3";
    		  
    		  	try{
    		  		conn = dbconnect.connect();
    		  		stmt = conn.createStatement();
					rs = stmt.executeQuery(sql1);
					
					while(rs.next()){
						
						%>
							<tr>
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
    		  	}
				catch(Exception e){
					System.out.println(e);
				}
			%>
			
        </table>
      </div><!-- related_song -->
    </div><!-- content -->
    
    <br><br>
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
    var audio_player = $("#audio-player");
    var play_button = $('#play');
    var progress_bar = $("#progressbar");
    var time = $("#time");
    var mute_button = $('#mute');
    var volume_bar = $('#volume');
    var more_info = $('#more-info-box');
    var info_tray = $("#info-tray");
    var player = document.getElementById('player');
    var duration = 0;
    var volume = 0.50;

    player.onloadedmetadata = function() {
        duration = player.duration;
        progress_bar.progressbar("option", { 'max' : duration });
    };

    player.load();
    player.volume = 0.50;
    player.addEventListener("timeupdate", function() {
        progress_bar.progressbar('value', player.currentTime);
        time.text(getTime(player.currentTime));
    }, false);

    function getTime(t) {
        var m=~~(t/60), s=~~(t % 60);
        return (m<10?"0"+m:m)+':'+(s<10?"0"+s:s);
    }

    function getProgressBarClickInfo(progress_bar, e) {
        var offset = progress_bar.position();
        var x = e.pageX - offset.left; // or e.offsetX (less support, though)
        var y = e.pageY - offset.top;  // or e.offsetY
        var max = progress_bar.progressbar("option", "max");
        var value = x * max / progress_bar.width();

        return { x: x, y: y, max: max, value: value };
    }

    volume_bar.progressbar({
        value : player.volume*100,
    });

    volume_bar.click(function(e) {
        var info = getProgressBarClickInfo($(this), e);
        volume_bar.progressbar('value', info.value);
        player.volume = info.value / info.max;
    });

    progress_bar.progressbar({
        value : player.currentTime,
    });

    progress_bar.click(function(e) {
        var info = getProgressBarClickInfo($(this), e);
        player.currentTime = player.duration / info.max * info.value;
    });

    play_button.click(function() {
        player[player.paused ? 'play' : 'pause']();
        $(this).toggleClass("fa-pause", !player.paused);
        $(this).toggleClass("fa-play", player.paused);
    });

    mute_button.click(function() {
        if (player.volume == 0) {
            player.volume = volume;
        } else {
            volume = player.volume;
            player.volume = 0;
        }

        volume_bar.progressbar('value', player.volume * 100);

        $(this).toggleClass("fa-volume-up", player.volume != 0);
        $(this).toggleClass("fa-volume-off", player.volume == 0);
    });

    more_info.click(function() {
        audio_player.animate({
            height: (audio_player.height() == 50) ? 100 : 50
        }, 1000);
    });
    
    </script>
    
    <script>
    	function myDown(){
    		
    		var val = null; 
			
    		if(val == null){
    			<%
    				
    			%>
    		}
    		 /* alert("I am an alert box!" + val);  */
    	}
    </script>
 
</body>
</html>