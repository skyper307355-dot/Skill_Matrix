/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/*
package DB;
import java.sql.*;

/**
 *
 * @author fujitsu
 
public class DBCon
{
    public Connection con;
    public Statement stmt;
    public PreparedStatement pstmt;
    public ResultSet rst;
    public DBCon()
    {
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/skill_matrix","root","root");
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
}
*/

//package DB;
//import java.sql.*;
//
//public class DBCon {
//    public static Connection getConnection() {
//        Connection con=null;
//        try {
//            Class.forName("com.mysql.jdbc.Driver");
//            con= DriverManager.getConnection("jdbc:mysql://localhost:3306/skill_matrix", "root", "root");
//        } catch (Exception e) {
//           System.out.println("connection error"+e);
//        }
//        return con;
//    }
//}
package DB; // Comment hata diya
import java.sql.*; // Comment hata diya

public class DBCon {
    public Connection con;
    public Statement stmt;
    public PreparedStatement pstmt;
    public ResultSet rst;

    // Constructor
    public DBCon() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/skill_matrix", "root", "");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Error theek karne ke liye ye method chahiye
    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            return DriverManager.getConnection("jdbc:mysql://localhost:3306/skill_matrix", "root", "");
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    // Error theek karne ke liye close method bhi chahiye
    public void close() {
        try {
            if (con != null) con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
