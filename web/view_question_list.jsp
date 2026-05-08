<%-- 
    Document   : view_question_list
    Created on : 10 Sep, 2024, 3:59:59 PM
    Author     : fujitsu
--%>

<%@page import="DB.DBCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Question List</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #1a1a1a;
            color: #ffffff;
            margin: 0;
            padding: 0;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        .navbar {
            background-color: rgba(0, 0, 0, 0.8);
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            z-index: 1000;
            box-shadow: 0 2px 10px rgba(0, 78, 146, 0.7);
        }

        .nav-container {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1rem;
        }

        .nav-left, .nav-right {
            display: flex;
            gap: 1rem;
        }

        .nav-left li, .nav-right li {
            list-style: none;
        }

        .nav-left a, .nav-right a {
            text-decoration: none;
            color: #ffffff;
            padding: 0.5rem 1rem;
            border-radius: 5px;
            transition: all 0.3s ease;
            border: 2px solid #0ef;
        }

        .nav-left a:hover, .nav-right a:hover {
            background-color: #0ef;
            color: #1a1a1a;
        }

        main {
            flex-grow: 1;
            padding: 6rem 2rem 2rem;
            max-width: 1200px;
            margin: 0 auto;
            width: 100%;
        }

        h2 {
            text-align: center;
            color: #0ef;
            margin-bottom: 2rem;
            font-size: 2.5rem;
        }

        table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            background-color: rgba(255, 255, 255, 0.1);
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 0 20px rgba(0, 78, 146, 0.7);
        }

        th, td {
            padding: 1rem;
            text-align: left;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }

        th {
            background-color: #0ef;
            color: #1a1a1a;
            font-weight: bold;
            text-transform: uppercase;
        }

        tr:nth-child(even) {
            background-color: rgba(255, 255, 255, 0.05);
        }

        tr:hover {
            background-color: rgba(255, 255, 255, 0.1);
        }

        .action-buttons {
            display: flex;
            gap: 0.5rem;
        }

        .delete-btn, .update-btn {
            padding: 0.5rem 1rem;
            border: none;
            cursor: pointer;
            transition: all 0.3s ease;
            border-radius: 5px;
            font-weight: bold;
        }

        .delete-btn {
            background-color: #f00;
            color: #ffffff;
        }

        .delete-btn:hover {
            background-color: #ff3333;
            box-shadow: 0 0 10px #f00, 0 0 40px #f00, 0 0 80px #f00;
        }

        .update-btn {
            background-color: #0ef;
            color: #1a1a1a;
        }

        .update-btn:hover {
            background-color: #00a3cc;
            box-shadow: 0 0 10px #00a3cc, 0 0 40px #00a3cc, 0 0 80px #00a3cc;
        }

        @media (max-width: 768px) {
            .nav-container {
                flex-direction: column;
                align-items: stretch;
            }

            .nav-left, .nav-right {
                flex-direction: column;
            }

            main {
                padding: 8rem 1rem 1rem;
            }

            table {
                font-size: 0.8rem;
            }

            th, td {
                padding: 0.5rem;
            }

            .action-buttons {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
    <nav class="navbar">
        <div class="nav-container">
            <ul class="nav-left">
                <li><a href="AdminHome.jsp">Home</a></li>
                <li><a href="ChangePasswordAdmin.jsp">Change Password</a></li>
                <li><a href="index.html">Logout</a></li>
            </ul>
        </div>
    </nav>

    <main>
        <h2>Question List</h2>
        <table>
            <thead>
                <tr>
                    <th>Question ID</th>
                    <th>Question</th>
                    <th>Option 1</th>
                    <th>Option 2</th>
                    <th>Option 3</th>
                    <th>Option 4</th>
                    <th>Correct Answer</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    DBCon db = new DBCon();
                    try {
                        db.pstmt = db.con.prepareStatement("SELECT * FROM ques_mstr");
                        db.rst = db.pstmt.executeQuery();
                        if (!db.rst.isBeforeFirst()) {
                %>
                <tr>
                    <td colspan="8">No questions found.</td>
                </tr>
                <%
                        } else {
                            while (db.rst.next()) {
                %>
                <tr>
                    <td><%= db.rst.getInt("ques_id") %></td>
                    <td><%= db.rst.getString("que") %></td>
                    <td><%= db.rst.getString("op1") %></td>
                    <td><%= db.rst.getString("op2") %></td>
                    <td><%= db.rst.getString("op3") %></td>
                    <td><%= db.rst.getString("op4") %></td>
                    <td><%= db.rst.getString("ans") %></td>
                    <td>
                        <div class="action-buttons">
                            <form action="DeleteQuestion" method="post">
                                <input type="hidden" name="questionId" value="<%= db.rst.getInt("ques_id") %>">
                                <button type="submit" class="delete-btn">Delete</button>
                            </form>
                            <form action="update_question.jsp" method="get">
                                <input type="hidden" name="questionId" value="<%= db.rst.getInt("ques_id") %>">
                                <button type="submit" class="update-btn">Update</button>
                            </form>
                        </div>
                    </td>
                </tr>
                <%
                            }
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </tbody>
        </table>
    </main>
</body>
</html>