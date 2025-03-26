package tech.happy.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tech.happy.dao.CommentDaoImp;

import java.io.IOException;

@WebServlet("/DeleteCommentServlet")
public class DeleteCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int sno = Integer.parseInt(request.getParameter("sno")); 
		
		CommentDaoImp commentDaoImp = new CommentDaoImp();
		boolean flag = commentDaoImp.deleteComment(sno); 
		
		response.sendRedirect("readtestimonial.jsp");
	}

}
