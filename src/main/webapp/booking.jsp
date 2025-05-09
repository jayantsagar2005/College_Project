<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Booking</title>
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
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css" integrity="sha512-5Hs3dF2AEPkpNAR7UiOHba+lRSJNeM2ECkwxUIxC1Q/FLycGTbNapWXB4tP889k5T5Ju8fs4b1P5z/iB4nMfSQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	

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
			                <a href="about.jsp" class="nav-item nav-link">About</a>
			                <a href="service.jsp" class="nav-item nav-link">Service</a>
			                <a href="menu.jsp" class="nav-item nav-link">Menu</a>
			                <div class="nav-item dropdown">
			                	<a href="#" class="nav-link dropdown-toggle active" data-bs-toggle="dropdown">Pages</a>
			                	<div class="dropdown-menu m-0">
			                    	<a href="booking.jsp" class="dropdown-item active">Booking</a>
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
                    <h1 class="display-3 text-white mb-3 animated slideInDown">Booking</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center text-uppercase">
                            <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
                            <li class="breadcrumb-item"><a href="#">Pages</a></li>
                            <li class="breadcrumb-item text-white active" aria-current="page">Booking</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
        <!-- Navbar & Hero End -->


        <!-- Reservation Start -->
        <div class="container-xxl py-5 px-0 wow fadeInUp" data-wow-delay="0.1s">
            <div class="row g-0">
                <div class="col-md-6">
                    <div class="video">
                        <button type="button" class="btn-play" data-bs-toggle="modal" data-src="https://www.youtube.com/embed/rI8FOLA-9XM?si=yu978Y0SjsuFCz-u" data-bs-target="#videoModal">
                            <span></span>
                        </button>
                    </div>
                </div>
                <div class="col-md-6 bg-dark d-flex align-items-center">
                    <div class="p-5 wow fadeInUp" data-wow-delay="0.2s">
                        <h5 class="section-title ff-secondary text-start text-primary fw-normal">Reservation</h5>
                        <h1 class="text-white mb-4">Book A Table Online</h1>
                        <form action="FoodOrderServlet1" method="post">
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="name" name="name" placeholder="Your Name">
                                        <label for="name">Your Name</label>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-floating">
                                        <input type="email" class="form-control" name="gmail" id="email" placeholder="Your Email">
                                        <label for="email">Your Email</label>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-floating date" id="date3" data-target-input="nearest">
                                        <input type="text" name="dateTime" class="form-control datetimepicker-input" id="datetime" placeholder="Date & Time" data-target="#date3" data-toggle="datetimepicker" />
                                        <label for="datetime">Date & Time</label>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-floating">
                                        <input type="number" class="form-control" name="tableno" id="tableno" placeholder="Our table number">
                                        <label for="tableno">Table No.</label>
                                    </div>
                                </div>
                                <div class="col-12 text-center mt-2">
								  <button type="button" onclick="storeSessionData()" class="btn btn-outline-primary mt-3">
									  Choose Food
								  </button>
								  <!-- Hidden input for passing selected order -->
								  <input type="hidden" name="foodOrder" id="foodOrderData">
								</div>

                                <%
                                	String str = (String) session.getAttribute("msg");
                                    if(str != null){   		
                                %>
                                		<h5 style="text-align:center;"><%@include file="message.jsp" %></h5>
                                <%
                                    }
                                %>
                                
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="videoModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content rounded-0">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Youtube Video</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <!-- 16:9 aspect ratio -->
                        <div class="ratio ratio-16x9">
                            <iframe class="embed-responsive-item" src="" id="video" allowfullscreen allowscriptaccess="always"
                                allow="autoplay"></iframe>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Reservation end -->
        
        <!-- choose food modal start  -->      	
        	<%@ include file="itemmodal.jsp" %>
        <!-- choose food modal end  -->
             

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

    <!-- Template Javascript -->
    	<script src="js/main.js"></script>
    	<script src="js/itemorder.js"></script>
</body>

</html>