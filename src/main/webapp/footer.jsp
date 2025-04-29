<%@page import="tech.happy.dao.AdminDataDao"%>

		<div class="container-fluid bg-dark text-light footer pt-5 mt-5 wow fadeIn" data-wow-delay="0.1s">
            <div class="container py-5">
                <div class="row g-5">
                    <div class="col-lg-3 col-md-6">
                        <h4 class="section-title ff-secondary text-start text-primary fw-normal mb-4">Company</h4>
                        <a class="btn btn-link" href="about.jsp">About Us</a>
                        <a class="btn btn-link" href="contact.jsp">Contact Us</a>
                        <a class="btn btn-link" href="booking.jsp">Booking Order</a>
                        <a class="btn btn-link" href="#">Privacy Policy</a>
                        <a class="btn btn-link" href="#">Terms and Condition</a>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <h4 class="section-title ff-secondary text-start text-primary fw-normal mb-4">Contact</h4>
                        <p class="mb-2"><i class="fa fa-map-marker-alt me-3"></i><%= (String) session.getAttribute("location") %></p>
                        <p class="mb-2"><i class="fa fa-phone-alt me-3"></i>+91 98********</p>
                        <%
			          		AdminDataDao adminDataDao = new AdminDataDao();
			          		String mail = adminDataDao.getMail((String) session.getAttribute("location"));
			          	%>
                        <p class="mb-2"><i class="fa fa-envelope me-3"></i><%= mail %></p>
                        <div class="d-flex pt-2">
                            <a class="btn btn-outline-light btn-social" target="_blank" href="https://x.com/HappyCoder22?t=-VFPyhJfJo1P7EAQLbRoiQ&s=09"><i class="fab fa-twitter"></i></a>
                            <a class="btn btn-outline-light btn-social" target="_blank" href="facebook.com/happycoder22"><i class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-outline-light btn-social" target="_blank" href="https://youtube.com/@happycoder2005?feature=shared"><i class="fab fa-youtube"></i></a>
                            <a class="btn btn-outline-light btn-social" target="_blank" href="https://www.linkedin.com/in/jayantsagar2005/"><i class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <h4 class="section-title ff-secondary text-start text-primary fw-normal mb-4">Opening</h4>
                        <h5 class="text-light fw-normal">Monday - Saturday</h5>
                        <p>09AM - 09PM</p>
                        <h5 class="text-light fw-normal">Sunday</h5>
                        <p>10AM - 08PM</p>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <h4 class="section-title ff-secondary text-start text-primary fw-normal mb-4">Newsletter</h4>
                        <p>Stay updated with our latest insights and offers! SignUp now.</p>
                        <div class="position-relative mx-auto" style="max-width: 400px;">
                            <input class="form-control border-primary w-100 py-3 ps-4 pe-5" type="text" placeholder="Your email">
                            <a href="adminlogin.jsp" type="button" class="btn btn-primary py-2 position-absolute top-0 end-0 mt-2 me-2">SignUp</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="copyright">
                    <div class="row">
                        <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                            &copy; <a class="border-bottom" href="index.jsp">Happy' Point</a>, All Right Reserved. 
							
							<!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
							Designed By <a class="border-bottom" href="https://www.linkedin.com/in/jayantsagar2005/">Happy Coder</a>
                        </div>
                        <div class="col-md-6 text-center text-md-end">
                            <div class="footer-menu">
                                <a href="index.jsp">Home</a>
                                <a href="#">Cookies</a>
                                <a href="#">Help</a>
                                <a href="#">FQAs</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>