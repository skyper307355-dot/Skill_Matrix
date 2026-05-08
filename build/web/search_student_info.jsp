<%-- 
    Document   : search_student_info
    Created on : 11 Sep, 2024, 9:12:02 PM
    Author     : fujitsu
--%>

<%@page import="DB.DBCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Student Info</title>
    <style>
        body {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            background-color: #000;
            color: #fff;
            height: 100vh;
            padding-top: 80px;
            margin: 0;
        }

        /* Navigation Bar */
        .navbar {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
            background-color: #000;
            box-shadow: 0 2px 10px rgba(0, 78, 146, 0.7);
            position: fixed;
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
            color: #fff;
            padding: 10px 20px;
            transition: background-color 0.3s, color 0.3s;
            border-radius: 5px;
            border: 2px solid #0ef;
        }

        .nav-left a:hover,
        .nav-right a:hover {
            background-color: #0ef;
            color: #000;
        }

        /* Form styling */
        .wrapper {
            position: relative;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            width: 400px;
            height: 400px;
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

        .search-btn {
            width: 100%;
            padding: 10px;
            font-size: 1em;
            color: #fff;
            background: #0ef;
            border: none;
            cursor: pointer;
            transition: background 0.3s ease, color 0.3s ease;
        }
        .search-btn:hover {
            background: #fff;
            color: #000;
            box-shadow: 0 0 10px #0ef, 0 0 40px #0ef, 0 0 80px #0ef;
        }

        .user-details {
            color: #fff;
            margin-top: 20px;
            bottom: 20px;
            width: 400px;
            padding: 20px;
            border: 1px solid #0ef;
            border-radius: 10px;
            box-shadow: 0 0 20px #0ef;
        }

        .user-details p {
            font-size: 1.2em;
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

    <!-- Search Form -->
    <div class="wrapper">
        <form action="display_student_info.jsp" method="post">
            <h2>Search Student</h2>
            <div class="input-box">
                <input type="text" name="username" required>
                <label>Enter Username</label>
            </div>
            <button type="submit" class="search-btn">Search</button>
        </form>
    </div>
</body>
</html>
