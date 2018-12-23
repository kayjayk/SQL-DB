<%-- 
    Document   : insert_sol
    Created on : 2017. 6. 22, 오후 2:10:32
    Author     : Kwon
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="./style_button.css" type="text/css" rel="stylesheet">
        <link href="./style_title.css" type="text/css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <buttont style ="margin-left:10px; margin-bottom:20px;"type="submit" disabled ="disabled" class="title">신병정보 추가</buttont>
          <form action="insert_sol_sql.jsp">
              군번 <br><input type="text" name="in_num" value="" /> <br>
            <br>중대 <br><input type="text" name="in_com" value="" size="10" /> <br>
            <br>주특기 <br><input type="text" name="in_spec" value="" size="10"/> <br>
            <br>이름   <br><input type="text" name="in_name" value="" size="10" /> <br>
            <br><br><button type="submit" style = "margin-left: 50px;" class="btn-4">Submit</button>
        </form>
    </body>
</html>
