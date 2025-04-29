package tech.happy.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import tech.happy.model.TeamPojo;
import tech.happy.service.TeamServiceImp;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption; 

@WebServlet("/AddTeamMemberServlet")
@MultipartConfig
public class AddTeamMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String UPLOAD_DIRECTORY = "TeamImages";

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		String memberName = request.getParameter("membername");
		String memberDesignation = request.getParameter("designation");
		String facebook = request.getParameter("fblink");
		String twitter = request.getParameter("twitterlink");
		String instagram = request.getParameter("instalink");
		String location = (String) session.getAttribute("location");
		
		Part filePart = request.getPart("memberimage");
        String memberImage = getFileName(filePart);
        
        TeamPojo dataPojo = new TeamPojo(memberName, memberDesignation, memberImage, facebook, twitter, instagram);
        
        TeamServiceImp teamServiceImp = new TeamServiceImp();
        String result = teamServiceImp.validData(dataPojo); 
                
        if(result.equals("Valid")) {
        	boolean flag = teamServiceImp.addMember(dataPojo, location);        	
        	
        	if(flag) {
        		String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
		        
		        File uploadDir = new File(uploadPath);
		        if (!uploadDir.exists()) { 
		            uploadDir.mkdir();
		        }
		        		        
		        if (memberImage != null && !memberImage.isEmpty()) {
		            File file = new File(uploadPath + File.separator + memberImage);
		            
		            try (InputStream input = filePart.getInputStream()) {
		                Files.copy(input, file.toPath(), StandardCopyOption.REPLACE_EXISTING);
		            } catch (IOException e) {
		                result = "Member Successfull Added! but Image upload failed.";  
						session.setAttribute("msg", result);
						response.sendRedirect("addmember.jsp"); 
		            }
		        
		        }
		        result = "Member Successfully Added!";  
				session.setAttribute("msg", result);
				response.sendRedirect("addmember.jsp");
				
        	}else {
				result = "Member Not Added!"; 
				session.setAttribute("msg", result);
				response.sendRedirect("addmember.jsp");
			}
        	
        }else {
			session.setAttribute("msg", result);
			response.sendRedirect("addmember.jsp");
		}   
        
	}
	
	private String getFileName(Part part) {
        String header = part.getHeader("content-disposition");
        if (header == null) {
            return null;
        }
        for (String content : header.split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }

}
