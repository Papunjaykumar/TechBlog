package com.tech.blog.helper;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider {
	
	private static Connection con;
	
	public static Connection getConnection() {
		
		
		try {
			if(con==null) {
				//1.load the driver 
				Class.forName("oracle.jdbc.OracleDriver");
				System.out.println("Driver get Loaded...");
				
				//2 create a connection..
				con=DriverManager.getConnection("jdbc:oracle:thin:@papunjay-Vostro-3580:9501/xe", "techblog", "techblog");
				System.out.println("Connection Established...");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return con;
	}
}
