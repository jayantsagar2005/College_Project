<!DOCTYPE html>
<%@page import="tech.happy.dao.TeamDaoImp"%>
<%@page import="tech.happy.model.TeamPojo"%>
<%@page import="java.util.ArrayList"%>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>About</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Nunito:wght@600;700;800&family=Pacifico&display=swap" rel="stylesheet">

    <!-- Icon Font Style Sheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css" integrity="sha512-5Hs3dF2AEPkpNAR7UiOHba+lRSJNeM2ECkwxUIxC1Q/FLycGTbNapWXB4tP889k5T5Ju8fs4b1P5z/iB4nMfSQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    
    <!-- Libraries Style Sheet -->
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Style Sheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Style Sheet -->
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
				    	<h1 class="text-primary m-2"><i class="fa fa-utensils me-3"></i>HAPPY' POINT</h1>	    	
				    	<p id="branchName">
						    <i class="fa-solid fa-location-dot mx-2"></i>
						    <%= (String) session.getAttribute("location") != null ? session.getAttribute("location") : "Location not set" %>
						</p>
				    </a>
				    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
				    	<span class="fa fa-bars"></span>
				    </button>
				    <div class="collapse navbar-collapse" id="navbarCollapse">
				    	<div class="navbar-nav ms-auto py-0 pe-4">
				        	<a href="index.jsp" class="nav-item nav-link">Home</a>
			                <a href="about.jsp" class="nav-item nav-link active">About</a>
			                <a href="service.jsp" class="nav-item nav-link">Service</a>
			                <a href="menu.jsp" class="nav-item nav-link">Menu</a>
			                <div class="nav-item dropdown">
			                	<a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Pages</a>
			                	<div class="dropdown-menu m-0">
			                    	<a href="booking.jsp" class="dropdown-item">Booking</a>
			                        <a href="team.jsp" class="dropdown-item">Our Team</a>
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
                    <h1 class="display-3 text-white mb-3 animated slideInDown">About Us</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center text-uppercase">
                            <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
                            <li class="breadcrumb-item"><a href="#">Pages</a></li>
                            <li class="breadcrumb-item text-white active" aria-current="page">About</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
        <!-- Navbar & Hero End -->


        <!-- About Start -->
        <div class="container-xxl py-5">
            <div class="container">
                <div class="row g-5 align-items-center">
                    <div class="col-lg-6">
                        <div class="row g-3">
                            <div class="col-6 text-start">
                                <img class="img-fluid rounded w-100 wow zoomIn" data-wow-delay="0.1s" src="img/download (3).png">
                            </div>
                            <div class="col-6 text-start">
                                <img class="img-fluid rounded w-75 wow zoomIn" data-wow-delay="0.3s" src="img/download (2).png" style="margin-top: 25%;">
                            </div>
                            <div class="col-6 text-end">
                                <img class="img-fluid rounded w-75 wow zoomIn" data-wow-delay="0.5s" src="img/download (1).png">
                            </div>
                            <div class="col-6 text-end">
                                <img class="img-fluid rounded w-100 wow zoomIn" data-wow-delay="0.7s" src="img/download (4).png">
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <h5 class="section-title ff-secondary text-start text-primary fw-normal">About Us</h5>
                        <h1 class="mb-4">Welcome to <i class="fa fa-utensils text-primary me-2"></i>Happy' Point</h1>
                        <p class="mb-4">Welcome to Happy' Point, where we take pride in delivering an exceptional dining experience. Our restaurant is designed to provide a warm and inviting atmosphere, perfect for family dinners, romantic evenings, or casual gatherings with friends. Each dish is crafted with care, using the finest ingredients to ensure both quality and flavor. From appetizers to desserts, every bite is a blend of creativity and tradition that aims to satisfy your cravings.</p>
                        <p class="mb-4">At Happy' Point, we believe food is more than just a meal—it’s an experience. Our diverse menu offers something for everyone, whether you're a fan of classic comfort food or adventurous culinary creations. Paired with excellent service and a relaxing environment, we strive to make every visit memorable. Join us at Happy' Point, where great food and wonderful memories are always on the menu.</p><div class="row g-4 mb-4">
                            <div class="col-sm-6">
                                <div class="d-flex align-items-center border-start border-5 border-primary px-3">
                                    <h1 class="flex-shrink-0 display-5 text-primary mb-0" data-toggle="counter-up">15</h1>
                                    <div class="ps-4">
                                        <p class="mb-0">Years of</p>
                                        <h6 class="text-uppercase mb-0">Experience</h6>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="d-flex align-items-center border-start border-5 border-primary px-3">
                                    <h1 class="flex-shrink-0 display-5 text-primary mb-0" data-toggle="counter-up">50</h1>
                                    <div class="ps-4">
                                        <p class="mb-0">Popular</p>
                                        <h6 class="text-uppercase mb-0">Master Chefs</h6>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- <a class="btn btn-primary py-3 px-5 mt-2" href="">Read More</a> -->
                    </div>
                </div>
            </div>
        </div>
        <!-- About End -->


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
                		ArrayList<TeamPojo> teamList = dao.fourMember((String) session.getAttribute("location"));
                		if(teamList.size() != 0){
                			for(int i=0; i<teamList.size(); i++){	
                	%>
		                    	<div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
			                        <div class="team-item text-center rounded overflow-hidden">
			                            <div class="rounded-circle overflow-hidden m-4">
			                                <%
			                            		if(teamList.get(i).getMemberImage().isEmpty()){
			                            	%>		
			                            			<img class="img-fluid  rounded-circle" style="height:252px; width:250px" src="TeamImages/th (13).jpeg" alt="">
			                            	<% 	
			                            		}else{
			                            	%>			
			                            			<img class="img-fluid  rounded-circle" style="height:252px; width:250px" src="TeamImages/<%= teamList.get(i).getMemberImage() %>" alt="">
			                            	<% 	
			                            		}
			                            	%>
			                            </div>
			                            <h5 class="mb-0"><%= teamList.get(i).getMemberName() %></h5>
			                            <small><%= teamList.get(i).getMemberDesignation() %></small>
			                            <div class="d-flex justify-content-center mt-3">
			                                <a class="btn btn-square btn-primary mx-1" target="_blank" href="<%= teamList.get(i).getFacebook() %>"><i class="fab fa-linkedin"></i></a>
			                                <a class="btn btn-square btn-primary mx-1" target="_blank" href="<%= teamList.get(i).getTwitter() %>"><i class="fab fa-twitter"></i></a>
			                                <a class="btn btn-square btn-primary mx-1" target="_blank" href="<%= teamList.get(i).getInstagram() %>"><i class="fab fa-instagram"></i></a>
			                            </div>
			                        </div>
			                    </div>                  
	                <%	        		
                			}
                		}else{
	                %>
	                		<h3 class="text-center">Present time not work any member</h3>
	                <%
                		}
	                %>                  
                </div>
            </div>
        </div>
        <a class="btn btn-primary  py-3 px-5 mt-2" href="team.jsp" style="margin-left:42%;">All Master Chefs</a>
        <!-- Team End -->
        

        <!-- Footer Start -->
        	<%@include file="footer.jsp" %>
        <!-- Footer End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    

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

    <!-- Template Java Script -->
    <script src="js/main.js"></script>
</body>

</html>