package tech.happy.service;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import tech.happy.dao.ContactDaoImp;
import tech.happy.model.ContactPojo;
import tech.happy.validation.ContactValidationImp;

public class ContactServiceImp implements ContactService {

	private String result; 
	@Override
	public String contactService1(String name, String email, String subject, String message) {
		try {
			ContactValidationImp contactValidationImp = new ContactValidationImp();
			result = contactValidationImp.contactValidation(name, email, subject, message);
				 
			
		} catch (Exception e) {
			result = "Service Error";
			e.printStackTrace();
		}
		
		return result;
	}
	
	@Override
	public String contactService2(String name, String email, String subject, String message) {
		try {
			String date = LocalDate.now().toString();
			LocalTime now = LocalTime.now();
	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm:ss");
	        String time = now.format(formatter);
	        
			ContactDaoImp contactDaoImp = new ContactDaoImp();
			result = contactDaoImp.saveContact(name, email, subject, message, date+" "+time);
			
		} catch (Exception e) { 
			result = "Service Error";
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public ArrayList<ContactPojo> readContactService() {
		ArrayList<ContactPojo> list = null;
		try {
			ContactDaoImp contactDaoImp = new ContactDaoImp();
			list = contactDaoImp.readContact();
			return list; 
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public String deleteContact(String sn) {
		try {
			int sno = Integer.parseInt(sn);
			ContactDaoImp contactDaoImp = new ContactDaoImp();
			result = contactDaoImp.deleteContact(sno);
		}catch (Exception e) {
			result = "Service Error!";
			e.printStackTrace();
		}
		return result;
	}
	
	

}
