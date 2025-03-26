package tech.happy.validation;

import tech.happy.model.BookTablePojo;

public class FoodOrderValidationImp implements FoodOrderValidation {

	@Override
	public String validData(BookTablePojo data) {
		
		String result = null;
		
		try {
			
			int nameLength = data.getName().trim().length();
			int gmailLength = data.getGmail().trim().length();
			int foodLength = data.getFood().trim().length();
			
			if(nameLength < 2 || nameLength > 100) {
				result = "Invalid Name!";
			}else if (gmailLength < 12 || nameLength > 120) {
				result = "Invalid Gmail!";
			}else if (foodLength < 2 || foodLength > 500) {
				result = "Invalid Order Request!";
			}else {
				result = "Valid";
			}
			
			
		}catch (Exception e) {
			result = "Data not valid";
			e.printStackTrace();
		}
		
		return result;
	}

}
