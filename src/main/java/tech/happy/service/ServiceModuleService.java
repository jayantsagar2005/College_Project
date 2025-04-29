package tech.happy.service;

import java.util.ArrayList;

import tech.happy.model.ServicePojo;

public interface ServiceModuleService {
	public String validationService(String iconname, String title, String descrition);
	public String addService(String iconname, String title, String descrition, String location);
	public ArrayList<ServicePojo> readService(String location);
	public ArrayList<ServicePojo> readFourService(String location);
	public String deleteService(String sno);
	public String updateService(String sno, String iconname, String title, String descrition);
}
