<%@page import="tech.happy.dao.ContactDaoImp"%>
<%@page import="tech.happy.dao.FoodOrderDaoImp"%>
<%@page import="tech.happy.model.Admin"%>

<%
	Admin check = (Admin) session.getAttribute("adminlogin");

	if(check == null){
		response.sendRedirect("adminlogin.jsp");
		return;
	}
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Add Testimonial</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
		<link href="css/admin.css" rel="stylesheet">
	</head>
	<body>
	
		<div class="back-colors py-4">
			<div class="text-center">
				<h1 class="fw-bolder font-color">ADD TESTIMONIAL</h1>
			</div>
		</div>
	
		
		<div class="bg-secondary d-flex justify-content-center align-items-center mt-1">
			<div>
				<div style="width:25vw;" class="border mt-2 border-5 border-body rounded shadow-lg p-3 mb-5 bg-body rounded">
					<div>
						<div class="text-center">
							<h2 class="fs-3 fw-bolder font-color">ADD TESTIMONIAL</h2>
						</div>
					</div>
					<form action="AddTestimonialServlet" id="myform" method="post" enctype="multipart/form-data" class="mx-2">
					 
					 <div class="my-3">
					  	<div class="row">
					  		<div class="col-5">
					  			<label for="designation" class="form-label mx-2 fw-bolder fs-5">Occupation</label>
					  		</div>
					  		<div class="col-7">
					  			<select class="form-control  form-select" name="occupation" id="occupation" required>
					  				<option selected value="select" disabled>--Select Occupation--</option>
									<option value="Student">Student</option>
								    <option value="Teacher">Teacher</option>
								    <option value="Engineer">Engineer</option>
								    <option value="Scientist">Scientist</option>
								    <option value="Nurse">Nurse</option>
								    <option value="Farmer">Farmer</option>
								    <option value="Carpenter">Carpenter</option>
								    <option value="Mechanic">Mechanic</option>
								    <option value="Chef">Chef</option>
								    <option value="Pilot">Pilot</option>
								    <option value="Artist">Artist</option>
								    <option value="Writer">Writer</option>
								    <option value="Lawyer">Lawyer</option>
								    <option value="Judge">Judge</option>
								    <option value="Driver">Driver</option>
								    <option value="Athlete">Athlete</option>
								    <option value="Musician">Musician</option>
								    <option value="Photographer">Photographer</option>
								    <option value="Entrepreneur">Entrepreneur</option>
								    <option value="Plumber">Plumber</option>
								    <option value="Electrician">Electrician</option>
								    <option value="Politician">Politician</option>
								    <option value="Researcher">Researcher</option>
								    <option value="Architect">Architect</option>
								    <option value="Lecturer">Lecturer</option>
								    <option value="Librarian">Librarian</option>
								    <option value="Designer">Designer</option>
								    <option value="Technician">Technician</option>
								    <option value="Other">Other</option>
								</select>
					  		</div>
					  	</div>	    
					  </div>
					 
					  <div class="my-3">
					    <label for="membername" class="form-label mx-2 fw-bolder fs-5">Name : </label><br>
					    <input style="width: 340px;" type="text" required class="form-control" id="membername" name="membername" placeholder="Enter Name" oninput="updateCounter('itemname')">
					  </div>
					  
					  <div class="my-3">
					    <label for="description" class="form-label mx-2 fw-bolder fs-5">Comment : </label><br>
					    <textarea class="form-control" style="width: 340px;" required rows="4"  id="description" name="description"  placeholder="Enter Description" oninput="updateCounter('description')"></textarea>
	            		<span id="description-counter" class="counter mx-2">0 characters</span>
	           			<span id="iconname-counter" class="counter">[50 to 100 characters]</span>
					  </div>
					  
					  <div class="my-3">
					  	<label for="memberimage" class="form-label mx-2 fw-bolder fs-5">Image</label>
					  	<input type="file" class="form-control-file" accept="image/*" id="memberimage" name="memberimage">
					  </div>
					  
					  <h3 style="text-align:center;"><%@include file="message.jsp" %></h3>
					  
					  <div class="text-center">
					  	<button type="submit" class="btn back-color my-2 fs-5 fw-bolder">Add Testimonial</button>
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