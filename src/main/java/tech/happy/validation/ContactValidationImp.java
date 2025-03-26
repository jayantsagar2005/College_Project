package tech.happy.validation;

public class ContactValidationImp implements ContactValidation {

	private String result;
	@Override
	public String contactValidation(String name, String email, String subject, String message) {
		
		try {
			int nameLength = name.length();
			int emailLength = email.length();
			int subjectLength = subject.length();
			int messageLength = message.length();
			
			if (nameLength < 2 || nameLength > 30) {
				result = "Invalid name length";
			}
			else if (emailLength < 10 || emailLength > 50 || !email.endsWith(".com")) {
				result = "Invalid email";
			}
			else if (subjectLength < 10 || subjectLength > 70) {
				result = "Invalid subject";
			}
			else if(messageLength < 10 || messageLength > 500) {
				result = "Invalid message";
			}
			else {
				result = "Valid";
			}	
		} catch (Exception e) {
			result = "Something went wrong";
			e.printStackTrace();
		}
		
		return result;
	}

}
