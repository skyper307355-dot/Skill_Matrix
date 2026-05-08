<%-- 
    Document   : update_question
    Created on : 10 Sep, 2024, 3:47:39 PM
    Author     : fujitsu
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Question</title>
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

        /* Floating Label Form Styling */
        .wrapper {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            width: 400px;
            margin-top: 50px;
            background: transparent;
            border: 5px solid #333;
            border-radius: 10px;
            padding: 30px;
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
            width: 100%;
            margin: 20px 0;
        }

        .input-box input,
        .input-box textarea {
            width: 100%;
            padding: 10px;
            font-size: 1em;
            color: #fff;
            background: transparent;
            border: none;
            border-bottom: 2px solid #fff;
            outline: none;
        }

        .input-box input:focus,
        .input-box textarea:focus {
            border-bottom: 2px solid #0ef;
        }

        .input-box label {
            position: absolute;
            top: 10px;
            left: 10px;
            font-size: 1em;
            color: #aaa;
            transition: 0.3s ease;
            pointer-events: none;
        }

        .input-box input:focus ~ label,
        .input-box textarea:focus ~ label,
        .input-box input:not(:placeholder-shown) ~ label,
        .input-box textarea:not(:placeholder-shown) ~ label {
            top: -20px;
            left: 10px;
            font-size: 0.8em;
            color: #0ef;
        }

        .submit-btn {
            width: 100%;
            padding: 10px;
            font-size: 1em;
            color: #fff;
            background: #0ef;
            border: none;
            cursor: pointer;
            transition: background 0.3s ease, color 0.3s ease;
        }

        .submit-btn:hover {
            background: #fff;
            color: #000;
            box-shadow: 0 0 10px #0ef, 0 0 40px #0ef, 0 0 80px #0ef;
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

    <!-- Update Question Form -->
    <div class="wrapper">
        <h2>Update Question</h2>
        <form action="UpdateQuestion" method="post">
            <div class="input-box">
                <input type="text" id="ques_id" name="ques_id" placeholder=" " required>
                <label for="ques_id">Question ID:</label>
            </div>
            <div class="input-box">
                <input type="text" id="question" name="question" placeholder=" " required>
                <label for="question">Question:</label>
            </div>
            <div class="input-box">
                <input type="text" id="option1" name="option1" placeholder=" " required>
                <label for="option1">Option 1:</label>
            </div>
            <div class="input-box">
                <input type="text" id="option2" name="option2" placeholder=" " required>
                <label for="option2">Option 2:</label>
            </div>
            <div class="input-box">
                <input type="text" id="option3" name="option3" placeholder=" " required>
                <label for="option3">Option 3:</label>
            </div>
            <div class="input-box">
                <input type="text" id="option4" name="option4" placeholder=" " required>
                <label for="option4">Option 4:</label>
            </div>
            <div class="input-box">
                <input type="text" id="correctAnswer" name="correctAnswer" placeholder=" " required>
                <label for="correctAnswer">Correct Answer:</label>
            </div>
            <button type="submit" class="submit-btn">Update Question</button>
        </form>
    </div>
</body>
</html>
