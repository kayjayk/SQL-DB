<%-- 
    Document   : insert_sol_sql
    Created on : 2017. 6. 22, 오후 2:15:08
    Author     : Kwon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            request.setCharacterEncoding("UTF-8");
            
            String in_num = request.getParameter("in_num");
            String in_com = request.getParameter("in_com");
            String in_spec = request.getParameter("in_spec");
            String in_name = request.getParameter("in_name");
            
            String sql = "INSERT INTO army.soldiers(Military_num, Sol_name, Specialty, Company_code) VALUES(?,?,?,?)";
            
            String sql2 = "INSERT INTO army.assessment(Military_num_a, Training_name_a) VALUES(?,'화생방')";
            String sql3 = "INSERT INTO army.assessment(Military_num_a, Training_name_a) VALUES(?,'사격')";
            String sql4 = "INSERT INTO army.assessment(Military_num_a, Training_name_a) VALUES(?,'구급법')";
            String sql5 = "INSERT INTO army.assessment(Military_num_a, Training_name_a) VALUES(?,'유격')";
            String sql6 = "INSERT INTO army.assessment(Military_num_a, Training_name_a) VALUES(?,'수류탄')";
            
            String dbURL = "jdbc:mysql://localhost:3306/army";
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(dbURL, "root", "autoset");
            
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, in_num);
            pstmt.setString(2, in_name);
            pstmt.setString(3, in_spec);
            pstmt.setString(4, in_com);
            pstmt.executeUpdate();
            pstmt.close();
            
            PreparedStatement pstmt2 = conn.prepareStatement(sql2);
            PreparedStatement pstmt3 = conn.prepareStatement(sql3);
            PreparedStatement pstmt4 = conn.prepareStatement(sql4);
            PreparedStatement pstmt5 = conn.prepareStatement(sql5);
            PreparedStatement pstmt6 = conn.prepareStatement(sql6);
            pstmt2.setString(1, in_num);
            pstmt3.setString(1, in_num);
            pstmt4.setString(1, in_num);
            pstmt5.setString(1, in_num);
            pstmt6.setString(1, in_num);
            pstmt2.executeUpdate();
            pstmt6.executeUpdate();
            pstmt5.executeUpdate();
            pstmt4.executeUpdate();
            pstmt3.executeUpdate();
            pstmt2.close();
            pstmt6.close();
            pstmt3.close();
            pstmt4.close();
            pstmt5.close();
            
            conn.close();
            

            response.sendRedirect("insert_sol.jsp");
            %>
    </body>
</html>
