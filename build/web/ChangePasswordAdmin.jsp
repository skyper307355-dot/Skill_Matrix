<%-- 
    Document   : ChangePasswordAdmin
    Created on : 8 Sep, 2024, 12:37:37 PM
    Author     : fujitsu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Change Password</title>
    <style>
        body {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #000;
            margin: 0;
            padding-top: 80px; /* To avoid content overlap */
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
            color: #fff; /* White for better visibility */
            padding: 10px 20px;
            transition: background-color 0.3s, color 0.3s;
            border-radius: 5px;
            border: 2px solid #0ef; /* Add border */
        }

        .nav-left a:hover,
        .nav-right a:hover {
            background-color: #0ef;
            color: #000;
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
            transition: background 0.3s ease, color 0.3s ease;
        }
        .login-btn:hover {
            background: #fff; /* Change background color on hover */
            color: #000;      /* Change text color on hover */
            box-shadow: 0 0 10px #0ef, 0 0 40px #0ef, 0 0 80px #0ef; /* Add glow effect */
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar">
        <div class="nav-container">
            <ul class="nav-left">
                <li><a href="AdminHome.jsp">Home</a></li>
                <li><a href="ChangePasswordAdmin.jsp">Change Password</a></li>
                <li><a href="index.html">Logout</a></li>
            </ul>
        </div>
    </nav>

    <!-- Change Password Form -->
    <div class="wrapper">
        <form action="AChangePassword" method="post">
            <h2>Change Password</h2>
            <div class="input-box">
                <input type="password" name="oldPassword" required>
                <label>Old Password</label>
            </div>
            <div class="input-box">
                <input type="password" name="newPassword" required>
                <label>New Password</label>
            </div>
            <div class="input-box">
                <input type="password" name="confirmPassword" required>
                <label>Confirm Password</label>
            </div>
            <button type="submit" class="login-btn">Change Password</button>
        </form>
        <%
            if(request.getParameter("error")!=null)
            {
                String msg=request.getParameter("error");
                out.println("<h2 style='color:red;'>"+msg+"</h2>");
            }
        %>
    </div>
</body>
</html>
