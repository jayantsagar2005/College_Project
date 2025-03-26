package tech.happy.service;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;


import tech.happy.dao.ServiceDaoImp;
import tech.happy.model.ServicePojo;
import tech.happy.validation.ServiceModuleValidationImp;

public class ServiceModuleServiceImp implements ServiceModuleService {

	private static String result;
	
	@Override
	public String validationService(String iconname, String title, String descrition) {
		
		try {
			ServiceModuleValidationImp serviceModuleValidationImp = new ServiceModuleValidationImp();
			result = serviceModuleValidationImp.serviceDataValidation(iconname, title, descrition);
			
		}catch (Exception e) {
			result = "Service Error";
			e.printStackTrace(); 
		}
		
		
		return result;
	}
	
	@Override
	public String addService(String iconname, String title, String descrition) {
		
		try {
			String date = LocalDate.now().toString();
			LocalTime now = LocalTime.now();
	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm:ss");
	        String time = now.format(formatter); 
			
			ServiceDaoImp serviceDaoImp = new ServiceDaoImp();
			result = serviceDaoImp.saveService(iconname, title, descrition, date+" "+time); 
			return result;
			
		}catch (Exception e) {
			result = "Service Error";
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public ArrayList<ServicePojo> readService() {
		
		ArrayList<ServicePojo> list = null;
		
		try {
			ServiceDaoImp serviceDaoImp = new ServiceDaoImp();
			list = serviceDaoImp.readService();  
			return list;
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return list; 
	}

	@Override
	public ArrayList<ServicePojo> readFourService() {
		ArrayList<ServicePojo> list = null;
		 
		try {
			ServiceDaoImp serviceDaoImp = new ServiceDaoImp();
			list = serviceDaoImp.readFourService();   
			return list;
			
		}catch (Exception e) {
			e.printStackTrace();
		} 	
		
		return list;
	}

	@Override
	public String deleteService(String sn) {
		try {
			
			int sno = Integer.parseInt(sn);
			ServiceDaoImp serviceDaoImp = new ServiceDaoImp();
			result = serviceDaoImp.deleteService(sno);
			
		}catch (Exception e) {
			
			result = "Service Error!";
			e.printStackTrace();
			
		}
		return result;
	}

	@Override
	public String updateService(String sno, String iconname, String title, String descrition) {
		
		try {
			
			int sn = Integer.parseInt(sno);
			
			String date = LocalDate.now().toString(); 
			LocalTime now = LocalTime.now();
	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm:ss");
	        String time = now.format(formatter); 
			
			ServiceDaoImp serviceDaoImp = new ServiceDaoImp();
			
			result = serviceDaoImp.updateService(sn, iconname, title, descrition, date+" "+time); 
			
			return result;
			
		}catch (Exception e) {
			result = "Service Error";
			e.printStackTrace();
		}
		
		return result;
	
	}

}
