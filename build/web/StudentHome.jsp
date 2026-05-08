<%-- 
    Document   : StudentHome
    Created on : 2 Sep, 2024, 9:18:20 PM
    Author     : fujitsu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Module</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            color: #333;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        /* Navigation Bar */
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 30px;
            background-color: #333;
            color: #fff;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            z-index: 1000;
        }

        .navbar ul {
            display: flex;
            list-style-type: none;
            margin: 0;
            padding: 0;
            gap: 15px;
        }

        .navbar a {
            color: #fff;
            text-decoration: none;
            padding: 10px 20px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .navbar a:hover {
            background-color: #0ef;
            color: #000;
        }

        /* Admin Module Content */
        .content {
            padding: 100px 20px;
            max-width: 1200px;
            width: 100%;
        }

        .section {
            margin-bottom: 40px;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: box-shadow 0.3s ease;
        }

        .section:hover {
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }

        .section h2 {
            font-size: 2em;
            margin-bottom: 20px;
            text-align: center;
            color: #0099ff;
        }

        /* Set grid to 4 columns for 4 items per row */
        .section ul {
            display: grid;
            grid-template-columns: repeat(4, 1fr); /* 4 columns */
            gap: 20px;
            list-style-type: none;
            padding: 0;
            width: 100%;
        }

        .section li {
            background-color: transparent; /* Set background to transparent for buttons */
            padding: 0; /* Remove padding from li */
            border: 2px solid #0099ff; /* Add border for visibility */
            border-radius: 10px; /* Round corners */
            text-align: center; /* Center text */
            transition: background-color 0.3s ease, transform 0.3s ease;
            cursor: pointer; /* Change cursor to pointer for better UX */
        }

        .section li:hover {
            background-color: #0099ff; /* Change background on hover */
            color: #fff; /* Change text color on hover */
            transform: translateY(-5px); /* Slight lift on hover */
        }

        .section li a {
            display: block; /* Make links block-level for full coverage */
            height: 100%; /* Take full height of the li */
            width: 100%; /* Take full width of the li */
            color: inherit; /* Inherit color from li */
            text-decoration: none; /* Remove underline from links */
            font-size: 1.2em; /* Font size */
            font-weight: bold; /* Font weight */
            padding: 20px; /* Add padding for better click area */
            box-sizing: border-box; /* Include padding in total dimensions */
        }

        /* Footer */
        footer {
            background-color: #333;
            color: #fff;
            padding: 20px;
            text-align: center;
            width: 100%;
            position: absolute;
            bottom: 0;
        }
    </style>
</head>
<body>

    <!-- Navigation Bar -->
    <nav class="navbar">
        <ul>
            <li><a href="StudentHome.jsp">Home</a></li>
            <li><a href="ChangePasswordStudent.jsp">Change Password</a></li>
            <li><a href="index.html">Logout</a></li>
        </ul>
    </nav>

    <br><br>
    <!-- Student Module Content -->
    <div class="content">
        <section class="section">
            <h2>Student Module</h2>
            <ul>
                <li><a href="ViewProfile.jsp">Profile</a></li>
                <li><a href="Exam.jsp">Start Exam</a></li>
                <li><a href="ViewResult.jsp">View Result</a></li>
                <li><a href="DeleteAccount.jsp">Delete Your Account</a></li>
            </ul>
        </section>
    </div>

    <!-- Footer -->
    <footer>
        <p>&copy; 2024 Student Module. All rights reserved.</p>
    </footer>

</body>
</html>
