<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기(본인 확인)</title>

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
						<h2 class="info">비밀번호 찾기(본인확인)</h2>

						<p>
							본인확인 이메일로 인증 ${member.email }<br>본인확인 이메일 주소와 입력한 이메일 주소가
							같아야, 인증번호를 받을 수 있습니다.
						</p>
						<form id="authForm" method="post">

							<input class="id" name="id" value="${member.id }"
								style="display: none">

							<div class="form-group">
								<input type="text" class="name" name="name" required> <label>성명</label>
							</div>

							<div class="form-group">
								<input type="text" class="email" name="email" required>
								<label>이메일</label>
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
							<input type="button" id="pw-button"
								class="btn btn-primary btn-block" value="다음">
						</form>


					</div>



				</div>

			</div>
		</div>
	</div>
	<script>
	/* 유효성 검사 통과유무 변수 */
	var nameCheck = false;            // 이름
	var mailCheck = false;            // 이메일
	var mailnumCheck = false;         // 이메일 인증번호 확인
	 							
	var code = "";	//이메일전송 인증번호 저장위한 코드
	
	$(document).ready(function(){
		//회원가입 버튼(회원가입 기능 작동)
	    $("#pw-button").click(function(){
	    	
	    	var id = $('.id').val();
	    	
	    	
	         var name = $('.name').val();           // 이름 입력란
	         var mail = $('.email').val();          // 이메일 입력란
	         
	         /* 이름 유효성 검사 */
	         if(name == ""){
	             $('.final-name-ck').css('display','block');
	             nameCheck = false;
	         }else{
	             $('.final-name-ck').css('display', 'none');
	             nameCheck = true;
	         }
	         	         
	         /* 이메일 유효성 검사 */
	         if(mail == ""){
	             $('.final-mail-ck').css('display','block');
	             mailCheck = false;
	         }else{
	             $('.final-mail-ck').css('display', 'none');
	             mailCheck = true;
	         }
	         
	         /* 최종 유효성 검사 */
	         if(nameCheck&&mailCheck&&mailnumCheck ){
	        	 $("#authForm").attr("action", "./resetpw");
		 	     $("#authForm").submit(); 
	         } 

	         return false;
	 	        
	    });
	});
				
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
		        url:"mailCheckPw?email=" + email,
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
		
		/* 입력 이메일 형식 유효성 검사 */
		function mailFormCheck(email){
			var form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
			return form.test(email);
		}
	
	</script>

</body>
</html>