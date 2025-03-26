package tech.happy.service;

import java.util.ArrayList;

import tech.happy.model.ServicePojo;

public interface ServiceModuleService {
	public String validationService(String iconname, String title, String descrition);
	public String addService(String iconname, String title, String descrition);
	public ArrayList<ServicePojo> readService();
	public ArrayList<ServicePojo> readFourService();
	public String deleteService(String sno);
	public String updateService(String sno, String iconname, String title, String descrition);
}
