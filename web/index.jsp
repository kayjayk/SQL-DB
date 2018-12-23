<%-- 
    Document   : index
    Created on : 2017. 4. 13, 오후 1:46:41
    Author     : Kwon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <link href="./style.css" type="text/css" rel="stylesheet">


        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>병사 인사 관리 System</title>
        <script>
            function changeIframeUrl(url)
            {
                document.getElementById("main_frame").src = url;
            }
        </script>


    </head>
    <body>
        <div style="width:100%; height: 10%; border-bottom:1px solid white; margin-top: 24px; padding-left: 50px;">
            <input type="button" value="병 신상조회" style="color:#e7708d; font-weight: bold;" onclick = "changeIframeUrl('./query1-1.jsp')"></input> 
            <span style=" padding-left: 50px;"></span>
            <input type="button" value="중대 구성" style="color:#e7708d; font-weight: bold;" onclick = "changeIframeUrl('./query1-3.jsp')"></input> 
            <span style=" padding-left: 50px;"></span>
            <input type="button" value="훈련 평가" style="color:#e7708d; font-weight: bold;" onclick = "changeIframeUrl('./query1-2.jsp')"></input> 
            <span style=" padding-left: 50px;"></span>
            <input type="button" value="중대별 훈련성과" style="color:#e7708d; font-weight: bold;" onclick = "changeIframeUrl('./query1-4.jsp')"></input> 
            <span style=" padding-left: 50px;"></span>
            <input type="button" value="모범병사 선발" style="color:#e7708d; font-weight: bold;" onclick = "changeIframeUrl('./query_pickout.jsp')"></input>
            <span style=" padding-left: 50px;"></span>
            <input type="button" value="훈련점수" style="color:#e7708d; font-weight: bold;" onclick = "changeIframeUrl('./update_score.jsp')"></input> 
            <span style=" padding-left: 50px;"></span>
            <input type="button" value="신병 추가" style="color:#e7708d; font-weight: bold;" onclick = "changeIframeUrl('./insert_sol.jsp')"></input> 
            
        </div>
        <div style="width:100%; height: 90%; margin-top: 12px;">
            <iframe src = "./query1-1.jsp" width="100%" height="800" frameborder="0" border="0" scrolling="yes" 
                    bgcolor=#EEEEEE bordercolor="#FF000000" marginwidth="0" marginheight="0" name="main_frame" id="main_frame"></iframe> 
        </div>


    </body>
</html>