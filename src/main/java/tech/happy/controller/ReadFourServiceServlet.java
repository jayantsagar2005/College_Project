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

@WebServlet("/ReadFourServiceServlet")
public class ReadFourServiceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession httpSession = request.getSession();
		
		httpSession.setAttribute("check", "FromServlet");
		
		try {
			ServiceModuleServiceImp serviceImp = new ServiceModuleServiceImp();
			ArrayList<ServicePojo> list = serviceImp.readFourService();
			
			if(list == null) {
				
				httpSession.setAttribute("msg", "Service Unavailable Right Now!");
				response.sendRedirect("index.jsp");
				
			}else if (list.isEmpty()) {
				
				httpSession.setAttribute("msg", "Service Unavailable Right Now!");
				response.sendRedirect("index.jsp");
				
			}else {
				
				String date = list.get(0).getDate();
				
				if(date.equals("ne")) {
					
					httpSession.setAttribute("msg", "Service Unavailable Right Now!");
					response.sendRedirect("index.jsp");
					
				}else{
					
					httpSession.setAttribute("servicedata", list);
					response.sendRedirect("index.jsp");
					
				}
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
