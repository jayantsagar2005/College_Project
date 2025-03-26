package tech.happy.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminUpdatePasswordDaoImp implements AdminUpdatePasswordDao {

	private static String result;
	private static Connection conn;
//	private static int sno;
	private static String user;
	private static String pass;
	
	@Override
	public String checkUserPass(String username, String password) {
		
		try {
			
			conn = ConnectionFactory.getConnection();
			
			String query = "select* from adminlogin where Username = ? AND Password = ?";
			
			PreparedStatement preparedStatement = conn.prepareStatement(query);
			preparedStatement.setString(1, username);
			preparedStatement.setString(2, password); 
			
			ResultSet resultSet =  preparedStatement.executeQuery();
			
			if(resultSet.next()) {
//				sno = resultSet.getInt("S_No");
				user = resultSet.getString("Username");
				pass = resultSet.getString("Password"); 
			}
			
			if(pass == null || user == null) {
				result = "Username or Current Password Wrong, Try Again !"; 
			}else{
				result = "Data Exits";
			}
					
		}catch (Exception e) {
			e.printStackTrace();
			result = "Data not found";
		}
		
		finally {
			try {
				conn.close();
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		}
		
		return result;
	}

	@Override
	public String updatePassword(String username, String oldPassword, String newPassword) {
		
		try {
			
			conn = ConnectionFactory.getConnection();
			
			String query = "update adminlogin set Password = ? where Username = ?";
			
			PreparedStatement preparedStatement = conn.prepareStatement(query);
			
			preparedStatement.setString(1, newPassword);
			preparedStatement.setString(2, username);
			
			int rowAffect = preparedStatement.executeUpdate();
			
			if(rowAffect > 0) {
				
				result = "Password Successfully Update";
				
			}else{
				
				result = "Password Not Update";
				
			}	
					
		}catch (Exception e) {
			e.printStackTrace();
			result = "Password Not Update!";
		}
		
		finally {
			try { 
				conn.close();
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		}
		
		return result;
		
	}

}
