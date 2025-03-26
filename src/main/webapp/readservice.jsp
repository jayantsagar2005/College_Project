<%@page import="tech.happy.dao.ServiceDaoImp"%>
<%@page import="tech.happy.dao.CommentDaoImp"%>
<%@page import="java.util.ArrayList"%>
<%@page import="tech.happy.dao.ContactDaoImp"%>
<%@page import="tech.happy.dao.FoodOrderDaoImp"%>
<%@page import="tech.happy.model.ServicePojo"%>
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
	<title>Read Service</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">	
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet"/>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link href="css/admin.css" rel="stylesheet">	
</head>
<body style="background-color: white;">
	<div>
		<div class="back-colors py-4">
			<div class="text-center">
				<h1 class="fw-bolder font-color">Read Service</h1>
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
	
		<div class="container-xxl py-5">
            <div class="container">
                <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                    <h5 class="section-title ff-secondary text-center text-primary fw-normal">Read Services</h5>
                    <h1 class="mb-5">Explore Our Services</h1>
                </div>
                <div class="row g-4">                	
                	<%
                		String msg = (String) session.getAttribute("msg");
                		if(msg == null){ 
                			ServiceDaoImp serviceDaoImp = new ServiceDaoImp();
                			ArrayList<ServicePojo> list = serviceDaoImp.readService();                 	
                			int index = 0;
                			for(ServicePojo sp : list){              			
                	%>   
		                    	<div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.1s">
		                        	<div class="rounded" style="background-color: #0F172B;">
		                            	<div class="pt-4 px-4">
		                                	<i class="fa fa-3x <%= sp.getIconName() %> text-primary mb-4"></i>
		                                	<h5 class="text-white"><%= sp.getTitle() %></h5>
		                                	<p class="text-white"><%= sp.getDescription() %></p>
		                                	<small class="text-white"><%= sp.getDate() %></small>
		                            	</div>
		                            	<div class="d-flex py-2 mx-2">
				    						<form action="DeleteServiceServlet" method="post">
								    			<input type="hidden" name="sno" value="<%= sp.getSno() %>">
								    			<button class="btn btn-primary fw-bolder">Delete</button>
								    		</form> 
								    		<form action="updateservice.jsp?index=<%= index %>" method="post" class="formbtn ms-2">
								    			<input type="hidden" name="sno" value="<%= sp.getSno() %>">
								    			<button class="btn btn-primary fw-bolder">Update</button>
					    					</form>
				    					</div>
		                        	</div>
		                    	</div>       
                    <%
                    			index++;
                			}
                		}else{
                    %>                   
                    	<h3 style="color:red; text-align:center;"> <%= msg %></h3>
                    <%
                		}                    
                    %>
                </div>
            </div>
        </div>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>