<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="model.Food" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Food Menu</title>

    <style>

        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }

        h1 {
            text-align: center;
        }

        .food-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
        }

        .food-card {
            background-color: white;
            width: 250px;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 8px gray;
        }

        .food-card h2 {
            margin-top: 0;
        }

        .food-card p {
            margin: 10px 0;
        }

        .button {
            display: inline-block;
            padding: 10px;
            margin-top: 10px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }

        .button:hover {
            background-color: #0056b3;
        }

        .cart-button {
            display: block;
            width: 120px;
            margin: 20px auto;
            padding: 12px;
            text-align: center;
            background-color: green;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }

    </style>

</head>

<body>

    <h1>Available Food Items</h1>

    <!-- Link to view the user's cart. -->
    <a href="cart" class="cart-button">View Cart</a>

    <div class="food-container">

        <%
            // Retrieve the food list sent by UserFoodServlet.
            List<Food> foodList =
                    (List<Food>) request.getAttribute("foodList");

            // Check whether food items are available.
            if (foodList != null && !foodList.isEmpty()) {

                // Loop through every food item.
                for (Food food : foodList) {
        %>

                    <div class="food-card">

                        <h2>
                            <%= food.getName() %>
                        </h2>

                        <p>
                            <strong>Category:</strong>
                            <%= food.getCategory() %>
                        </p>

                        <p>
                            <strong>Price:</strong>
                            ₹<%= food.getPrice() %>
                        </p>

                        <p>
                            <strong>Availability:</strong>
                            <%= food.getAvailability() %>
                        </p>

                        <!-- Link to view complete food details. -->
                        <a
                            href="food-details?id=<%= food.getId() %>"
                            class="button">
                            View Details
                        </a>

                        <!-- Link to add this food item to the cart. -->
                        <a
                            href="add-cart?id=<%= food.getId() %>"
                            class="button">
                            Add to Cart
                        </a>

                    </div>

        <%
                }

            } else {
        %>

                <h2>No food items available.</h2>

        <%
            }
        %>

    </div>

</body>

</html>