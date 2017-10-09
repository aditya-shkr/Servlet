package com.Kaldin.emp.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import com.Kaldin.emp.dbConnection.DbConnection;

public class ExportServlet extends HttpServlet{ 

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
		PrintWriter out=response.getWriter();
		HttpSession ses=request.getSession();
		
		String empId=(String)ses.getAttribute("empId");
		if(empId!=null)
		{
//			System.out.print(empId);
			Date date = new Date();
			String filename = "/home/s5/Documents/files/friends"+date.getTime() +".xls" ;

			try{
				Connection con=null;
				 con=DbConnection.getConnection();
			

				Statement stmt = con.createStatement();
				String strQuery = "select * from friend where frDelete=0 and empId ="+empId;


				ResultSet rs = stmt.executeQuery(strQuery);

				HSSFWorkbook hwb = new HSSFWorkbook();
				HSSFSheet sheet = hwb.createSheet("new sheet"); 

				HSSFRow rowhead = sheet.createRow(0);
				rowhead.createCell(0).setCellValue("Name");
				rowhead.createCell(1).setCellValue("Phone");
				rowhead.createCell(2).setCellValue("Email");
				rowhead.createCell(3).setCellValue("Address");
				rowhead.createCell(4).setCellValue("Gender");
				rowhead.createCell(5).setCellValue("Marital Status");
				rowhead.createCell(6).setCellValue("Dob");

				int index=2;
				
				
				while(rs.next()) 
				{
			
				HSSFRow row = sheet.createRow(index);
				
				row.createCell(0).setCellValue(rs.getString(3));
				row.createCell(1).setCellValue(rs.getString(4));
				row.createCell(2).setCellValue(rs.getString(5));
				row.createCell(3).setCellValue(rs.getString(6));
				row.createCell(4).setCellValue(rs.getString(7));
				row.createCell(5).setCellValue(rs.getString(8));
				row.createCell(6).setCellValue(rs.getString(9));
				index++;
				}
//				FileOutputStream fileOut = new FileOutputStream(filename);
//				hwb.write(fileOut);				
				response.reset();
				response.setContentType("application/vnd.ms-excel");
				response.setHeader("Content-Disposition", "attachment; filename="+filename);
				hwb.write(response.getOutputStream());
//				fileOut.close();
				hwb.close();
				out.println("Your excel file has been generated");
				} catch ( Exception ex ) {

				}
			
		}else{
			response.sendRedirect("jsp/homePage.jsp");
			System.out.print("else");
		}

	}

}  