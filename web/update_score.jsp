<%-- 
    Document   : update_score
    Created on : 2017. 6. 21, 오후 3:52:00
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
        <buttont style ="margin-left:10px; margin-bottom:20px;"type="submit" disabled ="disabled" class="title">훈련점수 입력</buttont>
          <form action="update_score_sql.jsp">
              군번 <br><input type="text" name="up_num" value="" /> <br><br>
              훈련별 점수 입력<br>
            <br>화생방 <br><input type="text" name="new_t1" value="" size="10" /> <br>
            <br>수류탄 <br><input type="text" name="new_t5" value="" size="10"/> <br>
            <br>사격   <br><input type="text" name="new_t2" value="" size="10" /> <br>
            <br>구급법 <br><input type="text" name="new_t3" value="" size="10"/> <br>
            <br>유격   <br><input type="text" name="new_t4" value="" size="10"/> <br>
            <br><br><button type="submit" style = "margin-left: 50px;" class="btn-4">Submit</button>
        </form>
    </body>
</html>
