<%@page import="tech.happy.model.Admin"%>
<%
	Admin check = (Admin) session.getAttribute("adminlogin");

	if(check == null){
		response.sendRedirect("adminlogin.jsp");
		return;
	}

%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Change Password</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<link href="css/admin.css" rel="stylesheet">
</head>
<body class="bg-secondary d-flex justify-content-center align-items-center min-vh-100 py-5">
    <div class="container">
        <div class="mx-auto shadow-lg p-4 bg-white border border-warning border-4 rounded-3" style="max-width: 400px;">
            <div class="text-center mb-4">
                <h2 class="fw-bold font-color">Change Password</h2>
            </div>

            <form action="ChangePasswordServlet1" method="post">
                <div class="mb-3">
                    <label for="username" class="form-label fw-bold">Username</label>
                    <input type="text" class="form-control" id="username" name="username" placeholder="Enter your username" required>
                </div>

                <div class="mb-3">
                    <label for="password" class="form-label fw-bold">Current Password</label>
                    <input type="password" class="form-control" id="password" name="oldpassword" placeholder="Enter your current password" required>
                </div>

                <div class="mb-3">
                    <label for="pass" class="form-label fw-bold">New Password</label>
                    <input type="password" class="form-control" id="pass" name="newpassword" placeholder="Enter your new password" oninput="updateCounter('pass')" maxlength="16" required>
                    <div class="d-flex justify-content-between small text-muted mt-1">
                        <span id="pass-counter">0 characters</span>
                        <span>[0 to 16 characters]</span>
                    </div>
                </div>

                <div class="text-center mt-4">
                    <button type="submit" class="btn back-color fw-bold px-4">Submit</button>
                </div>

                <div class="mt-3 text-center">
                    <h6 class="text-danger"><%@include file="message.jsp" %></h6>
                </div>
            </form>
        </div>
    </div>

    <script>
        function updateCounter(inputId) {
            const inputElement = document.getElementById(inputId);
            const counterElement = document.getElementById(inputId + '-counter');
            counterElement.textContent = inputElement.value.length + ' characters';
        }
    </script>
    
    
</body>

</html>
