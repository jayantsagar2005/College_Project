package tech.happy.service;

public interface AddItemService {
	public String isValidItem(String dayTime, String itemName, String itemContent, int itemPrice, String itemImge);
	public boolean addItem(String dayTime, String itemName, String itemContent, int itemPrice, String itemImge);
	public String deleteItem(String itemNo);
	public boolean updateItem(String dayTime, String itemName, String itemContent, int itemPrice, String itemImge, int itemNo);
}
