<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="db.dbconnect" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>TalkTunes | Add New Songs</title>
<link rel="icon" href="../img/storelogo.png">
<link rel="stylesheet" type="text/css" href="admin.css">
  	<%
  		if(session.getAttribute("Uname") == null){
  			
  				response.sendRedirect("index.jsp");
  			
  		}
  	%>

<style>

	fieldset{
       width: 800px;
       height:630px;
       margin-top: 25px;
       background-color: #F0F0F0;
       border-style: none;
       margin-left: 25px;
    } 

	table{
		margin-top: -100px;
		margin-left: 25px;
	}
    input[type=text]{
       	width: 320px;
       	height: 35px;
       	margin-left: 11px;
       	margin-bottom: 15px;
       	border: solid #D2D6DE;
       	padding-left: 15px;
       	font-family: 'Roboto';
       	color: #555555;
       	transition: 1s;
     }

     input[type=submit],[type=reset]{
       	width: 120px;
       	height: 40px;
       	float: left;
       	margin-left: 30px;
       	margin-top: 15px;
       	color: #fff;
       	background-color:#19B751;
       	border-radius: 4px;
       	border-style: none;
     }

     input[type=reset]{
       	background-color: #96281B;
     }

	 #file{
		margin-bottom: 10px;
		margin-left: 10px;
	 }
		
	 #heding{
	   font-family: 'Source Sans Pro';
	   font-weight: bold;
	   font-size: 28px;
	   margin-left: 30px;
	}
	
	#reset_btn input{
	   float:left;
	   margin-left:-170px;
	}
	
	input[type=reset]:hover, [type=submit]:hover{
	   background-color: #000;
	   transition: 1s;
	}
	
	.form{
		margin-bottom: 35px;
	}
	
	.cover{
		background-color: #F0F0F0;
		width: 800px;
		height: 150px;
		margin-left: 20px;
		margin-top: 100px;
	}
	
	.cover table{
		padding-top: 30px;
	}
	
	#reset_btn_cover{
		margin-left: 150px;
	}
	
	#submit_btn_cover{
		margin-left: 120px;
	}
</style>
</head>
<body>

<div class="header">
  <a href="#default" class="logo"><b>TALK </b>TUNES</a>
  <div class="header-right">
 	<a href="home-main.jsp">Home</a>
    <a class="active" href="home.jsp">Add New Song</a>
    <a href="newAdmin.jsp">New Admin </a>
    <a href="update&delete.jsp">Update & Delete</a>
    <a href="feedback.jsp">View FeedBack</a>
    <a href="viewpayment.jsp">View Payments</a>
    <%
    	%>
    		<a href="#" id="log-detils" style="color:#1DB954">Welcome ! <%out.print(session.getAttribute("Uname"));%><a href="a_logout.jsp">Logout</a></a>
    	<%
    %>
  </div>
</div>

<div class="form">
  <center>
	<fieldset>
		
		<form action="../a_newsong" method="POST" enctype="multipart/form-data">
			<table>
			
			<center><p id="heding">Add New Song</p></center>
			
			<tr>
				<td>Song ID :</td>
				<td>
				<%
					Connection conn = null;
					Statement stmt = null;
					ResultSet rs = null;
					conn = dbconnect.connect();
					
					String query = "SELECT * FROM song WHERE song_id= (SELECT MAX(song_id) FROM song)";
					try{
  					
  					stmt = conn.createStatement();
  					rs = stmt.executeQuery(query);
  								
  					while(rs.next()){
  						%>
  							<input type="text" name="songid" id="id" value="Last ID : <%=rs.getString("song_id")%>" placeholder="Song ID" style="color:#DD5145; font-weight:bold;"required></td>				
  						<%
  					}
  				}
  				catch(SQLException e){
  					System.out.println(e);
  				}		
				
				%>
				
				
			</tr>
			
			<tr>
				<td>Category :</td>
				<td><input type="text" name="category" id="category" placeholder="Category" required></td><br>
			</tr>
			
			<tr>
				<td>Title</td>
				<td><input type="text" name="title" id="title" placeholder="Title" required></td><br>
			</tr>
			
			<tr>
				<td>Album/Movie :</td>
				<td><input type="text" name="album" id="album" placeholder="Album/Movie" required></td><br>
			</tr>
			
			<tr>
				<td>Singer(s) :</td>
				<td><input type="text" name="singer" id="singer" placeholder="Singer(s)" required></td><br>
			</tr>
			
			<tr>
				<td>Year :</td>
				<td><input type="text" name="year" id="year" placeholder="Year" required ></td><br>
			</tr>

			<tr>
				<td>Price :</td>
				<td><input type="text" name="price" id="price" placeholder="Price" required></td><br>
			</tr>
			
			<tr>
				<td>Cover :</td>
				<td><input type="file" name="cover" id="file" required></td><br>
			</tr>
			
			
			<tr>
				<td></td>
				<td><input type="submit" value="Upload" onclick="myFunction()"></td>
				<td id="reset_btn"><input type="reset" value="Reset"></td>
			</tr>
			</table>
		</form>

	</fieldset>
	
	<br><br>
	

	
</center>
</div>


    <script>
    function myFunction() {
       var s_id    = document.getElementById("id").value;
       var s_cat   = document.getElementById("catagory").value;
       var s_title = document.getElementById("title").value;
       var s_album = document.getElementById("album").value;
       var s_singer= document.getElementById("singer").value;
       var s_year  = document.getElementById("year").value;
       var s_cover = document.getElementById("file").value;

       if (s_id == '' || s_cat == '' || s_title == '' || s_album == '' || s_singer == '' || s_year == '' || s_file == '') {
        	alert("Please Fill the Fields");
       }
       else{
            alert("Adding Done");
       }
     }
  </script>


</body>
</html>
