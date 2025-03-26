package tech.happy.model;

public class CommentPojo {
	
	int sNo;
	String name;
	String occupation;
	String comment;
	String dateTime;
	String image;
	String status;
	
	public CommentPojo(){
		
	}


	public CommentPojo(int sNo, String name, String occupation, String comment, String dateTime, String image,
			String status) {
		super();
		this.sNo = sNo;
		this.name = name;
		this.occupation = occupation;
		this.comment = comment;
		this.dateTime = dateTime;
		this.image = image;
		this.status = status;
	}



	public CommentPojo(String name, String occupation, String comment, String image) {
		super();
		this.name = name;
		this.occupation = occupation;
		this.comment = comment;
		this.image = image;
	}

	public CommentPojo(int sNo, String name, String occupation, String comment, String dateTime, String image) {
		super();
		this.sNo = sNo;
		this.name = name;
		this.occupation = occupation;
		this.comment = comment;
		this.dateTime = dateTime;
		this.image = image;
	}

	public int getsNo() {
		return sNo;
	}


	public void setsNo(int sNo) {
		this.sNo = sNo;
	}


	public String getOccupation() {
		return occupation;
	}


	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getComment() {
		return comment;
	}


	public void setComment(String comment) {
		this.comment = comment;
	}


	public String getDateTime() {
		return dateTime;
	}


	public void setDateTime(String dateTime) {
		this.dateTime = dateTime;
	}


	public String getImage() {
		return image;
	}


	public void setImage(String image) {
		this.image = image;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	
	

}
