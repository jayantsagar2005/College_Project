package tech.happy.dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionFactory {
	
	private static String url = "jdbc:mysql://mysql.railway.internal:3306/railway";
	private static String username = "root";
	private static String password = "cZscyPbnjzFSgzhoMeGJOWvKudoPpPWi";
	private static String driverClassName = "com.mysql.cj.jdbc.Driver";
	private static Connection conn;
	
	public static Connection getConnection() {
		try {
			Class.forName(driverClassName);
			conn = DriverManager.getConnection(url, username, password);
		}catch(Exception e) {
			e.printStackTrace();
		} 
		
		return conn; 
		
	}
}
