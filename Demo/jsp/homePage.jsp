<%@page import="com.Kaldin.emp.dbConnection.DbConnection,java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
<link href="css/style.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/jszip-2.5.0/dt-1.10.16/b-1.4.2/b-flash-1.4.2/b-html5-1.4.2/r-2.2.0/datatables.min.css"/>
 


<link href="css/font-awesome.min.css" rel="stylesheet">
 



</head>

<body>
 <%
        HttpSession ses=request.getSession();
        String email=(String)ses.getAttribute("email");
        String uname=(String)ses.getAttribute("uname");
        String empId=(String)ses.getAttribute("empId");
        
        
        if(email==null||"".equals(email))
        {
        	%>
        	<jsp:forward page="loginPage.jsp"/>
        	<% 
        }
        %>
            <input type="hidden" id="viewallact" name="viewallact" value="viewall"/>
    <input type="hidden" id="addact" name="addact" value="add"/>
    <input type="hidden" id="deleteact" name="deleteact" value="delete"/>
    <input type="hidden" id="showact" name="showact" value="show"/>
    <input type="hidden" id="updateact" name="updateact" value="update"/>
        
    <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
      <a class="navbar-brand" href="<%=request.getContextPath()%>/Home">Navbar</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarsExampleDefault">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item active">
            <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Link</a>
          </li>
          <li class="nav-item">
            <a class="nav-link disabled" href="#">Disabled</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="http://example.com" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Dropdown</a>
            <div class="dropdown-menu" aria-labelledby="dropdown01">
              <a class="dropdown-item" href="#">Action</a>
              <a class="dropdown-item" href="#">Another action</a>
              <a class="dropdown-item" href="#">Something else here</a>
            </div>
          </li>
        </ul>
        <form class="form-inline my-2 my-lg-0">
          <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">
          <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
          <a class="btn btn-outline-success my-2 my-sm-0" href="<%=request.getContextPath()%>/Logout" type="submit"><span class="glyphicon glyphicon-log-out" ></span>Log Out</a>
        </form>
      </div>
    </nav>

    <!-- Main jumbotron for a primary marketing message or call to action -->
    <div class="jumbotron">
      <div class="fw-container">
        <h6 class="display-5">Welcome 
       
    			<%=uname %> !<input type="hidden" id="empEmail" value="<%=email%>"></h6>
<br>        
        <div class="fw-container" >	
		
		<div id="msg" style="display:none;" class="alert alert-success" role="alert" >
						<strong><p id="successMsg"></p></strong> 
					</div>
						
		<div class="form-group row">
			<div class="col-md-6">
				<form id="importForm">
				<div class="form-group">				
					<label for="exampleInputFile">Add Friends using File</label> 
					<input type="file" class="form-control-file" id="file1" name="file1" aria-describedby="fileHelp"> 					
					
				</div>
				<button type="button" onclick="importFr()" class="btn btn-primary">Submit</button>
				</form>
			</div> 			
			<div class="col-md-6">
			<input type="button" style="float: right;" data-toggle="modal" data-target="#myModal" onclick="addMd()" class="btn btn-primary" id="btnAdd" value="Add Friend">
			</div> 
		</div>    		
	</div>                 
      </div>
    </div>
    
    
    <div class="fw-container">
    
		<button type="button"  onclick="deleteFr()">
		  <i class="fa fa-trash" aria-hidden="true"> Delete Selected</i>
		</button>
		<a href="../Export"><button type="button"  >
		  <i class="fa fa-file-excel-o" aria-hidden="true"> Export All</i>
		</button></a>


<!-- Modal -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Edit Friend's Detail</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<form id="frEditForm">
						<input type="hidden" class="form-control"  id="mId">
							<div class="form-group">
								<label for="recipient-name" class="form-control-label">Name:</label>
								<input type="text" class="form-control"  id="mName">
							</div>
							<div class="form-group">
								<label for="recipient-name" class="form-control-label">Phone:</label>
								<input type="tel" class="form-control" id="mPhone">
							</div>
							<div class="form-group">
								<label for="recipient-name" class="form-control-label">Email:</label>
								<input type="email" class="form-control" id="mEmail">
							</div>
							<div class="form-group">
								<label for="recipient-name" class="form-control-label">Address:</label>
								<input type="text" class="form-control" id="mAddress">
							</div>
							<div class="form-group row">
							<div class="col-lg-4">							
								<label for="recipient-name" class="form-control-label">Gender:</label>
								</div>
								  <div class="col-lg-4">
									    <div class="input-group">
									      <span class="input-group-addon">
									        <input type="radio" aria-label="Checkbox for following text input" name="mGender" id="mGenderM" value="male">Male
									      </span>									      
									    </div>
								  </div>
									  <div class="col-lg-4">
									    <div class="input-group">
									      <span class="input-group-addon">
									        <input type="radio" aria-label="Radio button for following text input" name="mGender" id="mGenderF" value="female">Female
									      </span>									      
									    </div>
									  </div>
							</div>
							<div class="form-group">
								<label for="recipient-name" class="form-control-label">Marital
									Status:</label><div class="mStatus"> <select id="mStatus" name="mStatus" class="form-control" >
									<option selected>Choose...</option>
									<option value="married">Married</option>
									<option value="unmarried">Unmarried</option>
								</select></div>
							</div>
							<div class="form-group">
								<label for="recipient-name" class="form-control-label">Date
									of Birth:</label> <input type="date" class="form-control" id="mDob"
									value="2011-08-19">
							</div>
							
							
						</form>
					</div>
					<div class="modal-footer">	
					<div id="showBtn">
					<button type="button" id="frSubmit" onclick="addFr()" class="btn btn-primary">Add
								Friend
							</button>	
					</div>				
					</div>
				</div>
			</div>
		</div>
		<!-- Example row of columns -->
		<div class="row">
			<div class="col-md-12">
				<div style="text-align:center;"><h3>Friend's Detail </h3></div>
				<table id="frTable" class="display">
					<thead>
						<tr>
							<th>Delete</th>
							<th>name</th>
							<th>Phone</th>
							<th>Email</th>
							<th>Address</th>
							<th>Gender</th>
							<th>Marital Status</th>
							<th>Date of Birth</th>
							<th>Actions</th>
						</tr>						
					</thead>										
				</table>							
			</div>
		</div>		
		<br>
		<br>
		<hr>
      <footer>
        <p>&copy; Company 2017</p>
      </footer>
    </div> <!-- /container -->
<jsp:include page="footer.jsp"></jsp:include>	
</body>
</html>