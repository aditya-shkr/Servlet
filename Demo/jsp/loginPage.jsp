<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
</head>
<body>
	
	<div class="container">
		<form id="signIn" class="form-signin" action="<%=request.getContextPath()%>/Login" method="POST" >
			<h2 class="form-signin-heading">Please sign in</h2>
			<label for="inputEmail" class="sr-only">Email address</label> 
			<input type="email" id="email" name="email" class="form-control" placeholder="Email address" autofocus=""> 
			<label for="inputPassword" class="sr-only">Password</label> 
			<input type="password" id="password" name="password" class="form-control" placeholder="Password" >
			<div class="checkbox">
				<label> <input type="checkbox" name="rememberMe" value="remember-me">
					Remember me
				</label>
			</div>
			<button class="btn btn-lg btn-primary btn-block" type="submit">Sign
				in</button>
				<br>
				<a href="../Registration">New User? Register Here..</a>
		</form>
		
	</div>
	<!-- /container -->
	<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/jquery.validate.min.js"></script>
	
	<script>  
		   $().ready(function() {
		var flag=0;
				$("#signIn").validate({
					rules: {
						email: {
							required: true,
							email: true
						},					
						password: "required"										
					},
					messages: {												
						email: "Please enter a valid email address",
						password: "Plese enter Password",
					}
				});		
				
				
				
				
				
				
		   });
		</script>
</body>
</html>