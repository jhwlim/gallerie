<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/jstl.jspf" %>


<html>
<head>

<title>Error Page</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
        integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/d3d6f2df1f.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="/spring/resources/js/errorPage.js"></script>

<link rel="stylesheet" href="/spring/resources/css/mainpage/main.css?ver=2.1">
<link rel="stylesheet" href="/spring/resources/css/error/errorPage.css?ver=1.0">


</head>
<body>

	<%@ include file="/WEB-INF/include/nav.jspf"%>
	
    <div class="warning-container">
        <div class="warning-box">
            <h2>죄송합니다. 페이지를 사용할 수 없습니다.</h2>
            <div class="error-message">클릭하신 링크가 잘못되었거나 페이지가 삭제되었습니다. <a href="http://localhost:8080/spring/"> Instagram으로 돌아가기.</a></div>
        </div>
    </div>
    <script>
        autocomplete(document.getElementById("myInput"), countries);

    </script>
    
</body>
</html>