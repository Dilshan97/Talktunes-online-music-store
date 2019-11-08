<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="db.dbconnect" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>TalkTunes | Summary</title>
<link rel="icon" href="../img/storelogo.png">
<link rel="stylesheet" type="text/css" href="admin.css">
<%
	PreparedStatement stmt = null;
	ResultSet rs = null;
	Connection conn = null;
%>
<%
	
	String sinhala = "";
	
	String query1 = "SELECT COUNT(*) FROM song WHERE category = 'Sinhala'";
	
	try{
		conn = dbconnect.connect();
		stmt = conn.prepareStatement(query1);
		rs = stmt.executeQuery();
		
		while(rs.next()){
			sinhala = rs.getString(1);
		}
		
	}catch(Exception e){
		System.out.println(e);
	}
%>

<%
	String english = "";

	String query2 = "SELECT COUNT(*) FROM song WHERE category = 'English'";
	
	try{
		conn = dbconnect.connect();
		stmt = conn.prepareStatement(query2);
		rs = stmt.executeQuery();
		
		while(rs.next()){
			english = rs.getString(1);
		}
		
	}catch(Exception e){
		System.out.println(e);
	}

%>


<%
	String hindi = "";

	String query3 = "SELECT COUNT(*) FROM song WHERE category = 'Hindi'";

	try{
		conn = dbconnect.connect();
		stmt = conn.prepareStatement(query3);
		rs = stmt.executeQuery();
		
		while(rs.next()){
			hindi = rs.getString(1);
		}
	}catch(Exception e){
		System.out.println(e);
	}
%>

<%
	String tamil = "";

	String query4 = "SELECT COUNT(*) FROM song WHERE category = 'Tamil'";

	try{
		conn = dbconnect.connect();
		stmt = conn.prepareStatement(query4);
		rs = stmt.executeQuery();
		
		while(rs.next()){
			tamil = rs.getString(1);
		}
	}catch(Exception e){
		System.out.println(e);
	}
%>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
    	  
		var s = <%out.print(sinhala);%>
		var e = <%out.print(english);%>
		var h = <%out.print(hindi);%>
		var t = <%out.print(tamil);%>
		
        var data = google.visualization.arrayToDataTable([
          ['Song category', 'count'],
          ['Sinhala',   s],
          ['English',   e],
          ['Hindi',     h],
          ['Tamil',     t]
        ]);

        var options = {
          title: 'Song Count'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
      }
    </script>

 <script>
	function date_time(id){
		date = new Date;
		year = date.getFullYear();
		month = date.getMonth();

		months = new Array('January', 'February', 'March', 'April', 'May', 'June', 'Jully', 'August', 'September', 'October', 'November', 'December');
		d = date.getDate();
		day = date.getDay();
		days = new Array('Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday');
		
		h = date.getHours();
		var ampm = h >= 12 ? 'PM' : 'AM';
		h = h % 12;
		h = h ? h : 12;

		if(h<10){
			h = "0"+h;
		}
		m = date.getMinutes();

		if(m<10){
			m = "0"+m;
		}
		s = date.getSeconds();

		if(s<10){
			s = "0"+s;
		}
		
		now_time = +h+':'+m+':'+s+ ':' +ampm;
		document.getElementById('time').innerHTML = now_time;
		
		result = ''+days[day]+' '+months[month]+' '+d+' '+year;
		document.getElementById(id).innerHTML = result;
		setTimeout('date_time("'+id+'");','1000');
		
		
		return true;
	}
</script>


<%
	String sales = "";

	String query5 = "SELECT COUNT(*) FROM payments";

	try{
		conn = dbconnect.connect();
		stmt = conn.prepareStatement(query5);
		rs = stmt.executeQuery();
		
		while(rs.next()){
			sales = rs.getString(1);
		}
	}catch(Exception e){
		System.out.println(e);
	}
%>

<%
	String Profit = "";

	String query6 = "SELECT SUM(profit) FROM payments";

	try{
		conn = dbconnect.connect();
		stmt = conn.prepareStatement(query6);
		rs = stmt.executeQuery();
		
		while(rs.next()){
			Profit = rs.getString(1);
		}
		
		
	}catch(Exception e){
		System.out.println(e);
	}
%>

<%
	String Users = "";

	String query7 = "SELECT COUNT(*) FROM member";

	try{
		conn = dbconnect.connect();
		stmt = conn.prepareStatement(query7);
		rs = stmt.executeQuery();
		
		while(rs.next()){
			Users = rs.getString(1);
		}
		
		
	}catch(Exception e){
		System.out.println(e);
	}
%>
<script type="text/javascript">
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
    	  
    	  var s = <%out.print(sales);%>
    	  var p = <%out.print(Profit);%>
    	  var u = <%out.print(Users);%>
    	  
        var data = google.visualization.arrayToDataTable([
          ['Year', 'Sales','Profit' ,'Users'],
          ['2018', s, p, u]
        ]);

        var options = {
          chart: {
            title: 'Store Performance',
            subtitle: 'Sales, Profit & Users: 2018',
          },
          bars: 'horizontal' // Required for Material Bar Charts.
        };

        var chart = new google.charts.Bar(document.getElementById('barchart_material'));

        chart.draw(data, google.charts.Bar.convertOptions(options));
      }
    </script>
    
<style>

	#piechart{
		width: 900px; 
		height: 500px;
		float:left;
		margin-left: -100px;
	}
	#time{
		font-size: 40px;
	}
	
	#date_time{
		margin-left: 25px;
	}
	
	.date_time{
		margin-top: 35px;
	}
	#login_name{
		font-size: 15px;
		margin-top: 4px;
	}
	#barchart_material{
		margin-left: 600px;
		margin-top: 25px;
		width: 650px; 
		height: 300px;
	}
</style>
</head>

<body onload="date_time('date_time')">

<div class="header">
  <a href="#default" class="logo"><b>TALK </b>TUNES</a>
  	<%
  		if(session.getAttribute("Uname") == null){
  			
  				response.sendRedirect("index.jsp");
  			
  		}
  	%>
  	
  <div class="header-right">
  	<a class="active" href="home-main.jsp">Home</a>
    <a href="home.jsp">Add New Song</a>
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

<div class="content">
	<div id="piechart"></div>
	
	<div class = "date_time">
		<div id="time"></div>
		<div id="date_time"></div>
	</div>
</div><!-- content -->

	<div id="barchart_material"></div>
</body>
</html>