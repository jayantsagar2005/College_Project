package tech.happy.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tech.happy.service.AdminUpdatePasswordServiceImp;

import java.io.IOException;

@WebServlet("/ChangePasswordServlet2")
public class ChangePasswordServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String result; 

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		try {
			
			String username = request.getParameter("username");
			String oldPassword = request.getParameter("oldpassword");
			String newPassword = request.getParameter("newpassword");
			
			AdminUpdatePasswordServiceImp updatePassword = new AdminUpdatePasswordServiceImp();
			result = updatePassword.updatePassword(username, oldPassword, newPassword);
			
			if(result.contains("Successfully")) {
				
				session.setAttribute("msg", result);
				response.sendRedirect("adminlogin.jsp");
				
			}else {
				session.setAttribute("msg", result);
				response.sendRedirect("changepassword.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}

}
