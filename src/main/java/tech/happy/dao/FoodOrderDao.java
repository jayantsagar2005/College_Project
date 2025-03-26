package tech.happy.dao;

import java.util.ArrayList;

import tech.happy.model.BookTablePojo;

public interface FoodOrderDao {
	public boolean saveData(BookTablePojo data);
	public int pendingOrder();
	public ArrayList<BookTablePojo> readData();
	public boolean updateStatus(int sNo);
	public boolean deleteOrder(int sNo);
}
