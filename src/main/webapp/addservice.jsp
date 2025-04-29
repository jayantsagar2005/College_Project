<%@page import="tech.happy.dao.CommentDaoImp"%>
<%@page import="tech.happy.dao.ContactDaoImp"%>
<%@page import="tech.happy.dao.OrderDao"%>
<%@page import="tech.happy.model.Admin"%>

<%
	Admin check = (Admin) session.getAttribute("adminlogin");

	if(check == null){
		response.sendRedirect("adminlogin.jsp");
		return;
	}
	ContactDaoImp contact = new ContactDaoImp();
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Add Service</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css" integrity="sha512-5Hs3dF2AEPkpNAR7UiOHba+lRSJNeM2ECkwxUIxC1Q/FLycGTbNapWXB4tP889k5T5Ju8fs4b1P5z/iB4nMfSQ==" crossorigin="anonymous" referrerpolicy="no-referrer"/>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<link href="css/admin.css" rel="stylesheet">
		<style>
			  .scrollable-dropdown {
			    max-height: 200px;
			    overflow-y: auto;
			  }
		</style>
	</head>
	<body>
	
		<header class="back-colors py-4 d-flex justify-content-between align-items-center">
		    <div class="text-center flex-grow-1">
		        <h1 class="fw-bolder font-color m-0">ADD SERVICE</h1>           
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
		        <li class="nav-item">
		          <a class="nav-link fs-5 fw-bolder text-white" aria-current="page" href="admin.jsp">Home</a>
		        </li>
		        <%
		        	CommentDaoImp commentDaoImp = new CommentDaoImp();
		        	OrderDao foodOrderDaoImp = new OrderDao();
		        	int pendingOrder = foodOrderDaoImp.pendingOrder((String) session.getAttribute("location"));
		        %>
		        <li class="nav-item">		
		          <a class="nav-link fs-5 fw-bolder text-white" href="readorder.jsp">Read Ordered (<%= pendingOrder %>)</a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link fs-5 fw-bolder text-white" href="ReadMessageServlet">Read Message (<%= contact.unreadCount((String) session.getAttribute("location")) %>)</a>
		        </li>
		        <li class="nav-item">		
			       <a class="nav-link fs-5 fw-bolder text-white" href="readtestimonial.jsp">Read Testimonial (<%= commentDaoImp.pendingCount((String) session.getAttribute("location")) %>)</a>
			    </li>
		        <li class="nav-item dropdown">
			    	<a class="nav-link fs-5 dropdown-toggle fw-bolder text-warning" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
				      	Manage 
				    </a>
				    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
			        	<li><a class="dropdown-item fw-bolder text-warning" href="addservice.jsp">Add Service</a></li>
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
		      <form class="d-flex">
		      	<a href="changepassword.jsp" class="btn btn-outline-dark bg-white font-color mx-3 fw-bolder">Change Password</a>
		        <a href="LogoutServlet" class="btn btn-outline-dark bg-white mx-2 font-color fw-bolder">LogOut</a>
		      </form>
		    </div>
		  </div>
		</nav>
		
		<div class="container-fluid bg-secondary d-flex justify-content-center align-items-center min-vh-100">
		  <div class="col-10 col-sm-8 col-md-6 col-lg-5 col-xl-3">
		    <div class="border border-5 border-body rounded shadow-lg p-4 bg-body">
		      <div class="text-center mb-3">
		        <h2 class="fs-1 fw-bolder font-color">ADD SERVICE</h2>
		      </div>
		
		      <form action="ServiceModuleServlet1" method="post">
		        <!-- Icon Input Section -->
		        <div class="mb-4">
		          <label for="iconname" class="form-label fw-bolder fs-5">Selected Icon:</label>
		          <div class="d-flex">
					  <div style="width: 65%;">
					    <input class="form-control" style="width: 100%" type="text" id="iconname" name="iconname" placeholder="Enter Iconname" oninput="updateCounter('iconname')" readonly>
					  </div>
					  <div class="dropdown ms-3">
					    <button class="btn btn-secondary dropdown-toggle" style="height: 38px;" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
					      Choose Icon
					    </button>
					    <%@include file="iconlist.jsp" %>
					  </div>
					</div>

		          <div class="mt-1">
		            <span id="iconname-counter" class="counter d-block">0 characters</span>
		            <span class="counter">[5 to 30 characters]</span>
		          </div>
		        </div>
		
		        <!-- Title Section -->
		        <div class="mb-4">
		          <label for="title" class="form-label fw-bolder fs-5">Title</label>
		          <input class="form-control" type="text" id="title" name="title" placeholder="Enter Title" oninput="updateCounter('title')">
		          <div class="mt-1">
		            <span id="title-counter" class="counter d-block">0 characters</span>
		            <span class="counter">[5 to 18 characters]</span>
		          </div>
		        </div>
		
		        <!-- Description Section -->
		        <div class="mb-4">
		          <label for="description" class="form-label fw-bolder fs-5">Description</label>
		          <textarea class="form-control" id="description" name="description" placeholder="Enter Description" oninput="updateCounter('description')"></textarea>
		          <div class="mt-1">
		            <span id="description-counter" class="counter d-block">0 characters</span>
		            <span class="counter">[50 to 100 characters]</span>
		          </div>
		        </div>
		
		        <!-- Submit Button -->
		        <div class="text-center">
		          <button type="submit" class="btn back-color my-2 fs-5 fw-bolder">Add Service</button>
		        </div>
		      </form>
		    </div>
		
		    <div class="circle c1"></div>
		    <div class="circle c2"></div>
		  </div>
		</div>
		
		<!-- Script Section -->
		<script>
		  function updateCounter(inputId) {
		    const inputElement = document.getElementById(inputId);
		    const counterElement = document.getElementById(inputId + '-counter');
		    counterElement.textContent = inputElement.value.length + ' characters';
		  }
		
		  function setInput(element) {
		 	const fullClass = element.innerText.trim(); // "fa fa-car"
			const classes = fullClass.split(" ");       // ["fa", "fa-car"]
			const iconClass = classes.find(cls => cls.startsWith("fa-")); // "fa-car"
			    
			const inputElement = document.getElementById("iconname");
			inputElement.value = iconClass || ''; // fallback to empty string if not found
			updateCounter("iconname");
		 }
		</script>
		

	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	</body>
</html>