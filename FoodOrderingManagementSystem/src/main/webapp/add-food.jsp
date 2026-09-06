<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Add Food</title>

    <style>

        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            padding: 30px;
        }

        .form-container {
            width: 400px;
            margin: auto;
            background-color: white;
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0 0 8px gray;
        }

        h1 {
            text-align: center;
        }

        label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
        }

        input,
        select {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            box-sizing: border-box;
        }

        button {
            width: 100%;
            padding: 12px;
            margin-top: 20px;
            background-color: green;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        button:hover {
            background-color: darkgreen;
        }

        .back-button {
            display: block;
            text-align: center;
            margin-top: 15px;
            color: #007bff;
            text-decoration: none;
        }

    </style>

</head>

<body>

    <div class="form-container">

        <h1>Add New Food</h1>

        <!--
            The form sends data to AddFoodServlet.
            method="post" calls the doPost() method.
        -->
        <form action="add-food" method="post">

            <label for="name">Food Name:</label>

            <input
                type="text"
                id="name"
                name="name"
                required>

            <label for="category">Category:</label>

            <input
                type="text"
                id="category"
                name="category"
                required>

            <label for="price">Price:</label>

            <input
                type="number"
                id="price"
                name="price"
                step="0.01"
                min="0"
                required>

            <label for="availability">Availability:</label>

            <select
                id="availability"
                name="availability"
                required>

                <option value="Yes">Yes</option>
                <option value="No">No</option>

            </select>

            <button type="submit">
                Add Food
            </button>

        </form>

        <!-- Return to the admin food management page. -->
        <a href="admin-food" class="back-button">
            Back to Admin Food Management
        </a>

    </div>

</body>

</html>