package student;

import DB.DBCon;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class DeleteAccount extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession(false);
        
        try (PrintWriter out = response.getWriter()) {
            if (session != null) {
                String username = (String) session.getAttribute("user");
                DBCon db = new DBCon();
                
                db.con.setAutoCommit(false);

                // Deleting from login table
                db.pstmt = db.con.prepareStatement("DELETE FROM login WHERE u_name = ?");
                db.pstmt.setString(1, username);
                int loginDeleted = db.pstmt.executeUpdate();

                // Deleting from result_mstr table
                db.pstmt = db.con.prepareStatement("DELETE FROM result_mstr WHERE user_id = ?");
                db.pstmt.setString(1, username);
                int resultDeleted = db.pstmt.executeUpdate();

                // Debugging: print the results of the deletion
                out.println("<h2>Debug Info:</h2>");
                out.println("<p>Login deleted rows: " + loginDeleted + "</p>");
                out.println("<p>Result deleted rows: " + resultDeleted + "</p>");

                // Check if either deletion was successful
                if (loginDeleted > 0 || resultDeleted > 0) {
                    db.con.commit();
                    session.invalidate();
                    response.sendRedirect("index.html");
                } else {
                    db.con.rollback();
                    out.println("<h2>Failed to delete the account. No records found to delete.</h2>");
                }
                
                db.con.close();
            } else {
                out.println("<h2>You are not logged in. Please log in first.</h2>");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
