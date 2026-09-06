<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="model.CartItem" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>My Cart</title>

    <style>

        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            padding: 30px;
        }

        h1 {
            text-align: center;
        }

        .cart-container {
            width: 80%;
            margin: auto;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 8px gray;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th,
        td {
            padding: 12px;
            text-align: center;
            border: 1px solid #ddd;
        }

        th {
            background-color: #007bff;
            color: white;
        }

        .total {
            text-align: right;
            font-size: 20px;
            font-weight: bold;
            margin-top: 20px;
        }

        .button {
            display: inline-block;
            padding: 10px 15px;
            margin-top: 20px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }

        .button:hover {
            background-color: #0056b3;
        }

    </style>

</head>

<body>

    <h1>My Cart</h1>

    <div class="cart-container">

        <%
            // Retrieve the cart from the user's session.
            List<CartItem> cart =
                    (List<CartItem>) request.getAttribute("cart");

            // Store the total cart amount.
            double grandTotal = 0;

            // Check whether the cart contains items.
            if (cart != null && !cart.isEmpty()) {
        %>

                <table>

                    <tr>
                        <th>Food Name</th>
                        <th>Category</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Total Price</th>
                    </tr>

        <%
                // Loop through every cart item.
                for (CartItem cartItem : cart) {

                    // Add the current item's total price to grand total.
                    grandTotal = grandTotal + cartItem.getTotalPrice();
        %>

                    <tr>

                        <td>
                            <%= cartItem.getFood().getName() %>
                        </td>

                        <td>
                            <%= cartItem.getFood().getCategory() %>
                        </td>

                        <td>
                            ₹<%= cartItem.getFood().getPrice() %>
                        </td>

                        <td>
                            <%= cartItem.getQuantity() %>
                        </td>

                        <td>
                            ₹<%= cartItem.getTotalPrice() %>
                        </td>

                    </tr>

        <%
                }
        %>

                </table>

                <div class="total">
                    Grand Total: ₹<%= grandTotal %>
                </div>

        <%
            } else {
        %>

                <h2>Your cart is empty.</h2>

        <%
            }
        %>

        <!-- Return to the food menu. -->
        <a href="user-food" class="button">
            Back to Menu
        </a>

    </div>

</body>

</html>