package tech.happy.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tech.happy.dao.ContactDaoImp;

import java.io.IOException;

@WebServlet("/UpdateContactServlet")
public class UpdateContactServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(); 
		
		String no = request.getParameter("sno");
		int sNo = Integer.parseInt(no);
		
		ContactDaoImp contactDaoImp = new ContactDaoImp();
		boolean result = contactDaoImp.updateMessage(sNo);
		
		if(!result) {
			String msg = "Message not read";
			session.setAttribute("msg", msg);			
		}
		
		response.sendRedirect("readcontact.jsp");
	}

}
