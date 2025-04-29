package tech.happy.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import tech.happy.model.TeamPojo;


public class TeamDaoImp implements TeamDao{

	private Connection conn;
	
	@Override
	public boolean addMember(TeamPojo team, String location) {
		boolean result = false;
		
		try {
			
			conn = ConnectionFactory.getConnection();
						
			String query = "insert into team(MemberName, MemberDesignation, MemberImage, Facebook, Twitter, Instagram, DateTime, Location) values (?, ?, ?, ?, ?, ?, ?, ?)"; 
			PreparedStatement statement = conn.prepareStatement(query);
			statement.setString(1, team.getMemberName());
			statement.setString(2, team.getMemberDesignation());
			statement.setString(3, team.getMemberImage());
			statement.setString(4, team.getFacebook());
			statement.setString(5, team.getTwitter());
			statement.setString(6, team.getInstagram());
			statement.setString(7, team.getDateTime());
			statement.setString(8, location);
						
			int rowAffected = statement.executeUpdate();
			
			if(rowAffected > 0) {
				result = true;
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
		
		return result;
	}

	
	@Override 
	public ArrayList<TeamPojo> fourMember(String location) {
		
		ArrayList<TeamPojo> list = new ArrayList<TeamPojo>(); 
		
		try {
			conn = ConnectionFactory.getConnection();
			
			String query = "select* from team where Location = ?";
			
			PreparedStatement statement = conn.prepareStatement(query);
			statement.setString(1, location);			
			ResultSet resultSet = statement.executeQuery();
			
			int i = 0;
			while(resultSet.next()) {
				if(i==4) break;
				i++;
				list.add(new TeamPojo(resultSet.getInt("SNo"), resultSet.getString("MemberName"), resultSet.getString("MemberDesignation"), resultSet.getString("MemberImage"), resultSet.getString("Facebook"), resultSet.getString("Twitter"), resultSet.getString("Instagram"), resultSet.getString("DateTime")));
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


	@Override
	public ArrayList<TeamPojo> getMember(String location) {
		
		ArrayList<TeamPojo> list = new ArrayList<TeamPojo>();  
		
		try {
			conn = ConnectionFactory.getConnection();
			
			String query = "select* from team where Location = ?";
			
			PreparedStatement statement = conn.prepareStatement(query);
			statement.setString(1, location); 
			
			ResultSet resultSet = statement.executeQuery();
			
			
			while(resultSet.next()) {
				list.add(new TeamPojo(resultSet.getInt("SNo"), resultSet.getString("MemberName"), resultSet.getString("MemberDesignation"), resultSet.getString("MemberImage"), resultSet.getString("Facebook"), resultSet.getString("Twitter"), resultSet.getString("Instagram"), resultSet.getString("DateTime")));
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


	@Override
	public boolean deleteMember(int sNo) {
		boolean flag = false;
		
		try {
			
			conn = ConnectionFactory.getConnection();
			String query = "delete from team where SNo = ?";
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
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
			
		return flag;
	}


	@Override
	public TeamPojo getMember(int sNo) {
		
		TeamPojo data = null;
		
		try {
			
			conn = ConnectionFactory.getConnection();
			String query = "select* from team where SNo = ?";
			
			PreparedStatement statement = conn.prepareStatement(query);
			statement.setInt(1, sNo);
			
			ResultSet resultSet = statement.executeQuery();
			
			if(resultSet.next()) {
				data = new TeamPojo(resultSet.getInt("SNo"), resultSet.getString("MemberName"), resultSet.getString("MemberDesignation"), resultSet.getString("MemberImage"), resultSet.getString("Facebook"), resultSet.getString("Twitter"), resultSet.getString("Instagram"), resultSet.getString("DateTime"));
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			try {
				if(conn != null) {
					conn.close();
				}
			}catch (Exception e1) {
				e1.printStackTrace();
			}
		}
		
		return data;
	}


	@Override
	public boolean updateMember(TeamPojo data) {
		boolean flag = false;
		
		try {		
			conn = ConnectionFactory.getConnection();
			
			if(data.getMemberImage().isEmpty() || data.getMemberImage() == null) {
				
				String query = "update team set MemberName = ?, MemberDesignation = ?, Facebook = ?, Twitter = ?, Instagram = ? where SNo = ?";
				PreparedStatement statement = conn.prepareStatement(query);
				statement.setString(1, data.getMemberName());
				statement.setString(2, data.getMemberDesignation());
				statement.setString(3, data.getFacebook());
				statement.setString(4, data.getTwitter());
				statement.setString(5, data.getInstagram());
				statement.setInt(6, data.getsNo());
				
				int rowAfected = statement.executeUpdate();
				
				if(rowAfected > 0) flag = true;
			
			}else {
				String query = "update team set MemberName = ?, MemberDesignation = ?, MemberImage = ?, Facebook = ?, Twitter = ?, Instagram = ? where SNo = ?";
				PreparedStatement statement = conn.prepareStatement(query);
				statement.setString(1, data.getMemberName());
				statement.setString(2, data.getMemberDesignation());
				statement.setString(3, data.getMemberImage());
				statement.setString(4, data.getFacebook());
				statement.setString(5, data.getTwitter());
				statement.setString(6, data.getInstagram());
				statement.setInt(7, data.getsNo());	
				
				int rowAfected = statement.executeUpdate();
				
				if(rowAfected > 0) flag = true;
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
