<%@page import="tech.happy.dao.CommentDaoImp"%>
<%@page import="tech.happy.dao.OrderDao"%>
<%@page import="tech.happy.dao.ContactDaoImp"%>
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
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Add Item</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css" integrity="sha512-5Hs3dF2AEPkpNAR7UiOHba+lRSJNeM2ECkwxUIxC1Q/FLycGTbNapWXB4tP889k5T5Ju8fs4b1P5z/iB4nMfSQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
		<link href="css/admin.css" rel="stylesheet">
    </head>
    <body>
    
    	<header class="back-colors py-4 d-flex justify-content-between align-items-center">
		    <div class="text-center flex-grow-1">
		        <h1 class="fw-bolder font-color m-0">ADD ITEM</h1>           
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
			        	<li><a class="dropdown-item fw-bolder" href="addservice.jsp">Add Service</a></li>
			            <li><a class="dropdown-item fw-bolder" href="readservice.jsp">Read Services</a></li>
			            <li><hr class="dropdown-divider"></li>
			          	<li><a class="dropdown-item fw-bolder text-warning" href="additem.jsp">Add Food</a></li>
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
    
    	
    	<div class="bg-secondary d-flex justify-content-center align-items-center mt-1">
			<div>
				<div style="width:25vw;" class="border mt-2 border-5 border-body rounded shadow-lg p-3 mb-5 bg-body rounded">
					<div>
						<div class="text-center">
							<h2 class="fs-1 fw-bolder font-color">ADD ITEMS</h2>
						</div>
					</div>
					<form action="AddItemServlet" id="myform" method="post" enctype="multipart/form-data" class="mx-2">
					  
					  <div class="my-3">
					  	<div class="row">
					  		<div class="col-4">
					  			<label for="time" class="form-label mx-2 fw-bolder fs-5">Time : </label>
					  		</div>
					  		<div class="col-8">
					  			<select class="form-control  form-select" name="daytime" id="time">
									<option>Breakfast</option>
									<option>Lunch</option>
									<option>Dinner</option>
								</select>
					  		</div>
					  	</div>	    
					  </div>
					  
					  <div class="my-3">
					    <label for="itemname" class="form-label mx-2 fw-bolder fs-5">Item Name : </label><br>
					    <input style="width: 340px;" type="text" required class="form-control" id="itemname" name="itemname" placeholder="Enter Item Name" oninput="updateCounter('itemname')">
	            		<span id="itemname-counter" class="counter mx-2">0 characters</span>
	            		<span id="iconname-counter" class="counter">[2 to 50 characters]</span>
					  </div>
					  
					  <div class="my-3">
					    <label for="itemcontent" class="form-label mx-2 fw-bolder fs-5">Item Content : </label><br>
					    <textarea style="width: 340px;"  required class="form-control" id="itemcontent" name="itemcontent" placeholder="Enter Item Content" oninput="updateCounter('itemcontent')"></textarea>
	            		<span id="itemcontent-counter" class="counter mx-2">0 characters</span>
	           			<span id="iconname-counter" class="counter">[5 to 100 characters]</span>
					  </div>
					  
					  <div class="my-3">
					  	<div class="row">
					  		<div class="col-5">
					  			<label for="itemprice" class="form-label mx-2 fw-bolder fs-5">Item Price: </label><br>
					  		</div>
					  		<div class="col-7">
					  			<input type="number" required class="form-control" id="itemprice" name="itemprice" placeholder="Enter Item Price">
					  		</div>
					  	</div>	    
					  </div>
					  
					  <div class="my-3">
					  	<label for="itemimage" class="form-label mx-2 fw-bolder fs-5">Item Image</label>
					  	<input type="file" class="form-control-file" accept="image/*" id="itemimage" name="itemimage">
					 </div>
					  
					  <div class="text-center">
					  	<button type="submit" class="btn back-color my-2 fs-5 fw-bolder">Add Item</button>
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