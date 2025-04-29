<%@page import="tech.happy.model.AdminData"%>
<%@page import="tech.happy.dao.AdminDataDao"%>
<%@page import="tech.happy.model.Admin"%>
<%@page import="tech.happy.dao.CommentDaoImp"%>
<%@page import="tech.happy.dao.FoodOrderDaoImp"%>
<%@page import="tech.happy.dao.ContactDaoImp"%>
<%@page import="tech.happy.dao.OrderDao"%>
<%
    Admin check = (Admin) session.getAttribute("adminlogin");
    if(check == null){
        response.sendRedirect("adminlogin.jsp");
        return;
    }

    ContactDaoImp dao = new ContactDaoImp();
%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin (Home)</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css" integrity="sha512-5Hs3dF2AEPkpNAR7UiOHba+lRSJNeM2ECkwxUIxC1Q/FLycGTbNapWXB4tP889k5T5Ju8fs4b1P5z/iB4nMfSQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="css/admin.css" rel="stylesheet">
</head>
<body>

<div class="container-fluid p-0">
    
    <header class="back-colors py-4 d-flex justify-content-between align-items-center">
	    <div class="text-center flex-grow-1">
	        <h1 class="fw-bolder font-color m-0">Admin Panel</h1>           
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
            <button class="navbar-toggler bg-dark" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item d-flex align-items-center">
                        <a class="nav-link active fs-5 fw-bolder text-warning" href="admin.jsp">Home</a>
                    </li>
                    <%
                        CommentDaoImp commentDaoImp = new CommentDaoImp();
                    	OrderDao orderDao = new OrderDao();
                        int pendingOrder = orderDao.pendingOrder((String) session.getAttribute("location"));
                    %>
                    <li class="nav-item d-flex align-items-center">
                        <a class="nav-link fs-5 fw-bolder text-white text-center" href="readorder.jsp">Read Ordered (<%= pendingOrder %>)</a>
                    </li>
                    <li class="nav-item d-flex align-items-center">
                        <a class="nav-link fs-5 fw-bolder text-white text-center" href="ReadMessageServlet">Read Message (<%= dao.unreadCount((String) session.getAttribute("location")) %>)</a>
                    </li>
                    <li class="nav-item d-flex align-items-center">
                        <a class="nav-link fs-5 fw-bolder text-white text-center" href="readtestimonial.jsp">Read Testimonial (<%= commentDaoImp.pendingCount((String) session.getAttribute("location")) %>)</a>
                    </li>
                    <li class="nav-item dropdown d-flex align-items-center">
                        <a class="nav-link fs-5 dropdown-toggle fw-bolder text-white text-center" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown">
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
                <div class="d-flex flex-wrap gap-2 justify-content-center">
                    <a href="changepassword.jsp" class="btn btn-outline-dark bg-white font-color fw-bolder">Change Password</a>
                    <a href="LogoutServlet" class="btn btn-outline-dark bg-white font-color fw-bolder text-center">LogOut</a>
                </div>
            </div>
        </div>
    </nav>
    
    <div class="container-fluid mt-3">
    	<div class="row">
    		<div class="col-9">
    		
    		</div>
    		<div class="col-3">
    		<%
    			AdminDataDao adminDataDao = new AdminDataDao();
    			AdminData list = adminDataDao.getData((String) session.getAttribute("location"));
    		%>
    			<div class="card text-center bg-dark">
                	<div class="text-center mt-2">
                    	<img src="img/<%=list.getImage() %>" alt="profile pic" class="img-fluid profile-img" style="border-radius:50%;" >
                    </div>
                    <div class="card-body text-white">
                        <h4>Location:<i class="fa-solid fa-location-dot ms-2 fs-5"></i> <%= list.getLocation() %></h4>
                        <p class="fw-bold">Admin Id : <%= list.getAdminId() %> </p>
                    	<p class="fw-bold"> Name : <%= list.getUsername() %></p>
                        <p class="fw-bold">G-mail : <%= list.getGmail() %></p>
                    </div>
                    <div class="mb-2">
                    	<button class="btn bg-warning fw-bolder mx-2">Edit</button>
                    	<a href="LogoutServlet" class="btn bg-warning fw-bolder mx-2">Logout</a>
                    </div>
                </div>
    		</div>
    	</div>
    </div>
    
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
    setTimeout(() => {
        location.reload();
    }, 10000);
</script>
</body>
</html>
