<%-- 
    Document   : Login
    Created on : 7 Sep, 2024, 3:54:26 PM
    Author     : fujitsu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <style>
        body {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #000;
            //background-color: lightblue;
            margin: 0;
            padding-top: 80px; /* Added to avoid content overlap */
        }

        /* Navigation Bar */
        .navbar {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
            background-color: #000;
            box-shadow: 0 2px 10px rgba(0, 78, 146, 0.7);
            position: fixed; /* Fixed position for the navbar */
            top: 0;
            width: 100%;
            z-index: 1000;
        }

        .nav-container {
            display: flex;
            justify-content: space-between;
            width: 100%;
            max-width: 1200px;
            padding: 0 20px;
        }

        .nav-left,
        .nav-right {
            display: flex;
            gap: 15px;
        }

        .nav-left li,
        .nav-right li {
            list-style: none;
        }

        .nav-left a,
        .nav-right a {
            text-decoration: none;
            color: #fff; /* Changed to white for better visibility */
            padding: 10px 20px;
            transition: background-color 0.3s, color 0.3s;
            border-radius: 5px;
            border: 2px solid #0ef; /* Added border to make the buttons stand out */
        }

        .nav-left a:hover,
        .nav-right a:hover {
            background-color: #0ef;
            color: #000;
        }

        .login-btn,
        .register-btn {
            background-color: #0ef;
    color: #000;
    padding: 10px 20px;
    border-radius: 5px;
    transition: background-color 0.3s, color 0.3s, transform 0.3s;
    font-weight: bold;
    position: relative;
        }

        .login-btn:hover,
        .register-btn:hover {
            background-color: #00aaff;
    color: #fff;
    transform: translateY(-5px); /* Move buttons up on hover */
    box-shadow: 0 10px 20px rgba(0, 78, 146, 0.7); /* Add shadow on hover */
        }

        /* Centering the form */
        .wrapper {
            position: relative;
            display: flex;
            justify-content: center;
            align-items: center;
            width: 400px;
            height: 500px;
            background: transparent;
            border: 5px solid #333;
            border-radius: 10px;
            transition: .5s;
        }

        .wrapper:hover {
            border: 5px solid #0ef;
            box-shadow: 0 0 20px #0ef, inset 0 0 20px #0ef;
        }

        h2 {
            font-size: 2em;
            text-align: center;
            color: #fff;
            transition: .5s;
        }

        .wrapper:hover h2 {
            color: #0ef;
        }

        .input-box {
            position: relative;
            width: 320px;
            margin: 30px 0;
        }

        .input-box input {
            width: 100%;
            padding: 10px;
            font-size: 1em;
            color: #fff;
            background: transparent;
            border: none;
            border-bottom: 2px solid #fff;
            outline: none;
        }

        .input-box input:focus {
            border-bottom: 2px solid #0ef;
        }

        .input-box label {
            position: absolute;
            top: 10px;
            left: 10px;
            color: #fff;
            pointer-events: none;
            transition: .5s;
        }

        .input-box input:focus ~ label,
        .input-box input:valid ~ label {
            top: -20px;
            left: 0;
            color: #0ef;
            font-size: 0.8em;
        }

        .login-btn {
            width: 100%;
            padding: 10px;
            font-size: 1em;
            color: #fff;
            background: #0ef;
            border: none;
            cursor: pointer;
            transition: .3s;
        }

        .login-btn:hover {
            background: #0cf;
        }

        .links {
            text-align: center;
            color: #fff;
            margin-top: 10px;
        }

        .links a {
            color: #0ef;
            text-decoration: none;
        }

        .links a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar">
        <div class="nav-container">
            <ul class="nav-left">
                <li><a href="index.html">Home</a></li>
                <li><a href="about.jsp">About</a></li>
                <li><a href="rules.jsp">Rules</a></li>
                <li><a href="contact.jsp">Contact</a></li>
            </ul>
            <ul class="nav-right">
                <li><a href="Login.jsp" class="login-btn">Login</a></li>
                <li><a href="Registration.jsp" class="register-btn">Register</a></li>
            </ul>
        </div>
    </nav>

    <!-- Login Form -->
    <div class="wrapper">
        <form action="LoginValidate" method="post">
            <h2>Login</h2>
            <div class="input-box">
                <input type="text" name="t2" required>
                <label>Username</label>
            </div>
            <div class="input-box">
                <input type="password" name="t3" required>
                <label>Password</label>
            </div>
            <button type="submit" class="login-btn">Login</button>
            <div class="links">
                <p>Don't have an account? <a href="Registration.jsp">Register</a></p>
            </div>
        </form>
    </div>
</body>
</html>
