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
	<div class="container" >
		<div class="outer">
			<form id="regForm" action="<%=request.getContextPath()%>/Registration" method="POST">
				<div class="form-group row">
					<label for="lblname" class="col-sm-3 col-form-label">Name</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="name" name="name" placeholder="Name">
					</div>
				</div>
				<div class="form-group row">
					<label for="lblphone" class="col-sm-3 col-form-label">Phone</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="phone" name="phone" placeholder="Phone" maxlength="10">
					</div>
				</div>
				<div class="form-group row">
					<label for="lblemail" class="col-sm-3 col-form-label">Email</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="email" name="email" placeholder="Email"><span id="errEmail"></span>
					</div>
				</div>
				<div class="form-group row">
					<label for="lbladdress" class="col-sm-3 col-form-label">Address</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="address" name="address" placeholder="Address">
					</div>
				</div>

				<div class="form-group row">
				
					<label for="lblgender" class="col-sm-3 col-form-label">Gender</label>
					
					<div class="col-sm-9">
						<div class="form-check ">
							<label class="form-check-label "> <input
								class="form-check-input" type="radio" name="gen"
								id="exampleRadios1" value="male" checked> Male
							</label>
						</div>
						<div class="form-check ">
							<label class="form-check-label "> <input
								class="form-check-input" type="radio" name="gen"
								id="exampleRadios2" value="female"> Female
							</label>
						</div>

					</div>
				</div>
				<div class="form-group row">
					<label for="lblphone" class="col-sm-3 col-form-label">Marital
						Status</label>
					<div class="col-sm-9">

						<select class="custom-select mb-2 mr-sm-2 mb-sm-0"
							id="maritalStatus" name="maritalStatus">
							<option selected>Choose...</option>
							<option value="married">Married</option>
							<option value="unmarried">UnMarried</option>
						</select>
					</div>
				</div>
				<div class="form-group row">
					<label for="example-date-input" class="col-sm-3 col-form-label">Date
						Of Birth</label>
					<div class="col-sm-9">
						<input class="form-control" type="date" value="2011-08-19"
							id="dob" name="dob">
					</div>
				</div>
				<div class="form-group row">
					<label for="example-date-input" class="col-sm-3 col-form-label">Skills</label>
					<div class="col-sm-9">
						<label class="checkbox-inline"><input type="checkbox"
							name="chk1" class="chk1" value="java" checked>Java</label> <label
							class="checkbox-inline"><input type="checkbox"
							name="chk1" class="chk1" value="DotNet">DotNet</label> <label
							class="checkbox-inline"><input type="checkbox"
							name="chk1" class="chk1" value="php">Php</label>

					</div>
				</div>
				<div class="form-group row">
					<label for="lblname" class="col-sm-3 col-form-label">Password</label>
					<div class="col-sm-9">
						<input type="password" class="form-control" id="password" name="password" placeholder="password">
					</div>
				</div>
				
				<div class="form-group row">
					<div class="offset-sm-2 col-sm-12">
						<center>
							<input type="submit" id="btnSubmit" class="btn btn-primary">&nbsp&nbsp&nbsp&nbsp
							<a href="../Login"><input type="button"  class="btn btn-secondary"
								id="cancel" value="Cancel"></a>
						</center>
					</div>
				</div>
			</form>
		</div>
	</div>

	<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/jquery.validate.min.js"></script>


	<script>  
		   $().ready(function() {
			   var flag=0;
			   
				$("#regForm").validate({
					rules: {
						name: "required",					
						phone: {
							required: true,
							minlength: 10,
							maxlength: 10							
						},						
						email: {
							required: true,
							email: true
						},
						address: "required",
						password: "required"
											},
					messages: {
						name: "Please enter your name",
						phone: {
							required: "Please enter a phone",
							minlength: "Your phone number must consist of least 10 digit"
						},
						email: "Please enter a valid email address",
						address: "Plese enter address",
						password: "Please enter password"
					}
				});
			   
				
				$('.chk1').on('change', function() {
				    $('.chk1').not(this).prop('checked', false);  
				});
						
				$('#email').on('blur',function(){	
					var email= $('#email').val();
					
	                $.post('../EmailCheck',{'emailCheck':email},function(status) {
	                		                	
	                	if(status=="Email Available"){
	                		flag=1;	                	
	                		
	                	}
	                	
	                	if(flag==1){
	                		$('#errEmail').text("Email Available");
	                	}else
	                		$('#errEmail').text("Already Registred");
	                		
	                });
	                
	                
	            });
			
				$('#regForm').submit( function(ev){
					if(flag==0)
			         ev.preventDefault();

					else if(flag==1)
			         $(this).unbind('submit').submit()

			  });
				
         });
			    
				
   
		   
		</script>

</body>
</html>