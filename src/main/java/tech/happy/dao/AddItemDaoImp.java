package tech.happy.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import tech.happy.model.ItemPojo;

public class AddItemDaoImp implements AddItemDao{
	
	private Connection conn;
	private static String result;
	
	@Override
	public boolean addItem(String dayTime, String itemName, String itemContent, int itemPrice, String itemImage,
			String dateTime, String location) { 
		boolean result = false;
		
		try {
			conn = ConnectionFactory.getConnection();
			String query = "insert into items(ItemName, Itemcontent, ItemPrice, ItemImage, DayTime, DateTime, Location) values (?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement pStatement = conn.prepareStatement(query);
			pStatement.setString(1, itemName);
			pStatement.setString(2, itemContent);
			pStatement.setInt(3, itemPrice);
			pStatement.setString(4, itemImage);	
			pStatement.setString(5, dayTime);
			pStatement.setString(6, dateTime);
			pStatement.setString(7, location);
			
			int rowAffected = pStatement.executeUpdate();
			
			if(rowAffected > 0) {
				result = true;
			}
			
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
		
		
		return result;
	}

	@Override
	public ArrayList<ItemPojo> getItem(String time, String location) {
		ArrayList<ItemPojo> list = new ArrayList<ItemPojo>();
		
		try {
			conn = ConnectionFactory.getConnection();
			String query = "select* from items where DayTime = ? and Location = ?";
			PreparedStatement pStatement = conn.prepareStatement(query);
			pStatement.setString(1, time);
			pStatement.setString(2, location);
			
			ResultSet resultSet = pStatement.executeQuery();
			
			while(resultSet.next()) {
				list.add(new ItemPojo(resultSet.getInt("ItemNo"), resultSet.getString("ItemName"), resultSet.getString("ItemContent"), resultSet.getInt("ItemPrice"), resultSet.getString("ItemImage"), resultSet.getString("DayTime"), resultSet.getString("DateTime")));
			}
			
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
		
		
		return list;
	}

	@Override
	public ArrayList<ItemPojo> getItemTen(String time, String location) {
		
		ArrayList<ItemPojo> list = new ArrayList<ItemPojo>();
			
			try {
				conn = ConnectionFactory.getConnection();
				String query = "select* from items where DayTime = ? and Location = ?";
				PreparedStatement pStatement = conn.prepareStatement(query);
				pStatement.setString(1, time);
				pStatement.setString(2, location);
				
				ResultSet resultSet = pStatement.executeQuery();
				
				int i = 0;
				while(resultSet.next()) {
					if(i == 10) break;
					list.add(new ItemPojo(resultSet.getInt("ItemNo"), resultSet.getString("ItemName"), resultSet.getString("ItemContent"), resultSet.getInt("ItemPrice"), resultSet.getString("ItemImage"), resultSet.getString("DayTime"), resultSet.getString("DateTime")));
					i++;
				}
				
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
			
			
			return list;
	}
	
	public ArrayList<ItemPojo> getItem(String location) { 
		ArrayList<ItemPojo> list = new ArrayList<ItemPojo>();
		
		try {
			conn = ConnectionFactory.getConnection();
			String query = "select* from items where location = ?";
			PreparedStatement pStatement = conn.prepareStatement(query);
			pStatement.setString(1, location);
			ResultSet resultSet = pStatement.executeQuery();
			
			while(resultSet.next()) {
				list.add(new ItemPojo(resultSet.getInt("ItemNo"), resultSet.getString("ItemName"), resultSet.getString("ItemContent"), resultSet.getInt("ItemPrice"), resultSet.getString("ItemImage"), resultSet.getString("DayTime"), resultSet.getString("DateTime")));
			}
			
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
		
		
		return list;
	}

	@Override
	public String deleteItem(int itemNo) {
		
		try {
			
			conn = ConnectionFactory.getConnection();
			
			String query = "delete from items where ItemNo = ?";
			
			PreparedStatement preparedStatement = conn.prepareStatement(query);
			
			preparedStatement.setInt(1, itemNo);
			
			
			int executeUpdate = preparedStatement.executeUpdate();
			
			if(executeUpdate == 1) {
				
				result = "Item Delete Successfully !";
				
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
	public ItemPojo getData(int itemNo) {
		ItemPojo dataItemPojo = null;
		
		try {
			conn = ConnectionFactory.getConnection();
			String query = "select* from items where ItemNo = ?";
			PreparedStatement pStatement = conn.prepareStatement(query);
			pStatement.setInt(1, itemNo); 
			
			ResultSet resultSet = pStatement.executeQuery();
			
			while(resultSet.next()) {
				dataItemPojo = new ItemPojo(resultSet.getInt("ItemNo"), resultSet.getString("ItemName"), resultSet.getString("ItemContent"), resultSet.getInt("ItemPrice"), resultSet.getString("ItemImage"), resultSet.getString("DayTime"), resultSet.getString("DateTime"));
			}
			
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
		
		 
		return dataItemPojo;
	}


	@Override
	public boolean updateItem(String dayTime, String itemName, String itemContent, int itemPrice, String itemImge, int itemNo) {
		
		boolean result = false;
		
		try {
			
			conn = ConnectionFactory.getConnection();
			
			if(itemImge.isEmpty() || itemImge == null) {
				
				String query = "update items set DayTime = ?, ItemName = ?, ItemContent = ?, ItemPrice = ? where ItemNo = ?";
				PreparedStatement preparedStatement = conn.prepareStatement(query);
				preparedStatement.setString(1, dayTime);
				preparedStatement.setString(2, itemName);
				preparedStatement.setString(3, itemContent);
				preparedStatement.setInt(4, itemPrice);
				preparedStatement.setInt(5, itemNo);
				
				int rowAffect = preparedStatement.executeUpdate();
				
				if(rowAffect > 0) result = true;	
				else result = false;
				
			}else {
				
				String query = "update items set DayTime = ?, ItemName = ?, ItemContent = ?, ItemPrice = ?, ItemImage = ? where ItemNo = ?";
				
				PreparedStatement preparedStatement = conn.prepareStatement(query);
				preparedStatement.setString(1, dayTime);
				preparedStatement.setString(2, itemName);
				preparedStatement.setString(3, itemContent);
				preparedStatement.setInt(4, itemPrice);
				preparedStatement.setString(5, itemImge); 
				preparedStatement.setInt(6, itemNo);
				
				int rowAffect = preparedStatement.executeUpdate();
				
				if(rowAffect > 0) result = true;	
				else result = false;		
				
			}		
					
		}catch (Exception e) {
			e.printStackTrace();
			result = false;
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
