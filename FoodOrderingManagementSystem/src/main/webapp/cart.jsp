<%@ page import="java.util.List" %>
<%@ page import="model.CartItem" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Shopping Cart</title>

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
            max-width: 1000px;
            margin: 50px auto;
        }

        .container h2 {
            text-align: center;
            font-size: 36px;
            color: #222;
            margin-bottom: 30px;
        }

        /* Cart table */
        .cart-table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
            border-radius: 10px;
            overflow: hidden;
        }

        .cart-table th {
            background-color: #222;
            color: white;
            padding: 15px;
            font-size: 17px;
        }

        .cart-table td {
            padding: 15px;
            text-align: center;
            border-bottom: 1px solid #ddd;
            font-size: 16px;
        }

        .cart-table tr:last-child td {
            border-bottom: none;
        }

        .cart-table tr:hover {
            background-color: #f5f5f5;
        }

        /* Grand total */
        .grand-total {
            background-color: white;
            margin-top: 25px;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
            text-align: right;
            font-size: 24px;
            font-weight: bold;
        }

        /* Navigation */
        .navigation {
            text-align: center;
            margin-top: 30px;
        }

        .button {
            display: inline-block;
            padding: 12px 22px;
            margin: 5px;
            background-color: #087ff5;
            color: white;
            text-decoration: none;
            border-radius: 6px;
            font-size: 17px;
        }

        .button:hover {
            background-color: #0668c9;
        }

        .home-button {
            background-color: #555;
        }

        .home-button:hover {
            background-color: #333;
        }

        /* Empty cart */
        .empty-cart {
            background-color: white;
            padding: 35px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
            text-align: center;
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

        <h2>Your Cart</h2>

        <%
            List<CartItem> cart =
                    (List<CartItem>) request.getAttribute("cart");
        %>

        <%
            if (cart != null && !cart.isEmpty()) {

                double grandTotal = 0;
        %>

            <!-- Cart table -->
            <table class="cart-table">

                <tr>
                    <th>Food Name</th>
                    <th>Category</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Total Price</th>
                </tr>

                <%
                    for (CartItem cartItem : cart) {

                        double totalPrice =
                                cartItem.getTotalPrice();

                        grandTotal += totalPrice;
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
                            ₹<%= totalPrice %>
                        </td>

                    </tr>

                <%
                    }
                %>

            </table>

            <!-- Grand total -->
            <div class="grand-total">
                Grand Total: Rs<%= grandTotal %>
            </div>

        <%
            } else {
        %>

            <!-- Empty cart -->
            <div class="empty-cart">

                <p>Your cart is empty.</p>

            </div>

        <%
            }
        %>

        <!-- Navigation -->
        <div class="navigation">

            <a href="index.jsp" class="button home-button">
                Home
            </a>

        </div>

    </div>

</body>
</html>