package tech.happy.validation;

import tech.happy.model.CommentPojo;

public class CommentValidationImp implements CommentValidation {

	@Override
	public String validComment(CommentPojo commentPojo) {
		String result = "";
		
		int nameLength = commentPojo.getName().trim().length();
		int commentLength = commentPojo.getComment().trim().length();
		int imageLength = commentPojo.getImage().length();
		
		if(commentPojo.getOccupation().equals("select")) {
			result = "Occupation is not selected";
		}else if(nameLength < 2 || nameLength > 100) {
			result = "Name length not valid!";
		}else if (commentLength < 50 || commentLength > 200) {
			result = "Comment length not valid";
		}else if (imageLength > 500) {
			result = "Image size is big!";
		}else {
			result = "Valid";
		}	
		
		return result;
	}

}
