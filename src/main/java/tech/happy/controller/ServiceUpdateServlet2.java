package tech.happy.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tech.happy.service.ServiceModuleServiceImp;

import java.io.IOException;

@WebServlet("/ServiceUpdateServlet2")
public class ServiceUpdateServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String result;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession httpSession = request.getSession();
		
		try {
			
			
			String sno = request.getParameter("sn");
			String icon = request.getParameter("icon"); 
			String title = request.getParameter("title");
			String description = request.getParameter("description");

			ServiceModuleServiceImp serviceImp = new ServiceModuleServiceImp();
			result = serviceImp.updateService(sno, icon, title, description);  
			
			httpSession.setAttribute("msg", result);
			response.sendRedirect("ReadServiceServlet");
			
		
		} catch (Exception e) {
			result = "Service Error!";
			e.printStackTrace();
		}
	}

}
