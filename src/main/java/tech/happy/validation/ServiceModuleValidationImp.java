package tech.happy.validation;

public class ServiceModuleValidationImp implements ServiceModuleValidation {

	private static String result;
	@Override
	public String serviceDataValidation(String iconname, String title, String descrition) {
		
		try {
			
			int iconlength = iconname.length();
			int titlelength = title.length(); 
			int descriptionlength = descrition.length();
			
			if(iconlength < 4 || iconlength > 30) {
				result = "Invalid Icon Name!";
			}else if(titlelength < 4 || titlelength > 18) {
				result = "Invalid Title!";
			}else if (descriptionlength < 50 || descriptionlength > 100) {
				result = "Invalid Description!";
			}else {
				result = "Valid"; 
			}			
			
		}catch (Exception e) {
			result = "Something Went Wrong";
			e.printStackTrace();
		}
		return result;
	}

}
