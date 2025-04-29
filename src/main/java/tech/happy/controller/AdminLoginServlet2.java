package tech.happy.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tech.happy.dao.AdminDataDao;
import tech.happy.dao.GetMailLocation;
import tech.happy.fileio.GenerateOTP;
import tech.happy.fileio.SendOTP; 
import tech.happy.model.Admin;
import tech.happy.service.AdminLoginServiceImp;

import java.io.IOException;

@WebServlet("/AdminLoginServlet2")
public class AdminLoginServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    private static String result;
    
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String location = (String) session.getAttribute("location");

		AdminLoginServiceImp adminLoginServiceImp = new AdminLoginServiceImp();
		result =  adminLoginServiceImp.adminLoginService2(username, password);
		
		AdminDataDao adminDataDao = new AdminDataDao();
		String gmail = adminDataDao.getMail(location);
		
		if(result.equals("Exits")) {
			int otp = GenerateOTP.generateRandomOTP();
			Admin admin = new Admin(username, otp, password);
			String subject = "OTP Verification for Admin Panel Access";
			String content = "Dear " + username + ",\n\n"
	                + "Your One-Time Password (OTP) for accessing the Admin Panel is: " + otp + "\n\n"
	                + "This OTP is valid for 10 minutes. Please do not share it with anyone for security reasons.\n\n"
	                + "If you did not request this, please ignore this email or contact support immediately.\n\n"
	                + "Best Regards,\n"
	                + "HAPPY' POINT\n"
	                + "happymail18062022@gmail.com";								
			
			SendOTP mail = new SendOTP();
	        boolean text =mail.sendEmail(username, content, subject, otp, gmail);
	        		
	        if(text){
	            session.setAttribute("adminlogin", admin);
	            resp.sendRedirect("verification.jsp");
	        }else{
	            String msg = "Gmail verification not send, try later!";
	            session.setAttribute("msg", msg);
	            resp.sendRedirect("adminlogin.jsp");
	        }
		
		}else {
			session.setAttribute("msg", "Not Exit");
			resp.sendRedirect("adminlogin.jsp");
		}
		
	} 

}
