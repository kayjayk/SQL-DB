<%-- 
    Document   : query1-4
    Created on : 2017. 6. 5, 오후 4:46:29
    Author     : Kwon
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <%
        
        %>
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
        <form name="find_company" action="query1-4.jsp" style="margin-left: 10px">            
         <buttont style =" margin-bottom:20px; "type="submit" disabled ="disabled" class="title">훈련 성취도 현황</buttont>
<!--            <input type="radio" name="tr_1" value="화생방" />화생방
            <input type="radio" name="tr_1" value="수류탄" />수류탄           
            <input type="radio" name="tr_1" value="사격" />사격
            <input type="radio" name="tr_1" value="구급법" />구급법
            <input type="radio" name="tr_1" value="유격" />유격-->
            <select name="tr_comp" size="1" style="padding-right: 20px;">
                <option>중대선택</option>
                <option>586109</option>
                <option>586110</option>
                <option>586111</option>
                <option>586112</option>
            </select>
            <button style ="margin-left:20px; "type="submit" class="btn-4" >Search</button>
        </form>

        <!--SQL 문 작성-->
        <%
            request.setCharacterEncoding("UTF-8");
   
            String sql="SELECT Training_name_a";            
//            String tr_name = request.getParameter("tr_1");
            String tr_com = request.getParameter("tr_comp");
                        
            sql = "SELECT Training_name_a, AVG(Score) As Avg_score "
                    + "FROM assessment "
                    + "WHERE Military_Num_a IN (SELECT Military_num FROM soldiers WHERE Company_code = '"+tr_com+"') "
                    + "Group By Training_name_a"
                    ;
        %>

        <!--DB에 명령 전달 (Send Request)-->
        <%          
            String dbURL = "jdbc:mysql://localhost:3306/army";
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(dbURL, "root", "autoset");
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

        %>
        
        <table class = "type11" border="1">
            <thead>
<!--        tr로 여는게 로우 하나 여는거고 그안에서 td로 칼럼하나씩 여는것-->
        <tr align=center> 
            <th scope="cols" width="120">훈련명</td>
            <th scope="cols" width="120">평균점수</td>
        </tr>
        </thead>
            <%
    while(rs.next()){
        %>
        <tbody>
        <tr align=center>
            <th><%=rs.getString("Training_name_a")%></td>
            <td><%=rs.getString("Avg_score")%></td>
           </tr>
           <%}%>
        </tbody>
        </table>
        
    </body>
</html>
