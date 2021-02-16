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

	비밀번호 변경하는 페이지
	<hr>
	<div class="info">
	<form action="<c:url value='/myprofile/updatepw' />" method="POST">
		<div class="form-group">
			<label for="pw">이전 비밀번호</label>
			<input type="text" id="pw" 
				name="pw" placeholder="이전 비밀번호" value="${myprofile.pw}" />
		</div>
		<div class="form-group">
			<label for="pw">새 비밀번호</label>
			<input type="text" id="pw" 
				name="pw" placeholder="새 비밀번호" value="${myprofile.pw}" />
		</div>
		<div class="form-group">
			<label for="pw">새 비밀번호 확인</label>
			<input type="text" id="pw"
				name="pw" placeholder="새 비밀번호 확인" value="${myprofile.pw}" />
		</div>
		
		<button type="submit" class="btn btn-default">비밀번호 변경</button>
	</form>
	</div>

</body>
</html>