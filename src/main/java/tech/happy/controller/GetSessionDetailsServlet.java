package tech.happy.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/GetSessionDetailsServlet")
public class GetSessionDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
	    response.setContentType("application/json");
	    PrintWriter out = response.getWriter();

	    if (session != null) {
	        String name = (String) session.getAttribute("name");
	        String gmail = (String) session.getAttribute("gmail");
	        String tableno = (String) session.getAttribute("tableno");
	        String datetime = (String) session.getAttribute("dateTime");

	        out.print("{");
	        out.print("\"name\":\"" + name + "\",");
	        out.print("\"gmail\":\"" + gmail + "\",");
	        out.print("\"tableno\":\"" + tableno + "\",");
	        out.print("\"datetime\":\"" + datetime + "\"");
	        out.print("}");
	    } else {
	        out.print("{}");
	    }
	}

}
