<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	정보수정페이지
	<hr>
	<div class="info">
	<form action="/update">
		<div class="form-group">
			<label for="name">이름</label>
			<input type="text" id="name" 
				name="name" placeholder="이름" value="${members.name}" />
		</div>
		<div class="form-group">
			<label for="email">이메일</label>
			<input type="text" id="email" 
				name="email" placeholder="이메일" value="${members.email}" />
		</div>
		<div class="form-group">
			<label for="phone">전화번호</label>
			<input type="text" id="phone" 
				name="phone" placeholder="전화번호" value="${members.phone}" />
		</div>
		
		<button type="submit" class="btn btn-default">제출</button>
	</form>
</div>

</body>
</html>