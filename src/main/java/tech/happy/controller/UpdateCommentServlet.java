package tech.happy.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tech.happy.dao.CommentDaoImp;

import java.io.IOException;

@WebServlet("/UpdateCommentServlet")
public class UpdateCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		HttpSession session = request.getSession();
		
		int sno = Integer.parseInt(request.getParameter("sno")); 
		
		CommentDaoImp commentDaoImp = new CommentDaoImp();
		boolean flag = commentDaoImp.updateStatus(sno); 
		
		// System.out.println(flag);
		
		response.sendRedirect("readtestimonial.jsp");
		
	}

}
