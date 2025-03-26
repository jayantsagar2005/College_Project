package tech.happy.validation;


public class AdminLoginValidationImp implements AdminLoginValidation {
	
	private static String result;
	@Override
	public String adminLoginValidation(String username, String password) {
		
		try {
			int usernameLength = username.length();
			int passwordLength = password.length();
			
			if(usernameLength < 5 || usernameLength > 16) {
				result = "Invalid username";
			}else if (passwordLength < 6 || passwordLength > 16) {
				result = "Invalid password";
			}else {
				result = "Valid";
			}
		} catch (Exception e) {
			result = "Something went wrong";
			e.printStackTrace();
		}
		
		
		return result;
	}

}
