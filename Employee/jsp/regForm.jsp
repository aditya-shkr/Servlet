<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/style.css" rel="stylesheet">	
	<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container" id="main">
            <div class="outer">
                <form name="addForm" action="insert.jsp" method="POST">
                    <div class="form-group row">
                        <label for="lblname" class="col-sm-3 col-form-label">Name</label>
                        <div class="col-sm-9">
                            <input type="text"  class="form-control" name="name" placeholder="Name" required><span class="fa fa-user err"/>
                        </div>
                    </div>
                     <div class="form-group row">
                        <label for="lblphone" class="col-sm-3 col-form-label">Phone</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" name="phone" placeholder="Phone" required minlength="11" maxlength="11"><span class="fa fa-phone err"/>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="lblemail" class="col-sm-3 col-form-label">Email</label>
                        <div class="col-sm-9">
                            <input type="email" class="form-control" name="email" placeholder="Email" required><span class=" fa fa-envelope err"/>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="lbladdress" class="col-sm-3 col-form-label">Address</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" name="address" placeholder="Address" required><span class="fa fa-map-marker err"/>
                        </div>
                    </div>
                    
                   
                    <fieldset class="form-group row">
                        <label for="lblgender" class="col-sm-3 col-form-label">Gender</label>
                        <div class="col-sm-9">
                            <div class="form-check">
                                <label class="form-check-label">
                                    <input class="form-check-input" type="radio" name="gen"  value="Male" checked>
                                    Male
                                </label>
                            </div>
                            <div class="form-check">
                                <label class="form-check-label">
                                    <input class="form-check-input" type="radio" name="gen"  value="Female">
                                    Female
                                </label>
                            </div>

                        </div>
                    </fieldset>
                    <div class="form-group row">
                        <label for="lblphone" class="col-sm-3 col-form-label">Marital Status</label>
                        <div class="col-sm-9">

                            <select class="custom-select mb-2 mr-sm-2 mb-sm-0" id="maritalStatus" name="maritalStatus" required>
                                <option selected>Choose...</option>
                                <option value="married">Married</option>
                                <option value="unmarried">UnMarried</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="example-date-input" class="col-sm-3 col-form-label">Date Of Birth</label>
                        <div class="col-sm-9">
                            <input class="form-control" type="date" value="2011-08-19" id="dob" name="dob">
                        </div>
                    </div>
                    
                    <div class="form-group row">
                        <div class="offset-sm-2 col-sm-12">
                            <center><input type="submit" class="btn btn-primary">&nbsp&nbsp&nbsp&nbsp
                                <a href="#"><input type="button" class="btn btn-secondary" id="cancel" value="Cancel"></a>
                            </center>
                        </div>
                    </div>
                </form>
                </div>
                </div>
</body>
</html>