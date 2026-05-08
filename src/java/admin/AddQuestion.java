package admin;

import DB.DBCon;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AddQuestion extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            String ques_id = request.getParameter("ques_id");
            String question = request.getParameter("question");
            String option1 = request.getParameter("option1");
            String option2 = request.getParameter("option2");
            String option3 = request.getParameter("option3");
            String option4 = request.getParameter("option4");
            String correctAnswer = request.getParameter("correctAnswer");
            DBCon db = new DBCon();

            // Insert question into ques_mstr using admin-provided ques_id
            db.pstmt = db.con.prepareStatement("INSERT INTO ques_mstr (ques_id, que, op1, op2, op3, op4, ans) VALUES (?, ?, ?, ?, ?, ?, ?)");
            db.pstmt.setString(1, ques_id);
            db.pstmt.setString(2, question);
            db.pstmt.setString(3, option1);
            db.pstmt.setString(4, option2);
            db.pstmt.setString(5, option3);
            db.pstmt.setString(6, option4);
            db.pstmt.setString(7, correctAnswer);

            // Execute the query
            int rowsInserted = db.pstmt.executeUpdate();

            // Redirect to a success or error page with appropriate message
            if (rowsInserted > 0) {
                response.sendRedirect("add_question.jsp?success=Question added successfully with Question ID: " + ques_id);
            } else {
                response.sendRedirect("add_question.jsp?error=Failed to add question. Try again.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
