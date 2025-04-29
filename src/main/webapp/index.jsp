<%@page import="tech.happy.model.CommentPojo"%>
<%@page import="tech.happy.dao.CommentDaoImp"%>
<%@page import="tech.happy.dao.ServiceDaoImp"%>
<%@page import="tech.happy.model.ServicePojo"%>
<%@page import="tech.happy.dao.AddItemDaoImp"%>
<%@page import="tech.happy.model.ItemPojo"%>
<%@page import="tech.happy.dao.TeamDaoImp"%>
<%@page import="tech.happy.model.TeamPojo"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Index</title>
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
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">   
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    

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

	<form action="ReadFourServiceServlet" method="post">
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
				    	<h1 class="text-primary mt-2 md-0"><i class="fa fa-utensils me-3"></i>HAPPY' POINT</h1>	    	
						<div style="display: flex; align-items: center;" class="md-2">
						    <i class="fa-solid fa-location-dot mx-2 mb-2"></i>
						    <div id="locationDisplay" class="mb-2 fw-bolder"><%= (String) session.getAttribute("location") %></div>
						</div>
				    </a>
				    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
				    	<span class="fa fa-bars"></span>
				    </button>
				    <div class="collapse navbar-collapse" id="navbarCollapse">
				    	<div class="navbar-nav ms-auto py-0 pe-4">
				        	<a href="index.jsp" class="nav-item nav-link active">Home</a>
			                <a href="about.jsp" class="nav-item nav-link">About</a>
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
                <div class="container my-5 py-5">
                    <div class="row align-items-center g-5">
                        <div class="col-lg-6 text-center text-lg-start">
                            <h1 class="display-3 text-white animated slideInLeft">Enjoy Our<br>Delicious Meal</h1>
                            <p class="text-white animated slideInLeft mb-4 pb-2">At our restaurant, enjoy a delicious meal crafted with the finest ingredients. Experience rich flavors, quality service, and a cozy atmosphere that makes every dining moment truly special.</p>
                            <a href="booking.jsp" class="btn btn-primary py-sm-3 px-sm-5 me-3 animated slideInLeft">Book A Table</a>
                        </div>
                        <div class="col-lg-6 text-center text-lg-end overflow-hidden">
                            <img class="img-fluid rounded-circle" src="img/roimg (1).png" alt="">
                        </div>
                    </div>
                </div>
            </div>
        <!-- Navbar & Hero End -->


        <!-- Service Start -->
        <div class="container-xxl py-5">
            <div class="container">
                <div class="row g-4">
                
                	<%              	
                		ServiceDaoImp serviceDaoImp = new ServiceDaoImp();
                		ArrayList<ServicePojo> listData = serviceDaoImp.readFourService((String) session.getAttribute("location"));             		
                		if(listData.size() != 0){               			
                			for(ServicePojo sp : listData){		
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
                    		<h3 style="color:black; text-align:center;">No Service Exit!</h3>
                    <%
                		}                    
                    %>
                </div>
            </div>
        </div>
        <!-- Service End -->
		<div class="text-center">
			<a class="btn btn-primary  py-3 text-center mt-2" href="service.jsp">All Services</a>
		</div>

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
                        
                        <div class="row g-4 mb-4">
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
                        <a class="btn btn-primary py-3 px-5 mt-2" href="about.jsp">Read More</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- About End -->


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
                            	ArrayList<ItemPojo> list = addItemDaoImp.getItemTen("Breakfast", (String) session.getAttribute("location"));
                            	
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
	                            	ArrayList<ItemPojo> list1 = addItemDaoImp.getItemTen("Lunch", (String) session.getAttribute("location"));                    	
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
	                            	ArrayList<ItemPojo> list2 = addItemDaoImp.getItemTen("Dinner", (String) session.getAttribute("location"));                    	
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
        <div class="text-center">
        	<a class="btn btn-primary py-3 text-center mt-2" href="menu.jsp">All Items</a>
        </div>
		

        <!-- Reservation Start -->
        <div class="container-xxl py-5 px-0 wow fadeInUp" data-wow-delay="0.1s">
            <div class="row g-0">
                <div class="col-md-6">
                    <div class="video">
                        <button type="button" class="btn-play" data-bs-toggle="modal" data-src="https://www.youtube.com/embed/2_kYOL1aifg?si=53w6qpE_P0NM_epz" title="YouTube video player" data-bs-target="#videoModal">
                            <span></span>   
                            <!-- https://www.youtube.com/embed/DWRcNpR6Kdc -->                                                
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
        <!-- Reservation Start -->
        
        <!-- choose food modal start  -->
        	<%@ include file="itemmodal.jsp" %>
        <!-- choose food modal end  -->


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
        <div class="text-center">
        	<a class="btn btn-primary py-3 mt-2 text-center" href="team.jsp">All Master Chefs</a>
        </div>
        
        <!-- Team End -->


        <!-- Testimonial Start -->
        <div class="container-xxl py-5 wow fadeInUp" data-wow-delay="0.1s">
            <div class="container">
                <div class="text-center">
                    <h5 class="section-title ff-secondary text-center text-primary fw-normal">Testimonial</h5>
                    <h1 class="mb-5">Our Clients Say!!!</h1>
                </div>
                <div class="owl-carousel testimonial-carousel">
                    <%
	                	CommentDaoImp commentDaoImp = new CommentDaoImp();
	                	ArrayList<CommentPojo> commentList = commentDaoImp.readCommentVerfied((String) session.getAttribute("location"));
	                	for(CommentPojo cp : commentList){
	                %>
	                		<div class="testimonial-item bg-transparent border rounded p-4">
		                        <i class="fa fa-quote-left fa-2x text-primary mb-3"></i>
		                        <p><%= cp.getComment() %></p>
		                        <div class="d-flex align-items-center">
		                            <img class="img-fluid flex-shrink-0 rounded-circle" src="CommentImages/<%= cp.getImage() %>" style="width: 50px; height: 50px;">
		                            <div class="ps-3">
		                                <h5 class="mb-1"><%= cp.getName() %></h5>
		                                <pre class="bolder"><%= cp.getOccupation() %>    <%= cp.getDateTime() %></pre>	                                
		                            </div>
		                        </div>
		                    </div>             
	                <%		
	                	}
	                %>
                </div>
            </div>
        </div>
        <div class="text-center">
        	<a class="btn btn-primary py-3 text-center mt-2" href="addtestimonial.jsp">Add Testimonial</a>
        </div>
        <!-- Testimonial End -->
        
        

        <!-- Footer Start -->
        	<%@include file="footer.jsp" %>
        <!-- Footer End -->
        
        <form id="geoForm" action="NearestLocationServlet" method="POST" style="display:none;">
		    <input type="hidden" name="lat" id="latField">
		    <input type="hidden" name="lng" id="lngField">
		</form>


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
    <script src="js/itemorder.js"></script>
    
    <script>
	    if (!sessionStorage.getItem("geoFetched")) {
	        navigator.geolocation.getCurrentPosition(function(position) {
	            var lat = position.coords.latitude;
	            var lng = position.coords.longitude;
	
	            console.log(lat);
	            console.log(lng);
	
	            // Fill form fields
	            document.getElementById("latField").value = lat;
	            document.getElementById("lngField").value = lng;
	
	            // Mark location as fetched
	            sessionStorage.setItem("geoFetched", "true");
	
	            // Submit form to servlet
	            document.getElementById("geoForm").submit();
	        }, function(error) {
	            switch(error.code) {
	                case error.PERMISSION_DENIED:
	                    alert("Permission denied. Please allow location access.");
	                    break;
	                case error.POSITION_UNAVAILABLE:
	                    alert("Location unavailable.");
	                    break;
	                case error.TIMEOUT:
	                    alert("Location request timed out.");
	                    break;
	                default:
	                    alert("An unknown error occurred.");
	                    break;
	            }
	            console.error('Geolocation error:', error);
	        });
	    }
	</script>
	
	<!-- <script>
	    if (!sessionStorage.getItem("reloadedOnce")) {
	        sessionStorage.setItem("reloadedOnce", "true");
	        setTimeout(() => {
	            location.reload();
	        }, 1000);
	    }
	</script> -->
</body>

</html>