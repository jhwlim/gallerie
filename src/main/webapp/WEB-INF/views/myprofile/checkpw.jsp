<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
        integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/d3d6f2df1f.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/spring/resources/css/mainpage/main.css?ver=1.0">
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	min-width: 630px;
	min-height: 1000px;
}

a {
	color: black;
	text-decoration: none;
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
	width: 44%;
	margin: 100px 28% 530px;
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
	font-weight: bold;
}

.main1>div>a {
	width: 100%;
	padding: 20px 20px 20px 18px;
	display: inline-block;
}

.main1>div:hover {
	border-left-color: gainsboro;
}

footer {
	display: grid;
	grid-template-columns: repeat(12, 1fr);
	font-size: 12px;
	text-align: center;
	height: 100px;
	margin: 0 15%;
}

input:focus {
	outline: none;
}

input[type=text]:focus {
	text-align: start;
}

.copyright {
	color: gainsboro;
}

.menu2 {
	border-left-color: black !important;
}

.pwd {
	display: inline-block;
	text-align: left;
	font-size: 15px;
	width: 100px;
	font-weight: bold;
}

.user_ {
	/* margin: 20px 0px 0px 0px;
    padding: 0px 0px 0px 10%;
    border: 0; */
	margin-top: 3%;
	align-items: center;
	font-size: 24px
}

.j_from {
	width: 80%;
	display: grid;
	grid-template-columns: auto auto;
	grid-gap: 20px;
	margin: 5% 3% 10% 17%;
}

.pwd2 {
	display: inline-block;
	text-align: left;
	padding-left: 0;
	font-weight: bold;
}

.ok_ {
	width: 100%;
	grid-column: 2/1 span;
	margin-top: 3%;
	display: inline-block;
	text-align: left;
}

.findpw {
	width: 100%;
	grid-column: 2/1 span;
	display: inline-block;
	text-align: left;
	margin-bottom: 3%;
}

.findpw>a {
	color: blue;
}

input[type=password] {
	padding: 10px;
	background-color: rgb(250, 250, 250);
	width: 70%;
	border-radius: 6px;
	border: 1px solid #dbdbdb;
}

input[type=password]:focus {
	padding: 10px;
	background-color: rgb(250, 250, 250);
	width: 70%;
	border-radius: 6px;
	border: 1px solid #1c1e21;
}

input[type=submit] {
	display: inline-block;
	width: 30%;
	height: 100%;
	padding: 10px;
	background-color: rgb(56, 151, 240);
	color: white;
	border: 0px;
	border-radius: 3px;
	text-align: center;
}
</style>

</head>
<body>

	<%@ include file="/WEB-INF/include/nav.jspf"%>

		<main>
		<div class="main1">
			<div class="menu1">
				<a href="/spring/account/edit">프로필 편집</a>
			</div>
			<div class="menu2">
				<a href="/spring/account/checkpw">비밀번호 변경</a>
			</div>
			<div class="menu3">
				<a href="/spring/account/loginActivity">로그인 활동</a>
			</div>
		</div>
		<div class="main2">
			<form class="j_from" action="<c:url value='/account/checkpw' />" method="POST" >
				<div class="pwd">
					<div class="password_1">이전 비밀번호</div>
				</div>
				<div class="pwd2">
					<input class="p1_t" id="pw" type="password" size="60"
					name="pw" placeholder="현재 비밀번호 입력"></input>
					<input type="hidden" name="test"></input>
					<span class="error_next_box" id="pwMsg" style="margin-top: 15px;"></span>
				</div>
				<div class="ok_">
					<input type="submit" value="본인확인" ></input>
				</div>
				<div class="findpw">
					<a href="/spring/findpw">비밀번호를 잊으셨나요?</a>
					<br>
				</div>
			</form>
		</div>
		</main>
	
</body>
</html>














