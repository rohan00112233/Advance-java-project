<%@ page import="java.util.List" %>
<%@ page import="model.Food" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Food Management</title>

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
            margin: 45px auto;
        }

        .container h2 {
            text-align: center;
            font-size: 36px;
            color: #222;
            margin-bottom: 30px;
        }

        /* Top navigation */
        .navigation {
            text-align: center;
            margin-bottom: 30px;
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

        .add-button {
            background-color: #008000;
        }

        .add-button:hover {
            background-color: #006400;
        }

        .home-button {
            background-color: #555;
        }

        .home-button:hover {
            background-color: #333;
        }

        /* Food table */
        .food-table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
            border-radius: 10px;
            overflow: hidden;
        }

        .food-table th {
            background-color: #222;
            color: white;
            padding: 15px;
            font-size: 17px;
        }

        .food-table td {
            padding: 14px;
            text-align: center;
            border-bottom: 1px solid #ddd;
            font-size: 16px;
        }

        .food-table tr:last-child td {
            border-bottom: none;
        }

        .food-table tr:hover {
            background-color: #f5f5f5;
        }

        /* Update button */
        .update-button {
            background-color: #f39c12;
            padding: 8px 14px;
            font-size: 15px;
        }

        .update-button:hover {
            background-color: #d68910;
        }

        /* Delete button */
        .delete-button {
            background-color: #d9534f;
            padding: 8px 14px;
            font-size: 15px;
        }

        .delete-button:hover {
            background-color: #c9302c;
        }

        /* No food message */
        .no-food {
            background-color: white;
            padding: 30px;
            text-align: center;
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

        <h2>Admin Food Management</h2>

        <!-- Navigation -->
        <div class="navigation">

            <a href="add-food.jsp" class="button add-button">
                + Add New Food
            </a>

            <a href="index.jsp" class="button home-button">
                Home
            </a>

        </div>

        <%
            List<Food> foodList =
                    (List<Food>) request.getAttribute("foodList");
        %>

        <%
            if (foodList != null && !foodList.isEmpty()) {
        %>

            <!-- Food table -->
            <table class="food-table">

                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Category</th>
                    <th>Price</th>
                    <th>Availability</th>
                    <th>Actions</th>
                </tr>

                <%
                    for (Food food : foodList) {
                %>

                    <tr>

                        <td>
                            <%= food.getId() %>
                        </td>

                        <td>
                            <%= food.getName() %>
                        </td>

                        <td>
                            <%= food.getCategory() %>
                        </td>

                        <td>
                            Rs<%= food.getPrice() %>
                        </td>

                        <td>
                            <%= food.getAvailability() %>
                        </td>

                        <td>

                            <a href="edit-food?id=<%= food.getId() %>"
                               class="button update-button">
                                Update
                            </a>

                            <a href="delete-food?id=<%= food.getId() %>"
                               class="button delete-button">
                                Delete
                            </a>

                        </td>

                    </tr>

                <%
                    }
                %>

            </table>

        <%
            } else {
        %>

            <div class="no-food">
                No food items are currently available.
            </div>

        <%
            }
        %>

    </div>

</body>
</html>