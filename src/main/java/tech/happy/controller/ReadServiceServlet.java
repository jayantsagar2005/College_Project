package tech.happy.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tech.happy.model.ServicePojo;
import tech.happy.service.ServiceModuleServiceImp;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/ReadServiceServlet")
public class ReadServiceServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ServiceModuleServiceImp serviceImp = new ServiceModuleServiceImp();
		ArrayList<ServicePojo> serviceList = serviceImp.readService();
		
		HttpSession httpSession = request.getSession();
		
		
		if(serviceList == null) {
			
			httpSession.setAttribute("msg", "Something went wrong : Service layer");
			response.sendRedirect("admin.jsp");
			
		}else if(serviceList.isEmpty()) {
			
			httpSession.setAttribute("msg", "Something went wrong : Dao layer");
			response.sendRedirect("admin.jsp");
			
		}else {
			
			String dateTime = serviceList.get(0).getDate();
			if(dateTime.equals("ne")) {
				
				httpSession.setAttribute("msg", "Data does not exits");
				response.sendRedirect("admin.jsp");
			}else{
				
				httpSession.setAttribute("servicelist", serviceList);
				response.sendRedirect("readservice.jsp");
				
			}
		}
		
	}


	

	
	

}
