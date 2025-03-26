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
		}else if (fbLength < 2 || fbLength > 400) {
			result = "Invalid facebook url";
		}else if (twitterLength < 2 || twitterLength > 400) {
			result = "Invalid twitter url";
		}else if (instagramLength < 2 || instagramLength > 400) {
			result = "Invalid instagram url";
		}else {
			result = "Valid";
		}
		
		return result;
		
	}

}
