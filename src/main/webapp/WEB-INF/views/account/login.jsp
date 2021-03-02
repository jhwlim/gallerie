<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/spring/resources/signin/signin.css?ver=1.0">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>


<body>

	<div class="container">
		<div class="row">
			<div class="col-sm-6">
				<img src="/spring/resources/css/member/images/phone.png"
					class="phone">
				<div class="change-bg">
					<div class="outer">
						<div class="detail"></div>

					</div>
				</div>
			</div>
			<div class="col-sm-6 align-self-center" id="logindiv">
				<div class="right-column text-center">

					<form id="loginForm" method="post">

						<img src="/spring/resources/css/member/images/instagram.png"
							class="instagram-logo">
						<h2 class="info">친구들의 사진과 동영상을 보려면 로그인하세요.</h2>
						<button type="submit" class="btn btn-primary btn-block">
							<img src="/spring/resources/css/member/images/facebook.jpg">Facebook으로
							로그인
						</button>
						<div class="bar">
							<div class="left-right"></div>
							<div class="or-center">또는</div>
							<div class="left-right"></div>
						</div>

						<div class="form-group">
							<input type="text" class="id" name="id" required> <label>사용자이름</label>
							<p class="loginerr" id="iderr">
  								${loginFailId }
  							</p>
						</div>
																						
						<div class="form-group">
							<input type="password" class="pw" name="pw" required> <label>비밀번호</label>
						</div>
						<p class="loginerr" id="pwerr">
  							${loginFailMsg }
  						</p>

						<input type="button" id="login-button"
							class="btn btn-primary btn-block" value="로그인">
						<label>
       						<input type="checkbox" value="remember-me" name="remember"> 자동로그인
      					</label>
					</form>

				</div>
				<div class="right-column-login text-center">
					<p>
						계정이 없으신가요?<a href="/spring/signup"> 가입하기</a>
					</p>
				</div>

			</div>

		</div>
	</div>

	<script>
	
	/* 유효성 검사 통과유무 변수 */
	var idCheck = false;            // 아이디
	var pwCheck = false;            // 비번
	
	
	$(document).ready(function(){
		//회원가입 버튼(회원가입 기능 작동)
	    $("#login-button").click(function(){
	    	
	    	 var id = $('.id').val();				// id 입력란
	         var pw = $('.pw').val();				// 비밀번호 입력란
	         const iderr = document.getElementById('iderr');
	         const pwerr = document.getElementById('pwerr');
	         
	         /* 아이디 유효성검사 */
	         if(id == ""){
				 
	             idCheck = false;
	         }else{

	             idCheck = true;
	         }
	         
	         /* 비밀번호 유효성 검사 */
	         if(pw == ""){
	             
	             pwCheck = false;
	         }else{
	             
	             pwCheck = true;
	         }
	         
	         /* 최종 유효성 검사 */
	         if(idCheck&&pwCheck ){
	        	 iderr.innerHTML = '';
	        	 pwerr.innerHTML = ''
	        	 $("#loginForm").attr("action", "/spring/");
		 	     $("#loginForm").submit(); 
		 	     
	         }else if(!idCheck){
	        	 iderr.innerHTML = '아이디를 입력해주세요';
	         }else if(!pwCheck){
	        	 pwerr.innerHTML = '비밀번호를 입력해주세요'
	        		 iderr.innerHTML = '';
	         }
	         	       	         	      	      
	         return false;
	 	        
	    });
	});
		
	
		
		
		
	</script>

</body>
</html>