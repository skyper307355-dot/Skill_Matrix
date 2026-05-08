<%-- 
    Document   : ViewResult
    Created on : 13 Sep, 2024, 6:40:25 PM
    Author     : fujitsu
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DB.DBCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Exam Result</title>
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

        .content {
            padding: 80px 20px 20px;
            max-width: 800px;
            width: 100%;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            background-color: #fff;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        table th, table td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        table th {
            background-color: #333;
            color: white;
        }

        .no-result {
            background-color: #f9f9f9;
            padding: 20px;
            text-align: center;
            border: 1px solid #ccc;
            margin-top: 20px;
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

    <!-- Exam Result Content -->
    <div class="content">
        <h2>Your Exam Result</h2>
        <div class="result">
            <%
                String userId = (String)session.getAttribute("user");

                DBCon db = new DBCon();
                try {
                    PreparedStatement pstmt = db.con.prepareStatement("SELECT * FROM result_mstr WHERE user_id = ?");
                    pstmt.setString(1, userId);
                    ResultSet rst = pstmt.executeQuery();

                    if (rst.next()) {
            %>
            <table>
                <tr>
                    <th>Exam Date</th>
                    <th>Score</th>
                    <th>Total Attempts</th>
                    <th>Correct Answers</th>
                </tr>
                <tr>
                    <td><%= rst.getString("exam_date") %></td>
                    <td><%= rst.getInt("score") %></td>
                    <td><%= rst.getInt("t_attempt") %></td>
                    <td><%= rst.getInt("c_answer") %></td>
                </tr>
            </table>
            <%
                    } else {
            %>
            <div class="no-result">No result found for this user.</div>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
        </div>
    </div>
</body>
</html>
