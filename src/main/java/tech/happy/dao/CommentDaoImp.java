package tech.happy.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import tech.happy.model.CommentPojo;

public class CommentDaoImp implements CommentDao {

	private Connection conn;
	
	@Override
	public boolean addComment(CommentPojo data) {
		
		boolean result = false;
		
		
		try {
			
			conn = ConnectionFactory.getConnection();
			
			String query = "insert into comment(Name, Occupation, Comment, DateTime, Image) values (?, ?, ?, ?, ?)"; 
			PreparedStatement statement = conn.prepareStatement(query);
			statement.setString(1, data.getName());
			statement.setString(2, data.getOccupation());
			statement.setString(3, data.getComment());
			statement.setString(4, data.getDateTime());
			statement.setString(5, data.getImage());
			
			int rowAffected = statement.executeUpdate();
			
			if(rowAffected > 0) {
				result = true;
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return result;
	}

	@Override
	public ArrayList<CommentPojo> readComment() {
		
		ArrayList<CommentPojo> list = new ArrayList<>();
		
		 try {
			conn = ConnectionFactory.getConnection();
			
			String query = "select* from comment order by SNo desc"; 
			PreparedStatement statement = conn.prepareStatement(query);
			ResultSet resultSet = statement.executeQuery();
			
			while(resultSet.next()) {
				list.add(new CommentPojo(resultSet.getInt("SNo"), resultSet.getString("Name"), resultSet.getString("Occupation"), resultSet.getString("Comment"), resultSet.getString("DateTime"), resultSet.getString("Image"), resultSet.getString("Verified")));
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
	public int pendingCount() {
		int n = 0;
		
		try {
			conn = ConnectionFactory.getConnection();
			String query = "SELECT COUNT(*) as n FROM comment WHERE Verified = ?";
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
	public boolean updateStatus(int sNo) { 
		
		boolean flag = false;
		
		try {
			conn = ConnectionFactory.getConnection();
			String query = "update comment set Verified = ? where SNo = ?";
			PreparedStatement statement = conn.prepareStatement(query);
			statement.setString(1, "Verified");
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
	public ArrayList<CommentPojo> readCommentVerfied() {
		
		ArrayList<CommentPojo> list = new ArrayList<>();
		
		 try {
			conn = ConnectionFactory.getConnection();
			
			String query = "select* from comment where Verified = ?";  
			PreparedStatement statement = conn.prepareStatement(query);
			statement.setString(1, "Verified");
			ResultSet resultSet = statement.executeQuery();
			
			while(resultSet.next()) {
				list.add(new CommentPojo(resultSet.getInt("SNo"), resultSet.getString("Name"), resultSet.getString("Occupation"), resultSet.getString("Comment"), resultSet.getString("DateTime"), resultSet.getString("Image"), resultSet.getString("Verified")));
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
	public boolean deleteComment(int sNo) {
		boolean flag = false;
		
		try {
			conn = ConnectionFactory.getConnection();
			String query = "delete from comment where SNo = ?";
			PreparedStatement statement = conn.prepareStatement(query);
			statement.setInt(1, sNo);
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

}
