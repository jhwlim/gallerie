<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>


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
						<h2 class="info">로그인에 문제가 있나요?</h2>
						<p>이메일 주소, 전화번호 또는 사용자 이름을 입력하시면 계정에 다시 액세스할 수 있는 링크를 보내드립니다.</p>
						<form id="pwForm" method="post">

							<div class="form-group">
								<input type="text" class="id" name="id" required> <label>사용자이름</label>
							</div>

							<input type="button" id="pw-button"
								class="btn btn-primary btn-block" value="본인 인증 절차">
						</form>

						<div class="bar">
							<div class="left-right"></div>
							<div class="or-center">또는</div>
							<div class="left-right"></div>
						</div>

						<h2 class="info">
							<a href="./signup">새 계정 만들기</a>
						</h2>

						<div class="login-box">
							<h3 class="info2">
								<a href="./login">로그인으로 돌아가기</a>
							</h3>
						</div>
					</div>



				</div>

			</div>
		</div>
	</div>

	<script>

var idCheck = false;            	// 아이디
var idckCheck = false;              // 아이디 중복 검사

$(document).ready(function(){
	//회원가입 버튼(회원가입 기능 작동)
    $("#pw-button").click(function(){
    	
    	 var id = $('.id').val();				// id 입력란
		
    	 
    	 if(idckCheck ){
        	 $("#pwForm").attr("action", "./userauth");
	 	     $("#pwForm").submit(); 
         } 
    	 else{
    		 alert('입력하신 아이디를 찾을 수 없습니다.');
             return false; 
    	 }       	
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
			
			if(result != 'success'){
				$('.id-input-re-1').css("display","inline-block");
				$('.id-input-re-2').css("display", "none"); 
				idckCheck = true;
			} else {
				$('.id-input-re-2').css("display","inline-block");
				$('.id-input-re-1').css("display", "none");
				idckCheck = false;
			}
			
		}// success 종료
	
	}); // ajax 종료

});// function 종료

</script>

</body>
</html>