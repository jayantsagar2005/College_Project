package tech.happy.service;

import tech.happy.dao.AdminLoginDaoImp;
import tech.happy.validation.AdminLoginValidationImp;

public class AdminLoginServiceImp implements AdminLoginService {

	private static String result;
	@Override
	public String adminLoginService1(String username, String password) {
		
		try {
			AdminLoginValidationImp adminLoginValidationImp = new AdminLoginValidationImp();
			result = adminLoginValidationImp.adminLoginValidation(username, password);
				
		}catch (Exception e) {
			result = "Service Error";
			e.printStackTrace();
		}
		
		return result;
	}
	
	@Override	
	public String adminLoginService2(String username, String password) {
		
		try {
			AdminLoginDaoImp adminLoginDaoImp = new AdminLoginDaoImp();
			result = adminLoginDaoImp.checkAdminLoginData(username, password);
			
		}catch (Exception e) {
			result = "Service Error";
			e.printStackTrace();
		}
		
		return result;
	}
}
