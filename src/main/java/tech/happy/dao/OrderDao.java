package tech.happy.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import tech.happy.model.OrderPojo;

public class OrderDao {
	Connection conn;
	
	public boolean saveOrder(OrderPojo order, String location) {
		
		boolean flag = false;
		
		try {
			conn = ConnectionFactory.getConnection();
			
			String query = "insert into orders(Name, Gmail, Table_No, DateTime, Items, Amount, Pay_Status, Status, Location) values (?, ?, ?, ?, ?, ?, ?, ?, ?)"; 
			PreparedStatement statement = conn.prepareStatement(query);

			statement.setString(1, order.getName());
			statement.setString(2, order.getGmail());
			statement.setInt(3, order.getTableNo());
			statement.setString(4, order.getDateTime());
			statement.setString(5, order.getItems());
			statement.setInt(6, order.getAmount());
			statement.setString(7, order.getPayStatus());
			statement.setString(8, order.getStatus());
			statement.setString(9, location);
			int rowAffected = statement.executeUpdate();
			
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
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return flag;
	}
	
	public ArrayList<OrderPojo> readData(String location){ 
		
		ArrayList<OrderPojo> list = new ArrayList<>();
		
		try {
			conn = ConnectionFactory.getConnection();
			
			String query = "select* from orders where Location = ? order by SNo desc"; 
			PreparedStatement statement = conn.prepareStatement(query);
			statement.setString(1, location);
			ResultSet resultSet = statement.executeQuery();
			
			while(resultSet.next()) {
				list.add(new OrderPojo(resultSet.getInt("SNo"), resultSet.getString("Name"), resultSet.getString("Gmail"), resultSet.getInt("Table_No"), resultSet.getString("DateTime"), resultSet.getString("Items"), resultSet.getInt("Amount"), resultSet.getString("Pay_Status"), resultSet.getString("Status")));
			}
			 			 
		} catch (Exception e) {
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
		 	
		return list;	 
	}
	
	public int pendingOrder(String location) {
		int n = 0;
		
		try {
			conn = ConnectionFactory.getConnection();
			String query = "SELECT COUNT(*) as n FROM orders WHERE Status = ? and Location = ?";
			PreparedStatement statement = conn.prepareStatement(query);
			statement.setString(1, "Pending");
			statement.setString(2, location);
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
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return n;
	}
	
	public boolean updateStatus(int sNo) {
		boolean flag = false;
		
		try {
			conn = ConnectionFactory.getConnection();
			String query = "update orders set Status = ? where SNo = ?";
			PreparedStatement statement = conn.prepareStatement(query);
			statement.setString(1, " Done ");
			statement.setInt(2, sNo);
			int rowAffected = statement.executeUpdate();
			
			if (rowAffected > 0) {
				flag = true;
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
		
		return flag;
	}
	
	public boolean deleteOrder(int sNo) {
		boolean flag = false;
		
		try {
			conn = ConnectionFactory.getConnection();
			String query = "delete from orders where SNo = ?";
			PreparedStatement statement = conn.prepareStatement(query);
			statement.setInt(1, sNo);
			int rowAffected = statement.executeUpdate();
			
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
}
