package tech.happy.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import tech.happy.model.ServicePojo;

public class ServiceDaoImp implements ServiceDao {

	private static String result;
	private static Connection conn;
	
	@Override
	public String saveService(String iconname, String title, String descrition, String dateTime, String location) {
		try {
			
			conn = ConnectionFactory.getConnection();
			
			String query = "insert into service(Iconname, Title, Description, DateTime, Location) values (?, ?, ?, ?, ?)";
			
			PreparedStatement preparedStatement = conn.prepareStatement(query);
			
			preparedStatement.setString(1, iconname);
			preparedStatement.setString(2, title);
			preparedStatement.setString(3, descrition); 
			preparedStatement.setString(4, dateTime);
			preparedStatement.setString(5, location); 
			
			int executeUpdate = preparedStatement.executeUpdate();
			
			if(executeUpdate == 1) {
				result = "Service Save Successfully !";
			}else {
				result = "Something Went Wrong!";
			}
	
			
		}catch (Exception e) {
			e.printStackTrace();
			result = "Something Went Wrong!";
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
	public ArrayList<ServicePojo> readService(String locatiion) {
		
		ArrayList<ServicePojo> list = new ArrayList<ServicePojo>(); 
		
		try {
			
			conn = ConnectionFactory.getConnection();
			
			String query = "select* from service where Location = ?";
			
			PreparedStatement preparedStatement = conn.prepareStatement(query);
			preparedStatement.setString(1, locatiion);
			ResultSet resultSet =  preparedStatement.executeQuery();		
			
			while(resultSet.next()) {
				list.add(new ServicePojo(resultSet.getInt("S_No"), resultSet.getString("Iconname"), resultSet.getString("Title"), resultSet.getString("Description"), resultSet.getString("DateTime")));
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
	public ArrayList<ServicePojo> readFourService(String location) {
		
		ArrayList<ServicePojo> list = new ArrayList<ServicePojo>(); 
		
		try { 
			
			conn = ConnectionFactory.getConnection();
			
			String query = "select* from service where Location = ? LIMIT 4";
			
			PreparedStatement preparedStatement = conn.prepareStatement(query);
			preparedStatement.setString(1, location);
			ResultSet resultSet =  preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				list.add(new ServicePojo(resultSet.getInt("S_No"), resultSet.getString("Iconname"), resultSet.getString("Title"), resultSet.getString("Description"), resultSet.getString("DateTime")));
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
	public String deleteService(int sno) {
		
		try {
			
			conn = ConnectionFactory.getConnection();
			
			String query = "delete from service where S_No = ?";
			
			PreparedStatement preparedStatement = conn.prepareStatement(query);
			
			preparedStatement.setInt(1, sno);
			
			
			int executeUpdate = preparedStatement.executeUpdate();
			
			if(executeUpdate == 1) {
				
				result = "Service Delete Successfully !";
				
			}else {
				
				result = "Something Went Wrong!";
				
			}
			
		}catch (Exception e) {
			
			e.printStackTrace();
			result = "Something Went Wrong!";
			
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
	public String updateService(int sno, String iconname, String title, String descrition, String dateTime) {
		
		try {
			
			conn = ConnectionFactory.getConnection();
			
			String query = "update service set Iconname = ?, Title = ?, Description = ?, DateTime = ? where S_No = ?";
			
			PreparedStatement preparedStatement = conn.prepareStatement(query);
			
			preparedStatement.setString(1, iconname);
			preparedStatement.setString(2, title);
			preparedStatement.setString(3, descrition);
			preparedStatement.setString(4, dateTime);
			preparedStatement.setInt(5, sno);
			
			
			int rowAffect = preparedStatement.executeUpdate();
			
			if(rowAffect > 0) {
				
				result = "Service Successfully Update";
				
			}else{
				
				result = "Service Not Update";
				
			}	
					
		}catch (Exception e) {
			e.printStackTrace();
			result = "Service Not Update!";
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
	
	public ServicePojo getService(int sno) {
		ServicePojo listPojo = null;
		
		try {
			
			conn = ConnectionFactory.getConnection();			
			String query = "select* from service where S_No = ?";			
			PreparedStatement preparedStatement = conn.prepareStatement(query);			
			preparedStatement.setInt(1, sno);
			
			ResultSet resultSet =  preparedStatement.executeQuery();
			
			if(resultSet.next()) {
				listPojo = new ServicePojo(resultSet.getInt("S_No"), resultSet.getString("Iconname"), resultSet.getString("Title"), resultSet.getString("Description"), resultSet.getString("DateTime"));
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
		
		return listPojo;
	}

}
