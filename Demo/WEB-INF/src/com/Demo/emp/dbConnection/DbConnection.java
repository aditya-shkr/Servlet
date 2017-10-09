package com.Kaldin.emp.dbConnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnection {

	public static Connection getConnection() throws SQLException, ClassNotFoundException {
		
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/empDb","root","");
//			System.out.println("Db connecteD");
		return conn;
		
	
}
public static void closeCon(Connection con) throws SQLException{
		
		if(con==null){
			System.out.println("con null");
		}
		else{
		con.releaseSavepoint(null);
		}
	}
}