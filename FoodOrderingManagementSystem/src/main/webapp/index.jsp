<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Food Ordering Management System</title>

    <style>

        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f8;
            margin: 0;
            padding: 0;
            text-align: center;
        }

        .header {
            background-color: #222;
            color: white;
            padding: 25px;
        }

        .header h1 {
            margin: 0;
        }

        .container {
            margin-top: 80px;
        }

        .container h2 {
            color: #333;
            margin-bottom: 15px;
            font-size: 32px;
        }

        .container p {
            color: #666;
            font-size: 18px;
            margin-bottom: 35px;
        }

        .login-card {
            background-color: white;
            width: 300px;
            margin: auto;
            padding: 35px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
        }

        .login-card h3 {
            color: #333;
            margin-bottom: 25px;
        }

        .login-button {
            display: inline-block;
            padding: 12px 35px;
            background-color: #087ff5;
            color: white;
            text-decoration: none;
            border-radius: 6px;
            font-size: 18px;
        }

        .login-button:hover {
            background-color: #0668c9;
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

        <h2>Welcome</h2>

        <p>
            Please login to continue.
        </p>

        <div class="login-card">

            <h3>Access Your Account</h3>

            <a href="login.jsp" class="login-button">
                Login
            </a>

        </div>

    </div>

</body>
</html>