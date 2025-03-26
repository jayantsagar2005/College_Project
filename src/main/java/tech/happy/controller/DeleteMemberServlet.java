package tech.happy.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tech.happy.service.TeamServiceImp;

import java.io.IOException;

@WebServlet("/DeleteMemberServlet")
public class DeleteMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		String snString = request.getParameter("sno");
		
		TeamServiceImp teamServiceImp = new TeamServiceImp();
		boolean flag = teamServiceImp.deleteMember(snString);
		
		if(flag) {
			String msg = "Member Delete Successfully!";
			session.setAttribute("msg", msg);
			response.sendRedirect("readmember.jsp");
		}else {
			String msg = "Member not deleted!";
			session.setAttribute("msg", msg);
			response.sendRedirect("readmember.jsp");
		}
	}

}
