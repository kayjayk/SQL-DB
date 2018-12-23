<%-- 
    Document   : query1-5
    Created on : 2017. 6. 6, 오후 9:51:05
    Author     : Kwon
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
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
        <form name="find_company" action="query1-5.jsp">            
        <h1><훈련 성취도 현황></h1>
        
            <input type="submit" value="검색" />
        </form>

        <!--SQL 문 작성-->
        <%
            request.setCharacterEncoding("UTF-8");
   
            String sql="SELECT Training_name";
//            String tr_name = request.getParameter("tr_1");
            String tr_com = request.getParameter("tr_comp");
  
            sql = "SELECT Training_name, AVG(Score) As Avg_score "
                    + "FROM assessment "
                    + "WHERE Military_Num IN (SELECT Military_num FROM soldiers WHERE Company_code = '"+tr_com+"') "
                    + "Group By Training_name";
        %>

        <!--DB에 명령 전달 (Send Request)-->
        <%          
            String dbURL = "jdbc:mysql://localhost:3306/army";
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(dbURL, "root", "autoset");
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

        %>
        
        <table border="1">
<!--        tr로 여는게 로우 하나 여는거고 그안에서 td로 칼럼하나씩 여는것-->
        <tr align=center> 
            <td width="120">소속</td>
            <td width="120">군번</td>
            <td width="120">이름</td>
            <td width="120">휴가지급</td>
        </tr>
            <%
    while(rs.next()){
        %>
        <tr align=center>
            <td><%=rs.getString("Company_code")%></td>
            <td><%=rs.getString("Military_num")%></td>
            <td><%=rs.getString("Sol_name")%></td>
            <td><a href="query1-5_add_holiday.jsp?add_who<%=rs.getString("Military_num")%>" target="_blank"><input type="submit" value="지급" /></a></td>
           </tr>
           <%}%>
        </table>
    </body>
</html>