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
        <buttont style ="margin-left:10px; margin-bottom:20px;"type="submit" disabled ="disabled" class="title">병사 인적사항 열람</buttont>
     
        <form name="name_set" action="query1-1.jsp" style="margin-left: 10px">
                <span style=" padding-bottom: 55px;"></span>
            <input type="text" name="input_name" value="이름입력" size="10" />
            
<!--  <button class="btn-1">Button 1</button>
  <button class="btn-2">Button 2</button>
  <button class="btn-3">Button 3</button>-->
  <button style ="margin-left:20px; "type="submit" class="btn-4" >Search</button>
  <!--<button class="btn-5">Button 5</button>-->
        </form>
        <form name="order" action="query1-1.jsp" style="margin-left: 10px">
            <select  name="order_how" size="1" width="20px" style=" margin-bottom: 0px; margin-left: 0px; margin-right:0px;">
                <option>정렬선택</option>
                <option>Prize_point</option>
                <option>Penalty_point</option>
            </select>
            <button style ="margin-left:20px;"type="submit" class="btn-4">Search</button>
        </form>
        <!--SQL 문 작성-->
        <%                
            request.setCharacterEncoding("UTF-8");
            
            String sql = "SELECT * FROM army.soldiers";
            
            if(request.getParameter("input_name")==null
                    || request.getParameter("input_name").equalsIgnoreCase(""))
            { 
                
                if(request.getParameter("order_how")==null
                    || request.getParameter("order_how").equalsIgnoreCase("")){
                
            }else{
                String order_how = request.getParameter("order_how");
                sql = "SELECT * FROM army.soldiers "
                        + "Order by "+order_how + " desc";
            }
                
            }
            
            else{
                String var_name = request.getParameter("input_name");
                sql = "SELECT * FROM army.soldiers WHERE Sol_name LIKE '"+var_name+"'";
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
        
        <table class="type10" border="1">
<!--        tr로 여는게 로우 하나 여는거고 그안에서 td로 칼럼하나씩 여는것-->
<thead>
    
<tr> 
        <th  scope="cols">군번</th>
        <th  scope="cols">병사이름</th>
        <th scope="cols">주특기</th>
        <th  scope="cols">계급</th>
        <th  scope="cols">중대코드</th>
        <th  scope="cols">상점</th>
        <th  scope="cols">벌점</th>
        <th  scope="cols">잔여휴가</th>
        <th  scope="cols">T/F</th>
        </tr>
        </thead>
    <%// 이제 저장한것을 출력해야하는데
    while(rs.next()){
        %>
        <tbody>
        <tr>
            <th><%=rs.getString("Military_num")%> </th>
            <td><%=rs.getString("Sol_name")%> </th>
            <th><%=rs.getString("Specialty")%> </td>
            <th><%=rs.getString("Rank")%> </td>
            <td><%=rs.getString("Company_code")%> </td>
            <td><%=rs.getString("Prize_point")%>
                    <a href="update_prize.jsp?mnum_prize_up=<%=rs.getString("Military_num")%>"> <input type="submit" value="+" /> </a>
<a href="update_prize.jsp?mnum_prize_reset=<%=rs.getString("Military_num")%>"> <input type="submit" value="Reset" /> </a>
                </td>
            <td><%=rs.getString("Penalty_point")%>
            <a href="update_prize.jsp?mnum_penalty_up=<%=rs.getString("Military_num")%>"> <input type="submit" value="+" /> </a>
            <a href="update_prize.jsp?mnum_penalty_reset=<%=rs.getString("Military_num")%>"> <input type="submit" value="Reset" /> </a></td>
            <td><%=rs.getString("Holiday_rest")%> </td>
            <td>
            <% 
                if(rs.getString("Rank")=="병장"){
            %>
            <%="0"%>
            <%
            }   
            else {
            %>
            <%="plus"%>
            <%
            }
            %></td>
                
           </tr>
           <%   
}
    %>
        </tbody>
        </table>

    </body>
</html>
