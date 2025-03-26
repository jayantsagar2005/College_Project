package tech.happy.model;

public class ItemPojo {
	
	private int itemNo;
	private String itemName;
	private String itemContentString;
	private int itemPrice;
	private String itemImage;
	private String dayTime;
	private String dateTime;
	
	public ItemPojo(int itemNo, String itemName, String itemContentString, int itemPrice, String itemImage, String dayTime,
			String dateTime) {
		super();
		this.itemNo = itemNo;
		this.itemName = itemName;
		this.itemContentString = itemContentString;
		this.itemPrice = itemPrice;
		this.itemImage = itemImage;
		this.dayTime = dayTime;
		this.dateTime = dateTime;
	}

	public ItemPojo(String itemName, String itemContentString, int itemPrice, String itemImage) {
		super();
		this.itemName = itemName;
		this.itemContentString = itemContentString;
		this.itemPrice = itemPrice;
		this.itemImage = itemImage;
	}
	
	

	public int getItemNo() {
		return itemNo;
	}

	public void setItemNo(int itemNo) {
		this.itemNo = itemNo;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getItemContentString() {
		return itemContentString;
	}

	public void setItemContentString(String itemContentString) {
		this.itemContentString = itemContentString;
	}

	public int getItemPrice() {
		return itemPrice;
	}

	public void setItemPrice(int itemPrice) {
		this.itemPrice = itemPrice;
	}

	public String getItemImage() {
		return itemImage;
	}

	public void setItemImage(String itemImage) {
		this.itemImage = itemImage;
	}

	public String getDayTime() {
		return dayTime;
	}

	public void setDayTime(String dayTime) {
		this.dayTime = dayTime;
	}

	public String getDateTime() {
		return dateTime;
	}

	public void setDateTime(String dateTime) {
		this.dateTime = dateTime;
	}
	
	

}
