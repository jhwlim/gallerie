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
	<div class="info">
	<form action="<c:url value='/myprofile/update' />" method="POST">
			<ul class="accountMenu" style="padding-left: 0px;">
				<li>
					<a class="eachMenu hoverMenu" href="<c:url value='/myprofile/update' />">프로필 편집</a>
				</li>
				<li>
					<a class="eachMenu hoverMenu" href="<c:url value='/myprofile/updatepw' />">비밀번호 변경</a>
				</li>
			</ul>
	
		<div class="form-group">
			<label for="name">이름</label>
			<input type="text" id="name" 
				name="name" placeholder="이름" value="${myprofile.name}" />
		</div>
		<div class="form-group">
			<label for="email">이메일</label>
			<input type="text" id="email" 
				name="email" placeholder="이메일" value="${myprofile.email}" />
		</div>
		<div class="form-group">
			<label for="phone">전화번호</label>
			<input type="text" id="phone" 
				name="phone" placeholder="전화번호" value="${myprofile.phone}" />
		</div>
		
		<button type="submit" class="btn btn-default">제출</button>
	</form>
	</div>
</body>
</html>