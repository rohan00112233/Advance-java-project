<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add New Food</title>

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
            background-color: #008000;
            color: white;
            text-decoration: none;
            border-radius: 6px;
            font-size: 17px;
            cursor: pointer;
        }

        .button:hover {
            background-color: #006400;
        }

        .back-button {
            background-color: #555;
        }

        .back-button:hover {
            background-color: #333;
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

        <h2>Add New Food</h2>

        <!-- Food form -->
        <div class="form-card">

            <form action="add-food" method="post">

                <!-- Food name -->
                <div class="form-group">

                    <label for="name">
                        Food Name
                    </label>

                    <input type="text"
                           id="name"
                           name="name"
                           placeholder="Enter food name"
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
                           placeholder="Enter category"
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
                           placeholder="Enter price"
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

                        <option value="">Select availability</option>
                        <option value="Yes">Yes</option>
                        <option value="No">No</option>

                    </select>

                </div>

                <!-- Buttons -->
                <div class="button-container">

                    <button type="submit" class="button">
                        Add Food
                    </button>

                    <a href="admin-food"
                       class="button back-button">
                        Back
                    </a>

                </div>

            </form>

        </div>

    </div>

</body>
</html>