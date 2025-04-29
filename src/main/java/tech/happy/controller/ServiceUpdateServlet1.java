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

@WebServlet("/ServiceUpdateServlet1")
public class ServiceUpdateServlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String result;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession httpSession = request.getSession();
		
		try {
			
			int index = Integer.parseInt(request.getParameter("sn"));
			httpSession.setAttribute("sn", index);
			
			String icon = request.getParameter("iconname");
			String title = request.getParameter("title");
			String description = request.getParameter("description");
			
			ServiceModuleServiceImp serviceImp = new ServiceModuleServiceImp();
			result = serviceImp.validationService(icon, title, description);
			
			
			if(result.equals("Valid")) {
				
				RequestDispatcher requestDispatcher =  request.getRequestDispatcher("ServiceUpdateServlet2");
				requestDispatcher.forward(request, response);
				
			}else {
				httpSession.setAttribute("msg", result);
				response.sendRedirect("updateservice.jsp");
			}
			
		} catch (Exception e) {
			result = "Service Error!";
			e.printStackTrace();
		}
		
		
	}

}
