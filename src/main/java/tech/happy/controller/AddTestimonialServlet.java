package tech.happy.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import tech.happy.model.CommentPojo;
import tech.happy.service.CommentServiceImp;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;


@WebServlet("/AddTestimonialServlet")
@MultipartConfig
public class AddTestimonialServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String UPLOAD_DIRECTORY = "CommentImages";

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		String name = request.getParameter("membername");
		String occupation = request.getParameter("occupation");
		String comment = request.getParameter("description");
		
		Part filePart = request.getPart("memberimage");
        String image = getFileName(filePart);
        
        if(image.isEmpty()) image = "th (13).jpeg";
        
        CommentPojo commentPojo = new CommentPojo(name, occupation, comment, image);
        
        CommentServiceImp commentServiceImp = new CommentServiceImp();
        String result = commentServiceImp.validData(commentPojo);
        
        if(result.equals("Valid")) {
        	
        	boolean flag = commentServiceImp.addComment(commentPojo);
        	
        	if(flag) {
        		
        		String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
        		
        		File uploadDir = new File(uploadPath);
		        if (!uploadDir.exists()) { 
		            uploadDir.mkdir();
		        }
		        
		        if (image != null && !image.isEmpty()) {
		            File file = new File(uploadPath + File.separator + image);

		            try (InputStream input = filePart.getInputStream()) {
		                Files.copy(input, file.toPath(), StandardCopyOption.REPLACE_EXISTING);
		            } catch (IOException e) {
		                result = "Comment Successfull Send To Verification! But Image Upload Failed.";  
						session.setAttribute("msg", result);
						response.sendRedirect("testimonial.jsp"); 
		            }
		        
		        }
		        
		        result = "Comment Successfully Send To Verification!";  
				session.setAttribute("msg", result);
				response.sendRedirect("testimonial.jsp"); 
        		
        	}else {
				result = "Comment Not Send To Verification!"; 
				session.setAttribute("msg", result);
				response.sendRedirect("addtestimonial.jsp"); 
			}
        	
        }else {
			session.setAttribute("msg", result);
			response.sendRedirect("addtestimonial.jsp"); 
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
