<%-- 
    Document   : Exam
    Created on : 10 Sep, 2024, 7:35:37 PM
    Author     : fujitsu
--%>

<%@page import="DB.DBCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Start Exam</title>
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
            padding: 80px 20px;
            max-width: 800px;
            width: 100%;
            text-align: center;
        }

        .timer {
            font-size: 1.5em;
            margin-bottom: 20px;
            color: #ff0000;
        }

        .progress-bar {
            width: 100%;
            background-color: #e0e0e0;
            height: 20px;
            border-radius: 10px;
            overflow: hidden;
            margin-bottom: 20px;
        }

        .progress {
            width: 0;
            height: 100%;
            background-color: #0ef;
            border-radius: 10px;
            transition: width 0.3s ease;
        }

        .question {
            margin-bottom: 20px;
            background-color: #fff;
            border-radius: 8px;
            padding: 15px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            display: none; /* Initially hide all questions */
        }

        .question.active {
            display: block; /* Show only the active question */
        }

        .options {
            margin-top: 10px;
            text-align: left;
        }

        .options label {
            display: block;
            margin: 5px 0;
        }

        .submit-btn, .nav-btn {
            background-color: #0ef;
            color: #000;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 20px;
            transition: background 0.3s ease;
        }

        .submit-btn:hover, .nav-btn:hover {
            background-color: #00bfff;
        }

        .nav-btn {
            margin-right: 10px;
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

    <!-- Exam Content -->
    <div class="content">
        <h2>Start Exam</h2>

        <!-- Timer -->
        <div class="timer" id="timer">Time Left: 00:20:00</div>

        <!-- Progress Bar -->
        <div class="progress-bar">
            <div class="progress" id="progressBar"></div>
        </div>

        <form action="SubmitExam.jsp" method="post" id="examForm">
            <%
                DBCon db = new DBCon();
                int questionIndex = 0;
                try {
                    db.pstmt = db.con.prepareStatement("SELECT * FROM ques_mstr");
                    db.rst = db.pstmt.executeQuery();
                    while (db.rst.next()) {
                        questionIndex++;
            %>
            <div class="question" id="question_<%= questionIndex %>">
                <h3>Question <%= questionIndex %>: <%= db.rst.getString("que") %></h3>
                <div class="options">
                    <label>
                        <input type="radio" name="question_<%= db.rst.getInt("ques_id") %>" value="<%= db.rst.getString("op1") %>">
                        <%= db.rst.getString("op1") %>
                    </label>
                    <label>
                        <input type="radio" name="question_<%= db.rst.getInt("ques_id") %>" value="<%= db.rst.getString("op2") %>">
                        <%= db.rst.getString("op2") %>
                    </label>
                    <label>
                        <input type="radio" name="question_<%= db.rst.getInt("ques_id") %>" value="<%= db.rst.getString("op3") %>">
                        <%= db.rst.getString("op3") %>
                    </label>
                    <label>
                        <input type="radio" name="question_<%= db.rst.getInt("ques_id") %>" value="<%= db.rst.getString("op4") %>">
                        <%= db.rst.getString("op4") %>
                    </label>
                </div>
            </div>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>

            <button type="button" class="nav-btn" id="prevBtn" onclick="navigateQuestion(-1)" disabled>Previous</button>
            <button type="button" class="nav-btn" id="nextBtn" onclick="navigateQuestion(1)">Next</button>
            <button type="submit" class="submit-btn" id="submitBtn" style="display: none;">Submit Exam</button>
        </form>
    </div>

    <script>
        let currentQuestion = 1;
        const totalQuestions = <%= questionIndex %>;

        document.getElementById('question_' + currentQuestion).classList.add('active');

        function navigateQuestion(step) {
            document.getElementById('question_' + currentQuestion).classList.remove('active');
            currentQuestion += step;
            document.getElementById('question_' + currentQuestion).classList.add('active');
            document.getElementById('prevBtn').disabled = (currentQuestion === 1);
            document.getElementById('nextBtn').style.display = (currentQuestion === totalQuestions) ? 'none' : 'inline-block';
            document.getElementById('submitBtn').style.display = (currentQuestion === totalQuestions) ? 'inline-block' : 'none';
            updateProgressBar();
        }

        function updateProgressBar() {
            const progress = (currentQuestion / totalQuestions) * 100;
            document.getElementById('progressBar').style.width = progress + '%';
        }

        // Timer Script
        let seconds = 0, minutes = 10, hours = 0; // Set starting time for the timer (20 minutes countdown)

        function setTimer() {
        // Decrease time
            if (seconds === 0) {
                if (minutes === 0) {
                    if (hours === 0) {
                        alert("Time is up! Your exam will be submitted automatically.");
                        document.getElementById('examForm').submit(); // Automatically submit the form
                        return;
                    } else {
                        hours--;  // Decrease hours
                        minutes = 59; // Reset minutes to 59
                        seconds = 59; // Reset seconds to 59
                    }
                } else {
                    minutes--; // Decrease minutes
                    seconds = 59; // Reset seconds to 59
                }
            } else {
                seconds--; // Decrease seconds
            }

            // Format time with leading zeros
            let h = hours < 10 ? "0" + hours : hours;
            let m = minutes < 10 ? "0" + minutes : minutes;
            let s = seconds < 10 ? "0" + seconds : seconds;

            // Update the timer display with "Time Left: HH:MM:SS"
            document.getElementById('timer').innerText = "Time Left: " + h + ":" + m + ":" + s;
        }

        // Start the timer when the page loads
        function startTimer() {
            setInterval(setTimer, 1000); // Call setTimer every second
        }

        // Initialize the timer on page load
        window.onload = startTimer;
    </script>
</body>
</html>
