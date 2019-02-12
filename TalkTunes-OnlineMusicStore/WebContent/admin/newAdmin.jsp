<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>TalkTunes | Add New Admin</title>
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
 		height:500px;
  		margin-top: 25px;
  		background-color: #F0F0F0;
  		border-style: none;
 		margin-left: 50px;
	}
	
	table{
  		margin-top: 50px;
  		margin-left: 25px;
	}

 	input[type=text],[type=password],[type=email]{
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
		
	i{
		margin-left: 310px;
		overflow: auto;
		margin-top: -16px;
		position: absolute;
	}
</style>
</head>
<body>

<div class="header">
  <a href="#default" class="logo"><b>TALK </b>TUNES</a>
  <div class="header-right">
  	<a href="home-main.jsp">Home</a>
    <a href="home.jsp">Add New Song</a>
    <a class="active" href="newAdmin.jsp">New Admin </a>
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
    
    <form action="../a_newuser" method="post">
      <table>
      	
		<center><p id="heding">New Admin Registration</p></center>
      
        <tr>
          <td><i class="fas fa-user"></i></td>
          <td><input type="text" name="fullname" id="" placeholder="Full Name" required=""></td>
        </tr>

        <tr>
          <td><i class="fas fa-envelope"></i></td>
          <td><input type="email" name="email" id="" placeholder="E-mail" required=""></td>
        </tr>

        <tr>
          <td><i class="fas fa-lock"></i></td>
          <td><input type="password" name="Password" id="" placeholder="Password" required=""></td>
        </tr>

        <tr>
          <td><i class="fas fa-redo-alt"></i></td>
          <td><input type="password" name="RPassword" id="" placeholder="Confirm Password" required></td>
        </tr>

        <tr>
       	  <td></td>
          <td><input type="submit" value="Register"></td>
          <td id="reset_btn"><input type="reset" value="Reset"></td>
        </tr>
        
        <tr>
          
        </tr>
      </table>

    </form>
  </fieldset>
  </center>
</div>

</body>
</html>
