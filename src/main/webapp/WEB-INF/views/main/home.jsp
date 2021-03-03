<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/jstl.jspf" %>

<html>
<head>
<title>Home</title>

<%@ include file="/WEB-INF/include/commonCss.jspf" %>
<%@ include file="/WEB-INF/include/headerCss.jspf" %>
</head>
<body>

<%@ include file="/WEB-INF/include/header.jspf" %>

<h1>
	Hello world!
</h1>

<div class="wrapper">
    <div class="container">
        <h1>CONTAINER</h1>
        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Vitae dicta alias reiciendis asperiores tempora quibusdam, quos obcaecati minus, itaque beatae cumque, fuga explicabo excepturi possimus repellendus vel aliquam magni maxime.           
    </div>    
</div>

<form action="/spring/logout" method="post">

    <button type="submit">로그아웃</button>
</form>
<form action="/spring/sessiondel" method="post">
    <button type="submit">세션삭제 후 리다이렉트</button>
</form>

</body>
</html>
