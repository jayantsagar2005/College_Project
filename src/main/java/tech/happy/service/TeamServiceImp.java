package tech.happy.service;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

import tech.happy.dao.TeamDaoImp;
import tech.happy.model.TeamPojo;
import tech.happy.validation.TeamValidationImp;

public class TeamServiceImp implements TeamService{

	@Override
	public String validData(TeamPojo data) {
		String result = null; 
		
		try {
			TeamValidationImp teamValidationImp = new TeamValidationImp();
			result = teamValidationImp.validData(data);
		}catch (Exception e) {
			result = "Service error";
		}
		
		return result; 
	}

	@Override
	public boolean addMember(TeamPojo data) {
		boolean flag = false;
		
		try {
			String date = LocalDate.now().toString();
			LocalTime now = LocalTime.now();
	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm:ss");
	        String time = now.format(formatter);
	        
	        String dateTime = date+" "+time;
	        
	        data.setDateTime(dateTime);
	        
	        TeamDaoImp teamDaoImp = new TeamDaoImp();
	        flag = teamDaoImp.addMember(data);
	                
		}catch (Exception e) {
			e.printStackTrace();
		} 
		
		return flag;
	}

	@Override
	public boolean deleteMember(String sNo) {
		boolean flag = false;
		try {
			int no = Integer.parseInt(sNo);
			TeamDaoImp teamDaoImp = new TeamDaoImp();
			flag = teamDaoImp.deleteMember(no);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return flag;
	}

	@Override
	public boolean updateMember(TeamPojo data) {
		
		boolean flag = false;
		
		try {
			TeamDaoImp teamDaoImp = new TeamDaoImp();
			flag = teamDaoImp.updateMember(data); 
		}catch(Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

}
