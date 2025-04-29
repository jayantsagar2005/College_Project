package tech.happy.validation;

import tech.happy.model.TeamPojo;

public class TeamValidationImp implements TeamValidation{

	@Override
	public String validData(TeamPojo data) {
		
		String result = null;
		
		int nameLength = data.getMemberName().length();
		int fbLength = data.getFacebook().length();
		int twitterLength = data.getTwitter().length();
		int instagramLength = data.getInstagram().length(); 
				
		if(nameLength < 2 || nameLength > 150) {
			result = "Invalid name";
		}else if (fbLength > 400 || !data.getFacebook().startsWith("https://www.linkedin.com/")) {
			result = "Invalid linkedin url";
		}else if (twitterLength > 400 || !data.getTwitter().startsWith("https://www.twitter.com/")) {
			result = "Invalid twitter url";
		}else if (instagramLength > 400 || !data.getInstagram().startsWith("https://www.instagram.com/")) {
			result = "Invalid instagram url";
		}else {
			result = "Valid";
		}
		
		return result;
		
	}

}
