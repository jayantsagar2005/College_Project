package tech.happy.service;

public interface AdminUpdatePasswordService {
	public String checkUserPass(String username, String password);
	public String newPassword(String oldPassword, String newPassword);
	public String updatePassword(String username, String oldPassword, String newPassword);
}
