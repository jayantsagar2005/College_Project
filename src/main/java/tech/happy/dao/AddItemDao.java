package tech.happy.dao;

import java.util.ArrayList;

import tech.happy.model.ItemPojo;

public interface AddItemDao {
	public boolean addItem(String dayTime, String itemName, String itemContent, int itemPrice, String itemImage, String dateTime, String location);
	
	public ArrayList<ItemPojo> getItem(String time, String location);
	
	public ArrayList<ItemPojo> getItemTen(String time, String location);
	
	public ArrayList<ItemPojo> getItem(String location);
	
	public String deleteItem(int itemNo);
	
	public ItemPojo getData(int itemNo);
	
	public boolean updateItem(String dayTime, String itemName, String itemContent, int itemPrice, String itemImge, int itemNo);
	
}
