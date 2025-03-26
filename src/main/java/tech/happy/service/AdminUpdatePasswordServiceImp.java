package tech.happy.service;

import tech.happy.dao.AdminUpdatePasswordDaoImp;
import tech.happy.validation.AdminUpdatePasswordValidationImp;

public class AdminUpdatePasswordServiceImp implements AdminUpdatePasswordService {

	private static String result;
	@Override
	public String checkUserPass(String username, String password) {
		
		try {
			
			AdminUpdatePasswordDaoImp updatePassword = new AdminUpdatePasswordDaoImp();
			result = updatePassword.checkUserPass(username, password);
			
		}catch (Exception e) {
			
			e.printStackTrace(); 
			result = "Service Error";
			
		}
		
		return result;
	}
	@Override
	public String newPassword(String oldpassword, String newPassword) {
		
		try {
			
			AdminUpdatePasswordValidationImp passwordValidationImp = new AdminUpdatePasswordValidationImp();
			result = passwordValidationImp.newPasswordValidation(oldpassword, newPassword);
			
		}catch (Exception e) {
			e.printStackTrace();
			result = "Service Error";
		}
		
		
		return result;
	}
	
	@Override
	public String updatePassword(String username, String oldPassword, String newPassword) {
		
		try {
			
			AdminUpdatePasswordDaoImp updatePassword = new AdminUpdatePasswordDaoImp();
			result = updatePassword.updatePassword(username, oldPassword, newPassword);
			
			
		}catch (Exception e) {
			e.printStackTrace();
			result = "Service Error";
		}
		
		
		return result;
	}

}
