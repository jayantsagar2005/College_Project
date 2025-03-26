package tech.happy.dao;

import java.util.ArrayList;

import tech.happy.model.ServicePojo;

public interface ServiceDao {
	public String saveService(String iconname, String title, String descrition, String dateTime);
	public ArrayList<ServicePojo> readService();
	public ArrayList<ServicePojo> readFourService();
	public String deleteService(int sno);
	public String updateService(int sno, String iconname, String title, String descrition, String dateTime);
}
