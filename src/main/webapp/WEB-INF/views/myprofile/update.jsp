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
	<form action="/main/user/info_update">
		<div class="form-group">
			<label for="name">이름</label>
			<input type="text" class="form-control w200" id="name" 
				name="name" placeholder="이름" value="${user.name}" />
		</div>
		<div class="form-group">
			<label for="website">닉네임</label>
			<input type="text" class="form-control w200" id="website" 
				name="website" placeholder="닉네임" value="${user.nickname}" />
		</div>
		<div class="form-group">
			<label for="email">이메일</label>
			<input type="text" class="form-control w200" id="email" 
				name="email" placeholder="이메일" value="${user.email}" />
		</div>
		<div class="form-group">
			<label for="phone">전화번호</label>
			<input type="text" class="form-control w200" id="phone" 
				name="phone" placeholder="전화번호" value="${user.phone}" />
		</div>
		<div class="form-group">
			<label for="gender">성별</label>
			<input type="text" class="form-control w200" id="gender" 
				name="gender" placeholder="성별" value="${user.gender}" />
		</div>
		<button type="submit" class="btn btn-default">제출</button>
	</form>
</div>

</body>
</html>