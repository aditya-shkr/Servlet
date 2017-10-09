package com.Kaldin.emp.servlet;

import javax.servlet.http.HttpServlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Kaldin.emp.dbConnection.*;

public class LoginServlet extends HttpServlet{

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
		super.service(req, resp);
	}
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		Connection conn=null;
		try {
			conn=DbConnection.getConnection();
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		int flag=0;
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		try{  String query1="select * from employee where email='"+email+"'";
		Statement st = conn.createStatement();
		ResultSet rs = st.executeQuery(query1);
		while (rs.next()) {
			
			String email1=rs.getString(4);
			String password1=rs.getString(10);			
			if(email1.equals(email) && password1.equals(password)){
				flag=1;
				HttpSession ses=request.getSession();  
		        ses.setAttribute("email",email);  
				}
			}
	}
	catch(Exception e){
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
	
	if(flag==1){
		
		response.sendRedirect("jsp/homePage.jsp");
	}
	else{			
			response.sendRedirect("jsp/loginPage.jsp");
		}
	
	}
}