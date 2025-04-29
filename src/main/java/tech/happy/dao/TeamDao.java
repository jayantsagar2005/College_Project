package tech.happy.dao;

import java.util.ArrayList;

import tech.happy.model.TeamPojo;
 
public interface TeamDao {
	public boolean addMember(TeamPojo team, String location); 
	public ArrayList<TeamPojo> fourMember(String location);
	public ArrayList<TeamPojo> getMember(String location);
	public boolean deleteMember(int sNo);
	public TeamPojo getMember(int sNo);
	public boolean updateMember(TeamPojo data);
}
