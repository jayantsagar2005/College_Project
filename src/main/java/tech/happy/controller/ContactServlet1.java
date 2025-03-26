package tech.happy.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tech.happy.service.ContactServiceImp;

import java.io.IOException;

@WebServlet("/ContactServlet1")
public class ContactServlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private static String result;
 
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String subject = req.getParameter("subject");
		String message = req.getParameter("message");
	
		ContactServiceImp contactServiceImp = new ContactServiceImp(); 
		result =  contactServiceImp.contactService1(name, email, subject, message);
	
		if(result.equals("Valid")) { 
			
			RequestDispatcher requestDispatcher =  req.getRequestDispatcher("ContactServlet2");
			requestDispatcher.forward(req, resp);
			
		}else {
			session.setAttribute("msg", result);
			resp.sendRedirect("contact.jsp");
		}
	}

}
