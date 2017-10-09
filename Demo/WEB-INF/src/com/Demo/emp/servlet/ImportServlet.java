package com.Kaldin.emp.servlet;

import java.io.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.Iterator;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.Row;
import com.Kaldin.emp.dbConnection.DbConnection;
import com.oreilly.servlet.MultipartRequest;



public class ImportServlet extends HttpServlet{ 

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
		String filename=null;
		PrintWriter out = response.getWriter();
		HttpSession ses=request.getSession();
        String empId=(String)ses.getAttribute("empId");
        if(empId==null||"".equals(empId)){
        	response.sendRedirect("jsp/homePage.jsp");
        	}else{
        try{		
        		
        MultipartRequest mrequest = new MultipartRequest(request,"/home/s5/Documents/files");
        Enumeration files = mrequest.getFileNames();
        
        while (files.hasMoreElements()) {
            
            String upload = (String) files.nextElement();
            filename = mrequest.getFilesystemName(upload);   
            System.out.println(filename);  
        }
        }
        catch(Exception e){
        	System.out.println(e+" hi");
        	
        }
        	
          

                
        
        int count=0;
        int flag=0;
        
        Connection con = null;
		try {
			con = DbConnection.getConnection();
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try 
		{
		        // Get the workbook instance for XLSX file
		        HSSFWorkbook wb = new HSSFWorkbook(new FileInputStream("/home/s5/Documents/files/"+filename));

		        // Get first sheet from the workbook
		        HSSFSheet sheet = wb.getSheetAt(0);

		        Row row;
		        Cell cell;

		        // Iterate through each rows from first sheet
		        Iterator<Row> rowIterator = sheet.iterator();
		        row = rowIterator.next();
		        ArrayList<String> list= new ArrayList<String>();
		        
		        while (rowIterator.hasNext()) 
		        {
		                row = rowIterator.next();

		                // For each row, iterate through each columns
		                Iterator<Cell> cellIterator = row.cellIterator();
		                list.clear();
		                while (cellIterator.hasNext()) 
		                {
		                	cell = cellIterator.next();

		                	


		                	switch (cell.getCellType()) 
		                	{


		                	case Cell.CELL_TYPE_NUMERIC:
		                		
		                		if(DateUtil.isCellDateFormatted(cell))
		                		   {

		                			Date date=cell.getDateCellValue();	                			
		                			// Create an instance of SimpleDateFormat used for formatting 
		                			// the string representation of date (month/day/year)
		                			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");		                			       
		                			// Using DateFormat format method we can create a string 
		                			// representation of a date with the defined format.
		                			String newDate = df.format(date);	                			
		                			list.add(newDate);		                			
		                		   }
		                		else{
		                		Double d =cell.getNumericCellValue();		                        
		                		long l = (new Double(d)).longValue();
		                		String s= Long.toString(l);
		                		list.add(s);
		                		}
		                		break;

		                	case Cell.CELL_TYPE_STRING:

		                		String s1=cell.getStringCellValue();
		                		list.add(s1);
		                		break;
		                		
		                	case Cell.CELL_TYPE_BLANK:

		                		break;

		                	default:


		                	}
		                }
		                

		               String emailEx=list.get(2);
//		               System.out.println(emailEx);
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
		    		
		    		
		    		
		    				    		
		    		if(emailEx == null || "".equals(emailEx)){
		    			emailEx = "empty";
		    		}	
		    		
		    		try{  String query1="select * from friend where empId='"+empId+"' and frEmail='"+emailEx+"'";		    		
		    		Statement st = conn.createStatement();
		    		ResultSet rs = st.executeQuery(query1);
		    		if (!rs.next()) {
		    			flag=1;
		                try
			        		{
			        			String query="insert into friend(empId,frName,frPhone,frEmail,frAddress,frGender,frMstatus,frDob)"+"values(?,?,?,?,?,?,?,?)";
			        			PreparedStatement ps=con.prepareStatement(query);
			        			ps.setString(1, empId);
			        			ps.setString(2, list.get(0));
			        			ps.setString(3, list.get(1));
			        			ps.setString(4, list.get(2));
			        			ps.setString(5, list.get(3));
			        			ps.setString(6, list.get(4));
			        			ps.setString(7, list.get(5));
			        			ps.setString(8, list.get(6));
			        			ps.executeUpdate();  
			        			ps.close();
			        			count++;
			        		
			        		
			        		}  
			        		catch(Exception e)
			        		{
			        			e.printStackTrace();
			        		}
			        		finally{
			        			try {
			        				DbConnection.closeCon(con);
			        			} catch (SQLException e) {
			        				// TODO Auto-generated catch block
			        				e.printStackTrace();
			        			}
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
		    				    				    		
		    			
		        }
		        
//		        System.out.println("count"+count);
//		        System.out.println("flag"+flag);
		       out.print(count);
		        wb.close();
		        
		        
		}
		catch (Exception e) 
		{
		        System.err.println("Exception :" + e.getMessage());
		        
		        out.print("only xml file supported");
		}
		
	
	}
		    
	}
}  