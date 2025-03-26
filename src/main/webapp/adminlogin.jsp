<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<link href="css/admin.css" rel="stylesheet">
</head>
<body class="bg-secondary d-flex justify-content-center align-items-center mt-5">
	<div class="mt-5">
		<div style="width:25vw;" class="border mt-5 border-5 border-body shadow-lg p-3 mb-5 bg-body rounded-5">
			<div>
				<div class="text-center my-3">
					<h2 class="fs-1 fw-bolder front-color">LogIn</h2>
				</div>
			</div>
			<form action="AdminLoginServlet1" method="post" class="mx-2">
			  <div class="my-4">
			    <label for="username" class="form-label mx-2 fw-bolder">Username</label>
			    <input type="text" class="form-control" id="username" name="username" placeholder="Enter your username">
			  </div>
			  <div class="my-4">
			    <label for="password" class="form-label mx-2 fw-bolder">Password</label>
			    <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password">
			  </div>
			  <div class="text-center">
			  	<button type="submit" class="btn back-color my-3 fs-5 fw-bolder">Submit</button>
			  </div> 
			  <h3 style="text-align:center;"><%@include file="message.jsp" %></h3>
			</form>
		</div>
		<div class="circle c1"></div>
        <div class="circle c2"></div>
	</div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>
