package tech.happy.service;

import tech.happy.model.TeamPojo;

public interface TeamService {
	public String validData(TeamPojo data);
	public boolean addMember(TeamPojo data);
	public boolean deleteMember(String sNo);
	public boolean updateMember(TeamPojo data);
}
