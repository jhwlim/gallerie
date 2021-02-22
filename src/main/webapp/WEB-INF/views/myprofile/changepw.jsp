<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>

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

input:focus {
	outline: none;
}

input[type=text]:focus {
	text-align: start;
}

.menu2 {
	border-left-color: black !important;
}

.pwd {
	display: inline-block;
	text-align: left;
	font-size: 15px;
	width: 100px;
}

.pwd2 {
	display: inline-block;
	text-align: left;
	padding-left: 0;
}

.ok_ {
	width: 100%;
	grid-column: 2/1 span;
	margin-top: 3%;
	display: inline-block;
	text-align: left;
}

input[type=password] {
	padding: 10px;
	background-color: rgb(233, 227, 227);
	border: 0px;
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

	<form action="<c:url value='/myprofile/changepw' />" method="POST" onsubmit="return validateJoin()">
			<div class="pwd">
				<div  class="password_1">새 비밀번호</div>
			</div>
			<div class="pwd2">
				<input id="pw1" name="newPassword" type="password" size="60" 
				placeholder="새 비밀번호 입력"></input>
			</div>
			<br>

			<div class="pwd">
				<div  class="password_1">새 비밀번호 확인</div>
			</div>
			<div  class="pwd2">
				<input id="pw" type="password" size="60" 
				name="pw" placeholder="새 비밀번호 입력" value="${myprofile.pw}"></input>
			</div>
			<div class="ok_">
				<input type="submit" value="비밀번호 변경"></input>
			</div>
	</form>
</main>
<script type="text/javascript">
function validateJoin() {

	var pw1 = document.querySelector("#pw1");
	var pw = document.querySelector("#pw");

	if (pw1.value === pw.value) {
		alert('변경 완료');
		return true;
	} else {
		pw1.value = "";
		pw.value = "";
		pw1.focus();
		alert('비밀번호가 일치하지않습니다.');
		
		return false;
	}
}
</script>

</body>
</html>












