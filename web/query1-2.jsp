<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="./style.css" type="text/css" rel="stylesheet">
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
        <buttont style ="margin-left:10px; margin-bottom:20px;"type="submit" disabled ="disabled" class="title">훈련 평가</buttont>
        
        <form name="Findtrainingscore_set" action="query1-2.jsp"style="margin-left: 10px">
            <input type="text" name="input_name_tr" value="이름입력"  size="10" />
            <button type="submit" class="btn-4" style="margin-left:20px;">Search</button >
        </form>

        <!--SQL 문 작성-->
        <%
            request.setCharacterEncoding("UTF-8");
            
            String sql = "SELECT assessment.*, soldiers.Sol_name FROM army.assessment, army.soldiers "
                    + "WHERE assessment.Military_num_a = soldiers.Military_num"
                    ;
             
            if(request.getParameter("input_name_tr")==null
                    || request.getParameter("input_name_tr").equalsIgnoreCase("")){            
            }
            else{
                String MName = request.getParameter("input_name_tr");
                sql = "SELECT assessment.*, soldiers.Sol_name FROM army.assessment, army.soldiers "
                        + "WHERE assessment.Military_num_a = soldiers.Military_num "
                        + "AND assessment.Military_Num_a IN "
                        + "(SELECT soldiers.Military_num FROM army.soldiers WHERE soldiers.Sol_name = '"+MName+ "')" ;
            }
            
        %>

        <!--DB에 명령 전달 (Send Request)-->
        <%          
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
        <table class="type10" border="1">
<!--        tr로 여는게 로우 하나 여는거고 그안에서 td로 칼럼하나씩 여는것-->
<thead>
        <tr align = center> 
            <th  scope="cols">군번</td>
            <th  scope="cols">이름</td>
            <th scope="cols">훈련명</td>
            <th scope="cols">점수</td>
        </tr>
        </thead>
    <%// 이제 저장한것을 출력해야하는데
    while(rs.next()){
        %>
        <tbody>
        <tr align=center>
            <th><%=rs.getString("Military_num_a")%> </td>
            <td><%=rs.getString("Sol_name")%> </td>            
            <td><%=rs.getString("Training_name_a")%> </td>
            <td><%=rs.getString("Score")%> </td>
                
           </tr>
           <%
}
    %></tbody>
        </table>

    </body>
</html>
