<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="form-group row">
                        <label for="example-date-input" class="col-sm-3 col-form-label">Skills</label>
                        <div class="col-sm-9">
                        <label class="checkbox-inline"><input type="checkbox" value="java" checked>Java</label>
						<label class="checkbox-inline"><input type="checkbox" value="DotNet">DotNet</label>
						<label class="checkbox-inline"><input type="checkbox" value="php">Php</label> 
                            
                        </div>
                    </div>
                    
                    pattern="/(7|8|9)\d{9}/"
                    
                    else if(email.equals(re))
				{
				$('#errEmail').text(email+"is valid");
				}
			else{
				$('#errEmail').text(email+"not valid");
				return false;
			}
			
			<script>  
		   $().ready(function() {
		
				$("#regForm").validate({
					rules: {
						//name: "required",					
						phone: {
							required: true,
							minlength: 10,
							maxlength: 10
							
						},						
						email: {
							required: true,
							email: true
						},
						address: "required"
						
					},
					messages: {
						name: "Please enter your name",
						phone: {
							required: "Please enter a phone",
							minlength: "Your phone number must consist of least 10 characters"
						},
						email: "Please enter a valid email address",
						address: "Plese enter address",
					}
				});
		   });
		</script> 
</body>
</html>