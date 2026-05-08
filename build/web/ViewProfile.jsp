<%-- 
    Document   : ViewProfile
    Created on : 12 Sep, 2024, 2:51:46 PM
    Author     : fujitsu
--%>

<%@page import="DB.DBCon"%>
<%@page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Profile</title>
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

        /* User details display */
        .user-details {
            margin-top: 20px;
            padding: 20px;
            width: 400px;
            border: 1px solid #0ef;
            border-radius: 10px;
            box-shadow: 0 0 20px #0ef;
        }

        .user-details table {
            width: 100%;
            border-collapse: collapse;
        }
        
        .user-details h2 {
            text-align: center;
        }

        .user-details td {
            padding: 10px;
            color: #fff;
        }

        .user-details th {
            color: #0ef;
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

    <% 
        String currentUser = (String) session.getAttribute("user");
        if (currentUser != null) {
            try {
                DBCon db = new DBCon();
                db.pstmt = db.con.prepareStatement("SELECT * FROM user_info WHERE u_name = ?");
                db.pstmt.setString(1, currentUser);
                db.rst = db.pstmt.executeQuery();
                if (db.rst.next()) {
    %>
    <div class="user-details">
        <h2 style="color: #fff;">Your Profile</h2>
        <table>
            <tr><th>Username:</th><td><%= db.rst.getString("u_name") %></td></tr>
            <tr><th>Date of Birth:</th><td><%= db.rst.getString("dob") %></td></tr>
            <tr><th>Gender:</th><td><%= db.rst.getString("gender") %></td></tr>
            <tr><th>Qualification 1:</th><td><%= db.rst.getString("quali1") %></td></tr>
            <tr><th>Qualification 2:</th><td><%= db.rst.getString("quali2") %></td></tr>
            <tr><th>Address:</th><td><%= db.rst.getString("addr") %></td></tr>
            <tr><th>City:</th><td><%= db.rst.getString("city") %></td></tr>
            <tr><th>Contact:</th><td><%= db.rst.getString("contact") %></td></tr>
            <tr><th>Email:</th><td><%= db.rst.getString("email") %></td></tr>
        </table>
    </div>
    <% 
                } else {
                    out.println("<h2 style='color:red;'>No profile found for user: " + currentUser + "</h2>");
                }
            } catch(Exception e) {
                e.printStackTrace();
                out.println("<h2 style='color:red;'>Error occurred while fetching your profile.</h2>");
            }
        }
    %>
</body>
</html>
