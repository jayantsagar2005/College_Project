package tech.happy.model;

public class TeamPojo {
	private int sNo;
	private String memberName;
	private String memberDesignation;
	private String memberImage;
	private String facebook;
	private String twitter;
	private String instagram;
	private String dateTime;
	
	
	
	public TeamPojo(int sNo, String memberName, String memberDesignation, String memberImage, String facebook,
			String twitter, String instagram) {
		super();
		this.sNo = sNo;
		this.memberName = memberName;
		this.memberDesignation = memberDesignation;
		this.memberImage = memberImage;
		this.facebook = facebook;
		this.twitter = twitter;
		this.instagram = instagram;
	}

	public TeamPojo(int sNo, String memberName, String memberDesignation, String memberImage, String facebook,
			String twitter, String instagram, String dateTime) {
		super();
		this.sNo = sNo;
		this.memberName = memberName;
		this.memberDesignation = memberDesignation;
		this.memberImage = memberImage;
		this.facebook = facebook;
		this.twitter = twitter;
		this.instagram = instagram;
		this.dateTime = dateTime;
	}

	public TeamPojo(String memberName, String memberDesignation, String memberImage, String facebook, String twitter,
			String instagram) {
		super();
		this.memberName = memberName;
		this.memberDesignation = memberDesignation;
		this.memberImage = memberImage;
		this.facebook = facebook;
		this.twitter = twitter;
		this.instagram = instagram;
	}

	public TeamPojo(String memberName, String memberDesignation, String memberImage, String facebook, String twitter,
			String instagram, String dateTime) {
		super();
		this.memberName = memberName;
		this.memberDesignation = memberDesignation;
		this.memberImage = memberImage;
		this.facebook = facebook;
		this.twitter = twitter;
		this.instagram = instagram;
		this.dateTime = dateTime;
	}

	public int getsNo() {
		return sNo;
	}

	public void setsNo(int sNo) {
		this.sNo = sNo;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberDesignation() {
		return memberDesignation;
	}

	public void setMemberDesignation(String memberDesignation) {
		this.memberDesignation = memberDesignation;
	}

	public String getMemberImage() {
		return memberImage;
	}

	public void setMemberImage(String memberImage) {
		this.memberImage = memberImage;
	}

	public String getFacebook() {
		return facebook;
	}

	public void setFacebook(String facebook) {
		this.facebook = facebook;
	}

	public String getTwitter() {
		return twitter;
	}

	public void setTwitter(String twitter) {
		this.twitter = twitter;
	}

	public String getInstagram() {
		return instagram;
	}

	public void setInstagram(String instagram) {
		this.instagram = instagram;
	}

	public String getDateTime() {
		return dateTime;
	}

	public void setDateTime(String dateTime) {
		this.dateTime = dateTime;
	}
	
	
}
