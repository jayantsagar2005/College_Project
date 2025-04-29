package tech.happy.model;

public class AdminData {
	private int adminId;
	private String username;
	private String gmail;
	private String location;
	private String image;
	
	public AdminData(int adminId, String username, String gmail, String location, String image) {
		super();
		this.adminId = adminId;
		this.username = username;
		this.gmail = gmail;
		this.location = location;
		this.image = image;
	}

	public int getAdminId() {
		return adminId;
	}

	public void setAdminId(int adminId) {
		this.adminId = adminId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getGmail() {
		return gmail;
	}

	public void setGmail(String gmail) {
		this.gmail = gmail;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
	
	
	
}
