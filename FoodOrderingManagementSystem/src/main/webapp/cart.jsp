<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="model.CartItem" %>
<%@ page import="java.util.List" %>

<%

    // Get the cart from the current user's session.

    List<CartItem> cart =
            (List<CartItem>) session.getAttribute("cart");


    // Calculate grand total.

    double grandTotal = 0;

    if (cart != null) {

        for (CartItem item : cart) {

            grandTotal +=
                    item.getTotalPrice();

        }

    }

%>


<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <title>FoodFlow - Shopping Cart</title>


    <style>


        /* =========================
           Global Styles
           ========================= */

        * {

            box-sizing: border-box;

        }


        body {

            font-family: Arial, sans-serif;

            background-color: #f5f7fa;

            margin: 0;

            padding: 0;

            color: #222;

        }


        /* =========================
           Navigation Bar
           ========================= */

        .navbar {

            background-color: #222;

            color: white;

            height: 70px;

            display: flex;

            align-items: center;

            justify-content: space-between;

            padding: 0 6%;

        }


        .logo {

            font-size: 28px;

            font-weight: bold;

            color: white;

        }


        .logo span {

            color: #ff6b35;

        }


        .nav-title {

            font-size: 16px;

            color: #ddd;

        }


        /* =========================
           Page Header
           ========================= */

        .page-header {

            background:
                linear-gradient(
                    135deg,
                    #ff6b35,
                    #ff914d
                );

            color: white;

            padding: 40px 6%;

        }


        .page-header-content {

            max-width: 1100px;

            margin: auto;

        }


        .page-header h1 {

            margin: 0 0 8px 0;

            font-size: 38px;

        }


        .page-header p {

            margin: 0;

            font-size: 17px;

            opacity: 0.95;

        }


        /* =========================
           Main Container
           ========================= */

        .container {

            width: 88%;

            max-width: 1100px;

            margin: 40px auto;

        }


        /* =========================
           Cart Card
           ========================= */

        .cart-card {

            background-color: white;

            border-radius: 12px;

            box-shadow:
                0 4px 14px
                rgba(0, 0, 0, 0.10);

            overflow: hidden;

        }


        /* =========================
           Cart Header
           ========================= */

        .cart-header {

            display: grid;

            grid-template-columns:
                2fr
                1.5fr
                1fr
                1fr
                1.2fr;

            background-color: #222;

            color: white;

            padding: 18px 25px;

            font-weight: bold;

            font-size: 15px;

        }


        /* =========================
           Cart Item
           ========================= */

        .cart-item {

            display: grid;

            grid-template-columns:
                2fr
                1.5fr
                1fr
                1fr
                1.2fr;

            align-items: center;

            padding: 22px 25px;

            border-bottom:
                1px solid #eee;

        }


        .cart-item:last-child {

            border-bottom: none;

        }


        /* =========================
           Food Information
           ========================= */

        .food-info {

            display: flex;

            align-items: center;

            gap: 15px;

        }


        .food-icon {

            width: 52px;

            height: 52px;

            border-radius: 10px;

            background-color: #fff0e9;

            display: flex;

            align-items: center;

            justify-content: center;

            font-size: 27px;

        }


        .food-name {

            font-size: 17px;

            font-weight: bold;

        }


        .category {

            color: #777;

            font-size: 13px;

            margin-top: 4px;

        }


        .price {

            font-weight: bold;

        }


        .quantity {

            display: inline-block;

            min-width: 35px;

            padding: 7px 10px;

            text-align: center;

            background-color: #f1f3f5;

            border-radius: 6px;

            font-weight: bold;

        }


        .total-price {

            font-weight: bold;

            color: #087ff5;

        }


        /* =========================
           Empty Cart
           ========================= */

        .empty-cart {

            background-color: white;

            border-radius: 12px;

            padding: 70px 30px;

            text-align: center;

            box-shadow:
                0 4px 14px
                rgba(0, 0, 0, 0.10);

        }


        .empty-icon {

            font-size: 60px;

            margin-bottom: 15px;

        }


        .empty-cart h2 {

            margin-bottom: 10px;

        }


        .empty-cart p {

            color: #777;

            margin-bottom: 25px;

        }


        /* =========================
           Summary
           ========================= */

        .summary {

            background-color: white;

            border-radius: 12px;

            margin-top: 25px;

            padding: 25px;

            display: flex;

            justify-content: space-between;

            align-items: center;

            box-shadow:
                0 4px 14px
                rgba(0, 0, 0, 0.10);

        }


        .summary-label {

            color: #666;

            font-size: 16px;

        }


        .grand-total {

            font-size: 27px;

            font-weight: bold;

            color: #222;

        }


        /* =========================
           Navigation
           ========================= */

        .navigation {

            display: flex;

            justify-content: center;

            margin-top: 30px;

        }


        .home-button {

            display: inline-block;

            padding: 12px 28px;

            background-color: #555;

            color: white;

            text-decoration: none;

            border-radius: 7px;

            font-size: 16px;

            font-weight: bold;

        }


        .home-button:hover {

            background-color: #333;

        }


        /* =========================
           Footer
           ========================= */

        .footer {

            margin-top: 60px;

            background-color: #222;

            color: #bbb;

            text-align: center;

            padding: 25px;

        }


        /* =========================
           Responsive Design
           ========================= */

        @media (max-width: 800px) {


            .cart-header {

                display: none;

            }


            .cart-item {

                grid-template-columns: 1fr;

                gap: 12px;

                padding: 20px;

            }


            .cart-item::before {

                content: "";

            }


            .summary {

                flex-direction: column;

                align-items: flex-start;

                gap: 10px;

            }


            .nav-title {

                display: none;

            }

        }


    </style>

</head>


<body>


    <!-- =========================
         Navigation Bar
         ========================= -->

    <div class="navbar">


        <div class="logo">

            Food<span>Flow</span>

        </div>


        <div class="nav-title">

            &#128722; Your Shopping Cart

        </div>


    </div>



    <!-- =========================
         Page Header
         ========================= -->

    <div class="page-header">


        <div class="page-header-content">


            <h1>

                Your Cart &#128722;

            </h1>


            <p>

                Review the food items you have
                added to your cart.

            </p>


        </div>


    </div>



    <!-- =========================
         Main Container
         ========================= -->

    <div class="container">


        <%

            if (cart != null &&
                !cart.isEmpty()) {

        %>


            <!-- =========================
                 Cart Card
                 ========================= -->

            <div class="cart-card">


                <!-- Cart Header -->

                <div class="cart-header">

                    <div>
                        Food
                    </div>

                    <div>
                        Category
                    </div>

                    <div>
                        Price
                    </div>

                    <div>
                        Quantity
                    </div>

                    <div>
                        Total
                    </div>

                </div>



                <!-- Cart Items -->

                <%

                    for (CartItem item : cart) {

                %>


                    <div class="cart-item">


                        <!-- Food -->

                        <div class="food-info">


                            <div class="food-icon">

                                &#127869;

                            </div>


                            <div>


                                <div class="food-name">

                                    <%= item.getFood().getName() %>

                                </div>


                                <div class="category">

                                    Food Item

                                </div>


                            </div>


                        </div>



                        <!-- Category -->

                        <div>

                            <%= item.getFood().getCategory() %>

                        </div>



                        <!-- Price -->

                        <div class="price">

                            &#8377;<%= item.getFood().getPrice() %>

                        </div>



                        <!-- Quantity -->

                        <div>

                            <span class="quantity">

                                <%= item.getQuantity() %>

                            </span>

                        </div>



                        <!-- Total -->

                        <div class="total-price">

                            &#8377;<%= item.getTotalPrice() %>

                        </div>


                    </div>


                <%

                    }

                %>


            </div>



            <!-- =========================
                 Cart Summary
                 ========================= -->

            <div class="summary">


                <div class="summary-label">

                    Grand Total

                </div>


                <div class="grand-total">

                    &#8377;<%= grandTotal %>

                </div>


            </div>



        <%

            } else {

        %>


            <!-- =========================
                 Empty Cart
                 ========================= -->

            <div class="empty-cart">


                <div class="empty-icon">

                    &#128722;

                </div>


                <h2>

                    Your Cart is Empty

                </h2>


                <p>

                    You haven't added any food
                    items yet.

                </p>


            </div>


        <%

            }

        %>



        <!-- =========================
             Navigation
             ========================= -->

        <div class="navigation">


            <a
                href="user-food"
                class="home-button">

                &#8592;
                Back to Menu

            </a>


        </div>


    </div>



    <!-- =========================
         Footer
         ========================= -->

    <div class="footer">

        <p>

            © 2026 FoodFlow |
            Food Ordering Management System

        </p>

    </div>


</body>

</html>