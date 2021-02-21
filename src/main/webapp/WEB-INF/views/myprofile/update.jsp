<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필 편집</title>

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	min-width: 630px;
	background-color: #fafafa;
	min-height: 1200px;
}

a {
	color: black;
	text-decoration: none;
}

.material-icons {
	position: absolute;
	left: 37%;
	top: 15%;
	font-size: 15px;
	color: gainsboro;
}


hr {
	height: 40px;
	width: 0;
	background-color: black;
	border-color: black;
	display: inline-block;
}

main {
	height: 100%;
	margin: 106px 15% 40px;
	background-color: white;
	border: 1px solid gainsboro;
	display: grid;
	grid-template-columns: 1fr 3fr;
}

main>div {
	border: 1px solid gainsboro;
}

.main1>div {
	text-align: center;
	font-size: 17px;
	border-left: white solid 2px;
}

.main1>div>a {
	width: 100%;
	padding: 20px 20px 20px 18px;
	display: inline-block;
}

.main1>div:hover {
	border-left-color: gainsboro;
}

</style>

</head>
<body>
	
	<main>
		
		<div class="main1">
			<div class="menu1">
				<a href="/spring/myprofile/update">프로필 편집</a>
			</div>
			<div class="menu2">
				<a href="/spring/myprofile/updatepw">비밀번호 변경</a>
			</div>
		</div>
		
		<div class="info">
		<form action="<c:url value='/myprofile/update' />" method="POST">
	
		<div class="form-group">
			<label for="name">이름</label>
			<input type="text" id="name" 
				name="name" placeholder="이름" value="${member.name}" />
		</div>
		<div class="form-group">
			<label for="email">이메일</label>
			<input type="text" id="email" 
				name="email" placeholder="이메일" value="${member.email}" />
		</div>
		<div class="form-group">
			<label for="phone">전화번호</label>
			<input type="text" id="phone" 
				name="phone" placeholder="전화번호" value="${member.phone}" />
		</div>
		
		<button type="submit" class="btn btn-default">제출</button>
	</form>
	</div>
		
	</main>
</body>
</html>