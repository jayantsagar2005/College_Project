package tech.happy.controller;

import jakarta.servlet.annotation.WebServlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tech.happy.dao.AddAdminLoginDetails;
import tech.happy.fileio.DateTime;
import tech.happy.model.Admin;

@WebServlet("/VerificationOTP")
public class VerificationOTP extends HttpServlet{
	@Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();

        Admin user = (Admin) session.getAttribute("adminlogin");
        int otp = Integer.parseInt(req.getParameter("otp"));

        if (otp != 0 && user != null && otp == user.getOtp()) {
        	String msg = "Admin Panel logIn successfully completed!";
        	session.setAttribute("msg", msg);
        	AddAdminLoginDetails addAdminLoginDetails = new AddAdminLoginDetails();
        	addAdminLoginDetails.addDetails(user.getUsername(), DateTime.currentDateTime());
            resp.sendRedirect("admin.jsp");      
        } else {
            String msg = "Verification is not matching, try later!";
            session.setAttribute("msg", msg);
            resp.sendRedirect("verification.jsp");
        }
    }
}
