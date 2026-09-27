<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="model.User" %>
<%@ page import="model.Food" %>
<%@ page import="java.util.List" %>


<%

    // Get the logged-in user from the HTTP session.

    User user =
            (User) session.getAttribute("user");


    // Get the food list sent by UserFoodServlet.

    List<Food> foods =
            (List<Food>) request.getAttribute("foodList");


    // Store username for displaying
    // personalized information.

    String username = "";

    if (user != null) {

        username =
                user.getUsername();

    }

%>


<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <title>FoodFlow - Menu</title>


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


        .nav-right {

            display: flex;

            align-items: center;

            gap: 20px;

        }


        .welcome-user {

            font-size: 16px;

            color: #f1f1f1;

        }


        .cart-button {

            background-color: #ff6b35;

            color: white;

            text-decoration: none;

            padding: 10px 18px;

            border-radius: 6px;

            font-weight: bold;

        }


        .cart-button:hover {

            background-color: #e85a2a;

        }


        /* =========================
           Hero Section
           ========================= */

        .hero {

            background:

                linear-gradient(
                    135deg,
                    #ff6b35,
                    #ff914d
                );

            color: white;

            padding: 55px 6%;

        }


        .hero-content {

            max-width: 1100px;

            margin: auto;

        }


        .hero h1 {

            margin: 0 0 12px 0;

            font-size: 42px;

        }


        .hero p {

            margin: 0;

            font-size: 19px;

            opacity: 0.95;

        }


        /* =========================
           Main Container
           ========================= */

        .container {

            width: 88%;

            max-width: 1200px;

            margin: 40px auto;

        }


        .section-title {

            font-size: 30px;

            margin-bottom: 8px;

        }


        .section-subtitle {

            color: #666;

            margin-bottom: 30px;

        }


        /* =========================
           Food Grid
           ========================= */

        .food-grid {

            display: grid;

            grid-template-columns:
                repeat(
                    auto-fit,
                    minmax(250px, 1fr)
                );

            gap: 25px;

        }


        /* =========================
           Food Card
           ========================= */

        .food-card {

            background-color: white;

            border-radius: 12px;

            overflow: hidden;

            box-shadow:
                0 4px 12px
                rgba(0, 0, 0, 0.10);

            transition:
                transform 0.2s,
                box-shadow 0.2s;

        }


        .food-card:hover {

            transform:
                translateY(-5px);

            box-shadow:
                0 8px 20px
                rgba(0, 0, 0, 0.15);

        }


        /* =========================
           Food Image
           ========================= */

        .food-image {

            height: 160px;

            background:
                linear-gradient(
                    135deg,
                    #ffe0d2,
                    #fff1eb
                );

            display: flex;

            align-items: center;

            justify-content: center;

            font-size: 65px;

        }


        .food-content {

            padding: 20px;

        }


        .food-name {

            font-size: 22px;

            font-weight: bold;

            margin-bottom: 8px;

        }


        .food-category {

            color: #777;

            font-size: 14px;

            margin-bottom: 15px;

        }


        .food-bottom {

            display: flex;

            align-items: center;

            justify-content: space-between;

            margin-top: 18px;

        }


        .price {

            font-size: 21px;

            font-weight: bold;

            color: #222;

        }


        .availability {

            font-size: 13px;

            font-weight: bold;

        }


        .available {

            color: #218838;

        }


        .unavailable {

            color: #dc3545;

        }


        /* =========================
           Add To Cart Button
           ========================= */

        .add-cart-button {

            display: block;

            width: 100%;

            margin-top: 18px;

            padding: 12px;

            background-color: #087ff5;

            color: white;

            text-align: center;

            text-decoration: none;

            border-radius: 6px;

            font-size: 16px;

            font-weight: bold;

        }


        .add-cart-button:hover {

            background-color: #0668c9;

        }


        /* =========================
           Unavailable Button
           ========================= */

        .unavailable-button {

            display: block;

            width: 100%;

            box-sizing: border-box;

            margin-top: 18px;

            padding: 12px;

            background-color: #ddd;

            color: #777;

            text-align: center;

            border-radius: 6px;

            font-size: 16px;

            font-weight: bold;

        }


        /* =========================
           Empty Food Message
           ========================= */

        .empty-message {

            background-color: white;

            padding: 40px;

            text-align: center;

            border-radius: 10px;

            color: #666;

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

        @media (max-width: 600px) {


            .navbar {

                padding: 0 20px;

            }


            .logo {

                font-size: 22px;

            }


            .welcome-user {

                display: none;

            }


            .hero {

                padding: 40px 20px;

            }


            .hero h1 {

                font-size: 32px;

            }


            .container {

                width: 92%;

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


        <div class="nav-right">


            <div class="welcome-user">

                &#128075;
                Hello,
                <strong>
                    <%= username %>
                </strong>

            </div>


            <a
                href="cart"
                class="cart-button">

                &#128722;
                View Cart

            </a>


        </div>


    </div>



    <!-- =========================
         Hero Section
         ========================= -->

    <div class="hero">


        <div class="hero-content">


            <h1>

                Welcome,
                <%= username %>
                &#128075;

            </h1>


            <p>

                Delicious food is just a few
                clicks away.
                Choose your favorite meal
                and add it to your cart.

            </p>


        </div>


    </div>



    <!-- =========================
         Food Section
         ========================= -->

    <div class="container">


        <h2 class="section-title">

            Explore Our Menu

        </h2>


        <p class="section-subtitle">

            Fresh and delicious choices
            available for you.

        </p>



        <%

            if (foods != null &&
                !foods.isEmpty()) {

        %>


            <div class="food-grid">


                <%

                    for (Food food : foods) {

                %>


                    <div class="food-card">


                        <!-- Food Image -->

                        <div class="food-image">

                            &#127869;

                        </div>



                        <div class="food-content">


                            <!-- Food Name -->

                            <div class="food-name">

                                <%= food.getName() %>

                            </div>



                            <!-- Category -->

                            <div class="food-category">

                                <%= food.getCategory() %>

                            </div>



                            <!-- Price and Availability -->

                            <div class="food-bottom">


                                <div class="price">

                                    &#8377;<%= food.getPrice() %>

                                </div>



                                <%

                                    if (
                                        "Yes".equalsIgnoreCase(
                                            food.getAvailability()
                                        )
                                    ) {

                                %>


                                    <div
                                        class="availability available">

                                        &#10003;
                                        Available

                                    </div>


                                <%

                                    } else {

                                %>


                                    <div
                                        class="availability unavailable">

                                        &#10007;
                                        Unavailable

                                    </div>


                                <%

                                    }

                                %>


                            </div>



                            <!-- Add To Cart -->

                            <%

                                if (
                                    "Yes".equalsIgnoreCase(
                                        food.getAvailability()
                                    )
                                ) {

                            %>


                                <a
                                    href="add-cart?id=<%= food.getId() %>"
                                    class="add-cart-button">

                                    &#128722;
                                    Add to Cart

                                </a>


                            <%

                                } else {

                            %>


                                <div
                                    class="unavailable-button">

                                    Currently Unavailable

                                </div>


                            <%

                                }

                            %>


                        </div>


                    </div>


                <%

                    }

                %>


            </div>


        <%

            } else {

        %>


            <!-- No Food Message -->

            <div class="empty-message">


                <h3>

                    No food items available

                </h3>


                <p>

                    Please check again later.

                </p>


            </div>


        <%

            }

        %>


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