<%@page import="tech.happy.model.OrderDeatils"%>
<%@page import="tech.happy.model.FoodList"%>
<%@page import="tech.happy.dao.MenuDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<!-- choose food modal start  -->
        
<!-- Modal -->
<div class="modal fade" id="foodModal" tabindex="-1">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header bg-warning">
		        <h5 class="modal-title">Select Food Items</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			</div>
		    <div class="modal-body" style="max-height: 400px; overflow-y: auto;">
		    	<div class="row mb-3">
					<div class="col-md-6">
				    	<input type="text" id="searchFood" class="form-control" placeholder="Search food name..." oninput="filterTable()">
				  	</div>
				  	<div class="col-md-6">
				    	<select id="mealFilter" class="form-control" onchange="filterTable()">
				      		<option value="">All Meal Types</option>
				      		<option value="breakfast">Breakfast</option>
				      		<option value="lunch">Lunch</option>
				      		<option value="dinner">Dinner</option>
				    	</select>
				  	</div>
				</div>
				<table class="table" id="foodTable">
					<thead>
				    	<tr>
				      		<th>Food Name</th>
				      		<th>Price</th>
				      		<th>Meal Type</th>
				      		<th>Quantity</th>
				    	</tr>
				  	</thead>
				  <tbody>
				  	<%
				  		MenuDao menuDao = new MenuDao();
						ArrayList<FoodList> itemList = menuDao.foodMenu((String) session.getAttribute("location"));
						for(FoodList f : itemList){
					%>
					  	<tr>
					    	<td><%= f.getFoodName() %></td>
					    	<td><i class="fa fa-indian-rupee-sign mx-1"></i><%= f.getPrice() %></td>
					    	<td><%= f.getMealTime() %></td>
					    	<td><input type="number" class="form-control quantity-input" min="0" data-name="<%= f.getFoodName() %>" data-price="<%= f.getPrice() %>" data-meal="<%= f.getMealTime() %>"></td>	
					  	</tr>
					<%
						}
					%>
				  </tbody>
				</table>    
		</div>
		   	<div class="modal-footer">
		    	<h6 class="text-end mx-2">Total: <i class="fa fa-indian-rupee-sign mx-1"></i><span id="totalBill">0</span></h6>
		    	<button type="button" class="btn btn-warning" id="openbillmodal" data-bs-dismiss="modal">Done</button>
			</div>
		</div>
	</div>
</div>
        
<!-- choose food modal end -->
        
<!-- bill modal start -->

<div class="modal fade" id="billmodal" tabindex="-1" aria-labelledby="modal2Label" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="modal2Label">Bill</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
	  <%
	  	HttpSession session1 = request.getSession();
		String name = (String) session1.getAttribute("name");
		String gmail = (String) session1.getAttribute("gmail");
		String dateTime = (String) session1.getAttribute("dateTime");
		String tableNo = (String) session1.getAttribute("tableno");
	  %>
      <div class="modal-body" style="max-height: 500px; overflow-y: auto;">
		<h2 class="text-center">Happy' Point</h2>
		<hr>
		<div class="mb-1"><strong>Name:</strong> <span id="sessionName">---</span></div>
		<div class="mb-1"><strong>G-mail:</strong> <span id="sessionGmail">---</span></div>
		<div class="mb-1"><strong>Table No:</strong> <span id="sessionTable">---</span></div>
		<div class="mb-1"><strong>Date and Time:</strong> <span id="sessionDateTime">---</span></div>
		<hr>
		<h5 class="text-center">Items List</h5>
		<table>
			<thead>
				<tr class="table-primary text-center align-middle">
				    <th class="pe-3 ps-1">Item Name</th>
				    <th class="px-3">Day Meal</th>
				    <th class="px-3">Price</th>
				    <th class="px-2">Quantity</th>
				    <th class="ps-2 pe-1">Total</th>
				</tr>
			</thead>
			<tbody id="modalOrderTableBody"></tbody>	
		</table>
		<hr>
		<p class="text-end fw-bold"><strong>Grand Total: <i class="fa fa-indian-rupee-sign mx-1"></i><span id="modalTotal">0.00</span></strong></p>
		<hr>
		<div class="d-flex justify-content-center gap-3 my-4">
		    <form action="OrderServlet" method="post">
		    	<button class="btn btn-primary px-4">Pay On Hand</button>	
		    </form>
		    <button class="btn btn-success px-4">Pay On Online</button>
		</div>
      </div>
    </div>
  </div>
</div>

<!-- biil modal end -->