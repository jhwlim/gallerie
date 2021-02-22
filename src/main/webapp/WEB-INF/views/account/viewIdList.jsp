<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 목록</title>
<link rel="stylesheet" href="/spring/resources/css/member/join.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>
<body>

	<div class="wrapper">
		<form id="idSuccessForm" method="get">
			<div class="wrap">
				<div class="subjecet">
					<span>아이디 찾기</span>
				</div>
				<div class="id-wrap">
					<div class="id-name">고객님의 정보와 일치하는 아이디 목록입니다.</div>
					<div class="id-input-box">
						<div>아이디: ${member.id } 가입일: ${member.regDate }</div>
					</div>
					
				</div>
				
				<div class="id-button-wrap">
					<input type="button" class="id-button" value="로그인하기"> <input type="button" class="pw-button" value="비밀번호찾기">
				</div>
			</div>
		</form>
	</div>

<script>
$(document).ready(function(){
	//회원가입 버튼(회원가입 기능 작동)
    $(".id-button").click(function(){
    	
        $("#idSuccessForm").attr("action", "./login");
	 	$("#idSuccessForm").submit(); 
         
    		
    });
});


$(document).ready(function(){
	//회원가입 버튼(회원가입 기능 작동)
    $(".pw-button").click(function(){
    	    	 
      		$("#idSuccessForm").attr("action", "./findpw");
	 	    $("#idSuccessForm").submit(); 
         
    });
});


</script>
</body>
</html>