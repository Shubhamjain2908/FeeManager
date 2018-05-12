<%-- 
    Document   : StudentL
    Created on : Jan 12, 2018, 1:02:19 AM
    Author     : SHUBHAM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Student Login</title>
                <link rel="stylesheet" href="css/styleSt.css">
	</head>
	<body>
		<div class="loginBox">
                    <img src="images/user.png" class="userD">
                    <h2>Log In Here</h2>
                        <form action="StudentChecker" method="post"><input hidden type="text" name="user" value="studentL"/>
				<p>User name</p>
				<input type="text" name="username" placeholder="Enter username or Roll no">
				<p>Password</p>
				<input type="password" name="password" placeholder="••••••">
				<input type="submit" name="" value="Sign In">
			</form>
		</div>
	</body>
</html>
