package tech.happy.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tech.happy.dao.OrderDao;

import java.io.IOException;

@WebServlet("/UpdateOrderServlet")
public class UpdateOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		int sno = Integer.parseInt(request.getParameter("sno")); 
		
		OrderDao orderDao = new OrderDao();
		boolean flag = orderDao.updateStatus(sno);
		
		if(flag) {
			String msg = "Updated Successfully!";
			session.setAttribute("msg", msg);
		}else { 
			String msg = "Not Updated!";
			session.setAttribute("msg", msg);
		}
		
		response.sendRedirect("readorder.jsp");	
	}

}
