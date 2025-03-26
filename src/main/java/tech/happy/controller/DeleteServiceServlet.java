package tech.happy.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tech.happy.service.ServiceModuleServiceImp;

import java.io.IOException;

@WebServlet("/DeleteServiceServlet")
public class DeleteServiceServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private static String result;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession httpSession = request.getSession();
		String snString = request.getParameter("sno");
		
		ServiceModuleServiceImp serviceImp = new ServiceModuleServiceImp();
		result = serviceImp.deleteService(snString);
		
		httpSession.setAttribute("msg", result);
		response.sendRedirect("ReadServiceServlet");
	}

}
