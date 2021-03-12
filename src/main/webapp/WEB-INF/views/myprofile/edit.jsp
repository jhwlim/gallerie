<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필 편집</title>
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
	margin: 100px 28% 340px;
	background-color: white;
	border: 1px solid gainsboro;
	display: grid;
	grid-template-columns: 1fr 3fr;
	text-align: center;
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

.menu1 {
	border-left-color: black !important;
}

.profile {
	grid-column: 1/2 span;
	padding: 10px;
}

.profile p:nth-child(1) {
	font-size: 20px;
}

.profile p:nth-child(2) {
	color: #3897f0;
	font-size: 13px;
}

.liner:nth-child(1n) {
	display: inline-block;
}

.profile div {
	display: inline-block;
	height: 40px;
}

.liner {
	padding: 50px;
	grid-column: 1/2 span;
}

.liner>div {
	display: grid;
	grid-template-columns: 1fr 3fr;
}

.key {
	text-align: end;
	padding-right: 32px;
	font-weight: bold;
	font-family: inherit;
}

.tablediv {
	grid-template-columns: 5% auto;
	display: grid;
}

.a_check {
	height: 100%;
}

.table {
	display: inline-block;
}

input[type=text] {
	border-radius: 6px;
	border: 1px solid #dbdbdb;
}	

input[type=text]:focus {
	border-radius: 6px;
	border: 2px solid #1c1e21;
}

input[type=email] {
	border-radius: 6px;
	border: 1px solid #dbdbdb;
}	

input[type=email]:focus {
	border-radius: 6px;
	border: 2px solid #1c1e21;
}

input[type=tel] {
	border-radius: 6px;
	border: 1px solid #dbdbdb;
}	

input[type=tel]:focus {
	border-radius: 6px;
	border: 2px solid #1c1e21;
}

input[type=submit] {
	display: inline-block;
	width: 50%;
	height: 100%;
	padding: 10px;
	background-color: rgb(56, 151, 240);
	color: white;
	border-radius: 6px;
	text-align: center;
	border: 1px solid #dbdbdb;
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
	<form action="<c:url value='/account/edit' />" method="POST" onsubmit="return validateUpdate()">
		<div class="liner">
		
			<div class="line1">
				<div class="key">
					이름<br/>
				</div>
				<input class="a_name" type="text" id="name" name="name" autocomplete="off" 
				placeholder="이름을 입력해주세요." value="${member.name}" size="30"><br />
			</div>
			<div class="line2">
				<div class="key">
					소개<br />
				</div>
				<!-- members테이블의 profile->자기소개글 -->
				<textarea cols="32" id="profile" name="profile" value="${member.profile}" rows="5"></textarea>
				<br />
			</div>
			<div class="line3">
				<div class="key">
					이메일<br />
				</div>
				<input class="a_email" type="email" id="email" name="email" 
				placeholder="이메일을 입력해주세요." size="30" value="${member.email}" ><br />
			</div>
			<div class="line4">
				<div class="key">
					전화번호<br />
				</div>
				<input type="tel" id="phone" name="phone" 
				placeholder="전화번호를 입력해주세요." size="30" value="${member.phone}"><br />
			</div>
			<input type="hidden" name="id" value="${member.id}"/>
			<div class="line5">
				<div class="key">
				</div>
				<input type="submit" value="제출">
			</div>
	</div>
	</form>	
	</main>
	
	<script>
		function validateUpdate() {
			
			var name = document.querySelector("#name");
			var profile = document.querySelector("#profile");
			var email = document.querySelector("#email");
			var phone = document.querySelector("#phone");
			
			if (name.value === "" || email.value === "" || phone.value === "") {
				alert('내용을 입력해주세요.');
				return false;
			} else {
				alert('프로필을 저장했습니다.');
			}
			
		}
	</script>
</body>
</html>