<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Fogot Password | TalkTunes</title>
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="icon" href="img/storelogo.png">
  	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.10/css/all.css" integrity="sha384-+d0P83n9kaQMCwj8F4RJB66tzIwOKmrdb46+porD/OvrJ+37WqIM7UoBtwHO6Nlg" crossorigin="anonymous">
  	<style>

  		body{
  			/* background-color: #000; */
  			background: url('img/back.jpg');
  		}

/**/  		fieldset{
            width: 360px;
            /*height: 400px;*/
            height: 300px;
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
		
 /**/      input[type=submit]{
       		width: 85px;
       		height: 35px;
       		float: left;
       		margin-left: 15px;
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

        <form action="ResetPassword" method="POST">
            <fieldset>
				 <tr>
				    <td><p class="head_name">Reset Your Password</p></td><br>
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
                   <td><i class="fas fa-redo-alt"></i></td>
                   <td><input type="password" name="rpassword" id="" placeholder="Retype password" required></td><br>
                 </tr>

				 <tr>
				   <td><input type="submit" value="Reset"></td>
				 </tr>
				
				 <tr>
                    <div class="fogot">    
                      <a href="login.jsp">I already have a membership</a><br>
                   </div><!-- fogot -->
              </tr>
            </fieldset>
        </form>
	</div><!-- login_form -->
</body>
</html>