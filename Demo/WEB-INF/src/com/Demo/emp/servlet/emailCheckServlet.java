package com.Kaldin.emp.servlet;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.Kaldin.emp.dbConnection.DbConnection;




public class emailCheckServlet extends HttpServlet{ 

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
		String status="Email Available";
		String status1="Email Already Registred";
		String status3="login";
		String email1 = request.getParameter("emailCheck");
		
		if(email1 == null || "".equals(email1)){
			email1 = "empty";
		}	
		
		try{  String query1="select * from employee where email='"+email1+"'";
		
		Statement st = conn.createStatement();
		ResultSet rs = st.executeQuery(query1);
		while (rs.next()) {

			flag=1;
				
			response.getWriter().write(status1);
			
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
		response.setContentType("text/plain");
		response.getWriter().write(status1);
		}
		else if(flag==2)
			response.getWriter().write(status3);
		else
			response.getWriter().write(status);


	}

}  