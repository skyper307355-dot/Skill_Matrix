
package student;

import DB.DBCon;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SChangePassword extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session=request.getSession();
            String user=session.getAttribute("user").toString();
            String opswd=request.getParameter("oldPassword");
            String npswd=request.getParameter("newPassword");
            String cpswd=request.getParameter("confirmPassword");
            DBCon db=new DBCon();
            db.pstmt=db.con.prepareStatement("select * from login where u_name=? and pswd=?");
            db.pstmt.setString(1, user);
            db.pstmt.setString(2, opswd);
            db.rst=db.pstmt.executeQuery();
            if(db.rst.next())
            {
                if(npswd.equals(cpswd))
                {
                    db.pstmt=db.con.prepareStatement("update login set pswd=? where u_name=?");
                    db.pstmt.setString(1, npswd);
                    db.pstmt.setString(2, user);
                    int i=db.pstmt.executeUpdate();
                    if(i>0)
                    {
                        response.sendRedirect("ChangePasswordStudent.jsp?success=Password Updated Successfully");
                    }
                }
                else
                {
                    response.sendRedirect("ChangePasswordStudent.jsp?error=New and Confirm Password must be Same");
                }
            }
            else
            {
                response.sendRedirect("ChangePasswordStudent.jsp?error=Old Password does not Correct");
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
}
