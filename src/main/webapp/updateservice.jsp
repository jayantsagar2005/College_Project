<%@page import="tech.happy.dao.CommentDaoImp"%>
<%@page import="tech.happy.model.ServicePojo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="tech.happy.dao.ContactDaoImp"%>
<%@page import="tech.happy.dao.FoodOrderDaoImp"%>
<%@page import="tech.happy.model.Admin"%>

<%
	Admin check = (Admin) session.getAttribute("adminlogin");

	if(check == null){
		response.sendRedirect("adminlogin.jsp");
		return;
	}
	ContactDaoImp contact = new ContactDaoImp();
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Service</title>
   	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<link href="css/admin.css" rel="stylesheet">
		
</head>
<body>
	
	<div>
		<div class="back-colors py-4">
			<div class="text-center">
				<h1 class="fw-bolder font-color">Update Service</h1>
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
		          <a class="nav-link fs-5 fw-bolder text-white" href="ReadMessageServlet">Read Message (<%= contact.unreadCount() %>)</a>
		        </li>
		        <li class="nav-item">		
			       <a class="nav-link fs-5 fw-bolder text-white" href="readtestimonial.jsp">Read Testimonial (<%= commentDaoImp.pendingCount() %>)</a>
			    </li>
		        <li class="nav-item dropdown">
			    	<a class="nav-link fs-5 dropdown-toggle fw-bolder text-warning" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
				      	Manage 
				    </a>
				    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
			        	<li><a class="dropdown-item fw-bolder" href="addservice.jsp">Add Service</a></li>
			            <li><a class="dropdown-item fw-bolder text-warning" href="ReadServiceServlet">Read Services</a></li>
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
	</div>

	<%		
		String indexString = request.getParameter("index");	
		int index = Integer.parseInt(indexString);
		ArrayList<ServicePojo> list =  (ArrayList<ServicePojo>) session.getAttribute("servicelist");
		ServicePojo sp = list.get(index);
		int sn = sp.getSno();		
	%>
	
	<div class="bg-secondary d-flex justify-content-center align-items-center mt-1">
			<div>
				<div style="width:25vw;" class="border mt-2 border-5 border-body rounded shadow-lg p-3 mb-5 bg-body rounded">
					<div>
						<div class="text-center my-1">
							<h2 class="fs-1 fw-bolder font-color">ADD SERVICE</h2>
						</div>
					</div>
					<form action="ServiceUpdateServlet1?sn=<%= sn %>" method="post" class="mx-2">
					  <div class="my-3">
					    <label for="iconname" class="form-label mx-2 fw-bolder fs-5">Icon Name</label><br>
					    <input class="form-control" style="width: 340px;" type="text" id="iconname" name="icon" value="<%= sp.getIconName() %>" oninput="updateCounter('iconname')">
					    <span id="iconname-counter" class="counter mx-2">0 characters</span>
	            		<span id="iconname-counter" class="counter">[5 to 30 characters]</span>
					  </div>
					  <div class="my-3">
					    <label for="title" class="form-label mx-2 fw-bolder fs-5">Title</label><br>
					    <input class="form-control" style="width: 340px;" type="text" id="title" name="title" value="<%= sp.getTitle() %>" oninput="updateCounter('title')">
	            		<span id="title-counter" class="counter mx-2">0 characters</span>
	            		<span id="iconname-counter" class="counter">[5 to 18 characters]</span>
					  </div>
					  <div class="my-3">
					    <label for="description" class="form-label mx-2 fw-bolder fs-5">Description</label><br>
					    <textarea class="form-control" style="width: 340px;"  id="description" name="description" oninput="updateCounter('description')"><%= sp.getDescription() %></textarea>
	            		<span id="description-counter" class="counter mx-2">0 characters</span>
	           			<span id="iconname-counter" class="counter">[50 to 100 characters]</span>
					  </div>
					  <div class="text-center">
					  	<button type="submit" class="btn back-color my-2 fs-5 fw-bolder">Update Service</button>
					  </div> 
					</form>
				</div>
				<div class="circle c1"></div>
		        <div class="circle c2"></div>
			</div>
		</div>
	
	<script>
        function updateCounter(inputId) {
            const inputElement = document.getElementById(inputId);
            const counterElement = document.getElementById(inputId + '-counter');
            counterElement.textContent = inputElement.value.length + ' characters';
        }
    </script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>