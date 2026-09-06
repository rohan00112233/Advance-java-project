<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="model.Food" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Admin Food Management</title>

    <style>

        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            padding: 30px;
        }

        h1 {
            text-align: center;
        }

        .container {
            width: 90%;
            margin: auto;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 8px gray;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
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

        .button {
            display: inline-block;
            padding: 8px 12px;
            margin: 3px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }

        .button:hover {
            background-color: #0056b3;
        }

        .add-button {
            background-color: green;
        }

        .delete-button {
            background-color: red;
        }

        .delete-button:hover {
            background-color: darkred;
        }

    </style>

</head>

<body>

    <h1>Admin Food Management</h1>

    <div class="container">

        <!-- Link to the Add Food page. -->
        <a href="add-food.jsp" class="button add-button">
            Add New Food
        </a>

        <table>

            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Category</th>
                <th>Price</th>
                <th>Availability</th>
                <th>Actions</th>
            </tr>

            <%
                // Retrieve the food list sent by AdminFoodServlet.
                List<Food> foodList =
                        (List<Food>) request.getAttribute("foodList");

                // Check whether food items are available.
                if (foodList != null && !foodList.isEmpty()) {

                    // Loop through every food item.
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
                                ₹<%= food.getPrice() %>
                            </td>

                            <td>
                                <%= food.getAvailability() %>
                            </td>

                            <td>

                                <!-- Link to update the selected food item. -->
                                <a
                                    href="edit-food?id=<%= food.getId() %>"
                                    class="button">
                                    Update
                                </a>

                                <!-- Link to delete the selected food item. -->
                                <a
                                    href="delete-food?id=<%= food.getId() %>"
                                    class="button delete-button">
                                    Delete
                                </a>

                            </td>

                        </tr>

            <%
                    }

                } else {
            %>

                    <tr>
                        <td colspan="6">
                            No food items available.
                        </td>
                    </tr>

            <%
                }
            %>

        </table>

    </div>

</body>

</html>