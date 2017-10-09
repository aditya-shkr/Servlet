<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="java.text.SimpleDateFormat,java.util.*,java.util.Date,java.text.DateFormat,java.sql.*"%>


<% 
    String name=request.getParameter("name");
	long phone = Long.parseLong(request.getParameter("phone"));
    String email=request.getParameter("email");
    String address=request.getParameter("address");  
    String gen=request.getParameter("gen");
    String mstatus=request.getParameter("maritalStatus");
    String dob=request.getParameter("dob");
    DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
    Date myDate =formatter.parse(dob);
    java.sql.Date sqlDate = new java.sql.Date(myDate.getTime());
    try
    {
    	Class.forName("com.mysql.jdbc.Driver");
        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/empDb","root","");
    	String query="insert into employee(name,phone,email,address,gender,mstatus,dob)"+"values(?,?,?,?,?,?,?)";
        PreparedStatement ps=conn.prepareStatement(query);
        ps.setString(1, name);
        ps.setLong(2, phone);
        ps.setString(3, email);
        ps.setString(4, address);
        ps.setString(5, gen);
        ps.setString(6, mstatus);
        ps.setDate(7, sqlDate);
        ps.executeUpdate();            
        ps.close();  
        
    }  
    catch(Exception e)
            {
                out.print(e);
            }
    finally{
    	conn.close();
    }
%>