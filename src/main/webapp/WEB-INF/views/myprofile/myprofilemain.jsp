<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="contents">
		<div class="nav">
			<span class="title"> 
				<a class="title_ft">${myprofile.id}</a>
			</span>
		</div>

		<div class="profile">
			<div class="title_image">
				<c:choose>
					<c:when test="${user.profile_photo == null}">
						<img src="/images/logo.png" class="profile_image">
					</c:when>
					<c:otherwise>
						<img src="/images/${user.profile_photo}" class="profile_image">
					</c:otherwise>
				</c:choose>
			</div>
			
			<div class="fix">
				<a href="<c:url value='/myprofile/update' />" class="btn btn-default">프로필 편집</a>
			</div>
			<div class="fix">
				<a href="<c:url value='' />" class="btn btn-default">사진 편집</a>
			</div>

			<div class="txt">
				<span>0</span><br>
				<span>게시물</span>
			</div>

			<div class="txt">
				<span>0</span><br>
				<span>팔로워</span>
			</div>

			<div class="txt">
				<span>0</span><br>
				<span>팔로우</span>
			</div>
		</div>
		
	</div>
</body>
</html>