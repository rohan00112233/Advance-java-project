<%@ page import="model.Food" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Food</title>

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
            max-width: 550px;
            margin: 50px auto;
        }

        .container h2 {
            text-align: center;
            font-size: 36px;
            color: #222;
            margin-bottom: 30px;
        }

        /* Form card */
        .form-card {
            background-color: white;
            padding: 35px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
        }

        /* Form group */
        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-size: 17px;
            font-weight: bold;
            color: #333;
        }

        /* Input fields */
        .form-group input,
        .form-group select {
            width: 100%;
            box-sizing: border-box;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 16px;
        }

        .form-group input:focus,
        .form-group select:focus {
            outline: none;
            border-color: #087ff5;
        }

        /* Food ID */
        .food-id {
            background-color: #eeeeee;
            color: #555;
        }

        /* Buttons */
        .button-container {
            text-align: center;
            margin-top: 25px;
        }

        .button {
            display: inline-block;
            padding: 12px 22px;
            margin: 5px;
            border: none;
            background-color: #f39c12;
            color: white;
            text-decoration: none;
            border-radius: 6px;
            font-size: 17px;
            cursor: pointer;
        }

        .button:hover {
            background-color: #d68910;
        }

        .back-button {
            background-color: #555;
        }

        .back-button:hover {
            background-color: #333;
        }

        /* Food not found */
        .not-found {
            background-color: white;
            padding: 30px;
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

        <h2>Edit Food</h2>

        <%
            Food food = (Food) request.getAttribute("food");
        %>

        <%
            if (food != null) {
        %>

            <!-- Edit form -->
            <div class="form-card">

                <form action="edit-food" method="post">

                    <!-- Food ID -->
                    <div class="form-group">

                        <label for="id">
                            Food ID
                        </label>

                        <input type="text"
                               id="id"
                               name="id"
                               value="<%= food.getId() %>"
                               class="food-id"
                               readonly>

                    </div>

                    <!-- Food name -->
                    <div class="form-group">

                        <label for="name">
                            Food Name
                        </label>

                        <input type="text"
                               id="name"
                               name="name"
                               value="<%= food.getName() %>"
                               required>

                    </div>

                    <!-- Category -->
                    <div class="form-group">

                        <label for="category">
                            Category
                        </label>

                        <input type="text"
                               id="category"
                               name="category"
                               value="<%= food.getCategory() %>"
                               required>

                    </div>

                    <!-- Price -->
                    <div class="form-group">

                        <label for="price">
                            Price
                        </label>

                        <input type="number"
                               id="price"
                               name="price"
                               value="<%= food.getPrice() %>"
                               step="0.01"
                               min="0"
                               required>

                    </div>

                    <!-- Availability -->
                    <div class="form-group">

                        <label for="availability">
                            Availability
                        </label>

                        <select id="availability"
                                name="availability"
                                required>

                            <option value="Yes"
                                <%= "Yes".equals(food.getAvailability()) ? "selected" : "" %>>
                                Yes
                            </option>

                            <option value="No"
                                <%= "No".equals(food.getAvailability()) ? "selected" : "" %>>
                                No
                            </option>

                        </select>

                    </div>

                    <!-- Buttons -->
                    <div class="button-container">

                        <button type="submit" class="button">
                            Update Food
                        </button>

                        <a href="admin-food"
                           class="button back-button">
                            Back
                        </a>

                    </div>

                </form>

            </div>

        <%
            } else {
        %>

            <!-- Food not found -->
            <div class="not-found">

                <p>Food item not found.</p>

                <a href="admin-food"
                   class="button back-button">
                    Back to Admin
                </a>

            </div>

        <%
            }
        %>

    </div>

</body>
</html>