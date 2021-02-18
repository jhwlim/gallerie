<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필 메인</title>

<style>
* {
	margin: 0;
	padding: 0;
}

body {
	background-color: rgb(250, 250, 250);
	text-align: center;
}

.body {
	display: inline-block;
	width: 1000px;
	margin-top: 94.961px;
}


.bodypadding {
	padding: 0 20px;
}

.profile {
	padding: 20px 50px;
	text-align: left;
	display: grid;
	grid-template-columns: auto auto;
}

.profile * {
	display: inline-block;
}

.thumbnail {
	width: 200px;
	height: 200px;
	position: relative;
}

.explorer {
	width: 150px;
	height: 150px;
	border: 1px solid;
	border-radius: 50%;
	background-image: url("/image/user/profile.jpg");
}

p {
	display: inline-block;
	font-weight: 600;
}

.name {
	margin-right: 15px;
	font-size: 28px;
	font-weight: 100;
}

.rower {
	display: block;
	justify-content: space-between;
	margin-bottom: 20px;
}

.rower * {
	margin-right: 20px;
	display: inline-block;
}
</style>

</head>
<body>

	<main class="body">
	<div class="bodypadding">
		<div class="profile">
			<div class="thumbnail">
				<div class="explorer"></div>
			</div>
			<div class="text">
				<div class="rower">
					<div class="name">vivavivaviva</div>
					<div>
						<button class="value3image2" 
						onclick="location.href='/spring/myprofile/update'">프로필편집</button>
						<button class="value3image2"
						onclick="location.href='/images/upload'">사진업로드</button>
					</div>
			</div>
				<div class="rower">
					<div>
						<a href="#" class="">
							게시물
						</a>
						<p></p>
					</div>
					<div>
						<a href="#" class="">
							팔로워
						</a>
						<p></p>
					</div>
					<div>
						<a href="#" class="">
							팔로우
						</a>
						<p></p>
					</div>
				</div>
			</div>
		</div>
		
		<hr>

</body>
</html>