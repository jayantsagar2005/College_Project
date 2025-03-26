package tech.happy.model;

public class Admin {
	
	private String username;
	private int otp;
	private String password;
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getOtp() {
		return otp;
	}
	public void setOtp(int otp) {
		this.otp = otp;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public Admin(String username, int otp, String password) {
		super();
		this.username = username;
		this.otp = otp;
		this.password = password;
	}
	
	
}
