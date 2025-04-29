package tech.happy.dao;

import java.util.ArrayList;

import tech.happy.model.ServicePojo;

public interface ServiceDao {
	public String saveService(String iconname, String title, String descrition, String dateTime, String location);
	public ArrayList<ServicePojo> readService(String location);
	public ArrayList<ServicePojo> readFourService(String location);
	public String deleteService(int sno);
	public String updateService(int sno, String iconname, String title, String descrition, String dateTime);
	public ServicePojo getService(int sno);
}
