<%-- 
    Document   : view_student_info
    Created on : 8 Sep, 2024, 9:18:44 PM
    Author     : fujitsu
--%>

<%@ page import="java.sql.*" %>
<%@ page import="DB.DBCon" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Student Information</title>
    <style>
        body {
            display: flex;
            flex-direction: column;
            align-items: center;
            height: auto;
            background-color: #000;
            margin: 0;
            padding-top: 80px;
            color: #fff;
        }

        /* Navigation Bar (No change) */
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

        .nav-left, .nav-right {
            display: flex;
            gap: 15px;
        }

        .nav-left li, .nav-right li {
            list-style: none;
        }

        .nav-left a, .nav-right a {
            text-decoration: none;
            color: #fff;
            padding: 10px 20px;
            transition: background-color 0.3s, color 0.3s;
            border-radius: 5px;
            border: 2px solid #0ef;
        }

        .nav-left a:hover, .nav-right a:hover {
            background-color: #0ef;
            color: #000;
            text-decoration: none;
        }

        /* Content Area */
        .content {
            padding: 100px 20px;
            max-width: 1200px;
            width: 100%;
        }

        .section {
            margin-bottom: 40px;
            background-color: #222;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.5);
            transition: box-shadow 0.3s ease;
        }

        .section:hover {
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.7);
        }

        .section h2 {
            font-size: 2em;
            margin-bottom: 20px;
            text-align: center;
            color: #0ef;
        }

        /* Grid layout for 4 buttons per row with fixed size */
        .username-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr); /* 4 buttons per row */
            gap: 20px;
            list-style-type: none;
            padding: 0;
            width: 100%;
            max-width: 1200px; /* Controls width of the grid */
        }

        .username-item {
            text-align: center;
        }

        .username-item a {
            display: block; /* Ensures button occupies block space */
            padding: 20px; /* Adjust padding for button size */
            color: #fff;
            border: 2px solid #0ef;
            border-radius: 10px;
            text-decoration: none;
            font-size: 1.2em; /* Medium font size */
            font-weight: bold;
            width: 100%; /* Ensures uniform button size */
            box-sizing: border-box; /* Include padding/border in width */
            transition: background-color 0.3s ease, color 0.3s ease, transform 0.3s ease;
            cursor: pointer;
        }

        .username-item a:hover {
            background-color: #0ef;
            color: #000;
            transform: translateY(-3px);
            text-decoration: none;
        }

        /* Button Styling */
        .back-btn {
            margin-top: -70px;
            padding: 10px 20px;
            font-size: 1em;
            color: #000;
            background: #0ef;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            transition: background 0.3s ease, color 0.3s ease;
            margin-bottom: 20px;
        }

        .back-btn:hover {
            background: #fff;
            color: #000;
            box-shadow: 0 0 10px #0ef, 0 0 40px #0ef, 0 0 80px #0ef;
            text-decoration: none;
        }
    </style>
</head>
<body>

    <!-- Navigation Bar (No change) -->
    <nav class="navbar">
        <div class="nav-container">
            <ul class="nav-left">
                <li><a href="AdminHome.jsp">Home</a></li>
                <li><a href="ChangePasswordAdmin.jsp">Change Password</a></li>
                <li><a href="index.html">Logout</a></li>
            </ul>
        </div>
    </nav>

    <div class="content">
        <section class="section">
            <h2>Student Usernames</h2>
            <ul class="username-grid">
                <%
                    try {
                        DBCon db = new DBCon();
                        PreparedStatement ps = db.con.prepareStatement("SELECT u_name FROM user_info");
                        ResultSet rs = ps.executeQuery();
                        
                        while (rs.next()) {
                            String username = rs.getString("u_name");
                            out.print("<li class='username-item'><a href='user_detail.jsp?username=" + username + "'>" + username + "</a></li>");
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </ul>
        </section>
    </div>
    <a href="AdminHome.jsp" class="back-btn">Back</a>

</body>
</html>
