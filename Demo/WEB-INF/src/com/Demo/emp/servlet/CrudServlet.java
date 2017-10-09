package com.Kaldin.emp.servlet;

import javax.servlet.http.HttpServlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Kaldin.emp.dbConnection.DbConnection;


public class CrudServlet extends HttpServlet{

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
		String empId=(String)session.getAttribute("empId");
		PrintWriter out = response.getWriter();
		
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
		if(empId==null)
		{
			empId="0";
		}
		
		String act=request.getParameter("act");
		if(act==null||"".equals(act)){
			act="empty_act";
			response.sendRedirect("jsp/homePage.jsp"); 
		}
		System.out.println(act);
//		System.out.println(empId);
		if(act.equals("add")){
			String name=request.getParameter("name");	
			String phone = request.getParameter("phone");
			String email=request.getParameter("email");
			String address=request.getParameter("address");  
			String gen=request.getParameter("gender");
			String mstatus=request.getParameter("mstatus");
			String dob=request.getParameter("dob");
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
				PreparedStatement ps=con.prepareStatement(query);
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
		else if(act.equals("viewall")){
			try {

				int count = 0;
				int counter = 0;
//				System.out.println("act=display");
//				System.out.println(empId);
				Statement st1 = con.createStatement();
				ResultSet rs1 = st1.executeQuery("select count(*) as count from friend where frDelete=0 AND empId="+empId);
				while (rs1.next()) {
					counter = rs1.getInt("count");
				}
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery("select * from friend where frDelete=0 And empId="+empId);
				out.print("{\"data\":[");
				while (rs.next()) {
					count = count + 1;
					//			            out.print(rs.getString(3));
					response.getWriter().write("{\"name\":\"" + rs.getString(3) + "\",\"phone\":\"" + rs.getString(4) + "\"" + ",\"email\":\"" + rs.getString(5) + "\",\"address\":\"" + rs.getString(6) + "\"," + "\"gender\":\"" + rs.getString(7) + "\",\"mstatus\":\""+rs.getString(8)+"\",\"dob\":\"" + rs.getDate(9) + "\",\"id\":\"" + rs.getInt(1) + "\"}");
					if (count == counter) {
						out.print("");
					} else {
						out.print(",");
					}
				}
				out.print("]}");
			}

			catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			finally{

				try {
					DbConnection.closeCon(con);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
//					System.out.println("finally");
//					System.out.println("");
				}
			}
						
//			String frId=request.getParameter("frId");
		
			}else if(act.equals("show"))	{
			
	        String id = request.getParameter("frId");
		       
			try {
				Statement st;
				st = con.createStatement();				
				ResultSet rs = st.executeQuery("select * from friend where frId=" + id);
		        if (rs.next()) {
//		        	response.getWriter().write("{\"data\":[");
		        	response.getWriter().write("{\"name\":\"" + rs.getString(3) + "\",\"phone\":\"" + rs.getString(4) + "\"" + ",\"email\":\"" + rs.getString(5) + "\",\"address\":\"" + rs.getString(6) + "\"," + "\"gender\":\"" + rs.getString(7) + "\",\"mstatus\":\""+rs.getString(8)+"\",\"dob\":\"" + rs.getDate(9) + "\"}");
//		        	response.getWriter().write("]}");
		        } else {
		            out.println("{\"error\":\"Student is not found!\"}");
		        }
		        rs.close();
		        st.close();
								
			} catch (SQLException e) {
				// TODO Auto-generated catch block
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
	        
	        					
			}else if(act.equals("update")){
				String name=request.getParameter("name");	
				String phone = request.getParameter("phone");
				String email=request.getParameter("email");
				String address=request.getParameter("address");  
				String gen=request.getParameter("gender");
				String mstatus=request.getParameter("mstatus");
				String dob=request.getParameter("dob");
				String id=request.getParameter("frId");

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
					String query = "update friend set frName=?,frPhone=?,frEmail=?,frAddress=?,frGender=?,frMstatus=?,frDob=?" + "where frId=" + id;
		            PreparedStatement ps = con.prepareStatement(query);
					
					ps.setString(1, name);
					ps.setString(2, phone);
					ps.setString(3, email);
					ps.setString(4, address);
					ps.setString(5, gen);
					ps.setString(6, mstatus);
					ps.setDate(7, sqlDate);					
					ps.executeUpdate();  
					ps.close();
					out.println("{\"success\":\"Updated Successfully\"}");			
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
				
				
			}else if(act.equals("delete")){
				
				       String id = request.getParameter("frIdDl");
				       String[] items = id.replaceAll("\\[", "").replaceAll("\\]", "").replaceAll("\\s", "").split(",");
				       int[] results = new int[items.length];
				       for (int i = 0; i < items.length; i++) {
				           try {
				               results[i] = Integer.parseInt(items[i]);
				           } catch (NumberFormatException nfe) {
				        	   nfe.printStackTrace();
				           };
				       }
				       
				       for(int i = 0; i < results.length; i++)
				       {
//				    	   System.out.println(results[i]);
				    	   
				        try {
				            String query = "update friend set frDelete=1 where frId=" + results[i];
				            Statement stmt = con.createStatement();
				            
				            stmt.executeUpdate(query);
				           stmt.close();
				            
				            out.println("{\"success\":\"deleted Successfully\"}");
				            //response.sendRedirect("jsp/homePage.jsp"); 
				            
				        } catch (Exception ex) {
				            out.println(ex.getMessage());
				            out.println("{\" error\":\"can not deleted Record\"}");
					} finally{
						try {
							DbConnection.closeCon(con);
						} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
				       } 
			}
	}
}
