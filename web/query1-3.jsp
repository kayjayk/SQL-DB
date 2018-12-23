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
        <link href="./style.css" type="text/css" rel="stylesheet">
        <link href="./style_button.css" type="text/css" rel="stylesheet">
        <link href="./style_title.css" type="text/css" rel="stylesheet">
    </head>
    <body>
        <buttont style ="margin-left:10px; margin-bottom:20px;"type="submit" disabled ="disabled" class="title">중대 구성현황</buttont>
        <form name="find_company" action="query1-3.jsp" style="margin-left: 10px">
            <select name="company_list" size="1">
                <option>중대선택</option>
                <option>586109</option>
                <option>586110</option>
                <option>586111</option>
                <option>586112</option>
            </select>
            <button type="submit" class="btn-4">Search</button>
        </form>

        <!--SQL 문 작성-->
        <%
            request.setCharacterEncoding("UTF-8");
            
            String sql = "SELECT Company_code, Military_num, Sol_name, Specialty, Rank FROM army.soldiers";
                    
            if(request.getParameter("company_list")==null
                    || request.getParameter("company_list").equalsIgnoreCase("")){            
            }
            else{
                String list_c = request.getParameter("company_list");
                sql = "SELECT Company_code, Military_num, Sol_name, Specialty, Rank FROM army.soldiers "
                        + "WHERE soldiers.Company_code ='"+list_c+"'" ;
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
        <tr align=center> 
            <th scope="cols">중대</th>
            <th scope="cols">군번</td>
            <th scope="cols">병사이름</td>
            <th scope="cols">주특기</td>
            <th scope="cols">계급</td>
        </tr>
         </thead>
    <%
    while(rs.next()){
        %>
        <tbody>
        <tr align=center>
            <th><%=rs.getString("Company_code")%> </td>
            <td><%=rs.getString("Military_num")%> </td>
            <td><%=rs.getString("Sol_name")%> </td>
            <td><%=rs.getString("Specialty")%> </td>
            <td><%=rs.getString("Rank")%> </td>
           </tr>
           <%
}
    %>
        </tbody>
        </table>

    </body>
</html>
