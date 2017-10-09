<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat,java.util.*,java.util.Date"%>
<%@page contentType="text/html"  pageEncoding="UTF-8"%>

<% 
    String name=request.getParameter("name");
	long phone = Long.parseLong(request.getParameter("phone"));
    String email=request.getParameter("email");
    String address=request.getParameter("address");  
    String gen=request.getParameter("gen");
    String maritalStatus=request.getParameter("maritalStatus");
    String dob=request.getParameter("dob");
    DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
    Date myDate =formatter.parse(dob);
    java.sql.Date sqlDate = new java.sql.Date(myDate.getTime());
    try
    {
    	Class.forName("com.mysql.jdbc.Driver");
        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/employee","root","");
    	String query="insert into employee(name,phone,email,address,gender,maritalstatus,dob)"+"values(?,?,?,?,?,?,?,?,?)";
        PreparedStatement ps=conn.prepareStatement(query);
        ps.setString(1, name);
        ps.setString(2, email);
        ps.setString(3, address);
        ps.setLong(4, phone);
        ps.setString(5, gen);
        ps.setString(6, maritalStatus);
        ps.setDate(7, sqlDate);
        ps.executeUpdate();            
        conn.close();
        ps.close();       
    }  
    catch(Exception e)
            {
                out.print(e);
            }
%>