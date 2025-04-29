<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="tech.happy.model.ServicePojo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="tech.happy.dao.ServiceDaoImp"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Service</title>
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

	<%
		String check = (String) session.getAttribute("check");
		if(check == null){
	
	%>

	<form action="ReadServiceModuleServlet" method="post">
		<input id="submitbutton" style="display:none;" type="submit" value="submit" >
	</form>
	
	<script type="text/javascript"> 
		window.onload=function(){
			document.getElementById('submitbutton').click();
		};
	</script>
	
	
	<%  
		   return;
		}
		session.removeAttribute("check");
	%>

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
			                <a href="service.jsp" class="nav-item nav-link active">Service</a>
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
                    <h1 class="display-3 text-white mb-3 animated slideInDown">Services</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center text-uppercase">
                            <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
                            <li class="breadcrumb-item"><a href="#">Pages</a></li>
                            <li class="breadcrumb-item text-white active" aria-current="page">Service</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
        <!-- Navbar & Hero End -->


        <!-- Service Start -->
        <div class="container-xxl py-5">
            <div class="container">
                <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                    <h5 class="section-title ff-secondary text-center text-primary fw-normal">Our Services</h5>
                    <h1 class="mb-5">Explore Our Services</h1>
                </div>
                <div class="row g-4">                	
                	<%
                		String msg = (String) session.getAttribute("msg");
                		if(msg == null){ 
                			ServiceDaoImp serviceDaoImp = new ServiceDaoImp();
                			ArrayList<ServicePojo> list = serviceDaoImp.readService((String) session.getAttribute("location"));                 	
                			int index = 0;
                			for(ServicePojo sp : list){              			
                	%>                   	
                				<div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.1s">
		                        	<div class="service-item rounded pt-3">
		                            	<div class="p-4">
		                                	<i class="fa fa-3x <%= sp.getIconName() %> text-primary mb-4"></i>
		                                	<h5><%= sp.getTitle() %></h5>
		                                	<p><%= sp.getDescription() %></p>
		                            	</div>
		                        	</div>
		                    	</div>		                    	       
                    <%
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
        <!-- Service End -->
        
        						
        

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