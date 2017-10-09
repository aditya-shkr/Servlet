package com.Kaldin.emp.servlet;

import java.io.IOException;
import java.sql.*;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Kaldin.emp.dbConnection.DbConnection;




public class AddFriendServlet extends HttpServlet{ 

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}


	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.service(req , resp);

	}


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// TODO Auto-generated method stub
		Connection conn = null;
		try {
			conn = DbConnection.getConnection();
		} catch (ClassNotFoundException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		} catch (SQLException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
	
		HttpSession ses=request.getSession();
        String empId=(String)ses.getAttribute("empId");
        
//        System.out.print(empId);
        
		
		String name=request.getParameter("name");	
		String phone = request.getParameter("phone");
		String email=request.getParameter("email");
		String address=request.getParameter("address");  
		String gen=request.getParameter("gen");
		String mstatus=request.getParameter("maritalStatus");
		String dob=request.getParameter("dob");
				
		if(name==null||"".equals(name)){
			name="empty";
		}if(phone==null||"".equals(phone)){
			phone="0";
		}if(email==null||"".equals(email)){
			email="empty";
		}if(address==null||"".equals(address)){
			address="empty";
		}if(gen==null||"".equals(gen)){
			gen="empty";
		}if(mstatus==null||"".equals(mstatus)){
			mstatus="empty";
		}
		if(dob==null||"".equals(dob)){
			dob="2011-08-19";
		}
		if(empId==null||"".equals(empId)){
			empId="0";
		}
		
		DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date myDate = null;
		try {
			myDate = formatter.parse(dob);
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		java.sql.Date sqlDate = new java.sql.Date(myDate.getTime());
			
		

		try
		{
			String query="insert into friend(empId,frName,frPhone,frEmail,frAddress,frGender,frMstatus,frDob)"+"values(?,?,?,?,?,?,?,?)";
			PreparedStatement ps=conn.prepareStatement(query);
			ps.setString(1, empId);
			ps.setString(2, name);
			ps.setString(3, phone);
			ps.setString(4, email);
			ps.setString(5, address);
			ps.setString(6, gen);
			ps.setString(7, mstatus);
			ps.setDate(8, sqlDate);
			ps.executeUpdate();  
			ps.close();
			response.sendRedirect("jsp/homePage.jsp"); 
		
		
		}  
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally{
			try {
				DbConnection.closeCon(conn);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}


	}

}  