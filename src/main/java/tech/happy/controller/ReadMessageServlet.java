package tech.happy.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tech.happy.model.ContactPojo;
import tech.happy.service.ContactServiceImp;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/ReadMessageServlet")
public class ReadMessageServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession httpSession = request.getSession();
		String location = (String) httpSession.getAttribute("location"); 
		
		ContactServiceImp contactServiceImp = new ContactServiceImp();
		ArrayList<ContactPojo> list =  contactServiceImp.readContactService(location);	
		
		if(list == null) {
			
			httpSession.setAttribute("msg", "Something went wrong : Service layer");
			response.sendRedirect("admin.jsp");
			
		}else if(list.isEmpty()) {
			
			httpSession.setAttribute("msg", "Something went wrong : Dao layer");
			response.sendRedirect("admin.jsp");
			
		}else {
			
			String dateTime = list.get(0).getDateTime();
			if(dateTime.equals("ne")) {
				
				httpSession.setAttribute("msg", "Data does not exits");
				response.sendRedirect("admin.jsp");
			}else{
				
				httpSession.setAttribute("contactdata", list);
				response.sendRedirect("readcontact.jsp");
			}
			
		}
	}

}
