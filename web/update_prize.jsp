<%-- 
    Document   : update_prize
    Created on : 2017. 6. 21, 오후 9:14:32
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
        sdaafasdf
        <%         
            request.setCharacterEncoding("UTF-8");
             
             String mnum_prize_up = request.getParameter("mnum_prize_up");
             String mnum_penalty_up = request.getParameter("mnum_penalty_up");
             String mnum_prize_reset = request.getParameter("mnum_prize_reset");
             String mnum_penalty_reset = request.getParameter("mnum_penalty_reset");
            
             String sql = "UPDATE soldiers SET Prize_point = Prize_point+1 WHERE Military_num = '" + mnum_prize_up + "'";
             String sql2 = "UPDATE soldiers SET Penalty_point = Penalty_point+1 WHERE Military_num = '" + mnum_penalty_up + "'";
             String sql3 = "UPDATE soldiers SET Prize_point = 0 WHERE Military_num = '" + mnum_prize_reset + "'";
             String sql4 = "UPDATE soldiers SET Penalty_point = 0 WHERE Military_num = '" + mnum_penalty_reset + "'";
        
             String dbURL = "jdbc:mysql://localhost:3306/army";
            // 이 부분이 Project 생성 시 Libraries에 추가한 JDBC Driver 호출하는 부분 
            Class.forName("com.mysql.jdbc.Driver");
            // DB에 실제로 연결하는 Connection 형성하는 부분
            Connection conn = DriverManager.getConnection(dbURL, "root", "autoset");

            // (SELECT), (UPDATE, INSERT, DELETE) 서로 사용하는 명령어가 달라짐.
            PreparedStatement pstmt = conn.prepareStatement(sql);
            PreparedStatement pstmt2 = conn.prepareStatement(sql2);
            PreparedStatement pstmt3 = conn.prepareStatement(sql3);
            PreparedStatement pstmt4 = conn.prepareStatement(sql4);
            pstmt.executeUpdate();
            pstmt.close();
            pstmt2.executeUpdate();
            pstmt2.close();
               pstmt3.executeUpdate();
            pstmt3.close();
               pstmt4.executeUpdate();
            pstmt4.close();
            conn.close();
            response.sendRedirect("query1-1.jsp");

             %>
    </body>
</html>
