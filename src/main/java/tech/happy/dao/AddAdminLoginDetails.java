package tech.happy.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class AddAdminLoginDetails {
	
	private Connection conn;
	
	public void addDetails(String username, String dateTime) {
		
		try {
			conn = ConnectionFactory.getConnection();
			String query = "insert into adminlogindetails(Username, DateTime) values (?, ?)";
			PreparedStatement pStatement = conn.prepareStatement(query);
			pStatement.setString(1, username);
			pStatement.setString(2, dateTime);
			pStatement.executeUpdate();	
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				if(conn != null) {
					conn.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
}
