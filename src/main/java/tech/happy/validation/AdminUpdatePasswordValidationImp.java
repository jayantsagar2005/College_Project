package tech.happy.validation;

public class AdminUpdatePasswordValidationImp implements AdminUpdatePasswordValidation {

	private static String result;
	@Override
	public String newPasswordValidation(String oldpassword, String newPassword) {
		
		try {
			
			int passwordLength = newPassword.length();
			
			if(passwordLength < 6 || passwordLength > 16) {
				result = "Invalid password";
			}else if (oldpassword.equals(newPassword)) {
				result = "New Password are equals to old Password";
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
