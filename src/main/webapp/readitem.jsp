<%@page import="tech.happy.dao.CommentDaoImp"%>
<%@page import="tech.happy.model.ItemPojo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="tech.happy.dao.AddItemDaoImp"%>
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css" integrity="sha512-5Hs3dF2AEPkpNAR7UiOHba+lRSJNeM2ECkwxUIxC1Q/FLycGTbNapWXB4tP889k5T5Ju8fs4b1P5z/iB4nMfSQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link href="css/admin.css" rel="stylesheet">
	
</head>
<body style="background-color: white;">

	<div>
		<div class="back-colors py-4">
			<div class="text-center">
				<h1 class="fw-bolder font-color">Read Items</h1>
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
			            <li><a class="dropdown-item fw-bolder" href="ReadServiceServlet">Read Services</a></li>
			            <li><hr class="dropdown-divider"></li>
			          	<li><a class="dropdown-item fw-bolder" href="additem.jsp">Add Food</a></li>
			            <li><a class="dropdown-item fw-bolder text-warning" href="readitem.jsp">Read Foods</a></li>
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
		AddItemDaoImp addItemDaoImp = new AddItemDaoImp();		
	%>
	
	
	<div class="py-5">
		<div class="text-center wow fadeInUp" data-wow-delay="0.1s">
        	<h5 class="section-title ff-secondary text-center text-primary fw-normal">Read Food Menu</h5>
            <h1 class="mb-3">Most Popular Items</h1>
        </div>
		<div class="row">
			<div class="col-4 my-2">
				<h2 class="text-center text-warning fw-bolder" style="text-decoration: underline #0F172B;">Break Fast</h2>
				<div class="row">
					<div class="col-12">
						<%
							ArrayList<ItemPojo> list = addItemDaoImp.getItem("Break Fast");
							if(list.size() != 0){
								for(int i=0; i<list.size(); i++){					
						%>
									<div class="card mx-1 my-2 back-colors">
										<div class="d-flex card-body">
											<div>
												<img src="images/<%= list.get(i).getItemImage() %>" class="card-img-top" alt="" style="width: 150px; height: 120px;">
												<h5 class="card-title text-white fw-bolder text-center mt-2"><i class="fa fa-indian-rupee-sign px-1"></i><%= list.get(i).getItemPrice() %></h5>
											</div>
											<div class="mx-2">
												<h4 class="card-title text-warning fw-bolder"><%= list.get(i).getItemName() %></h4>
												<p class="card-text text-white"><%= list.get(i).getItemContentString() %></p>
											</div>
										</div>
										<div class="d-flex justify-content-between ms-3"> 
											<div>
												<small class="text-white fw-bolder"><%= list.get(i).getDateTime() %></small>
											</div>
											<div class="d-flex justify-content-end mb-2">
					    						<form action="DeleteItemServlet" method="post" class="formbtn">
									    			<input type="hidden" name="sno" value="<%= list.get(i).getItemNo() %>">
									    			<button class="btn bg-white text-warning fw-bolder">Delete</button>
									    		</form> 
									    		<form action="updateitem.jsp" method="post" class="formbtn mx-3">
									    			<input type="hidden" name="sno" value="<%= list.get(i).getItemNo() %>">
									    			<button class="btn bg-white text-warning fw-bolder">Update</button>
						    					</form>
					    					</div>
										</div>
									</div>
						<%
								}
							}
						%>				
					</div>
				</div>
			</div>
			<div class="col-4 my-2">
				<h2 class="text-center text-warning fw-bolder" style="text-decoration: underline #0F172B;">Lunch</h2>
				<div class="row">
					<div class="col-12">
						<%
							ArrayList<ItemPojo> list1 = addItemDaoImp.getItem("Lunch");
							if(list1.size() != 0){
								for(int i=0; i<list1.size(); i++){					
						%>
									<div class="card mx-1 my-2 back-colors">
										<div class="d-flex card-body">
											<div>
												<img src="images/<%= list1.get(i).getItemImage() %>" class="card-img-top" alt="" style="width: 150px; height: 120px;">
												<h5 class="card-title text-white fw-bolder text-center mt-3"><i class="fa fa-indian-rupee-sign px-1"></i><%= list1.get(i).getItemPrice() %></h5>
											</div>
											<div class="mx-2">
												<h4 class="card-title text-warning fw-bolder"><%= list1.get(i).getItemName() %></h4>
												<p class="card-text text-white"><%= list1.get(i).getItemContentString() %></p>
											</div>
										</div>
										<div class="d-flex justify-content-between ms-3"> 
											<div>
												<small class="text-white fw-bolder"><%= list1.get(i).getDateTime() %></small>
											</div>
											<div class="d-flex justify-content-end mb-2">
					    						<form action="DeleteItemServlet" method="post" class="formbtn">
									    			<input type="hidden" name="sno" value="<%= list1.get(i).getItemNo() %>">
									    			<button class="btn bg-white text-warning fw-bolder">Delete</button>
									    		</form> 
									    		<form action="updateitem.jsp" method="post" class="formbtn mx-3">
									    			<input type="hidden" name="sno" value="<%= list1.get(i).getItemNo() %>">
									    			<button class="btn bg-white text-warning fw-bolder">Update</button>
						    					</form>
					    					</div>
										</div>
									</div>
						<%
								}
							}
						%>				
					</div>
				</div>
			</div>
			<div class="col-4 my-2">
				<h2 class="text-center text-warning fw-bolder" style="text-decoration: underline #0F172B;">Dinner</h2>
				<div class="row">
					<div class="col-12">
						<%
							ArrayList<ItemPojo> list2 = addItemDaoImp.getItem("Dinner");
							if(list2.size() != 0){
								for(int i=0; i<list2.size(); i++){					
						%>
									<div class="card mx-1 my-2 back-colors">
										<div class="d-flex card-body">
											<div>
												<img src="images/<%= list2.get(i).getItemImage() %>" class="card-img-top" alt="" style="width: 150px; height: 120px;">
												<h5 class="card-title text-white fw-bolder text-center mt-3"><i class="fa fa-indian-rupee-sign px-1"></i><%= list2.get(i).getItemPrice() %></h5>
											</div>
											<div class="mx-2">
												<h4 class="card-title text-warning fw-bolder"><%= list2.get(i).getItemName() %></h4>
												<p class="card-text text-white"><%= list2.get(i).getItemContentString() %></p>
											</div>
										</div> 
										<div class="d-flex justify-content-between ms-3"> 
											<div>
												<small class="text-white fw-bolder"><%= list2.get(i).getDateTime() %></small>
											</div>
											<div class="d-flex justify-content-end mb-2">
					    						<form action="DeleteItemServlet" method="post" class="formbtn">
									    			<input type="hidden" name="sno" value="<%= list2.get(i).getItemNo() %>">
									    			<button class="btn bg-white text-warning fw-bolder">Delete</button>
									    		</form> 
									    		<form action="updateitem.jsp" method="post" class="formbtn mx-3">
									    			<input type="hidden" name="sno" value="<%= list2.get(i).getItemNo() %>">
									    			<button class="btn bg-white text-warning fw-bolder">Update</button>
						    					</form>
					    					</div>
										</div>
										
									</div>
						<%
								}
							}
						%>				
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>