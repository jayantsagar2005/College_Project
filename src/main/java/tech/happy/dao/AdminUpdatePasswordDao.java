package tech.happy.dao;

public interface AdminUpdatePasswordDao {
	public String checkUserPass(String username, String password);
	public String updatePassword(String username, String oldPassword, String newPassword);
}
 