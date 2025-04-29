package tech.happy.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import tech.happy.model.AdminData;


public class AdminDataDao {
	
	Connection conn;
	
	public AdminData getData(String location) {
		AdminData data = null;
		
		try {
			conn = ConnectionFactory.getConnection();
			String query = "select* from location where City = ?";
			PreparedStatement pStatement = conn.prepareStatement(query);
			pStatement.setString(1, location);
			
			ResultSet resultSet = pStatement.executeQuery();
			
			while(resultSet.next()) {
				data = new AdminData(resultSet.getInt("SNo"), resultSet.getString("AdminName"), resultSet.getString("AdminMail"), resultSet.getString("City"), resultSet.getString("Image"));
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
		
		return data;
	}
	
	public String getMail(String location) {
		String mail = "";
		
		try {
			conn = ConnectionFactory.getConnection();
			String query = "select AdminMail from location where City = ?";
			PreparedStatement pStatement = conn.prepareStatement(query);
			pStatement.setString(1, location);
			
			ResultSet resultSet = pStatement.executeQuery();
			
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
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return mail;
	}
	
	public double[] getPoints(String location) {
		double[] points = new double[2];
		
		try {
			conn = ConnectionFactory.getConnection();
			String query = "select Latitude, Longitude from location where City = ?";
			PreparedStatement pStatement = conn.prepareStatement(query);
			pStatement.setString(1, location);
			
			ResultSet resultSet = pStatement.executeQuery();
			
			if(resultSet.next()) {
				points[0] = resultSet.getDouble("Latitude");
				points[1] = resultSet.getDouble("Longitude");
			}
		}catch(Exception e) {
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
		return points;
	}
}
