package tech.happy.service;

import java.util.ArrayList;

import tech.happy.model.ContactPojo;

public interface ContactService {
	
	public String contactService1(String name, String email, String subject, String message);
	public String contactService2(String name, String email, String subject, String message, String location);
	public ArrayList<ContactPojo> readContactService(String location); 
	public String deleteContact(String sno);


}
