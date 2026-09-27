<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">

    <title>Register - FoodFlow</title>

    <style>

        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f8;
            margin: 0;
            padding: 0;
        }

        .header {
            background-color: #222;
            color: white;
            text-align: center;
            padding: 25px;
        }

        .header h1 {
            margin: 0;
        }

        .container {
            width: 90%;
            max-width: 450px;
            margin: 60px auto;
        }

        .container h2 {
            text-align: center;
            font-size: 36px;
            color: #222;
            margin-bottom: 30px;
        }

        .register-card {
            background-color: white;
            padding: 35px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
        }

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

        .button-container {
            text-align: center;
            margin-top: 25px;
        }

        .register-button {
            width: 100%;
            padding: 12px;
            border: none;
            background-color: #087ff5;
            color: white;
            border-radius: 6px;
            font-size: 18px;
            cursor: pointer;
        }

        .register-button:hover {
            background-color: #0668c9;
        }

        .login-button {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #555;
            color: white;
            text-decoration: none;
            border-radius: 6px;
            font-size: 16px;
        }

        .login-button:hover {
            background-color: #333;
        }

        .error-message {
            background-color: #f8d7da;
            color: #842029;
            padding: 12px;
            border-radius: 6px;
            margin-bottom: 20px;
            text-align: center;
        }

        .success-message {
            background-color: #d1e7dd;
            color: #0f5132;
            padding: 12px;
            border-radius: 6px;
            margin-bottom: 20px;
            text-align: center;
        }

    </style>
</head>

<body>

    <div class="header">
        <h1>FoodFlow</h1>
    </div>

    <div class="container">

        <h2>Create Account</h2>

        <div class="register-card">

            <%
                String error = request.getParameter("error");
                String success = request.getParameter("success");

                if ("exists".equals(error)) {
            %>

                <div class="error-message">
                    Username already exists.
                </div>

            <%
                } else if ("password".equals(error)) {
            %>

                <div class="error-message">
                    Passwords do not match.
                </div>

            <%
                } else if ("failed".equals(error)) {
            %>

                <div class="error-message">
                    Registration failed. Please try again.
                </div>

            <%
                }

                if ("registered".equals(success)) {
            %>

                <div class="success-message">
                    Registration successful. Please login.
                </div>

            <%
                }
            %>

            <form action="register" method="post">

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

                <div class="form-group">

                    <label for="confirmPassword">
                        Confirm Password
                    </label>

                    <input type="password"
                           id="confirmPassword"
                           name="confirmPassword"
                           placeholder="Confirm password"
                           required>

                </div>

                <div class="button-container">

                    <button type="submit"
                            class="register-button">
                        Register
                    </button>

                    <a href="login.jsp"
                       class="login-button">
                        Back to Login
                    </a>

                </div>

            </form>

        </div>

    </div>

</body>
</html>