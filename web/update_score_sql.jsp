<%-- 
    Document   : uqdate_score_sql
    Created on : 2017. 6. 21, 오후 3:56:01
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
            
            String up_num = request.getParameter("up_num");
            String new_t1 = request.getParameter("new_t1");
            String new_t2 = request.getParameter("new_t2");
            String new_t3 = request.getParameter("new_t3");
            String new_t4 = request.getParameter("new_t4");
            String new_t5 = request.getParameter("new_t5");

            String sql = "UPDATE assessment "
                    + "SET Score = '" +new_t1 + "' "
                    + "WHERE assessment.Military_num_a = '" +up_num+"' "
                    + "AND assessment.Training_name_a = '화생방'"
                    ;   
            String sql2 = "UPDATE assessment "
                    + "SET Score = '" +new_t2 + "' "
                    + "WHERE assessment.Military_num_a = '" +up_num+"' "
                    + "AND assessment.Training_name_a = '사격'"
                    ;
            
            String sql3 = "UPDATE assessment "
                    + "SET Score = '" +new_t3 + "' "
                    + "WHERE assessment.Military_num_a = '" +up_num+"' "
                    + "AND assessment.Training_name_a = '구급법'"
                    ;
            String sql4 = "UPDATE assessment "
                    + "SET Score = '" +new_t4 + "' "
                    + "WHERE assessment.Military_num_a = '" +up_num+"' "
                    + "AND assessment.Training_name_a = '유격'"
                    ;
            String sql5 = "UPDATE assessment "
                    + "SET Score = '" +new_t5 + "' "
                    + "WHERE assessment.Military_num_a = '" +up_num+"' "
                    + "AND assessment.Training_name_a = '수류탄'"
                    ;
        %>

        <!--DB에 명령 전달 (Send Request)-->
        <%            // infodb 부분이 DB 명에 따라 바뀜
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
            PreparedStatement pstmt5 = conn.prepareStatement(sql5);
            pstmt.executeUpdate();
            pstmt2.executeUpdate();
            pstmt3.executeUpdate();
            pstmt4.executeUpdate();
            pstmt5.executeUpdate();
            
            pstmt.close();
            pstmt2.close();
            pstmt3.close();
            pstmt4.close();
            pstmt5.close();
            
            String sql6 = "UPDATE soldiers SET Holiday_rest = Holiday_rest+5 "
                    + "WHERE soldiers.Military_num = '"+ up_num + "' "
                    + "AND "
                    + "(SELECT Count(*) FROM assessment, trainings "
                    +       "WHERE assessment.Training_name_a = trainings.Training_name "
                    +       "AND assessment.Military_num_a = '"+up_num + "' "
                    +       "AND Score >= 95) "
                    + "= 5"
                    ;
            
           String sql7 = "UPDATE soldiers SET Holiday_rest = Holiday_rest+3 "
                    + "WHERE soldiers.Military_num = '"+ up_num + "' "
                    + "AND "
                    + "(SELECT Count(*) FROM assessment, trainings "
                    +       "WHERE assessment.Training_name_a = trainings.Training_name "
                    +       "AND assessment.Military_num_a = '"+up_num + "' "
                    +       "AND Score >= Cutline) "
                    + "= 5 "
                   + "AND (SELECT Count(*) FROM assessment, trainings "
                    +       "WHERE assessment.Training_name_a = trainings.Training_name "
                    +       "AND assessment.Military_num_a = '"+up_num + "' "
                    +       "AND Score >= 95) "
                   + "<5"
                    ;
           String sql8 = "UPDATE soldiers SET Holiday_rest = Holiday_rest+2 "
                    + "WHERE soldiers.Military_num = '"+ up_num + "' "
                    + "AND "
                    + "(SELECT Count(*) FROM assessment, trainings "
                    +       "WHERE assessment.Training_name_a = trainings.Training_name "
                    +       "AND assessment.Military_num_a = '"+up_num + "' "
                    +       "AND Score >= Cutline) "
                    + "= 4"
                    ;
                        
                        
                        
           
            PreparedStatement pstmt6 = conn.prepareStatement(sql6);
            pstmt6.executeUpdate();
            pstmt6.close();
            PreparedStatement pstmt7 = conn.prepareStatement(sql7);
            pstmt7.executeUpdate();
            pstmt7.close();
            PreparedStatement pstmt8 = conn.prepareStatement(sql8);
            pstmt8.executeUpdate();
            pstmt8.close();
            
            
            conn.close();
            

//            보고 있던 창에서 다른페이지를 보여주려면 
            response.sendRedirect("update_score.jsp");
            
        %>
    </body>
</html>
