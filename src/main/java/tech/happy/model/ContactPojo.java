package tech.happy.model;

public class ContactPojo {
	private int sno;
	private String name;
	private String gmail;
	private String subject;
	private String message;
	private String dateTime;
	private String seen;
	
	public ContactPojo(int sno, String name, String gmail, String subject, String message, String dateTime,
			String seen) {
		super();
		this.sno = sno;
		this.name = name;
		this.gmail = gmail;
		this.subject = subject;
		this.message = message;
		this.dateTime = dateTime;
		this.seen = seen;
	}

	public ContactPojo(int sno, String name, String gmail, String subject, String message, String dateTime) {
		super();
		this.sno = sno;
		this.name = name;
		this.gmail = gmail;
		this.subject = subject;
		this.message = message;
		this.dateTime = dateTime;
	}
	
	public int getSno() {
		return sno;
	}
	
	public void setSno(int sno) {
		this.sno = sno;
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
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getDateTime() {
		return dateTime;
	}
	public void setDateTime(String dateTime) {
		this.dateTime = dateTime;
	}
	
	public String getSeen() {
		return seen;
	}

	public void setSeen(String seen) {
		this.seen = seen;
	}

	@Override
	public String toString() {
		return "ContactPojo [sno=" + sno + ", name=" + name + ", gmail=" + gmail + ", subject=" + subject + ", message="
				+ message + ", dateTime=" + dateTime + "]";
	}
	
	
	
}
