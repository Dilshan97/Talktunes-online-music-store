<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="db.dbconnect" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>TalkTunes | Update & Delete</title>
<link rel="icon" href="../img/storelogo.png">
<link rel="stylesheet" type="text/css" href="admin.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.10/css/all.css" integrity="sha384-+d0P83n9kaQMCwj8F4RJB66tzIwOKmrdb46+porD/OvrJ+37WqIM7UoBtwHO6Nlg" crossorigin="anonymous">
  	<%
  		if(session.getAttribute("Uname") == null){
  			
  				response.sendRedirect("index.jsp");
  			
  		}
  	%>
 <style>
	fieldset{
  		width: 800px;
 		height:260px;
  		margin-top: 25px;
  		background-color: #F0F0F0;
  		border-style: none;
 		margin-left: 50px;
	}
	
	input[type=text]{
    	width: 320px;
    	height: 40px;
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
        border-radius: 4px;
        border-style: none;
    }
		
	input[type=submit]{
		background-color:#19B751;
	}
	
    input[type=reset]{
        background-color: #96281B;
    }
	
	input[type=reset]:hover, [type=submit]:hover{
	   background-color: #000;
	   transition: 1s;
	}
	
	#reset_btn input{
		float:left;
		margin-left:-170px;
	}
	
	#heding{
	   font-family: 'Source Sans Pro';
	   font-weight: bold;
	   font-size: 28px;
	   margin-left: 30px;
	   margin-top: 0px;
	}
	
	select{
		width: 300px;
		height: 35px;
		margin-left: -50px;
	}
	#row td{
		margin-left: 100px;
	}
	#row2 {
		padding-left: 70px;
	}
	
	#set1{
		
		height:450px;
	}
	
	i{
		margin-left: 300px;
		margin-top: -16px;
		overflow: auto;
		position: absolute;
	}
	
	#list2{
		margin-left: 10px;
		width: 320px;
		margin-bottom: 10px;
	}
</style>
</head>
<body>

<div class="header">
  <a href="#default" class="logo"><b>TALK </b>TUNES</a>
  <div class="header-right">
  	<a href="home-main.jsp">Home</a>
    <a href="home.jsp">Add New Song</a>
    <a href="newAdmin.jsp">New Admin </a>
    <a class="active" href="update&delete.jsp">Update & Delete</a>
    <a href="feedback.jsp">View FeedBack</a>
    <a href="viewpayment.jsp">View Payments</a>
    <%
    	%>
    		<a href="#" id="log-detils" style="color:#1DB954">Welcome ! <%out.print(session.getAttribute("Uname"));%><a href="a_logout.jsp">Logout</a></a>
    	<%
    %>
  </div>
</div>

<%
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	conn = dbconnect.connect();
	
	String query = "SELECT * FROM song";
%>
<div class="form">
  <center>
  	<fieldset id="set1">
  		<form action="../a_updatesonginfo" method="post"><table>
      	
		<center><p id="heding">Update Song Info</p></center>
      
      	  <tr>
      	  <td></td>
          <td><select id="list2" onchange="getVal2()" name="song_list2" required>
  			  <option value=""><i class="fas fa-search">Select song</i></option>
      	 	<%
  		  					
  				try{
  					
  					stmt = conn.createStatement();
  					rs = stmt.executeQuery(query);
  								
  					while(rs.next()){
  						%>
  									
  						<option value="<%=rs.getString("song_id")%>"><%=rs.getString("title")%></option>
  									
  						<%
  					}
  				}
  				catch(SQLException e){
  					System.out.println(e);
  				}		
  			%>
  			</td>
  		</tr>
  		
        <tr>
          <td><i class="fas fa-bars"></i></td>
          <td><input type="text" name="title" id="" placeholder="Song Title" required=""></td>
        </tr>

        <tr>
          <td><i class="fab fa-audible"></i></td>
          <td><input type="text" name="album" id="" placeholder="Song Album" required=""></td>
        </tr>
		
		<tr>
          <td><i class="fas fa-user"></i></td>
          <td><input type="text" name="singer" id="" placeholder="Singer" required=""></td>
        </tr>
        
        <tr>
          <td><i class="far fa-calendar-alt"></i></td>
          <td><input type="text" name="year" id="" placeholder="Year" required=""></td>
        </tr>
        
        <tr>
       	  <td></td>
          <td><input type="submit" value="Update"></td>
          <td id="reset_btn"><input type="reset" value="Reset"></td>
        </tr>
        
      </table>
    </form>
  	</fieldset>
  </center>
  
  <!-- -------------------------------------------------------------------------------------------------------------------------------- -->
  <center>
  	<fieldset>
  		<form action="../a_updatesongcover" method="post" enctype="multipart/form-data">
  			<table>
  				<center><p id="heding">Update Image</p></center>
  			
  			
  				<tr>
  					<td>Song Title :</td>
  					<td id="row2"><select id="list1" onchange="getVal1()" name="song_list1" required>
  						<option value="">Select song</option>
  						
  						<%
  							
  				
  							try{
  						
  								stmt = conn.createStatement();
								rs = stmt.executeQuery(query);
						
								while(rs.next()){
									%>
  										<option value="<%=rs.getString("song_id")%>"><%=rs.getString("title")%></option>
  									<%
								}
  						
  							}catch(Exception e){
  								System.out.println(e);	
  							}
  					
  						%>
  					</td>
  				</tr>
  				
  				<tr>
  					<td>Cover: </td>
  					<td><input type="file" name="cover" id="" required ></td>
  				</tr>
  				
  				<tr>
  					<td></td>
          			<td><input type="submit" value="Update"></td>
          			<td id="reset_btn"><input type="reset" value="Reset"></td>
  				</tr>
  			</table>
  		</form>
  	</fieldset>
  </center>
  <!-- -------------------------------------------------------------------------------------------------------------------------------- -->
  
    <center>
  	<fieldset>
  		<form action="../a_deletesong" method="post">
  			<table>
  				<center><p id="heding">Delete Song</p></center>
  				
  				<tr>
  					<td>Song name :</td>
  					<td><select id="list" onchange="getseletedValue()" name="song_list" required>
  						<option value="">Select song</option>
  						
  						<%
  		  					
  		  				
  							try{
  								stmt = conn.createStatement();
  								rs = stmt.executeQuery(query);
  								
  								while(rs.next()){
  									%>
  									
  									<option value="<%=rs.getString("song_id")%>"><%=rs.getString("title")%></option>
  									
  									<%
  								}
  							}
  							catch(SQLException e){
  								System.out.println(e);
  							}
  						
  						%>
					</select></td>
  				</tr>
  			
  				<tr id="row">
          			<td><input type="submit" value="Delete"></td>
          			<td id="reset_btn_c"><input type="reset" value="Reset"></td>
  				</tr>
  				
  			</table>
  		</form>
  	</fieldset>
  </center>
  
</div>

<script>
	
	function getseletedValue(){
		var seletedValue = document.getElementById("list").value;
		console.log(seletedValue);
	}
	
	function getVal1(){
		var seletedValue = document.getElementById("list1").value;
		console.log(seletedValue);
	}
	
	function getVal2(){
		var seletedValue = document.getElementById("list2").value;
		console.log(seletedValue);
	}
</script>
</body>
</html>
