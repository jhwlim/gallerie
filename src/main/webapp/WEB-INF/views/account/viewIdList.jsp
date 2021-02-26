<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 목록</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/spring/resources/css/member/idpw.css?ver=1.0">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>
<body>

	<div class="container">
		<div class="row">
			<div class="col-sm-6">

				<div class="col-sm-6">
					<div class="right-column text-center">
						<img src="/spring/resources/css/member/images/lock.png"
							class="lock-logo">
						<h2 class="info">아이디 찾기</h2>
						<p>고객님의 정보와 일치하는 아이디 목록입니다.</p>
						<form id="idSuccessForm" method="get">

							<div class="form-group">
								<p>
									아이디: <b>${member.id }</b> 가입일: <b>${member.regDate }</b>
								</p>
							</div>

							<input type="button" id="id-button"
								class="btn btn-primary btn-block" value="로그인 하기">
						</form>

						<div class="bar">
							<div class="left-right"></div>
							<div class="or-center">또는</div>
							<div class="left-right"></div>
						</div>


						<div class="login-box">
							<h3 class="info2">
								<a href="./findpw">비밀번호 찾기</a>
							</h3>
						</div>
					</div>



				</div>

			</div>
		</div>
	</div>

	<script>
	$(document).ready(function(){
		//회원가입 버튼(회원가입 기능 작동)
	    $("#id-button").click(function(){
	    	
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