package com.hms.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

	private static Connection conn;
	
	public static Connection getConn() {
		
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital","root","Thara@#01");
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		
		return conn;
	}
}
