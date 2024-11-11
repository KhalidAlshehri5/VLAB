<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #6dd5fa, #2980b9);
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            color: #333;
        }
        .header {
            width: 100%;
            background-color: #333;
            padding: 10px;
            text-align: center;
            color: #fff;
            position: fixed;
            top: 0;
            left: 0;
        }
        .header h1 {
            margin: 0;
            font-size: 18px;
        }
        .container {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
            text-align: center;
            max-width: 400px;
            width: 100%;
            margin-top: 80px;
        }
        h2 {
            color: #333;
            margin-bottom: 20px;
        }
        label {
            font-weight: bold;
            display: block;
            margin-top: 10px;
        }
        input {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .login-btn {
            width: 100%;
            padding: 15px;
            margin-top: 20px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            background-color: #4CAF50;
            color: #fff;
        }
        .login-btn:hover {
            opacity: 0.9;
        }
        .register-link {
            margin-top: 15px;
            display: block;
            font-size: 14px;
            color: #007bff;
            text-decoration: none;
        }
        .register-link:hover {
            color: #0056b3;
        }
        footer {
            position: fixed;
            bottom: 0;
            width: 100%;
            background-color: #333;
            color: #fff;
            text-align: center;
            padding: 10px;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Welcome to VLAB Login</h1>
    </div>

    <div class="container">
        <h2>Login</h2>
        <form action="/login" method="POST">
            <label for="username">Username</label>
            <input type="text" id="username" name="username" required>

            <label for="password">Password</label>
            <input type="password" id="password" name="password" required>

            <button type="submit" class="login-btn">Login</button>
        </form>
        <a href="/register" class="register-link">Don't have an account? Register here</a>
    </div>

    <footer>
        VLAB Project © 2024 | Empowering students with cloud-based learning environments
    </footer>
</body>
</html>
