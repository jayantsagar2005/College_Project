package tech.happy.service;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

import tech.happy.dao.CommentDaoImp;
import tech.happy.model.CommentPojo;
import tech.happy.validation.CommentValidationImp;

public class CommentServiceImp implements CommentService {
	
	String result = "";

	@Override
	public String validData(CommentPojo data) {
		try {
			CommentValidationImp commentValidationImp = new CommentValidationImp();
			result = commentValidationImp.validComment(data);
		}catch (Exception e) {
			e.printStackTrace();
			result = "Server Error";
		}
		return result;
	}

	@Override
	public boolean addComment(CommentPojo data) {
		
		boolean flag = false;
		
		try {
			
			String date = LocalDate.now().toString();
			LocalTime now = LocalTime.now();
	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm:ss");
	        String time = now.format(formatter);
	        
	        String dateTime = date+" "+time;
	        
	        data.setDateTime(dateTime);  
	        
	        CommentDaoImp commentDaoImp = new CommentDaoImp();
	        flag = commentDaoImp.addComment(data);
			
		}catch (Exception e) {
			e.printStackTrace();
			
		}
		return flag;
	}

}
