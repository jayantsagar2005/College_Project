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
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;


@WebServlet("/AddItemServlet")
@MultipartConfig
public class AddItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String UPLOAD_DIRECTORY = "images";

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		String dayTime = request.getParameter("daytime");
		String itemName = request.getParameter("itemname");
		String itemContent = request.getParameter("itemcontent");
		int itemPrice = Integer.parseInt(request.getParameter("itemprice"));
        String location = (String) session.getAttribute("location");
        
        Part filePart = request.getPart("itemimage");
        String itemImage = getFileName(filePart);
        
		AddItemServiceImp addItemServiceImp = new AddItemServiceImp(); 
		String result =  addItemServiceImp.isValidItem(dayTime, itemName, itemContent, itemPrice, itemImage);

		
		if(result.equals("Valid")) {
			boolean flag = addItemServiceImp.addItem(dayTime, itemName, itemContent, itemPrice, itemImage, location);
			
			if(flag) { 
				
					String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
					
				//	System.out.println(uploadPath);	
				//	Path = C:\Users\hp\eclipse-workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp1\wtpwebapps\RestaurantApp\\images
					
			        File uploadDir = new File(uploadPath);
			        if (!uploadDir.exists()) { 
			            uploadDir.mkdir();
			        }
			        
				
			        if (itemImage != null && !itemImage.isEmpty()) {
			            File file = new File(uploadPath + File.separator + itemImage);

			            try (InputStream input = filePart.getInputStream()) {
			                Files.copy(input, file.toPath(), StandardCopyOption.REPLACE_EXISTING);
			            } catch (IOException e) {
			                result = "Item Successfull Added! but File upload failed.";  
							session.setAttribute("msg", result);
							response.sendRedirect("additem.jsp"); 
			            }
			        } else {
			            result = "Item Successfull Added! but No file selected.";  
						session.setAttribute("msg", result);
						response.sendRedirect("additem.jsp");
			        }
				     
				result = "Item Successfully Added!";  
				session.setAttribute("msg", result);
				response.sendRedirect("additem.jsp");
				
			}else {
				result = "Item Not Added!"; 
				session.setAttribute("msg", result);
				response.sendRedirect("additem.jsp");
			}
		}else {
			session.setAttribute("msg", result);
			response.sendRedirect("additem.jsp");
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
