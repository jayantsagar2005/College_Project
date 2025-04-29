package tech.happy.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class GetMailLocation {
	
	private Connection conn;

	public String getMail(String location) {
		String mail = "";
		
		try {
			conn = ConnectionFactory.getConnection();
			String query = "SELECT AdminMail FROM location WHERE City = ?";
			PreparedStatement statement = conn.prepareStatement(query);
			statement.setString(1, location);
			ResultSet resultSet = statement.executeQuery();
			
			if(resultSet.next()) {
				mail = resultSet.getString("AdminMail");
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn != null) {
					conn.close();
				}
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return mail; 
	}
}
