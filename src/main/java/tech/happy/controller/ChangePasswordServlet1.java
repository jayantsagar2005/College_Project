package tech.happy.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tech.happy.service.AdminUpdatePasswordServiceImp;

import java.io.IOException;

@WebServlet("/ChangePasswordServlet1")
public class ChangePasswordServlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		try {
			
			String username = request.getParameter("username");
			String oldPassword = request.getParameter("oldpassword");
			String newPassword = request.getParameter("newpassword"); 
			
			AdminUpdatePasswordServiceImp updatePassword = new AdminUpdatePasswordServiceImp();
			String result = updatePassword.checkUserPass(username, oldPassword);
			
			
			if(result.contains("Exits")) {
				
				String validation = updatePassword.newPassword(oldPassword, newPassword);
				
				if(validation.equals("Valid")) {
					
					RequestDispatcher requestDispatcher =  request.getRequestDispatcher("ChangePasswordServlet2");
					requestDispatcher.forward(request, response);
					
				}else {
					session.setAttribute("msg", validation);
					response.sendRedirect("changepassword.jsp");
				}
				
			}else {
				session.setAttribute("msg", "Username or Password not match!");
				response.sendRedirect("changepassword.jsp");
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}

}
