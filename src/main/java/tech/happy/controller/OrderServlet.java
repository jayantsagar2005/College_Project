package tech.happy.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tech.happy.dao.OrderDao;
import tech.happy.model.OrderDeatils;
import tech.happy.model.OrderPojo;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String name = (String) session.getAttribute("name"); 
		String gmail = (String) session.getAttribute("gmail");
		String dateTime = (String) session.getAttribute("dateTime");
		String tableNo = (String) session.getAttribute("tableno");
		String location = (String) session.getAttribute("location");
		int amount = 0;
		ArrayList<OrderDeatils> list = (ArrayList<OrderDeatils>) session.getAttribute("orderList");
		StringBuilder sb = new StringBuilder("{");
		for(OrderDeatils data : list) {
			sb.append(data.getName()).append(", ").append(data.getMeal()).append(", ₹").append(data.getPrice()).append(", ").append(data.getQuantity()).append(" | ");
			amount += (int) data.getPrice() * (int) data.getQuantity();
		}
		if (sb.length() > 0) sb.setLength(sb.length() - 2);
		sb.append("}");
		String orderString = sb.toString();
		
		OrderPojo orderPojo = new OrderPojo(name, gmail, Integer.parseInt(tableNo), dateTime, orderString, amount, "Pay On Hand", "Pending");
		OrderDao orderDao = new OrderDao();
		boolean flag = orderDao.saveOrder(orderPojo, location);
		
		session.removeAttribute("name");
		session.removeAttribute("gmail");
		session.removeAttribute("dateTime");
		session.removeAttribute("tableno");
		session.removeAttribute("orderList");
		
		if(flag) {
			session.setAttribute("msg", "Order Successfully");
		}else {
			session.setAttribute("msg", "Server Problem");
		}
		
		session.removeAttribute("name");
		session.removeAttribute("gmail");
		session.removeAttribute("dateTime");
		session.removeAttribute("tableno");
		session.removeAttribute("orderList");
		
		response.sendRedirect("booking.jsp");
	}

}
