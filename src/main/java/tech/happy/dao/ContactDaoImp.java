package tech.happy.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import tech.happy.model.ContactPojo;

public class ContactDaoImp implements ContactDao {

	private static String msgString;
	private static Connection conn;
	
	@Override
	public String saveContact(String name, String email, String subject, String message, String dateTime) {

		try {
			
			conn = ConnectionFactory.getConnection();
			
			String query = "insert into contact(Name, Gmail, Subject, Message, DateTime) values (?, ?, ?, ?, ?)";
			
			PreparedStatement preparedStatement = conn.prepareStatement(query);
			
			preparedStatement.setString(1, name);
			preparedStatement.setString(2, email);
			preparedStatement.setString(3, subject);
			preparedStatement.setString(4, message);
			preparedStatement.setString(5, dateTime);
			
			int executeUpdate = preparedStatement.executeUpdate();
			
			if(executeUpdate == 1) {
				msgString = "Message Sent Successfully !";
			}else {
				msgString = "Something Went Wrong!";
			}
	
			
		}catch (Exception e) {
			e.printStackTrace();
			msgString = "Something Went Wrong!";
		}
		
		finally {
			try {
				conn.close();
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		}
		
		return msgString;
	}
	
	@Override
	public ArrayList<ContactPojo> readContact() {
		
		ArrayList<ContactPojo> list = new ArrayList<ContactPojo>();
		
		try {
			
			conn = ConnectionFactory.getConnection();
			
			String query = "select* from contact order by S_No desc";
			
			PreparedStatement preparedStatement = conn.prepareStatement(query);
			ResultSet resultSet =  preparedStatement.executeQuery();
			
			if(!resultSet.next()) {
				list.add(new ContactPojo(0, "ne", "ne", "ne", "ne", "ne"));
			}else {
				do {
					list.add(new ContactPojo(resultSet.getInt("S_No"), resultSet.getString("Name"), resultSet.getString("Gmail"), resultSet.getString("Subject"), resultSet.getString("Message"), resultSet.getString("DateTime"), resultSet.getString("Seen")));
				}while(resultSet.next());
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			list.clear();  
		}
		
		finally {
			try {
				conn.close();
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		}
		
		return list; 
	}

	@Override
	public String deleteContact(int sno) {
		try {
			
			conn = ConnectionFactory.getConnection();
			
			String query = "delete from contact where S_No = ?";
			
			PreparedStatement preparedStatement = conn.prepareStatement(query);
			
			preparedStatement.setInt(1, sno);
			
			
			int executeUpdate = preparedStatement.executeUpdate();
			
			if(executeUpdate == 1) {
				msgString = "Contact Delete Successfully !";
			}else {
				msgString = "Something Went Wrong!";
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			msgString = "Something Went Wrong!";
		}
		
		finally {
			try {
				conn.close();
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		}
		
		return msgString;
	}

	public boolean updateMessage(int sNo) {
		boolean flag = false;
		
		try {
			conn = ConnectionFactory.getConnection();
			
			String queryString = "update contact set Seen = ? where S_No = ?";
			
			PreparedStatement preparedStatement = conn.prepareStatement(queryString);
			preparedStatement.setString(1, "Read");
			preparedStatement.setInt(2, sNo);
			
			int rowAffected = preparedStatement.executeUpdate();
			
			if(rowAffected > 0) {
				flag = true;
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
		
		return flag;
	}
 
	@Override
	public int unreadCount() {
		int n = 0;
		try {	
			conn = ConnectionFactory.getConnection();
			String query = "SELECT COUNT(*) as n FROM contact WHERE Seen = ?";
			PreparedStatement statement = conn.prepareStatement(query);
			statement.setString(1, "Unread");
			
			ResultSet resultSet = statement.executeQuery();
			
			if(resultSet.next()) {
				n = resultSet.getInt("n");
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn != null) {
					conn.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		 
		return n;
	}
}
