<%@ page import="java.util.List"%>
<%@ page import="model.Food"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Food Menu</title>

<style>

/* Page */
body {
	font-family: Arial, sans-serif;
	background-color: #f4f6f8;
	margin: 0;
	padding: 0;
}

/* Header */
.header {
	background-color: #222;
	color: white;
	text-align: center;
	padding: 25px;
}

.header h1 {
	margin: 0;
}

/* Main container */
.container {
	width: 90%;
	max-width: 1100px;
	margin: 40px auto;
	text-align: center;
}

.container h2 {
	font-size: 36px;
	margin-bottom: 25px;
	color: #222;
}

/* Navigation buttons */
.navigation {
	margin-bottom: 35px;
}

.nav-button {
	display: inline-block;
	padding: 12px 25px;
	margin: 5px;
	background-color: #008000;
	color: white;
	text-decoration: none;
	border-radius: 6px;
	font-size: 18px;
}

.nav-button:hover {
	background-color: #006400;
}

/* Food cards */
.food-container {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	gap: 25px;
}

.food-card {
	background-color: white;
	width: 300px;
	padding: 25px;
	border-radius: 10px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
	text-align: left;
}

.food-card h3 {
	font-size: 28px;
	margin-top: 0;
	margin-bottom: 20px;
	color: #222;
}

.food-info {
	font-size: 17px;
	line-height: 1.8;
}

.food-info strong {
	color: #222;
}

/* Food buttons */
.button-container {
	margin-top: 20px;
}

.button {
	display: inline-block;
	padding: 10px 14px;
	margin-right: 5px;
	background-color: #087ff5;
	color: white;
	text-decoration: none;
	border-radius: 6px;
	font-size: 16px;
}

.button:hover {
	background-color: #0668c9;
}

/* Message when no food is available */
.no-food {
	background-color: white;
	padding: 25px;
	border-radius: 10px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
	font-size: 20px;
}
</style>
</head>

<body>

	<!-- Header -->
	<div class="header">
		<h1>Food Ordering Management System</h1>
	</div>

	<!-- Main content -->
	<div class="container">

		<h2>Available Food Items</h2>

		<!-- Navigation -->
		<div class="navigation">

			<a href="cart" class="nav-button"> View Cart </a> <a href="index.jsp"
				class="nav-button"> Home </a>

		</div>

		<%
		List<Food> foodList = (List<Food>) request.getAttribute("foodList");
		%>

		<div class="food-container">

			<%
			if (foodList != null && !foodList.isEmpty()) {

				for (Food food : foodList) {
			%>

			<div class="food-card">

				<h3>
					<%=food.getName()%>
				</h3>

				<div class="food-info">

					<p>
						<strong>Category:</strong>
						<%=food.getCategory()%>
					</p>

					<p>
						<strong>Price:</strong> ₹<%=food.getPrice()%>
					</p>

					<p>
						<strong>Availability:</strong>
						<%=food.getAvailability()%>
					</p>

				</div>

				<div class="button-container">

					<a href="add-cart?id=<%=food.getId()%>" class="button"> Add
						to Cart </a>

				</div>

			</div>

			<%
			}

			} else {
			%>

			<div class="no-food">No food items are currently available.</div>

			<%
			}
			%>

		</div>

	</div>

</body>
</html>