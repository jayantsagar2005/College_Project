package tech.happy.service;

import tech.happy.dao.FoodOrderDaoImp;
import tech.happy.model.BookTablePojo;
import tech.happy.validation.FoodOrderValidationImp;

public class FoodOrderServiceImp implements FoodOrderService {

	@Override
	public String validData(BookTablePojo data) {
		String result = null;
		
		try {
			
			 FoodOrderValidationImp foodOrderValidationImp = new FoodOrderValidationImp();
			 result = foodOrderValidationImp.validData(data);
			 
		}catch (Exception e) {
			e.printStackTrace();
			result = "Service error. Try again";
		}
		
		return result;
	}

	@Override
	public boolean savaData(BookTablePojo data) {
		boolean flag = false;
		try {
			FoodOrderDaoImp foodOrderDaoImp = new FoodOrderDaoImp();
			flag = foodOrderDaoImp.saveData(data);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

}
