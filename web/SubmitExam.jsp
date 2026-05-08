<%-- 
    Document   : SubmitExam
    Created on : 10 Sep, 2024, 7:41:02 PM
    Author     : fujitsu
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="DB.DBCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Exam Result</title>
    <style>
        /* Add your styles here */
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

        .content {
            padding: 80px 20px;
            max-width: 800px;
            width: 100%;
            text-align: center;
        }

        .result {
            background-color: #fff;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
        }

        .score {
            font-size: 2em;
            color: #0ef;
        }

        .nav-link {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #0ef;
            color: #000;
            text-decoration: none;
            border-radius: 5px;
        }

        .nav-link:hover {
            background-color: #00bfff;
        }

        .questions-summary {
            text-align: left;
            margin-top: 20px;
        }

        .correct {
            color: green;
        }

        .wrong {
            color: red;
        }
    </style>
</head>
<body>

    <div class="content">
        <h2>Exam Result</h2>
        <div class="result">
            <%
                int score = 0;
                int totalQuestions = 0;
                int correctAnswers = 0;
                int totalAttempts = 0;
                String userId = (String)session.getAttribute("user"); // Assuming user_id is stored in session

                DBCon db = new DBCon();
                try {
                    // Get exam questions and user's answers
                    db.pstmt = db.con.prepareStatement("SELECT * FROM ques_mstr");
                    db.rst = db.pstmt.executeQuery();
                    
                    StringBuilder questionsSummary = new StringBuilder();

                    while (db.rst.next()) {
                        totalQuestions++;
                        int quesId = db.rst.getInt("ques_id");
                        String questionText = db.rst.getString("que");
                        String correctAnswer = db.rst.getString("ans");
                        String userAnswer = request.getParameter("question_" + quesId);

                        if (userAnswer != null) {
                            totalAttempts++;
                        }

                        questionsSummary.append("<div class='").append(userAnswer != null && userAnswer.equals(correctAnswer) ? "correct" : "wrong").append("'>");
                        questionsSummary.append("<strong>").append(questionText).append("</strong><br>");
                        questionsSummary.append("Your Answer: ").append(userAnswer != null ? userAnswer : "Not answered").append("<br>");
                        questionsSummary.append("Correct Answer: ").append(correctAnswer).append("<br>");
                        questionsSummary.append("</div><br>");

                        if (userAnswer != null && userAnswer.equals(correctAnswer)) {
                            score++;
                            correctAnswers++;
                        }
                    }

                    // Get current date for exam_date
                    Date date = new Date();
                    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                    String examDate = formatter.format(date);

                    // Check if result already exists for the user
                    PreparedStatement checkStmt = db.con.prepareStatement("SELECT * FROM result_mstr WHERE user_id = ?");
                    checkStmt.setString(1, userId);
                    ResultSet checkResult = checkStmt.executeQuery();

                    if (checkResult.next()) {
                        // Update existing result
                        PreparedStatement updateStmt = db.con.prepareStatement("UPDATE result_mstr SET exam_date = ?, score = ?, t_attempt = ?, c_answer = ? WHERE user_id = ?");
                        updateStmt.setString(1, examDate);
                        updateStmt.setInt(2, score);
                        updateStmt.setInt(3, totalAttempts);
                        updateStmt.setInt(4, correctAnswers);
                        updateStmt.setString(5, userId);
                        updateStmt.executeUpdate();
                    } else {
                        // Insert new result
                        PreparedStatement insertStmt = db.con.prepareStatement("INSERT INTO result_mstr (user_id, exam_date, score, t_attempt, c_answer) VALUES (?, ?, ?, ?, ?)");
                        insertStmt.setString(1, userId);
                        insertStmt.setString(2, examDate);
                        insertStmt.setInt(3, score);
                        insertStmt.setInt(4, totalAttempts);
                        insertStmt.setInt(5, correctAnswers);
                        insertStmt.executeUpdate();
                    }
            %>
            <p class="score">Your Score: <%= score %> out of <%= totalQuestions %></p>
            <div class="questions-summary">
                <h3>Questions Summary:</h3>
                <%= questionsSummary.toString() %>
            </div>
            <%
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
        </div>
        <a href="StudentHome.jsp" class="nav-link">Back to Home</a>
    </div>
</body>
</html>
