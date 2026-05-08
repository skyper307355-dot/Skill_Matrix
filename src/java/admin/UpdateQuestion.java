package admin;

import DB.DBCon;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdateQuestion extends HttpServlet {

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

            // Update the question in ques_mstr using the provided ques_id
            db.pstmt = db.con.prepareStatement("UPDATE ques_mstr SET que = ?, op1 = ?, op2 = ?, op3 = ?, op4 = ?, ans = ? WHERE ques_id = ?");
            db.pstmt.setString(1, question);
            db.pstmt.setString(2, option1);
            db.pstmt.setString(3, option2);
            db.pstmt.setString(4, option3);
            db.pstmt.setString(5, option4);
            db.pstmt.setString(6, correctAnswer);
            db.pstmt.setString(7, ques_id);

            // Execute the update
            int rowsUpdated = db.pstmt.executeUpdate();

            // Redirect to a success or error page with appropriate message
            if (rowsUpdated > 0) {
                response.sendRedirect("update_question.jsp?success=Question updated successfully with Question ID: " + ques_id);
            } else {
                response.sendRedirect("update_question.jsp?error=Failed to update the question. Please try again.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
