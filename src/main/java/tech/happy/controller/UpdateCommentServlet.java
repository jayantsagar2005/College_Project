package tech.happy.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tech.happy.dao.CommentDaoImp;
import tech.happy.dao.FoodOrderDaoImp;

import java.io.IOException;

@WebServlet("/UpdateCommentServlet")
public class UpdateCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		HttpSession session = request.getSession();
		
		int sno = Integer.parseInt(request.getParameter("sno")); 
		
		CommentDaoImp commentDaoImp = new CommentDaoImp();
		boolean flag = commentDaoImp.updateStatus(sno); 
		
		response.sendRedirect("readtestimonial.jsp");
		
	}

}
