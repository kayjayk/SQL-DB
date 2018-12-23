<%-- 
    Document   : 20170525필기
    Created on : 2017. 5. 25, 오후 1:34:49
    Author     : Kwon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
           <h1>회원 정보 입니다.</h1>
        
        1. DB에 정보가 없다면 -> 정보를 넣어야 함.
                
        2. JSP에서 DB에 Connect
        3. SQL문 작성
        3-1. SQL문 작성 규칙을 정해야 함 -> 검색 조건
                (어떤 칼럼을 기준으로 검색할 것인지?)

        3-2.      SELECT * FROM customer WHERE customer_name LIKE '%이%';
                ==> 포함되는 단어 검색할 때 LIKE를 쓴다!
                LIKE '%" + nameStr + "%'";
                
        4. 데이터를 어떤식으로 보여줄 것인가? ( ex. 표 형식..
        5. 
        
        <% String sql = "INSERT INTO army.training"
                %>
</html>
