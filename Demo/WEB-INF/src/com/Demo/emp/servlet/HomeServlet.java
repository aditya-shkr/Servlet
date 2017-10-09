package com.Kaldin.emp.servlet;

import javax.servlet.http.HttpServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



public class HomeServlet extends HttpServlet{

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

		
		HttpSession session=request.getSession();
		String email=(String)session.getAttribute("email");
//		String empId=(String)session.getAttribute("empId");

		 

		if(email==null){  

			response.sendRedirect("jsp/loginPage.jsp");

		} 
		else{
			response.sendRedirect("jsp/homePage.jsp");
		}

	}

}
