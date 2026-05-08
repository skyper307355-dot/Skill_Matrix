
package admin;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginValidate extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter())
        {
            String user = request.getParameter("t2");
            String pswd = request.getParameter("t3");

            DB.DBCon db = new DB.DBCon();
            db.pstmt = db.con.prepareStatement("select * from login where u_name=? and pswd=?");
            db.pstmt.setString(1, user);
            db.pstmt.setString(2, pswd);
            db.rst = db.pstmt.executeQuery();

            if (db.rst.next())
            {
                String utype = db.rst.getString("type");
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                session.setAttribute("role", utype);

                if (utype.equalsIgnoreCase("Admin"))
                {
                    response.sendRedirect("AdminHome.jsp");
                }
                else if (utype.equalsIgnoreCase("Student"))
                {
                    response.sendRedirect("StudentHome.jsp");
                }
            }
            else
            {
                response.sendRedirect("Login.jsp?error=Incorrect Username or Password");
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
}
