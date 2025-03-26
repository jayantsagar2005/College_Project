<%@page import="tech.happy.dao.CommentDaoImp"%>
<%@page import="tech.happy.dao.ContactDaoImp"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="tech.happy.model.ContactPojo"%>
<%@page import="tech.happy.dao.FoodOrderDaoImp"%>
<%@page import="java.util.ArrayList"%>
<%@page import="tech.happy.model.Admin"%>

<%
	Admin check = (Admin) session.getAttribute("adminlogin");

	if(check == null){
		response.sendRedirect("adminlogin.jsp");
		return;
	}
	ContactDaoImp contact = new ContactDaoImp();
%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
	    <meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>Read Contact</title>
	    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
		<link href="css/admin.css" rel="stylesheet">
	</head>
	<body>
		<div>
			<div class="back-colors py-4">
				<div class="text-center">
					<h1 class="fw-bolder font-color">READ CONTACT</h1>
			    	<h2><%@include file="message.jsp" %></h2>
				</div>
			</div>
	
			<nav class="navbar navbar-expand-lg navbar-light back-colors mt-1">
			  <div class="container-fluid">
			    <a class="navbar-brand fs-2 fw-bolder font-color" href="admin.jsp" style="color:#FEA116;">Happy' Point</a>
			    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			      <span class="navbar-toggler-icon"></span>
			    </button>
			    <div class="collapse navbar-collapse" id="navbarSupportedContent">
			      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
			        <li class="nav-item">
			          <a class="nav-link fs-5 fw-bolder text-white" aria-current="page" href="admin.jsp">Home</a>
			        </li>
			        <%
			        	CommentDaoImp commentDaoImp = new CommentDaoImp();
			        	FoodOrderDaoImp foodOrderDaoImp = new FoodOrderDaoImp();
			        	int pendingOrder = foodOrderDaoImp.pendingOrder();
			        %>
			        <li class="nav-item">		
			          <a class="nav-link fs-5 fw-bolder text-white" href="readorder.jsp">Read Ordered (<%= pendingOrder %>)</a>
			        </li>
			        <li class="nav-item">
			          <a class="nav-link fs-5 active fw-bolder text-warning" href="ReadMessageServlet">Read Message (<%= contact.unreadCount() %>)</a>
			        </li>
			        <li class="nav-item">		
				       <a class="nav-link fs-5 fw-bolder text-white" href="readtestimonial.jsp">Read Testimonial (<%= commentDaoImp.pendingCount() %>)</a>
				    </li>
			        <li class="nav-item dropdown">
			       	  <a class="nav-link fs-5 dropdown-toggle fw-bolder text-white" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
				      	Manage 
				      </a>
				      <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
			            <li><a class="dropdown-item fw-bolder" href="addservice.jsp">Add Service</a></li>
			            <li><a class="dropdown-item fw-bolder" href="ReadServiceServlet">Read Services</a></li>
			            <li><hr class="dropdown-divider"></li>
			          	<li><a class="dropdown-item fw-bolder" href="additem.jsp">Add Food</a></li>
			            <li><a class="dropdown-item fw-bolder" href="readitem.jsp">Read Foods</a></li>
			            <li><hr class="dropdown-divider"></li>
			            <li><a class="dropdown-item fw-bolder" href="addmember.jsp">Add Member</a></li>
			            <li><a class="dropdown-item fw-bolder" href="readmember.jsp">Read Members</a></li>
			          </ul>			      		      
			       </li>
			      </ul>
			      <form class="d-flex">
			      	<a href="changepassword.jsp" class="btn btn-outline-dark bg-white font-color mx-3 fw-bolder">Change Password</a>
			        <a href="LogoutServlet" class="btn btn-outline-dark bg-white mx-2 font-color fw-bolder">LogOut</a>
			      </form>
			    </div>
			  </div>
			</nav>
		
			<div class="mt-2">
				<table class="table table-secondary table-bordered">
		    		<thead>
						<tr class="table-warning">
							<th scope="col" class="text-center fs-4 fw-bolder bg-warnig">Name</th>
						    <th scope="col" class="text-center fs-4 fw-bolder">Email</th>
						    <th scope="col" class="text-center fs-4 fw-bolder">Subject</th>
						    <th scope="col" class="text-center fs-4 fw-bolder">Message</th>
						    <th scope="col" class="text-center fs-4 fw-bolder">DateTime</th>
						    <th scope="col" class="text-center fs-4 fw-bolder">Action</th>
						</tr>
					</thead>
				<%
			    	ArrayList<ContactPojo> list = contact.readContact();
			    	for(ContactPojo cp : list){
			    %>
			    		<tbody>
			    			<tr class="table-success">
			    				<th scope="row" class="pt-3 fw-bolder"><%= cp.getName() %></th>
			    				<td class="pt-3"><%= cp.getGmail() %></td>
			    				<td class="pt-3"><%= cp.getSubject() %></td>
			    				<td class="pt-3" style="width:490px;"><%= cp.getMessage() %></td>
			    				<td class="pt-3"><%= cp.getDateTime() %></td>
			    				<td style="width: 160px;">
			    					<div class="d-flex">
			    						<form action="DeleteContactServlet" method="post">
							    			<input type="hidden" name="sno" value="<%= cp.getSno() %>">
							    			<button class="btn btn-primary fw-bolder">Delete</button>
							    		</form>
							    		<form action="UpdateContactServlet" method="post" class="ms-2">
							    			<input type="hidden" name="sno" value="<%= cp.getSno() %>">
							    			<%
							    				if(cp.getSeen().equals("Unread")){
							    			%>			
							    					<button class="btn bg-warning fw-bolder"><%= cp.getSeen() %></button>
							    			<% 
							    				}else{
							    			%>		
							    					<button class="btn bg-success fw-bolder"><%= cp.getSeen() %></button>
							    			<%
							    				}
							    			%>	    			
							    		</form>
			    					</div>
			    				</td>
			    			</tr>
			    		</tbody>
			    <%
			    	}
			    %>
			    </table>
			</div>	
		</div>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	</body>
</html>