<!DOCTYPE html>
<%@page import="tech.happy.dao.TeamDaoImp"%>
<%@page import="tech.happy.model.TeamPojo"%>
<%@page import="java.util.ArrayList"%>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Team</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Nunito:wght@600;700;800&family=Pacifico&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
</head>

<body>
    <div class="container-fluid bg-white p-0">
        <!-- Spinner Start -->
        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        <!-- Spinner End -->


        <!-- Navbar & Hero Start -->
        	<div class="container-fluid position-relative p-0">
				<nav class="navbar navbar-expand-lg navbar-dark bg-dark px-4 px-lg-5 py-3 py-lg-0">
				    <a href="" class="navbar-brand p-0">
				    	<h1 class="text-primary m-0"><i class="fa fa-utensils me-3"></i>HAPPY' POINT</h1>
				    </a>
				    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
				    	<span class="fa fa-bars"></span>
				    </button>
				    <div class="collapse navbar-collapse" id="navbarCollapse">
				    	<div class="navbar-nav ms-auto py-0 pe-4">
				        	<a href="index.jsp" class="nav-item nav-link">Home</a>
			                <a href="about.jsp" class="nav-item nav-link">About</a>
			                <a href="service.jsp" class="nav-item nav-link">Service</a>
			                <a href="menu.jsp" class="nav-item nav-link">Menu</a>
			                <div class="nav-item dropdown">
			                	<a href="#" class="nav-link dropdown-toggle active" data-bs-toggle="dropdown">Pages</a>
			                	<div class="dropdown-menu m-0">
			                    	<a href="booking.jsp" class="dropdown-item">Booking</a>
			                        <a href="team.jsp" class="dropdown-item active">Our Team</a>
			                        <a href="testimonial.jsp" class="dropdown-item">Testimonial</a>
			                   	</div>
			               	</div>
			                <a href="contact.jsp" class="nav-item nav-link">Contact</a>
			            </div>
			            <a href="booking.jsp" class="btn btn-primary py-2 px-4">Book A Table</a>
			       </div>
			    </nav>
			</div>
        	<div class="container-fluid py-5 bg-dark hero-header mb-5">
                <div class="container text-center my-5 pt-5 pb-4">
                    <h1 class="display-3 text-white mb-3 animated slideInDown">Our Team</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center text-uppercase">
                            <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
                            <li class="breadcrumb-item"><a href="#">Pages</a></li>
                            <li class="breadcrumb-item text-white active" aria-current="page">Team</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
        <!-- Navbar & Hero End -->


        <!-- Team Start -->
        <div class="container-xxl pt-5 pb-3">
            <div class="container">
                <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                    <h5 class="section-title ff-secondary text-center text-primary fw-normal">Team Members</h5>
                    <h1 class="mb-5">Our Master Chefs</h1>
                </div>
                <div class="row g-4">
                	<%
                		TeamDaoImp dao = new TeamDaoImp();
                		ArrayList<TeamPojo> list = dao.getMember();
                		if(list.size() != 0){
                			for(int i=0; i<list.size(); i++){	
                	%>
		                    	<div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
			                        <div class="team-item text-center rounded overflow-hidden">
			                            <div class="rounded-circle overflow-hidden m-4">
			                            	<%
			                            		if(list.get(i).getMemberImage().isEmpty()){
			                            	%>		
			                            			<img class="img-fluid  rounded-circle" style="height:252px; width:250px" src="TeamImages/th (13).jpeg" alt="">
			                            	<% 	
			                            		}else{
			                            	%>			
			                            			<img class="img-fluid  rounded-circle" style="height:252px; width:250px" src="TeamImages/<%= list.get(i).getMemberImage() %>" alt="">
			                            	<% 	
			                            		}
			                            	%>		                                
			                            </div>
			                            <h5 class="mb-0"><%= list.get(i).getMemberName() %></h5>
			                            <small><%= list.get(i).getMemberDesignation() %></small>
			                            <div class="d-flex justify-content-center mt-3">
			                                <a class="btn btn-square btn-primary mx-1" target="_blank" href="<%= list.get(i).getFacebook() %>"><i class="fab fa-linkedin"></i></a>
			                                <a class="btn btn-square btn-primary mx-1" target="_blank" href="<%= list.get(i).getTwitter() %>"><i class="fab fa-twitter"></i></a>
			                                <a class="btn btn-square btn-primary mx-1" target="_blank" href="<%= list.get(i).getInstagram() %>"><i class="fab fa-instagram"></i></a>
			                            </div>
			                        </div>
			                    </div>                  
	                <%	        		
                			}
                		}else{
	                %>
	                		<h3>Present time not work any member</h3>
	                <%
                		}
	                %>
                </div>
            </div>
        </div>
        <!-- Team End -->
        

        <!-- Footer Start -->
        	<%@include file="footer.jsp" %>
        <!-- Footer End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/counterup/counterup.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/tempusdominus/js/moment.min.js"></script>
    <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>

</html>