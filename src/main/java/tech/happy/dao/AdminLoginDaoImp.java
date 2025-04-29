package tech.happy.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AdminLoginDaoImp implements AdminLoginDao {

	private static String result;
	@Override
	public String checkAdminLoginData(String username, String password) {
		try {
			
			Connection connection = ConnectionFactory.getConnection();
			String query = "select* from adminlogin where Username = ? and Password = ?";
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, username);
			preparedStatement.setString(2, password);
			ResultSet resultSet = preparedStatement.executeQuery();
			
			if(resultSet.next()) {
				result = "Exits";
			}else {
				result = "Username or Password is invalid!";
			}
			
			
		}catch (Exception e) {
			result = "Failed";
			e.printStackTrace();
		}	
		
		return result;
	}

}
