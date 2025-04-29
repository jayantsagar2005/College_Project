package tech.happy.controller;
 
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/SetOrderDetailsServlet")
public class SetOrderDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
	    String gmail = request.getParameter("gmail");
	    String dateTime = request.getParameter("dateTime");
	    String tableno = request.getParameter("tableno"); 
	    
	    HttpSession session = request.getSession();
	    session.setAttribute("name", name);
	    session.setAttribute("gmail", gmail);
	    session.setAttribute("dateTime", dateTime);
	    session.setAttribute("tableno", tableno);

	    response.setStatus(200);
	}
}
