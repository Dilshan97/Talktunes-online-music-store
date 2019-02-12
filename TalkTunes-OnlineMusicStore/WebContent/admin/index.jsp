<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>TalkTunes | Admin Login </title>
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="icon" href="../img/storelogo.png">
  	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.10/css/all.css" integrity="sha384-+d0P83n9kaQMCwj8F4RJB66tzIwOKmrdb46+porD/OvrJ+37WqIM7UoBtwHO6Nlg" crossorigin="anonymous">

  	<link rel="stylesheet" href="">
  	<style>

  		body{
  			background-color: #000;
  			/*background: url('mdb/img/image/4.png');*/
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
       		border: solid #D2D6DE;
       		padding-left: 15px;
       		font-family: 'Source Sans Pro';
       		color: #555555;
       		transition: 1s;
       		
       	}

       input[type=submit]{
       		width: 300px;
       		height: 40px;
       		float: left;
       		margin-left: 30px;
       		margin-top: 15px;
       		color: #fff;
       		background-color:#19B751;
       		border-radius: 4px;
       		border-style: none;
       }

       input[type=submit]:hover{
          background-color: #000000;
          transition: 1s;
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

        .fogot a{
        	text-decoration: none;
        	color: #3C8DBC;
			
        }

        .fogot a:hover{
        	color: #72AFD2;
        	transition: 0.9s;
        }

		.copyright p{
			color: #444444;
			font-family: 'Source Sans Pro';


		}

       .container {
       		font-family: 'Source Sans Pro';
       		margin-left: 110px;
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
            <a href="#"><b>TALK</b>TUNES</a>
        </div>

        <form action="../a_login" method="POST" >
            <fieldset>
				<tr>
					<td><p class="head_name">Sign in to start your session</p></td><br>
				</tr>

				<tr>
					<td><i class="fas fa-envelope"></i></td>
					<td><input type="email" name="email" id="email" placeholder="Email"  required></td><br>
				</tr>

				<tr>
					<td><i class="fas fa-lock"></i></td>
					<td><input type="password" name="Password" id="Pass" placeholder="Password"  required></td><br>
				</tr>

				<tr>
					<td>
						<label class="container">
							<p id="container">Remember Me</p>
  							<input type="checkbox">
  							<span class="checkmark"></span>
						</label>
					</td>
				</tr>

				<tr>
					<td><input type="submit" value="Login"></td>
				</tr>
            </fieldset>

            <div class="copyright">
            	<center><p>&copy;&nbsp;2017&nbsp;-&nbsp;2018</p></center>
            </div><!-- copyright -->
        </form>
	</div><!-- login_form -->


	<script>
		
		function validateForm(){
			var mail = document.getElementById('email').value;
			var pass = document.getElementById('Pass').value;

			if (mail == "") {
				alert("Email need");
				return false;
			}

			else if (pass = "") {
				alert("Password need");
				return false;
			}
		}
	</script>
</body>
</html>