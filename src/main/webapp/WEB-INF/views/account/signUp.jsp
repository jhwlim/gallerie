<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/spring/resources/css/member/signup.css?ver=1.0">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>


<body>

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
      appId      : '1217609175325759',
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
			<div class="col-sm-6">
				<div class="right-column text-center">

					<form id="signUpForm" method="post">

						<img src="/spring/resources/css/member/images/gallerie-logo-s.png"
							class="instagram-logo">
						<h2 class="info">친구들의 사진과 동영상을 보려면 가입하세요.</h2>
						
						<div class="fb-login-button" data-width="" data-size="large" data-button-type="login_with" data-layout="default" data-auto-logout-link="false" data-use-continue-as="true" scope="public_profile,email" onlogin="checkLoginState();"></div>
						
						<div class="bar">
							<div class="left-right"></div>
							<div class="or-center">또는</div>
							<div class="left-right"></div>
						</div>

						<div class="form-group">
							<input type="text" class="id" name="id" required> <label>사용자이름</label>
							<img src="/spring/resources/css/member/images/correct.png" class="correct-check">
							<img src="/spring/resources/css/member/images/incorrect.png" class="incorrect-check">
						</div>
																						
						<div class="form-group">
							<input type="password" class="pw" name="pw" required> <label>비밀번호</label>
						</div>

						<div class="form-group">
							<input type="password" class="pwck-input" name="pwck-input"
								required> <label>비밀번호 확인</label>
							<img src="/spring/resources/css/member/images/correct.png" class="correct-check-pw">
							<img src="/spring/resources/css/member/images/incorrect.png" class="incorrect-check-pw">
						</div>

						<div class="form-group">
							<input type="text" class="name" name="name" required> <label>성명</label>
						</div>

						<div class="form-group">
							<input type="text" id="phone" class="phone" name="phone" required>
							<label>전화번호</label>
						</div>

						<div class="form-group">
							<input type="text" class="email" name="email" required> <label>이메일</label>
							<img src="/spring/resources/css/member/images/correct.png" class="correct-check-email">
							<img src="/spring/resources/css/member/images/incorrect.png" class="incorrect-check-email">
						</div>

						<div class="form-group">
							<div class="mail-check-input-box" id="mailCheckInputBoxFalse">
								<input class="mail-check-input" disabled="disabled" required>
								<label>인증번호</label>
								
							</div>
							<div class="mail-check-button">
								<input type="button" value="인증번호 전송">
							</div>
							<div class="clearfix"></div>
							<img src="/spring/resources/css/member/images/correct.png" class="correct-check-num">
							<img src="/spring/resources/css/member/images/incorrect.png" class="incorrect-check-num">
						</div>

						<input type="button" id="join-button"
							class="btn btn-primary btn-block" value="가입">
					</form>

					<p class="terms">
						가입하면 Instagram의 <b>약관, 데이터 정책</b> 및 <b> 쿠키 정책 </b> 에 동의하게 됩니다.
					</p>
				</div>
				<div class="right-column-login text-center">
					<p>
						계정이 있으신가요?<a href="./"> 로그인</a>
					</p>
				</div>
				

			</div>

		</div>
	</div>

	<script>
	
	/* 유효성 검사 통과유무 변수 */
	var idCheck = false;            // 아이디
	var idckCheck = false;            // 아이디 중복 검사
	var pwCheck = false;            // 비번
	var pwckCheck = false;            // 비번 확인
	var pwckcorCheck = false;        // 비번 확인 일치 확인
	var nameCheck = false;            // 이름
	var phoneCheck = false;			// 전화번호 확인
	var mailCheck = false;            // 이메일
	var mailckCheck = false;		 // 이메일 중복 검사
	var mailnumCheck = false;        // 이메일 인증번호 확인
	
	var code = "";	//이메일전송 인증번호 저장위한 코드
	
	$(document).ready(function(){
		//회원가입 버튼(회원가입 기능 작동)
	    $("#join-button").click(function(){
	    	
	    	 var id = $('.id').val();				// id 입력란
	         var pw = $('.pw').val();				// 비밀번호 입력란
	         var pwck = $('.pwck-input').val();		// 비밀번호 확인 입력란
	         var name = $('.name').val();           // 이름 입력란
	         var phone = $('#phone').val();			// 전화번호 확인 입력란
	         var mail = $('.email').val();          // 이메일 입력란
	         
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
	         
	         /* 비밀번호 확인 유효성 검사*/ 
	         if(pwck == ""){
	             
	             pwckCheck = false;
	         }else{
	         
	             pwckCheck = true;
	         }
	         
	         
	         /* 이름 유효성 검사 */
	         if(name == ""){
	             
	             nameCheck = false;
	         }else{
	             
	             nameCheck = true;
	         }
	         
	         /* 전화번호 유효성 검사 */
	         if(phone == ""){
	        	 
	             phoneCheck = false;
	         }else{
	             phoneCheck = true;
	         }
	         
	         /* 이메일 유효성 검사 */
	         if(mail == ""){
	             
	             mailCheck = false;
	         }else{
	             
	             mailCheck = true;
	         }
	         
	         /* 최종 유효성 검사 */
	         if(idCheck&&idckCheck&&pwCheck&&pwckCheck&&pwckcorCheck&&nameCheck&&phoneCheck&&mailCheck&mailckCheck&&mailnumCheck ){
	        	 $("#signUpForm").attr("action", "./success");
		 	     $("#signUpForm").submit(); 
		 	     
		 	     alert('회원가입이 완료되었습니다.');
	         } 
	         	       	         	      	      
	         return false;
	 	        
	    });
	});
		
	
		$('.id').on("propertychange change keyup paste input", function() {

			var id = $('.id').val(); // .id에 입력되는 값 
			var data = {id : id} 	 // '컨트롤에 넘길 데이터 이름' : '데이터(.id에 입력되는 값)'
			
			$.ajax({ 
				type : "post",
				url : "./memberIdChk",
				data : data,
				success : function(result){
				
					if(result != 'fail'){
						$('.correct-check').css('display', 'block');
			            $('.incorrect-check').css('display', 'none');
						idckCheck = true;
					} else {									             
			            $('.correct-check').css('display','none');
			            $('.incorrect-check').css('display','block');
						idckCheck = false;
					}


					
				}// success 종료
				
			}); // ajax 종료

		});// function 종료
		
		$('.email').on("propertychange change keyup paste input", function() {

			var mail = $('.email').val(); // .id에 입력되는 값 
			var data = {email : mail} 	 // '컨트롤에 넘길 데이터 이름' : '데이터(.email에 입력되는 값) var mail에 들어가있는 값'
			
			$.ajax({ 
				type : "post",
				url : "./memberEmailChk",
				data : data,
				success : function(result){
				
					if(result != 'fail'){
						$('.correct-check-email').css('display', 'block');
			            $('.incorrect-check-email').css('display', 'none'); 
						mailckCheck = true;
					} else {
						$('.correct-check-email').css('display','none');
			            $('.incorrect-check-email').css('display','block');
						mailckCheck = false;
					}


					
				}// success 종료
				
			}); // ajax 종료

		});// function 종료
		
		/* 인증번호 이메일 전송 */
		$(".mail-check-button").click(function(){
		    
			var email = $(".email").val();        		// 입력한 이메일
			var checkBox = $(".mail-check-input");		// 인증번호 입력란
			var boxWrap = $(".mail-check-input-box");	// 인증번호 입력란 박스
			var warnMsg = $(".mail-input-box-warn");    // 이메일 입력 경고글

			 /* 이메일 형식 유효성 검사 */
		    if(mailFormCheck(email)){
		        warnMsg.html("이메일이 전송 되었습니다. 이메일을 확인해주세요.");
		        warnMsg.css("display", "inline-block");
		    } else {
		        warnMsg.html("올바르지 못한 이메일 형식입니다.");
		        warnMsg.css("display", "inline-block");
		        return false;
		    }    
			
			$.ajax({
		        
		        type:"GET",
		        url:"mailCheck?email=" + email,
		        success:function(data){
		        	
		        	checkBox.attr("disabled",false);
		        	boxWrap.attr("id", "mailCheckInputBoxTrue");
		        	code = data;
		        }
		                
		    });
			
		});
		
		/* 인증번호 비교 */
		$(".mail-check-input").blur(function(){
			
			var inputCode = $(".mail-check-input").val();        // 입력코드    
		    var checkResult = $("#mailCheckInputBoxWarn");    	 // 비교 결과     
		    
		    
		    if(inputCode == code){                            	 // 일치할 경우
		    	$('.correct-check-num').css('display', 'block');
	            $('.incorrect-check-num').css('display', 'none'); 
		        mailnumCheck = true;
		    } else {                                             // 일치하지 않을 경우
		    	$('.correct-check-num').css('display','none');
	            $('.incorrect-check-num').css('display','block');
		        mailnumCheck = false;
		    }  
		    
		});

		/* 비밀번호 확인 일치 유효성 검사 */		 
		$('.pwck-input').on("propertychange change keyup paste input", function(){
		        
			var pw = $('.pw').val();
		    var pwck = $('.pwck-input').val();
		    $('.final-pwck-ck').css('display', 'none');
		    
		    if(pw == pwck){
		    	$('.correct-check-pw').css('display', 'block');
	            $('.incorrect-check-pw').css('display', 'none');
		        pwckcorCheck = true;
		    }else{
		    	$('.correct-check-pw').css('display','none');
	            $('.incorrect-check-pw').css('display','block');
		        pwckcorCheck = false;
		    }        
			
		});    
		 
		/* 입력 이메일 형식 유효성 검사 */
		function mailFormCheck(email){
			var form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
			return form.test(email);
		}
		
	</script>
	<script async defer crossorigin="anonymous" src="https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v10.0" nonce="XvzubL4a"></script>
</body>
</html>


