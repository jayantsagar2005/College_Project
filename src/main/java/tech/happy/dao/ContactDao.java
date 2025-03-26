package tech.happy.dao;

import java.util.ArrayList;

import tech.happy.model.ContactPojo;

public interface ContactDao {
	public String saveContact(String name, String email, String subject, String message, String dateTime);
	public ArrayList<ContactPojo> readContact();
	public String deleteContact(int sno);
	public boolean updateMessage(int sNo);
	public int unreadCount();
} 
