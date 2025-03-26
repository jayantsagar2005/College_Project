package tech.happy.service;

import tech.happy.model.BookTablePojo;

public interface FoodOrderService {
	public String validData(BookTablePojo data);
	public boolean savaData(BookTablePojo data);
}
