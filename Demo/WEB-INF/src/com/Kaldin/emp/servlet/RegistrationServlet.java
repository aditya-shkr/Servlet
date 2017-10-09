package com.Kaldin.emp.servlet;

import java.io.IOException;
import java.sql.*;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Kaldin.emp.dbConnection.DbConnection;

import javafx.scene.control.Alert;



public class RegistrationServlet extends HttpServlet{ 

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
		int flag=0;
		String name=request.getParameter("name");	
		String phone = request.getParameter("phone");
		String email=request.getParameter("email");
		String address=request.getParameter("address");  
		String gen=request.getParameter("gen");
		String mstatus=request.getParameter("maritalStatus");
		String dob=request.getParameter("dob");
		String skill=request.getParameter("chk1");
		String password=request.getParameter("password");
		
		if(name==null){
			name="empty";
		}if(phone==null){
			phone="0";
		}if(email==null){
			email="empty";
		}if(address==null){
			address="empty";
		}if(gen==null){
			gen="empty";
		}if(mstatus==null){
			mstatus="empty";
		}
		if(dob==null){
			dob="2011-08-19";
		}
		if(skill==null){
			skill="empty";
		}
		if(password==null){
			password="empty";
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
			
		try{  String query1="select * from employee where email='"+email+"'";
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(query1);
			while (rs.next()) {

				flag=1;
				}
		}
		catch(Exception e){
			e.printStackTrace();
		}
if(flag==1)
{
	response.sendRedirect("jsp/regPage.jsp");
	}
		try
		{ if(flag==0)
			{
			String query="insert into employee(name,phone,email,address,gender,mstatus,dob,skill,password)"+"values(?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps=conn.prepareStatement(query);
			ps.setString(1, name);
			ps.setString(2, phone);
			ps.setString(3, email);
			ps.setString(4, address);
			ps.setString(5, gen);
			ps.setString(6, mstatus);
			ps.setDate(7, sqlDate);
			ps.setString(8, skill);
			ps.setString(9, password);
			ps.executeUpdate();  
			ps.close();
			response.sendRedirect("jsp/loginPage.jsp"); 
		}
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