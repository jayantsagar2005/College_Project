package tech.happy.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tech.happy.dao.FoodOrderDaoImp;

import java.io.IOException;

@WebServlet("/DeleteOrderServlet")
public class DeleteOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		int sno = Integer.parseInt(request.getParameter("sno"));
		
		FoodOrderDaoImp foodOrderDaoImp = new FoodOrderDaoImp();
		boolean flag = foodOrderDaoImp.deleteOrder(sno);
		
		if(flag) {
			String msg = "Delete Successfully!";
			session.setAttribute("msg", msg);
			
		}else {
			String msg = "Don't Delete, Try Again!";
			session.setAttribute("msg", msg);
		}
		
		response.sendRedirect("readorder.jsp");
	}

}
