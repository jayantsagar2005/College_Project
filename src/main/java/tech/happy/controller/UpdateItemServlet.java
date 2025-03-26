package tech.happy.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import tech.happy.service.AddItemServiceImp;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;

@WebServlet("/UpdateItemServlet")
@MultipartConfig
public class UpdateItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String UPLOAD_DIRECTORY = "images";

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String dayTime = request.getParameter("daytime");
		String itemName = request.getParameter("itemname");
		String itemContent = request.getParameter("itemcontent");
		int itemPrice = Integer.parseInt(request.getParameter("itemprice"));
		
		String item = request.getParameter("sno");			
		int itemNo = Integer.parseInt(item);
		
		 Part filePart = request.getPart("itemimage");
        String itemImage = getFileName(filePart); 
        
		AddItemServiceImp addItemServiceImp = new AddItemServiceImp(); 
		String result =  addItemServiceImp.isValidItem(dayTime, itemName, itemContent, itemPrice, itemImage);

		if(result.equals("Valid")) {
			boolean flag = addItemServiceImp.updateItem(dayTime, itemName, itemContent, itemPrice, itemImage, itemNo); 
			
			if(flag) { 
				
				String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
		        
			        File uploadDir = new File(uploadPath);
			        if (!uploadDir.exists()) {
			            uploadDir.mkdir();
			        }
			        
				
			        if (itemImage != null && !itemImage.isEmpty()) {
			            File file = new File(uploadPath + File.separator + itemImage);

			            try (InputStream input = filePart.getInputStream()) {
			                Files.copy(input, file.toPath(), StandardCopyOption.REPLACE_EXISTING);
			            } catch (IOException e) {
			                result = "Item Successfully Update! but File upload failed.";  
							session.setAttribute("msg", result);
							response.sendRedirect("readitem.jsp");
			            }
			        } else { 
			            result = "Item Successfully Update!";  
						session.setAttribute("msg", result);
						response.sendRedirect("readitem.jsp");
			        }
			        
			        result = "Item Successfully Update!";  
					session.setAttribute("msg", result);
					response.sendRedirect("readitem.jsp");
				
			}else {
				result = "Item Not Update!"; 
				session.setAttribute("msg", result);
				response.sendRedirect("readitem.jsp");
			}
		}else {
			session.setAttribute("msg", result);
			response.sendRedirect("readitem.jsp");
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
