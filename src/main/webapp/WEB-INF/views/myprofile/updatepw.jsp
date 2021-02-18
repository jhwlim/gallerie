<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
</head>
<body>
	<div class="info">
	<form action="<c:url value='/myprofile/updatepw' />" method="POST">
		<ul class="accountMenu" style="padding-left: 0px;">
			<li>
				<a class="eachMenu hoverMenu" href="<c:url value='/myprofile/update' />">프로필 편집</a>
			</li>
			<li>
				<a class="eachMenu hoverMenu" href="<c:url value='/myprofile/updatepw' />">비밀번호 변경</a>
			</li>
		</ul>
	
	<!-- 비밀번호 변경 기능만 확인하기 위해 잠시 주석처리
			<div class="pwd">
				<div class="password_1">이전 비밀번호</div>
			</div>
			<div class="pwd2">
				<input id="old_pwd" name="old_pwd" class="p1_t" type="password" size="60" />
			</div>
	-->	

			<div class="pwd">
				<div class="password_1">새 비밀번호</div>
			</div>
			<div class="pwd2">
				<input id="new_pwd" name="new_pwd" type="password" size="60"></input>
			</div>


			<div class="pwd">
				<div class="password_1">새 비밀번호 확인</div>
			</div>
			<div class="pwd2">
				<input id="new_pwd2" type="password" size="60"></input>
			</div>
			<div class="ok_">
				<input type="submit" value="비밀번호 변경" ></input>
			</div>
	</form>
	</div>
	
	<!--
	<script>
		function oldPwdCheck() {
			var old_pwd = document.querySelector("#old_pwd");
				
				let url = '/passwordCheck';
				
				fetch(url,{
					method: "POST"
					alert("비밀번호 완료");
					
					
				})/* .then(function(res){
					console.log(res);
					return res.text();
				}).then(function(result){
					if(result === 'ok'){
						alert('성공');
						return true;
					}else{
						alert('실패');
						return false;
					} 
				})*/.catch();
			
		}
		function checkPwd() {
			
			var new_pwd = document.querySelector("#new_pwd");
			var new_pwd2 = document.querySelector("#new_pwd2");
			console.log(new_pwd.value);
			console.log(new_pwd2.value);
			if (new_pwd.value === new_pwd2.value) {
				if(oldPwdCheck()){
					return true;	
				}
				
					return false;
			} else {
				new_pwd.value = "";
				new_pwd2.value = "";
				new_pwd.focus();
				alert("비밀번호가 일치하지 않습니다.");
				return false;
			}
		}
	</script>
	-->

</body>
</html>