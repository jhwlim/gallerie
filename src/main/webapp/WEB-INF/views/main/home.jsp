<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world! <%=session.getAttribute("user") %>
</h1>

<form action="/spring/logout" method="post">
    <button class="w-100 btn btn-lg btn-primary" type="submit">로그아웃</button>
 </form>

</body>
</html>
