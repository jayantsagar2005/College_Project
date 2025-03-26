package tech.happy.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tech.happy.service.AdminLoginServiceImp;

import java.io.IOException;

@WebServlet("/AdminLoginServlet1")
public class AdminLoginServlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String result;
	
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		String username = req.getParameter("username");
		String password = req.getParameter("password");
;
		AdminLoginServiceImp adminLoginServiceImp = new AdminLoginServiceImp();
		result =  adminLoginServiceImp.adminLoginService1(username, password); 
		
		if(result.equals("Valid")) {
			
			RequestDispatcher requestDispatcher =  req.getRequestDispatcher("AdminLoginServlet2");
			requestDispatcher.forward(req, resp);
			
		}else{
			session.setAttribute("msg", result);
			resp.sendRedirect("adminlogin.jsp");
		}
	}

}
