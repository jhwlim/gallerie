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
input[type=submit] {
	display: inline-block;
	width: 100%;
	height: 100%;
	padding: 10px;
	background-color: rgb(56, 151, 240);
	color: white;
	border: 0px;
	border-radius: 3px;
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
		<div class="menu3">
			<a href="/spring/myprofile/login_activity">로그인 활동</a>
		</div>
	</div>
	<form action="<c:url value='/myprofile/update' />" method="POST" >
	<div class="main2">
		<div class="liner">
		<!--  
			<div class="profile">
					<div>
						<h1>vivaviva</h1>
					</div>
			</div>
		-->
			<div class="line1">
				<div class="key">
					이름<br />
				</div>
				<input class="a_name" type="text" id="name" name="name" 
				placeholder="이름" value="${member.name}" size="30"><br />
			</div>
			<div class="line2">
				<div class="key">
					소개<br />
				</div>
				<textarea cols="32" name="bio" ${member.something} rows="5">
				${member.something}
				</textarea>
				<br />
			</div>
			<div class="line3">
				<div class="key">
					이메일<br />
				</div>
				<input class="a_email" type="email" id="email" name="email" 
				placeholder="이메일" size="30" value="${member.email}" ><br />
			</div>
			<div class="line4">
				<div class="key">
					전화번호<br />
				</div>
				<input type="tel" id="phone" name="phone" 
				placeholder="전화번호" size="30" value="${member.phone}"><br />
			</div>
		
			<div class="line5">
				<input type="submit" value="제출">
			</div>
	</div>
	</form>	
	</main>
	<footer>
		<div>
			<a href="#">INSTARGRAM 정보</a>
		</div>
		<div>
			<a href="#">지원</a>
		</div>
		<div>
			<a href="#">홍보 센터</a>
		</div>
		<div>
			<a href="#">API</a>
		</div>
		<div>
			<a href="#">채용 정보</a>
		</div>

		<div>
			<a href="#">개인정보처리방침</a>
		</div>
		<div>
			<a href="#">약관</a>
		</div>
		<div>
			<a href="#">디렉터리</a>
		</div>
		<div>
			<a href="#">프로필</a>
		</div>
		<div>
			<a href="#">해시태그</a>
		</div>

		<div>
			<a href="#">언어</a>
		</div>
		<div>
			<p class="copyright">©️2021 INSTARGRAM</p>
		</div>
	</footer>
</body>
</html>