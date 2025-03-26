<%@page import="tech.happy.model.Admin"%>
<%@page import="tech.happy.dao.CommentDaoImp"%>
<%@page import="tech.happy.dao.FoodOrderDaoImp"%>
<%@page import="tech.happy.dao.ContactDaoImp"%>
<%
	Admin check = (Admin) session.getAttribute("adminlogin");

	if(check == null){
		response.sendRedirect("adminlogin.jsp");
		return;
	}
	
	ContactDaoImp dao = new ContactDaoImp();
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin (Home)</title>
   	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<link href="css/admin.css" rel="stylesheet">
</head>
<body>

	<div>
		<div class="back-colors py-4">
			<div class="text-center">
				<h1 class="fw-bolder font-color">Admin Panel</h1>
 		    	<h2 class="visually-hidden"><%@include file="message.jsp" %>Happy Coder</h2>
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
		          <a class="nav-link active fs-5 fw-bolder text-warning" aria-current="page" href="admin.jsp">Home</a>
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
		          <a class="nav-link fs-5 fw-bolder text-white" href="ReadMessageServlet">Read Message (<%= dao.unreadCount() %>)</a>
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
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	<script type="text/javascript">
		setTimeout(() => {
		    location.reload();
		}, 10000);
	</script>
</body>
</html>