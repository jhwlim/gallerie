<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="/spring/resources/css/signin/signin.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
	
</head>


<body>

	<script src = "<c:url value='/resources/config/config.js' />"></script>
	<script>


  function statusChangeCallback(response) {  // Called with the results from FB.getLoginStatus().
    console.log('statusChangeCallback');
    console.log(response);                   // The current login status of the person.
    if (response.status === 'connected') {   // Logged into your webpage and Facebook.
      testAPI();  
      var accessToken = response.authResponse.accessToken;
      
      window.location.href='facebook.login?access_token='+response.authResponse.accessToken; 
      
    } else {                                 // Not logged into your webpage or we are unable to tell.
      document.getElementById('status').innerHTML = 'Please log ' +
        'into this webpage.';
    }
  }


  function checkLoginState() {               // Called when a person is finished with the Login Button.
    FB.getLoginStatus(function(response) {   // See the onlogin handler
      statusChangeCallback(response);
    });
  }


  window.fbAsyncInit = function() {
    FB.init({
      appId      : config.FB_KEY,
      cookie     : true,                     // Enable cookies to allow the server to access the session.
      xfbml      : true,                     // Parse social plugins on this webpage.
      version    : 'v10.0'           // Use this Graph API version for this call.
    });


    FB.getLoginStatus(function(response) {   // Called after the JS SDK has been initialized.
      statusChangeCallback(response);        // Returns the login status.
    });
  };
 
  function testAPI() {                      // Testing Graph API after login.  See statusChangeCallback() for when this call is made.
    console.log('Welcome!  Fetching your information.... ');
    FB.api('/me', function(response) {
      console.log('Successful login for: ' + response.name);
      document.getElementById('status').innerHTML =
        'Thanks for logging in, ' + response.name + '!';
    });
  }

</script>
	
	

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

						<img src="/spring/resources/css/member/images/gallerie-logo-s.png"
							class="instagram-logo">
						<h2 class="info">친구들의 사진과 동영상을 보려면 로그인하세요.</h2>
						
						<div class="fb-login-button" data-width="" data-size="large" data-button-type="login_with" data-layout="default" data-auto-logout-link="false" data-use-continue-as="true" scope="public_profile,email" onlogin="checkLoginState();"></div>
												
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
	<script async defer crossorigin="anonymous" src="https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v10.0" nonce="XvzubL4a"></script>
</body>
</html>