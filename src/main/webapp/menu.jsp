<!DOCTYPE html>
<%@page import="tech.happy.dao.AddItemDaoImp"%>
<%@page import="tech.happy.model.ItemPojo"%>
<%@page import="java.util.ArrayList"%>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Menu</title>
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
			                <a href="menu.jsp" class="nav-item nav-link active">Menu</a>
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
                    <h1 class="display-3 text-white mb-3 animated slideInDown">Food Menu</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center text-uppercase">
                            <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
                            <li class="breadcrumb-item"><a href="#">Pages</a></li>
                            <li class="breadcrumb-item text-white active" aria-current="page">Menu</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
        <!-- Navbar & Hero End -->


        <!-- Menu Start -->
        <div class="container-xxl py-5">
            <div class="container">
                <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                    <h5 class="section-title ff-secondary text-center text-primary fw-normal">Food Menu</h5>
                    <h1 class="mb-5">Most Popular Items</h1>
                </div>
                <div class="tab-class text-center wow fadeInUp" data-wow-delay="0.1s">
                    <ul class="nav nav-pills d-inline-flex justify-content-center border-bottom mb-5">
                        <li class="nav-item">
                            <a class="d-flex align-items-center text-start mx-3 ms-0 pb-3 active" data-bs-toggle="pill" href="#tab-1">
                                <i class="fa fa-coffee fa-2x text-primary"></i>
                                <div class="ps-3">
                                    <small class="text-body">Popular</small>
                                    <h6 class="mt-n1 mb-0">Breakfast</h6>
                                </div>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="d-flex align-items-center text-start mx-3 pb-3" data-bs-toggle="pill" href="#tab-2">
                                <i class="fa fa-hamburger fa-2x text-primary"></i>
                                <div class="ps-3">
                                    <small class="text-body">Special</small>
                                    <h6 class="mt-n1 mb-0">Launch</h6>
                                </div>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="d-flex align-items-center text-start mx-3 me-0 pb-3" data-bs-toggle="pill" href="#tab-3">
                                <i class="fa fa-utensils fa-2x text-primary"></i>
                                <div class="ps-3">
                                    <small class="text-body">Lovely</small>
                                    <h6 class="mt-n1 mb-0">Dinner</h6>
                                </div>
                            </a>
                        </li>
                    </ul>
                                      
                    <div class="tab-content">
                        <div id="tab-1" class="tab-pane fade show p-0 active">
                            <div class="row g-4">   
                            <%
                            	AddItemDaoImp addItemDaoImp = new AddItemDaoImp();
                            	ArrayList<ItemPojo> list = addItemDaoImp.getItem("Breakfast", (String) session.getAttribute("location"));
                            	
                            	if(list.size() != 0){
                            		 for(int i=0; i<list.size(); i++){
                            %>			  
                            			 <div class="col-lg-6">
	                                         <div class="d-flex align-items-center">
	                                             <img class="flex-shrink-0 img-fluid rounded" src="images/<%= list.get(i).getItemImage() %>" alt="" style="width: 80px;">
	                                             <div class="w-100 d-flex flex-column text-start ps-4">
	                                                 <h5 class="d-flex justify-content-between border-bottom pb-2">
	                                                     <span><%= list.get(i).getItemName() %></span>
	                                                     <span class="text-primary"><i class="fa fa-indian-rupee-sign text-primary px-1"></i><%= list.get(i).getItemPrice() %></span>
	                                                 </h5>
	                                                 <small class="fst-italic"><%= list.get(i).getItemContentString() %></small>
	                                             </div>
	                                         </div>
	                                     </div>
                           <%                                    			 
                            		 }
                            	}else{                            
    	                    %> 
                            		<h3>No Any Item Added</h3>
                            <%
                            	}
                            %>                                              
                            </div>
                        </div>     
                                                 
                        <div id="tab-2" class="tab-pane fade show p-0">
                            <div class="row g-4">
                                <%       
	                            	ArrayList<ItemPojo> list1 = addItemDaoImp.getItem("Lunch", (String) session.getAttribute("location"));                    	
	                            	if(list1.size() != 0){
	                            		 for(int i=0; i<list1.size(); i++){
	                            %>			  
	                            			 <div class="col-lg-6">
		                                         <div class="d-flex align-items-center">
		                                             <img class="flex-shrink-0 img-fluid rounded" src="images/<%= list1.get(i).getItemImage() %>" alt="" style="width: 80px;">
		                                             <div class="w-100 d-flex flex-column text-start ps-4">
		                                                 <h5 class="d-flex justify-content-between border-bottom pb-2">
		                                                     <span><%= list1.get(i).getItemName() %></span>
		                                                     <span class="text-primary"><i class="fa fa-indian-rupee-sign text-primary px-1"></i><%= list1.get(i).getItemPrice() %></span>
		                                                 </h5>
		                                                 <small class="fst-italic"><%= list1.get(i).getItemContentString() %></small>
		                                             </div>
		                                         </div>
		                                     </div>
	                           <%                                    			 
	                            		 }
	                            	}else{                            
	                            %> 
	                            		<h3>No Any Item Added</h3>
	                            <%
	                            	}
	                            %>                             
	                            </div>
	                        </div>
                                               
                        <div id="tab-3" class="tab-pane fade show p-0">
                            <div class="row g-4">
                                <%       
	                            	ArrayList<ItemPojo> list2 = addItemDaoImp.getItem("Dinner", (String) session.getAttribute("location"));                    	
	                            	if(list2.size() != 0){
	                            		 for(int i=0; i<list2.size(); i++){
	                            %>			  
	                            			 <div class="col-lg-6">
		                                         <div class="d-flex align-items-center">
		                                             <img class="flex-shrink-0 img-fluid rounded" src="images/<%= list2.get(i).getItemImage() %>" alt="" style="width: 80px;">
		                                             <div class="w-100 d-flex flex-column text-start ps-4">
		                                                 <h5 class="d-flex justify-content-between border-bottom pb-2">
		                                                     <span><%= list2.get(i).getItemName() %></span>
		                                                     <span class="text-primary"><i class="fa fa-indian-rupee-sign text-primary px-1"></i><%= list2.get(i).getItemPrice() %></span>
		                                                 </h5>
		                                                 <small class="fst-italic"><%= list2.get(i).getItemContentString() %></small>
		                                             </div>
		                                         </div>
		                                     </div>
	                           <%                                   			 
	                            		 }
	                            	}else{                            
	                            %> 
	                            		<h3>No Any Item Added</h3>
	                            <%
	                            	}
	                            %>                               
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Menu End -->
        

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