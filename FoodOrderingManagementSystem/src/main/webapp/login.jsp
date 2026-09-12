<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login - Food Ordering Management System</title>

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
            max-width: 450px;
            margin: 70px auto;
        }

        .container h2 {
            text-align: center;
            font-size: 36px;
            color: #222;
            margin-bottom: 30px;
        }

        /* Login card */
        .login-card {
            background-color: white;
            padding: 35px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
        }

        /* Form group */
        .form-group {
            margin-bottom: 22px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-size: 17px;
            font-weight: bold;
            color: #333;
        }

        /* Input fields */
        .form-group input {
            width: 100%;
            box-sizing: border-box;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 16px;
        }

        .form-group input:focus {
            outline: none;
            border-color: #087ff5;
        }

        /* Login button */
        .button-container {
            text-align: center;
            margin-top: 25px;
        }

        .login-button {
            width: 100%;
            padding: 12px;
            border: none;
            background-color: #087ff5;
            color: white;
            border-radius: 6px;
            font-size: 18px;
            cursor: pointer;
        }

        .login-button:hover {
            background-color: #0668c9;
        }

        /* Home button */
        .home-button {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #555;
            color: white;
            text-decoration: none;
            border-radius: 6px;
            font-size: 16px;
        }

        .home-button:hover {
            background-color: #333;
        }

        /* Login error message */
        .error-message {
            background-color: #f8d7da;
            color: #842029;
            padding: 12px;
            border-radius: 6px;
            margin-bottom: 20px;
            text-align: center;
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

        <h2>Login</h2>

        <div class="login-card">

            <!-- Display login error if present -->
            <%
                String error = request.getParameter("error");

                if ("invalid".equals(error)) {
            %>

                <div class="error-message">
                    Invalid username or password.
                </div>

            <%
                }
            %>

            <!-- Login form -->
            <form action="login" method="post">

                <!-- Username -->
                <div class="form-group">

                    <label for="username">
                        Username
                    </label>

                    <input type="text"
                           id="username"
                           name="username"
                           placeholder="Enter username"
                           required>

                </div>

                <!-- Password -->
                <div class="form-group">

                    <label for="password">
                        Password
                    </label>

                    <input type="password"
                           id="password"
                           name="password"
                           placeholder="Enter password"
                           required>

                </div>

                <!-- Login button -->
                <div class="button-container">

                    <button type="submit"
                            class="login-button">
                        Login
                    </button>

                    <a href="index.jsp"
                       class="home-button">
                        Back to Home
                    </a>

                </div>

            </form>

        </div>

    </div>

</body>
</html>