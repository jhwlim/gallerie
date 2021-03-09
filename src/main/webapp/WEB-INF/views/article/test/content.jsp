<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/jstl.jspf" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
<style>
.pre {
	white-space: pre;
	width: 200px;
	flex-wrap;
	
	border: 1px solid red;
}
.pre-wrap {
	white-space: pre-wrap;
	width: 200px;
	flex-wrap;
	
	border: 1px solid blue;
}
.article__textarea {
	width: 200px;
	height: 100px;
	resize: none;
	padding: 10px;
	font-family: 'Noto Sans KR', sans-serif;
	overflow: auto;
	
}
</style>
</head>
<body>
	
	<p class="pre">
		${article.content}
	</p>
	
	<textarea class="article__textarea" readonly>
		${article.content}
	</textarea>
	
	<p class="pre-wrap">
		${article.content}
	</p>
	
<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
  	<div class="carousel-inner">
	  	<c:forEach var="file" items="${article.files}" varStatus="status">
		    <div class="carousel-item ${status.first ? 'active' : ''}">
		      	<img src="<c:url value = '/image/article/${file.imgPath}/' />" class="d-block w-100" alt="...">
		    </div>
		</c:forEach>
  	</div>
	<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls"  data-bs-slide="prev">
		<span class="carousel-control-prev-icon" aria-hidden="true"></span>
		<span class="visually-hidden">Previous</span>
	</button>
	<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls"  data-bs-slide="next">
	  	<span class="carousel-control-next-icon" aria-hidden="true"></span>
	  	<span class="visually-hidden">Next</span>
	</button>
</div>

	
</body>
</html>