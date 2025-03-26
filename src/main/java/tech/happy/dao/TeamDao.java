package tech.happy.dao;

import java.util.ArrayList;

import tech.happy.model.TeamPojo;
 
public interface TeamDao {
	public boolean addMember(TeamPojo team); 
	public ArrayList<TeamPojo> fourMember();
	public ArrayList<TeamPojo> getMember();
	public boolean deleteMember(int sNo);
	public TeamPojo getMember(int sNo);
	public boolean updateMember(TeamPojo data);
}
