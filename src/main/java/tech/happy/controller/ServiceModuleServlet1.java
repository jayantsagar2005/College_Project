package tech.happy.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tech.happy.service.ServiceModuleServiceImp;

import java.io.IOException;

@WebServlet("/ServiceModuleServlet1")
public class ServiceModuleServlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String result;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String iconname = request.getParameter("iconname");
		String title = request.getParameter("title");
		String description = request.getParameter("description");
		
		HttpSession httpSession = request.getSession();
			
		try {
			
			ServiceModuleServiceImp serviceImp = new ServiceModuleServiceImp();
			result = serviceImp.validationService(iconname, title, description);
			
			if(result.equals("Valid")) {
				
				RequestDispatcher requestDispatcher =  request.getRequestDispatcher("ServiceModuleServlet2");
				requestDispatcher.forward(request, response);
				
			}else {
				httpSession.setAttribute("msg", result);
				response.sendRedirect("addservice.jsp");
			}
			 
		}catch (Exception e) {
			result = "Service Error!";
			e.printStackTrace();
		}
		 
		
	}

}
