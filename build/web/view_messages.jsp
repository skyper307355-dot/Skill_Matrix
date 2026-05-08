<%-- 
    Document   : view_messages
    Created on : 13 Sep, 2024, 8:22:37 PM
    Author     : fujitsu
--%>

<%-- 
    Document   : view_messages
    Created on : 13 Sep, 2024, 8:22:37 PM
    Author     : fujitsu
--%>

<%@ page import="java.sql.*, DB.DBCon" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Contact Messages - Admin</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            padding-top: 60px;
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
        
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 50px 0;
        }
        
        table, th, td {
            border: 1px solid #ddd;
        }
        
        th, td {
            padding: 12px;
            text-align: left;
            word-wrap: break-word;
        }
        
        th {
            background-color: #333;
            color: white;
        }
        
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        
        @media (max-width: 768px) {
            th, td {
                font-size: 14px;
            }
        }
    </style>
</head>
<body>
    <nav class="navbar">
        <ul>
            <li><a href="AdminHome.jsp">Home</a></li>
            <li><a href="ChangePasswordAdmin.jsp">Change Password</a></li>
            <li><a href="index.html">Logout</a></li>
        </ul>
    </nav>
    <h2>Messages from Contact Form</h2>
    <table>
        <tr>
            <th>Name</th>
            <th>Email</th>
            <th>Message</th>
        </tr>
        <%
            DB.DBCon db = null;
            try {
                db = new DB.DBCon();
                db.pstmt = db.con.prepareStatement("SELECT name, email, message FROM contact_feed");
                db.rst = db.pstmt.executeQuery();
                
                while (db.rst.next()) {
        %>
                    <tr>
                        <td><%= db.rst.getString("name") %></td>
                        <td><%= db.rst.getString("email") %></td>
                        <td><%= db.rst.getString("message") %></td>
                    </tr>
        <%
                }
            } catch (Exception e) {
                out.println("<tr><td colspan='3'>Error fetching messages</td></tr>");
            }
        %>
    </table>
</body>
</html>
