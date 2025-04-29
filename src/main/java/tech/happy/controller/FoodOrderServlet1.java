package tech.happy.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tech.happy.model.BookTablePojo;
import tech.happy.service.FoodOrderServiceImp;

import java.io.IOException;

@WebServlet("/FoodOrderServlet1")
public class FoodOrderServlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String name = request.getParameter("name");
		String gmail = request.getParameter("gmail");
		int peopleNo = Integer.parseInt(request.getParameter("peopleNo"));
		String food = request.getParameter("request");
		String dateTime  = request.getParameter("dateTime");
		
		BookTablePojo data = new BookTablePojo(name, gmail, peopleNo, food, dateTime);
		
		FoodOrderServiceImp foodOrderServiceImp = new FoodOrderServiceImp();
		
		String result = foodOrderServiceImp.validData(data);
		
		if(result.equals("Valid")) {
//			boolean flag =  foodOrderServiceImp.savaData(data);
			
			/*
			 * if(flag) { String msg = "Your Special Request Successfully Send!";
			 * session.setAttribute("msg", msg); response.sendRedirect("booking.jsp");
			 * }else{ String msg = "Your Request Failed, Try Later!";
			 * 
			 * } session.setAttribute("msg", msg);
			 */
			response.sendRedirect("booking.jsp");
			
		}else {
			session.setAttribute("msg", result);
			response.sendRedirect("booking.jsp");
		}
	}

}
