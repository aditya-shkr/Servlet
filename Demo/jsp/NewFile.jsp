<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="text-align:center;"><h3>Add Your Friend </h3></div>
					<form id="addFriendForm" action="<%=request.getContextPath()%>/AddFriend" method="POST">
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
						<input type="text" class="form-control" id="email" name="email" placeholder="Email">
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
					<div class="offset-sm-2 col-sm-12">
						<center>
							<input type="submit" id="btnSubmit" class="btn btn-primary">&nbsp&nbsp&nbsp&nbsp
							<a href="#"><input type="button" onclick="clearFr()" class="btn btn-secondary"
								id="cancel" value="Cancel"></a>
						</center>
					</div>
				</div>
			</form>
					<form id="addFriendForm" action="<%=request.getContextPath()%>/AddFriend" method="POST">
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
						<input type="text" class="form-control" id="email" name="email" placeholder="Email">
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
					<div class="offset-sm-2 col-sm-12">
						<center>
							<input type="submit" id="btnSubmit" class="btn btn-primary">&nbsp&nbsp&nbsp&nbsp
							<a href="#"><input type="button" onclick="clearFr()" class="btn btn-secondary"
								id="cancel" value="Cancel"></a>
						</center>
					</div>
				</div>
			</form>

					<form id="addFriendForm" action="<%=request.getContextPath()%>/AddFriend" method="POST">
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
						<input type="text" class="form-control" id="email" name="email" placeholder="Email">
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
					<div class="offset-sm-2 col-sm-12">
						<center>
							<input type="submit" id="btnSubmit" class="btn btn-primary">&nbsp&nbsp&nbsp&nbsp
							<a href="#"><input type="button" onclick="clearFr()" class="btn btn-secondary"
								id="cancel" value="Cancel"></a>
						</center>
					</div>
				</div>
			</form>

</body>
</html>