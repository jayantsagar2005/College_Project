package tech.happy.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import tech.happy.model.BookTablePojo;

public class FoodOrderDaoImp implements FoodOrderDao {

	Connection conn;
	@Override
	public boolean saveData(BookTablePojo data) {
		boolean flag = false;
		
		try {
			conn = ConnectionFactory.getConnection();
			
			String query = "insert into booktable(Name, Gmail, PeopleNo, Food, DateTime) values (?, ?, ?, ?, ?)"; 
			PreparedStatement statement = conn.prepareStatement(query);
			statement.setString(1, data.getName());
			statement.setString(2, data.getGmail());
			statement.setInt(3, data.getPeopleNo());
			statement.setString(4, data.getFood());
			statement.setString(5, data.getDateTime());
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

	@Override
	public int pendingOrder() {
		int n = 0;
		
		try {
			conn = ConnectionFactory.getConnection();
			String query = "SELECT COUNT(*) as n FROM booktable WHERE Status = ?";
			PreparedStatement statement = conn.prepareStatement(query);
			statement.setString(1, "Pending");
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

	@Override
	public ArrayList<BookTablePojo> readData() {
		ArrayList<BookTablePojo> list = new ArrayList<>();
		
		 try {
			conn = ConnectionFactory.getConnection();
			
			String query = "select* from booktable order by SNo desc"; 
			PreparedStatement statement = conn.prepareStatement(query);
			ResultSet resultSet = statement.executeQuery();
			
			while(resultSet.next()) {
				list.add(new BookTablePojo(resultSet.getInt("SNo"), resultSet.getString("Name"), resultSet.getString("Gmail"), resultSet.getInt("PeopleNo"), resultSet.getString("Food"), resultSet.getString("DateTime"), resultSet.getString("Status")));
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

	@Override
	public boolean updateStatus(int sNo) {
		boolean flag = false;
		
		try {
			conn = ConnectionFactory.getConnection();
			String query = "update booktable set Status = ? where SNo = ?";
			PreparedStatement statement = conn.prepareStatement(query);
			statement.setString(1, "Done");
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

	@Override
	public boolean deleteOrder(int sNo) {
		boolean flag = false;
		
		try {
			conn = ConnectionFactory.getConnection();
			String query = "delete from booktable where SNo = ?";
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
