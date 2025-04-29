// session create method
function storeSessionData() {
    const name = document.getElementById('name').value.trim();
    const gmail = document.getElementById('email').value.trim();
    const dateTime = document.getElementById('datetime').value.trim();
    const tableno = document.getElementById('tableno').value.trim();

    // Basic Validation
    if (!name || !gmail || !dateTime || !tableno) {
        alert("Please fill in all fields.");
        return;
    }

    // Optional: Email format validation
    const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailPattern.test(gmail)) {
        alert("Please enter a valid email address.");
        return;
    }

    // AJAX request to save session data
    fetch('SetOrderDetailsServlet', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: `name=${encodeURIComponent(name)}&gmail=${encodeURIComponent(gmail)}&dateTime=${encodeURIComponent(dateTime)}&tableno=${encodeURIComponent(tableno)}`
    }).then(response => {
        if (!response.ok) {
            alert("Failed to save session data.");
        } else {
            // Modal open using Bootstrap JS
            const foodModal = new bootstrap.Modal(document.getElementById('foodModal'));
            foodModal.show();
        }
    }).catch(error => {
        console.error("Error:", error);
        alert("Something went wrong!");
    });
}



/*table filter method*/
function filterTable() {
	const foodInput = document.getElementById("searchFood").value.toLowerCase();
	const mealInput = document.getElementById("mealFilter").value.toLowerCase();
	const rows = document.querySelectorAll("#foodTable tbody tr");
			
	rows.forEach(row => {
		const foodName = row.cells[0].innerText.toLowerCase();
		const mealType = row.cells[2].innerText.toLowerCase();
				
		const matchesFood = foodName.includes(foodInput);
		const matchesMeal = !mealInput || mealType === mealInput;
				
		row.style.display = (matchesFood && matchesMeal) ? "" : "none";
	});
			
// Also update the total after filter
	calculateTotal();
}
			
function calculateTotal() {
	let total = 0;
	const rows = document.querySelectorAll("#foodTable tbody tr");
			
	rows.forEach(row => {
		if (row.style.display === "none") return; // Ignore hidden rows
			
		const price = parseFloat(row.cells[1].innerText);
		const quantityInput = row.querySelector("input[type='number']");
		const quantity = parseInt(quantityInput.value) || 0;
			
		total += price * quantity;
	});
			
	document.getElementById("totalBill").innerText = total;
}
			
// Trigger total calculation when quantity changes
document.addEventListener("input", function (e) {
	if (e.target && e.target.type === "number") {
		calculateTotal();
	}
});


//bill modal
const openModal2Btn = document.getElementById('openbillmodal');
const modal1 = new bootstrap.Modal(document.getElementById('foodModal'));
const modal2 = new bootstrap.Modal(document.getElementById('billmodal'));

openModal2Btn.addEventListener("click", function () {
    const orders = [];
    const rows = document.querySelectorAll("#foodTable tbody tr");

    rows.forEach(row => {
        const name = row.cells[0].innerText.trim();
        const price = parseFloat(row.cells[1].innerText.replace(/[^\d.]/g, ""));
        const meal = row.cells[2].innerText.trim();
        const qtyInput = row.querySelector("input");
        const quantity = parseInt(qtyInput.value);

        if (quantity && quantity > 0) {
            orders.push({
                name: name,
                price: price,
                meal: meal,
                quantity: quantity
            });
        }
    });

    console.log("Sending Data: ", JSON.stringify(orders));

    // Hide modal1 first
    modal1.hide();

    // Send data to servlet via AJAX
    fetch('StoreOrderServlet', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(orders)
    })
    .then(res => {
        if (res.ok) {
            console.log("Order successfully sent to session!");

            // Show modal2 AFTER data is sent
            setTimeout(() => {
				renderOrderInModal(orders);
                modal2.show();
            }, 500); // small delay to ensure modal1 fully hides
        } else {
            alert("Failed to send order to session.");
        }
    })
    .catch(err => {
        console.error("Error sending order to servlet:", err);
        alert("Something went wrong while sending order.");
    });
});

function renderOrderInModal(orders) {
    const orderTableBody = document.getElementById("modalOrderTableBody");
    orderTableBody.innerHTML = ""; // Clear old data

    let total = 0;

    orders.forEach(order => {
        const row = document.createElement("tr");

        row.innerHTML = `
            <td class="pe-3 ps-1">${order.name}</td>
            <td class="px-3">${order.meal}</td>
            <td class="px-3"><i class="fa fa-indian-rupee-sign mx-1"></i>${order.price}</td>
            <td class="px-3">${order.quantity}</td>
            <td class="ps-3 pe-1"><i class="fa fa-indian-rupee-sign mx-1"></i>${order.price * order.quantity}</td>
        `;

        total += order.price * order.quantity;
        orderTableBody.appendChild(row);
    });

    document.getElementById("modalTotal").innerText = total.toFixed(2);
	
	// Fetch session details via AJAX
	fetch('GetSessionDetailsServlet')
		.then(res => res.json())
	    .then(data => {
	    	document.getElementById("sessionName").innerText = data.name;
	    	document.getElementById("sessionGmail").innerText = data.gmail;
	    	document.getElementById("sessionTable").innerText = data.tableno;
	    	document.getElementById("sessionDateTime").innerText = data.datetime;
		})
		.catch(err => {
	    	console.error("Error fetching session details:", err);
		});
}





