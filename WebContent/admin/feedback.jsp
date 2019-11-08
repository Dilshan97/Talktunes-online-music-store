<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="db.dbconnect" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>TalkTunes | FeedBack</title>
<link rel="icon" href="../img/storelogo.png">
<link rel="stylesheet" type="text/css" href="admin.css">
 <style>
	fieldset{
  		width: 1200px;
 		height:500px;
  		margin-top: 25px;
  		/* background-color: #F0F0F0; */
  		border-style: none;
 		margin-left: 50px;
	}
	table{
		font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    	border-collapse: collapse;
    	margin-bottom: 30px;
	}
	
	table td, td{
		border: 1px solid #ddd;
    	padding: 21px;
	}
	
	table th{
		padding-top: 12px;
    	padding-bottom: 12px;
    	text-align: center;
    	background-color: #4CAF50;
    	color: white;
	}
	
	table tr:nth-child(even){
		background-color: #f2f2f2;
	}

	table tr:hover {
		background-color: #ddd;
	}
	
	#heding{
	   font-family: 'Source Sans Pro';
	   font-weight: bold;
	   font-size: 28px;
	   margin-left: 30px;
	   margin-top: 0px;
	}
	
	#foot{
		background-color: #F03434;
		color: #fff;
		padding: 10px;
		text-align: center;
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
    <a href="update&delete.jsp">Update & Delete</a>
    <a class="active" href="feedback.jsp">View FeedBack</a>
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
  		<center><p id="heding">User Feedbacks</p></center>
  		
  		<table>
  			<tr>
  				<th>Date</th>
  				<th>Unique ID</th>
  				<th>E-mail</th>
  				<th>Contact No</th>
  				<th>Feedback</th>
  			</tr>
  			
			<%
				int numCols = 0;
			
  				PreparedStatement stmt = null;
  				ResultSet rs = null;
  				ResultSetMetaData rsmd = null;
  				
  				String query = "SELECT * FROM feedback";
  				
  				try{
  					Connection conn = dbconnect.connect();
  					stmt = conn.prepareStatement(query);
  					rs = stmt.executeQuery();
  					
  					
  					
  					while(rs.next()){
  						%>
  							<tr>
  								<td><%out.print(rs.getString(2)); %></td>
  								<td><%out.print(rs.getString(3)); %></td>
  								<td><%out.print(rs.getString(4)); %></td>
  								<td><%out.print(rs.getString(5)); %></td>
  								<td><%out.print(rs.getString(6)); %></td>
  							</tr>	
  						<% 
  						rsmd = rs.getMetaData();
  						numCols = rsmd.getColumnCount();
  					}
  				}
  				catch(Exception e){
  					out.print(e);
  				}
  			%>
  			
  			<tr>
  				<td colspan="7" id="foot">No of Reports (May) : <%out.print(numCols); %></td>
  			</tr>
  			
  		</table>
  	</fieldset>
  </center>
</div>

</body>
</html>
