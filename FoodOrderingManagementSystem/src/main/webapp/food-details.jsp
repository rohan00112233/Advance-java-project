<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="model.Food" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Food Details</title>

    <style>

        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            padding: 30px;
        }

        .details-card {
            width: 400px;
            margin: auto;
            padding: 25px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 0 8px gray;
        }

        h1 {
            text-align: center;
        }

        p {
            font-size: 18px;
            margin: 15px 0;
        }

        .button {
            display: inline-block;
            padding: 10px 15px;
            margin-top: 15px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }

        .button:hover {
            background-color: #0056b3;
        }

        .back-button {
            background-color: gray;
        }

    </style>

</head>

<body>

    <%
        // Retrieve the food object sent by FoodDetailsServlet.
        Food food = (Food) request.getAttribute("food");
    %>

    <div class="details-card">

        <%
            // Check whether the selected food item exists.
            if (food != null) {
        %>

            <h1><%= food.getName() %></h1>

            <p>
                <strong>Food ID:</strong>
                <%= food.getId() %>
            </p>

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

            <!-- Add the selected food item to the cart. -->
            <a
                href="add-cart?id=<%= food.getId() %>"
                class="button">
                Add to Cart
            </a>

            <!-- Return to the food menu. -->
            <a
                href="user-food"
                class="button back-button">
                Back to Menu
            </a>

        <%
            } else {
        %>

            <h1>Food Not Found</h1>

            <p>The selected food item does not exist.</p>

            <a
                href="user-food"
                class="button">
                Back to Menu
            </a>

        <%
            }
        %>

    </div>

</body>

</html>