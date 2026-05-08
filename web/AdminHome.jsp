<%-- 
    Document   : AdminHome
    Created on : 2 Sep, 2024, 8:44:48 PM
    Author     : fujitsu
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Module</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f0f5;
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

        /* Set grid to 3 columns for 3 items per row */
        .section ul {
            display: grid;
            grid-template-columns: repeat(3, 1fr); /* 3 columns */
            gap: 20px;
            list-style-type: none;
            padding: 0;
            width: 100%;
        }

        .section li {
            background-color: transparent; /* No background */
            padding: 0; /* Remove padding to allow full clickable area */
            border: 2px solid #0099ff; /* Border for visibility */
            border-radius: 10px;
            text-align: center;
            transition: background-color 0.3s ease, transform 0.3s ease;
            cursor: pointer; /* Change cursor to pointer */
        }

        .section li:hover {
            background-color: #0099ff; /* Change background on hover */
            color: #fff; /* Change text color on hover */
            transform: translateY(-5px);
        }

        .section li a {
            display: block; /* Make the link cover the entire li */
            height: 100%; /* Ensure it takes full height */
            width: 100%; /* Ensure it takes full width */
            color: inherit; /* Inherit color from the li */
            text-decoration: none;
            font-size: 1.2em;
            font-weight: bold;
            padding: 20px; /* Add padding for better click area */
            box-sizing: border-box; /* Include padding in total width and height */
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
            <li><a href="AdminHome.jsp">Home</a></li>
            <li><a href="ChangePasswordAdmin.jsp">Change Password</a></li>
            <li><a href="index.html">Logout</a></li>
        </ul>
    </nav>

    <!-- Admin Module Content -->
    <div class="content">
        <section class="section">
            <h2>Admin Module</h2>
            <ul>
                <li><a href="view_student_info.jsp">View Student Information</a></li>
                <li><a href="search_student_info.jsp">Search Student Information</a></li>
                <li><a href="add_question.jsp">Add Questions</a></li>
                <li><a href="update_question.jsp">Update Questions</a></li>
                <li><a href="delete_question.jsp">Delete Questions</a></li>
                <li><a href="view_question_list.jsp">View Question List</a></li>
                <li><a href="view_messages.jsp">View Messages</a></li>
            </ul>
        </section>
    </div>

    <!-- Footer -->
    <footer>
        <p>&copy; 2024 Admin Module. All rights reserved.</p>
    </footer>

</body>
</html>
