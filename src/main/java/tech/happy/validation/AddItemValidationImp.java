package tech.happy.validation;

public class AddItemValidationImp implements AddItemValidation {

	@Override
	public String isValidItem(String dayTime, String itemName, String itemContent, int itemPrice, String itemImage) {
		String result;
		
		int itemNameLength = itemName.length();
		int itemContentLength = itemContent.length();
		
		if(itemNameLength < 2 || itemNameLength > 70) {
			result = "Item name is not valid!";
		}else if (itemContentLength < 5 || itemContentLength > 100) {
			result = "Item content is not valid!";
		}else {
			result = "Valid";
		}
		
		return result;  
	}

}
