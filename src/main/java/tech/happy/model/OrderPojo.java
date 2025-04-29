package tech.happy.model;

public class OrderPojo {
	private int sNo;
	private String name;
	private String gmail;
	private int tableNo;
	private String dateTime;
	private String items;
	private int amount;
	private String payStatus;
	private String status;
	
	public OrderPojo(int sNo, String name, String gmail, int tableNo, String dateTime, String items, int amount,
			String payStatus, String status) {
		super();
		this.sNo = sNo;
		this.name = name;
		this.gmail = gmail;
		this.tableNo = tableNo;
		this.dateTime = dateTime;
		this.items = items;
		this.amount = amount;
		this.payStatus = payStatus;
		this.status = status;
	}
	
	public OrderPojo(String name, String gmail, int tableNo, String dateTime, String items, int amount,
			String payStatus, String status) {
		super();
		this.name = name;
		this.gmail = gmail;
		this.tableNo = tableNo;
		this.dateTime = dateTime;
		this.items = items;
		this.amount = amount;
		this.payStatus = payStatus;
		this.status = status;
	}

	public int getsNo() {
		return sNo;
	}

	public void setsNo(int sNo) {
		this.sNo = sNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGmail() {
		return gmail;
	}

	public void setGmail(String gmail) {
		this.gmail = gmail;
	}

	public int getTableNo() {
		return tableNo;
	}

	public void setTableNo(int tableNo) {
		this.tableNo = tableNo;
	}

	public String getDateTime() {
		return dateTime;
	}

	public void setDateTime(String dateTime) {
		this.dateTime = dateTime;
	}

	public String getItems() {
		return items;
	}

	public void setItems(String items) {
		this.items = items;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getPayStatus() {
		return payStatus;
	}

	public void setPayStatus(String payStatus) {
		this.payStatus = payStatus;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	
}
