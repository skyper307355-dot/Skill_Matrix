<%-- 
    Document   : submit_contact
    Created on : 13 Sep, 2024, 8:30:35 PM
    Author     : fujitsu
--%>

<%@ page import="java.sql.*, DB.DBCon" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Submit Contact Message</title>
</head>
<body>
    <%
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String message = request.getParameter("message");

        try {
            DB.DBCon db = new DB.DBCon();
            db.pstmt = db.con.prepareStatement("INSERT INTO contact_feed (name, email, message) VALUES (?, ?, ?)");
            db.pstmt.setString(1, name);
            db.pstmt.setString(2, email);
            db.pstmt.setString(3, message);
            int result = db.pstmt.executeUpdate();

            if (result > 0) {
                response.sendRedirect("contact.jsp?status=success");  // Redirect after success
            } else {
                out.println("<h2>Failed to send message. Please try again.</h2>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h2>Error: " + e.getMessage() + "</h2>");
        }
    %>
</body>
</html>
