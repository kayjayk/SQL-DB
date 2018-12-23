<%-- 
    Document   : query_pickout
    Created on : 2017. 6. 20, 오후 7:59:00
    Author     : Kwon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
          <link href="./style_avg.css" type="text/css" rel="stylesheet">
           <link href="./style_button.css" type="text/css" rel="stylesheet">
           <link href="./style_title.css" type="text/css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title> 
        <script>
            function changeIframeUrl(url)
            {
                document.getElementById("main_frame").src = url;
            }
        </script>
    </head>
    <body>
    <buttont style ="margin-left:10px; margin-bottom:20px;"type="submit" disabled ="disabled" class="title">모범병사 선발대상</buttont>
<!--     
        <form name="name_set" action="query1-1.jsp">
            <input type="text" name="input_name" value="이름입력" size="20" />
            <input type="submit" value="검색" />
        </form>-->

        <!--SQL 문 작성-->
        <%                
            request.setCharacterEncoding("UTF-8");
            
            String sql = "SELECT Military_num, Sol_name, COUNT(*) As pass_number, Prize_point, Penalty_point, Holiday_rest "
                    + "FROM army.soldiers, army.assessment, army.trainings "
                    + "WHERE soldiers.Military_num = assessment.Military_Num_a "
                    + "AND assessment.Training_name_a = trainings.Training_name "
                    + "AND assessment.Score >= trainings.Cutline "
                    + "AND Prize_point>=10 AND Penalty_point<10 "
                    + "Group by Military_num "
                    + "Having pass_number>=2 "
//                    + "OR"
//                    "SELECT Military_num, COUNT(*) As p_num "
//                    "FROM army.soldiers, army.assessment, army.trainings "
//                    + "WHERE soldiers.Military_num = assessment.Military_Num_a "
//                    + "AND assessment.Training_name_a = trainings.Training_name "
//                    + "AND assessment.Score >= trainings.Cutline"
                     ;
            
            if(request.getParameter("input_name")==null
                    || request.getParameter("input_name").equalsIgnoreCase("")){                
            }
            else{
                String var_name = request.getParameter("input_name");
                sql = "SELECT * FROM army.soldiers WHERE Sol_name LIKE '%"+var_name+"%'";
            }
            
        %>

        <!--DB에 명령 전달 (Send Request)-->
        <%            // infodb 부분이 DB 명에 따라 바뀜
            String dbURL = "jdbc:mysql://localhost:3306/army";
            // 이 부분이 Project 생성 시 Libraries에 추가한 JDBC Driver 호출하는 부분 
            Class.forName("com.mysql.jdbc.Driver");
            // DB에 실제로 연결하는 Connection 형성하는 부분
            Connection conn = DriverManager.getConnection(dbURL, "root", "autoset");
            // ?
            Statement stmt = conn.createStatement();
            // 조회 결과 받아온 부분.  
            ResultSet rs = stmt.executeQuery(sql);

        %>
        <table class="type11" border="1">
<!--        tr로 여는게 로우 하나 여는거고 그안에서 td로 칼럼하나씩 여는것-->
<thead>
        <tr align=center> 
            <th width="120" scope="cols">군번</td>
            <th width="120" scope="cols">병사이름</td>
            <th width="120" scope="cols">합격 훈련 수</td>
            <th width="120" scope="cols">상점</td>
            <th width="120" scope="cols">벌점</td>
            <th width="120" scope="cols">휴가</td>
        </tr>
        </thead>
    <%// 이제 저장한것을 출력해야하는데
    while(rs.next()){
        %>
        <tbody>
        <tr align=center>
            <td><%=rs.getString("Military_num")%> </td>
            <td><%=rs.getString("Sol_name")%> </td>
            <td><%=rs.getString("pass_number")%> </td>
            <td><%=rs.getString("Prize_point")%> </td>
            <td><%=rs.getString("Penalty_point")%> </td>
            <td><%=rs.getString("Holiday_rest")%> </td>
                
           </tr>
           <%
}
    %>
    </tbody>
        </table>

    </body>
</html>