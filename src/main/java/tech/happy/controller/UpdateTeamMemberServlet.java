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


@WebServlet("/UpdateTeamMemberServlet")
@MultipartConfig 
public class UpdateTeamMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String UPLOAD_DIRECTORY = "TeamImages";

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		String item = request.getParameter("sno");			
		int itemNo = Integer.parseInt(item);
		
		String memberName = request.getParameter("membername");
		String memberDesignation = request.getParameter("designation");
		String facebook = request.getParameter("fblink");
		String twitter = request.getParameter("twitterlink");
		String instagram = request.getParameter("instalink");
		
		Part filePart = request.getPart("memberimage");
        String memberImage = getFileName(filePart); 
        
        TeamPojo dataPojo = new TeamPojo(itemNo, memberName, memberDesignation, memberImage, facebook, twitter, instagram);
        
        TeamServiceImp teamServiceImp = new TeamServiceImp();
        String result = teamServiceImp.validData(dataPojo); 
        
        if(result.equals("Valid")) {
        	boolean flag = teamServiceImp.updateMember(dataPojo);
        	
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
		                result = "Member Successfull Update! but Image upload failed.";  
						session.setAttribute("msg", result);
						response.sendRedirect("readmember.jsp"); 
		            }
		        
		        }
		        result = "Member Successfully Update!";  
				session.setAttribute("msg", result);
				response.sendRedirect("readmember.jsp");
				
        	}else {
				result = "Member Not Update!"; 
				session.setAttribute("msg", result);
				response.sendRedirect("readmember.jsp");
			}
        	
        }else {
			session.setAttribute("msg", result);
			response.sendRedirect("readmember.jsp");
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
