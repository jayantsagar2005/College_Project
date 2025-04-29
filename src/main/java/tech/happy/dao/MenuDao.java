package tech.happy.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import tech.happy.model.FoodList;

public class MenuDao {
	
	Connection conn;
	
	public ArrayList<FoodList> foodMenu(String location){
		ArrayList<FoodList> list = new ArrayList<>();
		
		try {
			conn = ConnectionFactory.getConnection();
			
			String query = "select ItemName, ItemPrice, DayTime from items where Location = ?"; 
			PreparedStatement statement = conn.prepareStatement(query);
			statement.setString(1, location);
			ResultSet resultSet = statement.executeQuery();
			 
			while(resultSet.next()) {
				list.add(new FoodList(resultSet.getString("ItemName"), resultSet.getInt("ItemPrice"), resultSet.getString("DayTime")));
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
		
		return list;
	}
}
