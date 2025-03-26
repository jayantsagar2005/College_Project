package tech.happy.service;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

import tech.happy.dao.AddItemDaoImp;
import tech.happy.validation.AddItemValidationImp;

public class AddItemServiceImp implements AddItemService {
	
	private static String result;

	@Override
	public String isValidItem(String dayTime, String itemName, String itemContent, int itemPrice, String itemImge) {
		
		String result = null;
		
		try {
	        
	        AddItemValidationImp addItemValidationImp = new AddItemValidationImp();
	        result = addItemValidationImp.isValidItem(dayTime, itemName, itemContent, itemPrice, itemImge);
	        
		} catch (Exception e) {
			e.printStackTrace();
		}
		 
		return result;

	}

	@Override
	public boolean addItem(String dayTime, String itemName, String itemContent, int itemPrice, String itemImge) {
		
		boolean result = false;
		
		try {
			String date = LocalDate.now().toString();
			LocalTime now = LocalTime.now();
	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm:ss");
	        String time = now.format(formatter);
	        
	        String dateTime = date+" "+time;
	        
	        AddItemDaoImp addItemDaoImp = new AddItemDaoImp();
	        result = addItemDaoImp.addItem(dayTime, itemName, itemContent, itemPrice, itemImge, dateTime);
	        
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		return result;
	}

	@Override
	public String deleteItem(String itemNo) {
		try {
			
			int sno = Integer.parseInt(itemNo);
			AddItemDaoImp addItemDaoImp = new AddItemDaoImp();
			result = addItemDaoImp.deleteItem(sno);
			
		}catch (Exception e) {
			
			result = "Service Error!";
			e.printStackTrace();
			
		}
		return result;
	}

	@Override
	public boolean updateItem(String dayTime, String itemName, String itemContent, int itemPrice, String itemImge, int itemNo) {
		
		boolean result = false;
		
		try {
			AddItemDaoImp addItemDaoImp = new AddItemDaoImp();
			result = addItemDaoImp.updateItem(dayTime, itemName, itemContent, itemPrice, itemImge, itemNo);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

}
