<%@page import="tech.happy.dao.CommentDaoImp"%>
<%@page import="tech.happy.model.CommentPojo"%>
<%@page import="tech.happy.model.BookTablePojo"%>
<%@page import="tech.happy.service.FoodOrderServiceImp"%>
<%@page import="tech.happy.dao.ContactDaoImp"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="tech.happy.model.ContactPojo"%>
<%@page import="tech.happy.dao.OrderDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="tech.happy.model.Admin"%>

<%
	Admin check = (Admin) session.getAttribute("adminlogin");

	if(check == null){
		response.sendRedirect("adminlogin.jsp");
		return;
	}
	CommentDaoImp commentDaoImp = new CommentDaoImp();
	OrderDao foodOrderDaoImp = new OrderDao();
	ContactDaoImp contact = new ContactDaoImp();
%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
	    <meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>Read Testimonial</title>
	    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css" integrity="sha512-5Hs3dF2AEPkpNAR7UiOHba+lRSJNeM2ECkwxUIxC1Q/FLycGTbNapWXB4tP889k5T5Ju8fs4b1P5z/iB4nMfSQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
		<link href="css/admin.css" rel="stylesheet">
	</head>
	<body>
		<div>
			<header class="back-colors py-4 d-flex justify-content-between align-items-center">
			    <div class="text-center flex-grow-1">
			        <h1 class="fw-bolder font-color m-0">READ TESTIMONIALS</h1>           
			        <h2 class="visually-hidden">
			            <%@include file="message.jsp" %>             
			        </h2>
			    </div>
			    
			    <div class="text-end ms-auto">
			        <h4 id="branchName" class="m-0 text-white me-4">
			            <i class="fa-solid fa-location-dot mx-2"></i>
			            <%= (String) session.getAttribute("location") != null ? session.getAttribute("location") : "Location not set" %>
			        </h4>
			    </div>
			</header>
	
			<nav class="navbar navbar-expand-lg navbar-light back-colors mt-1">
			  <div class="container-fluid">
			    <a class="navbar-brand fs-2 fw-bolder font-color" href="admin.jsp" style="color:#FEA116;">Happy' Point</a>
			    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			      <span class="navbar-toggler-icon"></span>
			    </button>
			    <div class="collapse navbar-collapse" id="navbarSupportedContent">
			      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
			        <li class="nav-item d-flex align-items-center">
			          <a class="nav-link fs-5 fw-bolder text-white" aria-current="page" href="admin.jsp">Home</a>
			        </li>
			        <%		
			        	int pendingOrder = foodOrderDaoImp.pendingOrder((String) session.getAttribute("location"));
			        %>
			        <li class="nav-item d-flex align-items-center">		
			          <a class="nav-link fs-5 fw-bolder text-white text-center" href="readorder.jsp">Read Ordered (<%= pendingOrder %>)</a>
			        </li>
			        
			        <li class="nav-item d-flex align-items-center">
			          <a class="nav-link fs-5 fw-bolder text-white text-center" href="ReadMessageServlet">Read Message (<%= contact.unreadCount((String) session.getAttribute("location")) %>)</a>
			        </li>
			        
			        <li class="nav-item d-flex align-items-center">		
			          <a class="nav-link fs-5 fw-bolder text-warning text-center" href="readtestimonial.jsp">Read Testimonial (<%= commentDaoImp.pendingCount((String) session.getAttribute("location")) %>)</a>
			        </li>
		        
			        <li class="nav-item dropdown d-flex align-items-center">
			       	  <a class="nav-link fs-5 dropdown-toggle fw-bolder text-white text-center" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
				      	Manage 
				      </a>
				      <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
			            <li><a class="dropdown-item fw-bolder" href="addservice.jsp">Add Service</a></li>
			            <li><a class="dropdown-item fw-bolder" href="readservice.jsp">Read Services</a></li>
			            <li><hr class="dropdown-divider"></li>
			          	<li><a class="dropdown-item fw-bolder" href="additem.jsp">Add Food</a></li>
			            <li><a class="dropdown-item fw-bolder" href="readitem.jsp">Read Foods</a></li>
			            <li><hr class="dropdown-divider"></li>
			            <li><a class="dropdown-item fw-bolder" href="addmember.jsp">Add Member</a></li>
			            <li><a class="dropdown-item fw-bolder" href="readmember.jsp">Read Members</a></li>
			          </ul>			      		      
			       </li>
			      </ul>
			      <form class="d-flex flex-wrap gap-2 justify-content-center">
			      	<a href="changepassword.jsp" class="btn btn-outline-dark bg-white font-color fw-bolder">Change Password</a>
			        <a href="LogoutServlet" class="btn btn-outline-dark bg-white font-color fw-bolder text-center">LogOut</a>
			      </form>
			    </div>
			  </div>
			</nav>
		
			<div class="mt-2">
			    <div class="table-responsive">
			        <table class="table table-secondary table-bordered">
			            <thead>
			                <tr class="table-warning">
			                    <th scope="col" class="text-center fs-4 fw-bolder" style="min-width: 100px;">Image</th>
			                    <th scope="col" class="text-center fs-4 fw-bolder" style="min-width: 120px;">Name</th>
			                    <th scope="col" class="text-center fs-4 fw-bolder" style="min-width: 140px;">Occupation</th>
			                    <th scope="col" class="text-center fs-4 fw-bolder" style="min-width: 250px;">Comment</th>
			                    <th scope="col" class="text-center fs-4 fw-bolder" style="min-width: 180px;">DateTime</th>
			                    <th scope="col" class="text-center fs-4 fw-bolder" style="min-width: 100px;">Status</th>
			                    <th scope="col" class="text-center fs-4 fw-bolder" style="min-width: 200px;">Action</th>
			                </tr>
			            </thead>
			            <tbody>
			                <%
			                    ArrayList<CommentPojo> list = commentDaoImp.readComment((String) session.getAttribute("location"));
			                    for(CommentPojo cp : list){
			                %>
			                <tr class="table-success align-middle">
			                    <td class="text-center">
			                        <img class="img-fluid rounded-circle" src="CommentImages/<%= cp.getImage() %>" style="width: 50px; height: 50px;">
			                    </td>
			                    <td><%= cp.getName() %></td>
			                    <td><%= cp.getOccupation() %></td>
			                    <td><%= cp.getComment() %></td>
			                    <td><%= cp.getDateTime() %></td>
			                    <td class="fw-bolder"><%= cp.getStatus() %></td>
			                    <td>
			                        <div class="d-flex flex-wrap gap-2">
			                            <form action="DeleteCommentServlet" method="post">
			                                <input type="hidden" name="sno" value="<%= cp.getsNo() %>">
			                                <button class="btn btn-primary fw-bolder">Delete</button>
			                            </form>
			                            <form action="UpdateCommentServlet" method="post">
			                                <input type="hidden" name="sno" value="<%= cp.getsNo() %>">
			                                <%
			                                    if(cp.getStatus().equals("Pending")){
			                                %>			
			                                        <button class="btn bg-warning fw-bolder"><%= cp.getStatus() %></button>
			                                <% 
			                                    } else {
			                                %>		
			                                        <button class="btn bg-success fw-bolder"><%= cp.getStatus() %></button>
			                                <%
			                                    }
			                                %>	    			
			                            </form>
			                        </div>
			                    </td>
			                </tr>
			                <%
			                    }
			                %>
			            </tbody>
			        </table>
			    </div>
			</div>
		</div>	
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	</body>
</html>