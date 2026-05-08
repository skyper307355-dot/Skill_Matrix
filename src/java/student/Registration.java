package student;

import DB.DBCon;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Registration extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            String u_name = request.getParameter("username");
            String pswd = request.getParameter("password");
            String dob = request.getParameter("date_of_birth");
            String gender = request.getParameter("gender");
            String quali1 = request.getParameter("qualification1");
            String quali2 = request.getParameter("qualification2");
            String addr = request.getParameter("address");
            String city = request.getParameter("city");
            String contact = request.getParameter("contact");
            String email = request.getParameter("email");

            Date date = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String d_reg = sdf.format(date);

            DBCon db = new DBCon();
            
            db.pstmt = db.con.prepareStatement("SELECT u_name FROM user_info WHERE u_name = ?");
            db.pstmt.setString(1, u_name);
            ResultSet rs = db.pstmt.executeQuery();

            if (rs.next()) {
                response.sendRedirect("Registration.jsp?msg=Username already exists. Please choose a different username.</h2>");
                return;
            }

            // **Insert into user_info table**
            db.pstmt = db.con.prepareStatement("INSERT INTO user_info (u_name, pswd, d_reg, dob, gender, quali1, quali2, addr, city, contact, email) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
            db.pstmt.setString(1, u_name);
            db.pstmt.setString(2, pswd);
            db.pstmt.setString(3, d_reg);
            db.pstmt.setString(4, dob);
            db.pstmt.setString(5, gender);
            db.pstmt.setString(6, quali1);
            db.pstmt.setString(7, quali2);
            db.pstmt.setString(8, addr);
            db.pstmt.setString(9, city);
            db.pstmt.setString(10, contact);
            db.pstmt.setString(11, email);

            int i1 = db.pstmt.executeUpdate();

            db.pstmt = db.con.prepareStatement("INSERT INTO login (u_name, pswd, type) VALUES (?, ?, 'Student')");
            db.pstmt.setString(1, u_name);
            db.pstmt.setString(2, pswd);

            int i2 = db.pstmt.executeUpdate();

            if (i1 > 0 && i2 > 0) {
                response.sendRedirect("Login.jsp?msg=Student Added Successfully");
            } else {
                response.sendRedirect("Registration.jsp?msg=Registration failed. Please try again.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
