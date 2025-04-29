<%@page import="tech.happy.dao.AdminDataDao"%>
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
    <title>Verify OTP</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width" />
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdn.jsdelivr.net/npm/flowbite@2.5.2/dist/flowbite.min.css"  rel="stylesheet" />
    
	<link href="css/admin.css" rel="stylesheet">
  </head>
<body class="max-h-screen">
  <section class="border-red-500 bg-[#6c757d] min-h-screen flex items-center justify-center">
    <div class="bg-gray-100 p-5 flex rounded-2xl shadow-lg max-w-3xl">

        <div class="w-1/2 md:block hidden mt-1">
            <img src="img/healthy-7213383_640.jpg" class="rounded-2xl" alt="page img">
        </div>

      <div class="md:w-1/2 px-5">
        <h1 class="text-4xl font-bold text-black">Admin Verification</h1>
        <%
            Admin user = (Admin) session.getAttribute("adminlogin"); 
            String msg  = (String) session.getAttribute("msg");
             if(msg != null) {
        %>
                <p style="text-align:center;"><%@include file="message.jsp" %></p>
        <%
             }
        %> 
        <p class="text-sm mt-2 text-[#002D74] font-bold">Please contact the administrator for access Admin Panel</p>

        <form class="mt-6" action="VerificationOTP" method="POST">

            <div>
                <label class="block font-bold text-gray-700" for="username">Username</label>
                <input type="text" value="<%=user.getUsername() %>" class="w-full px-4 py-3 rounded-lg bg-gray-200 mt-2 border focus:border-orange-500 focus:bg-white focus:outline-none" autofocus autocomplete readonly>
            </div>
            
          <div class="mt-4">
          	<%
          		AdminDataDao adminDataDao = new AdminDataDao();
          		String mail = adminDataDao.getMail((String) session.getAttribute("location"));
          	%>
            <label class="block text-gray-700 font-bold" for="email">G-mail Address</label>
            <input type="email" value="<%= mail %>" class="w-full px-4 py-3 rounded-lg bg-gray-200 mt-2 border focus:border-orange-500 focus:bg-white focus:outline-none" autofocus autocomplete readonly>
          </div>

          <div class="">
            <label class="block text-gray-700 font-bold" for="password">Password</label>
            <input type="password" value="<%= user.getPassword() %>"  minlength="6" class="w-full px-4 py-3 rounded-lg bg-gray-200 mt-2 border focus:border-orange-500
                  focus:bg-white focus:outline-none" readonly>
          </div>

          <div class="mt-4">
            <label class="block text-gray-700 font-bold" for="otp">OTP</label>
            <input type="number" name="otp" id="otp" placeholder="Enter OTP" minlength="6" min="100000" max="999999" class="w-full px-4 py-3 rounded-lg bg-gray-200 mt-2 border focus:border-orange-500
                  focus:bg-white focus:outline-none" required>
          </div>
        
          <button type="submit" class="w-full block bg-[#FEA116] hover:bg-orange-400 focus:bg-orange-400 text-black text-xl font-bold rounded-lg
                px-4 py-3 mt-6">Verification OTP</button>
        </form>
        
        <div class="circle c1"></div>
        <div class="circle c2"></div>

    </div>
  </section>

  <script src="https://cdn.jsdelivr.net/npm/flowbite@2.5.2/dist/flowbite.min.js"></script>
  </body>
</html>