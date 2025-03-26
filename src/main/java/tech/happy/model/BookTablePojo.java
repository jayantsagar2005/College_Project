package tech.happy.model;

public class BookTablePojo {
	private int sNo;
	private String name;
	private String gmail;
	private int peopleNo;
	private String food;
	private String dateTime;
	private String status;
	
	public BookTablePojo(int sNo, String name, String gmail, int peopleNo, String food, String dateTime,
			String status) {
		super();
		this.sNo = sNo;
		this.name = name;
		this.gmail = gmail;
		this.peopleNo = peopleNo;
		this.food = food;
		this.dateTime = dateTime;
		this.status = status;
	}

	public BookTablePojo(String name, String gmail, int peopleNo, String food, String dateTime, String status) {
		super();
		this.name = name;
		this.gmail = gmail;
		this.peopleNo = peopleNo;
		this.food = food;
		this.dateTime = dateTime;
		this.status = status;
	}

	public BookTablePojo(String name, String gmail, int peopleNo, String food, String dateTime) {
		super();
		this.name = name;
		this.gmail = gmail;
		this.peopleNo = peopleNo;
		this.food = food;
		this.dateTime = dateTime;
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

	public int getPeopleNo() {
		return peopleNo;
	}

	public void setPeopleNo(int peopleNo) {
		this.peopleNo = peopleNo; 
	}

	public String getFood() {
		return food;
	}

	public void setFood(String food) {
		this.food = food;
	}

	public String getDateTime() {
		return dateTime;
	}

	public void setDateTime(String dateTime) {
		this.dateTime = dateTime;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	
}
