<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login | TalkTunes</title>
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="icon" href="img/storelogo.png">
  	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.10/css/all.css" integrity="sha384-+d0P83n9kaQMCwj8F4RJB66tzIwOKmrdb46+porD/OvrJ+37WqIM7UoBtwHO6Nlg" crossorigin="anonymous">
  	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  	<style>

  		body{
  			/* background-color: #000; */
  			background: url('img/back.jpg');
  			font-family: 'Roboto';
  			
  		}

  		fieldset{
            width: 360px;
            /*height: 400px;*/
            height: 275px;
            margin: 30px auto;
            background-color: #FFFFFF;
            border-style: none;
       	} 

       input[type=email],[type=password]{
       		width: 320px;
       		height: 35px;
       		margin-left: 11px;
       		margin-bottom: 15px;
       		border: 1px solid #eee;
       		border-left: 3px solid;
       		padding-left: 15px;
       		font-family: 'Roboto';
       		color: #555555;
       		transition: 1s;
       	}
       	
       	input:required {
  			border-left-color: #FA8072;
		}

       input[type=submit]{
       		width: 85px;
       		height: 35px;
       		float: right;
       		margin-right: 10px;
       		color: #fff;
       		background-color: #19B751;
       		border-style: none;
       }

       input[type=submit]:hover{
			background-color: #000000;
			transition: 1s;
       }
       .logo_name a{
       		margin-top: 35px;	
       }

		input[type=checkbox]{
			margin-top: 10px;
			margin-left: 20px;
		}
       
       	.logo_name{
            margin-top: 100px;
            font-size: 35px;
            text-align: center;
            font-weight: 300;
            font-family: 'Source Sans Pro', 'Helvetica Neue', Helvetica, Arial, sans-serif;
        }

        .logo_name a{
            color: #444444;
            text-decoration: none;
        }

        .logo_name a:hover{
            color: #1DB954;
            transition: 1s;
        }

        .head_name{
        	margin-left: 95px;
        	margin-bottom: -12px;
        	font-family: 'Source Sans Pro';
        	color: #555555;
        }

        .fogot{
        	margin-left: 20px;
        	margin-top: 50px;
        	font-family: 'Source Sans Pro';
        	margin-right: 50px;
        	
        }

        .fogot a{
        	text-decoration: none;
        	color: #3C8DBC;
			
        }

        .fogot a:hover{
        	color: #72AFD2;
        	transition: 0.9s;
        }


       .container {
       		font-family: 'Roboto';
       		margin-left: 15px;
    		display: block;
    		position: relative;
    		/*padding-left: 30px;*/
    		/*margin-bottom: 12px;*/
    		cursor: pointer;
    		font-size: 12px;
    		-webkit-user-select: none;
    		-moz-user-select: none;
    		-ms-user-select: none;
    		user-select: none;
    		background-color: #fff;
    		float: left;
		}

		#container {
			margin-top: 5px;
			padding-left: 40px;
			font-size: 14px;
			color: #555555;
		}
		/* Hide the browser's default checkbox */
		.container input {
		    position: absolute;
		    opacity: 0;
		    cursor: pointer;
		}

		/* Create a custom checkbox */
		.checkmark {
		    position: absolute;
		    top: 0;
		    left: 0;
		    height: 21px;
		    width: 21px;
		  	border: solid #D2D6DE;
		}
		
		.checkmark:hover{
			border: solid #1DB954;
			transition: 1s;
		}

		/* Create the checkmark/indicator (hidden when not checked) */
		.checkmark:after {
		    content: "";
		    position: absolute;
		    display: none;
		}
		
		/* Show the checkmark when checked */
		.container input:checked ~ .checkmark:after {
		    display: block;   
		}
		
		/* Style the checkmark/indicator */
		.container .checkmark:after {
		    left: 9px;
		    top: 5px;
		    width: 2px;
		    height: 7px;
		    border: solid #15B64E;
		    border-width: 0 3px 3px 0;
		    -webkit-transform: rotate(45deg);
		    -ms-transform: rotate(45deg);
		    transform: rotate(45deg);
		}
		
		 i{
			margin-left: 320px;
			overflow: auto;
			margin-top: 15px;
			position: absolute;
		}
  	</style>
</head>
<body>
	<div class="login_form">
		<div class="logo_name">
            <a href="index.html"><b>TALK</b>TUNES</a>
        </div>

        <form action="login" method="POST">
            <fieldset>
				<tr>
					<td><p class="head_name">Sign in to start your session</p></td><br>
				</tr>

				<tr>
					<td><i class="fas fa-envelope"></i></td>
					<td><input type="email" name="email" id="" placeholder="Email" required></td><br>
				</tr>

				<tr>
					<td><i class="fas fa-lock"></i></td>
					<td><input type="password" name="password" id="" placeholder="Password" required></td><br>
				</tr>

				<tr>
					<td>
						<label class="container">
							<p id="container">Remember Me</p>
  							<input type="checkbox">
  							<span class="checkmark"></span>
						</label>
					</td>
					<td><input type="submit" value="Login"></td>
				</tr>
				
				<tr>
                	<div class="fogot">    
                	    <a href="fogotPassword.jsp">forgot my password</a><br>
                	    <a href="newuser.jsp">Register a new membership</a>
                	</div><!-- fogot -->
                </tr>
            </fieldset>
        </form>
	</div><!-- login_form -->
</body>
</html>