<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기(비밀번호 재설정)</title>
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
						<h2 class="info">비밀번호 재설정</h2>
						<p>인스타그램 아이디 : ${member.id }</p>
						<form id="resetForm" method="post">

							<input class="id" name="id" value="${member.id }"
								style="display: none">
							<div class="form-group">
								<input type="password" class="pw" name="pw" required> <label>새
									비밀번호</label>
							</div>							

							<div class="form-group">
								<input type="password" class="pwck-input" name="pwck-input"
									required> <label>새 비밀번호 확인</label>
									<img src="/spring/resources/css/member/images/correct.png" class="correct-check-pw">
									<img src="/spring/resources/css/member/images/incorrect.png" class="incorrect-check-pw">
							</div>
						
							<input type="button" id="pw-button"
								class="btn btn-primary btn-block" value="비밀번호 변경 확인">
						</form>


					</div>

				</div>

			</div>
		</div>
	</div>
	
	<script>
		/* 유효성 검사 통과유무 변수 */
		var pwCheck = false; // 비번
		var pwckCheck = false; // 비번 확인
		var pwckcorCheck = false; // 비번 확인 일치 확인

		$(document).ready(function() {
			//회원가입 버튼(회원가입 기능 작동)
			$("#pw-button").click(function() {

				var pw = $('.pw').val(); // 비밀번호 입력란
				var pwck = $('.pwck-input').val(); // 비밀번호 확인 입력란

				/* 비밀번호 유효성 검사 */
				if (pw == "") {
					$('.final-pw-ck').css('display', 'block');
					pwCheck = false;
				} else {
					$('.final-pw-ck').css('display', 'none');
					pwCheck = true;
				}

				/* 비밀번호 확인 유효성 검사*/
				if (pwck == "") {
					$('.final-pwck-ck').css('display', 'block');
					pwckCheck = false;
				} else {
					$('.final-pwck-ck').css('display', 'none');
					pwckCheck = true;
				}

				/* 최종 유효성 검사 */
				if (pwCheck && pwckCheck && pwckcorCheck) {
					$("#resetForm").attr("action", "./login");
					$("#resetForm").submit();
				}

				return false;

			});
		});

		/* 비밀번호 확인 일치 유효성 검사 */

		$('.pwck-input').on("propertychange change keyup paste input",
				function() {

					var pw = $('.pw').val();
					var pwck = $('.pwck-input').val();
					$('.final-pwck-ck').css('display', 'none');

					if (pw == pwck) {
						$('.correct-check-pw').css('display', 'block');
			            $('.incorrect-check-pw').css('display', 'none');
						pwckcorCheck = true;
					} else {
						$('.correct-check-pw').css('display','none');
			            $('.incorrect-check-pw').css('display','block');
						pwckcorCheck = false;
					}

				});
	</script>

	<!--  
	<div class="wrapper">
		<form id="resetForm" method="post">
			<div class="wrap">
				<div class="subjecet">
					<span>비밀번호 재설정</span>
				</div>
				<div class="id-wrap">
					<div class="id-name">
						<input class="id" name="id" value="${member.id }" style="display:none">
						<h3>네이버 아이디 : (${member.id })</h3>
					</div>
						
				</div>
				<div class="pw-wrap">
					<div class="pw-name">새 비밀번호</div>
					<div class="pw-input-box">
						<input type="password" class="pw" name="pw">
					</div>
					<span class="final-pw-ck">비밀번호를 입력해주세요.</span>
					
				</div>
				<div class="pwck-wrap">
					<div class="pwck-name">새 비밀번호 확인</div>
					<div class="pwck-input-box">
						<input type="password" class="pwck-input">
					</div>
					<span class="final-pwck-ck">비밀번호 확인을 입력해주세요</span>
					<span class="pwck-input-re-1">비밀번호가 일치합니다.</span>
                	<span class="pwck-input-re-2">비밀번호가 일치하지 않습니다.</span>
				</div>

				<div class="pw-button-wrap">
					<input type="button" class="pw-button" value="확인">
				</div>
			</div>
		</form>
	</div>
	
	
<script>
/* 유효성 검사 통과유무 변수 */
var pwCheck = false;               // 비번
var pwckCheck = false;             // 비번 확인
var pwckcorCheck = false;          // 비번 확인 일치 확인

$(document).ready(function(){
	//회원가입 버튼(회원가입 기능 작동)
   $(".pw-button").click(function(){
   	
        var pw = $('.pw').val();				// 비밀번호 입력란
        var pwck = $('.pwck-input').val();		// 비밀번호 확인 입력란
               
        /* 비밀번호 유효성 검사 */
        if(pw == ""){
            $('.final-pw-ck').css('display','block');
            pwCheck = false;
        }else{
            $('.final-pw-ck').css('display', 'none');
            pwCheck = true;
        }
        
        /* 비밀번호 확인 유효성 검사*/ 
        if(pwck == ""){
            $('.final-pwck-ck').css('display','block');
            pwckCheck = false;
        }else{
            $('.final-pwck-ck').css('display', 'none');
            pwckCheck = true;
        }
               
        /* 최종 유효성 검사 */
        if(pwCheck&&pwckCheck&&pwckcorCheck ){
       		$("#resetForm").attr("action", "./login");
	 	    $("#resetForm").submit(); 
        } 

        return false;
	        
   });
});

/* 비밀번호 확인 일치 유효성 검사 */

$('.pwck-input').on("propertychange change keyup paste input", function(){
        
	var pw = $('.pw').val();
    var pwck = $('.pwck-input').val();
    $('.final-pwck-ck').css('display', 'none');
    
    if(pw == pwck){
        $('.pwck-input-re-1').css('display','block');
        $('.pwck-input-re-2').css('display','none');
        pwckcorCheck = true;
    }else{
        $('.pwck-input-re-1').css('display','none');
        $('.pwck-input-re-2').css('display','block');
        pwckcorCheck = false;
    }        
	
});    
	
</script>
-->
</body>
</html>