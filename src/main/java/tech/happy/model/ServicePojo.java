package tech.happy.model;

public class ServicePojo {
	private int sno;
	private String iconName;
	private String title;
	private String description;
	private String date; 
	
	public ServicePojo(int sno, String iconName, String title, String description, String date) {
		super();
		this.sno = sno;
		this.iconName = iconName;
		this.title = title;
		this.description = description;
		this.date = date;
	}
	
	
	
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	
	public String getIconName() {
		return iconName;
	}
	public void setIconName(String iconName) {
		this.iconName = iconName;
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}

	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
	
	@Override
	public String toString() {
		return "ServicePojo [sno=" + sno + ", iconName=" + iconName + ", title=" + title + ", description="
				+ description + ", date=" + date + "]";
	}
	
}
