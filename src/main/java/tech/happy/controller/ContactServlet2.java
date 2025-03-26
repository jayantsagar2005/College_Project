package tech.happy.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tech.happy.service.ContactServiceImp;

import java.io.IOException;

@WebServlet("/ContactServlet2")
public class ContactServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String result;
    
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String subject = req.getParameter("subject");
		String message = req.getParameter("message");
		
		ContactServiceImp contactServiceImp = new ContactServiceImp();
		result =  contactServiceImp.contactService2(name, email, subject, message);
		session.setAttribute("msg", result);
		resp.sendRedirect("contact.jsp"); 
	}

}
