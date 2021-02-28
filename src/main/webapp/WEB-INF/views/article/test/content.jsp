<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</body>
</html>