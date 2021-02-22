<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
<link rel="stylesheet" href="/spring/resources/css/member/join.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>

</head>
<body>
	<div class="wrapper">
		<form id="joinForm" method="post">
			<div class="wrap">
				<div class="subjecet">
					<span>회원가입</span>
				</div>
				<div class="id-wrap">
					<div class="id-name">아이디</div>
					<div class="id-input-box">
						<input class="id" name="id">
					</div>
					<span class="id-input-re-1">사용 가능한 아이디입니다.</span>
					<span class="id-input-re-2">아이디가 이미 존재합니다.</span>
					<span class="final-id-ck">아이디를 입력해주세요.</span>
				</div>
				<div class="pw-wrap">
					<div class="pw-name">비밀번호</div>
					<div class="pw-input-box">
						<input type="password" class="pw" name="pw">
					</div>
					<span class="final-pw-ck">비밀번호를 입력해주세요.</span>
					
				</div>
				<div class="pwck-wrap">
					<div class="pwck-name">비밀번호 확인</div>
					<div class="pwck-input-box">
						<input type="password" class="pwck-input">
					</div>
					<span class="final-pwck-ck">비밀번호 확인을 입력해주세요</span>
					<span class="pwck-input-re-1">비밀번호가 일치합니다.</span>
                	<span class="pwck-input-re-2">비밀번호가 일치하지 않습니다.</span>
				</div>

				<div class="user-wrap">
					<div class="user-name">이름</div>
					<div class="user-input-box">
						<input class="name" name="name">
					</div>
					<span class="final-name-ck">이름을 입력해주세요.</span>
				</div>

				<div class="phone-wrap">
					<div class="phone-name">전화번호</div>
					<div class="phone-input-box">
						<input class="phone" name="phone">
					</div>
					<span class="final-phone-ck">전화번호를 입력해주세요.</span>
				</div>

				<div class="mail-wrap">
					<div class="mail-name">이메일</div>
					<div class="mail-input-box">
						<input class="email" name="email">
					</div>
					<span class="email-input-re-1">사용 가능한 이메일입니다.</span>
					<span class="email-input-re-2">이 이메일은 이미 존재합니다.</span>
					<span class="final-mail-ck">이메일을 입력해주세요.</span>
					<span class="mail-input-box-warn"></span>
					<div class="mail-check-wrap">
						<div class="mail-check-input-box" id="mailCheckInputBoxFalse">
							<input class="mail-check-input" disabled="disabled">
						</div>
						<div class="mail-check-button">
							<span>인증번호 전송</span>
						</div>
						<div class="clearfix"></div>
						<span id="mailCheckInputBoxWarn"></span>
					</div>
				</div>
				<div class="profile-wrap">
					<div class="profile-name">자기소개</div>
					<div class="profile-input-3-wrap">
						<div class="profile-input-3-box">
							<input class="profile" name="profile">
						</div>
					</div>
				</div>
				<div class="join-button-wrap">
					<input type="button" class="join-button" value="가입하기">
				</div>
			</div>
		</form>
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
	var addressCheck = false         // 주소
	
	var code = "";	//이메일전송 인증번호 저장위한 코드
	
	$(document).ready(function(){
		//회원가입 버튼(회원가입 기능 작동)
	    $(".join-button").click(function(){
	    	
	    	 var id = $('.id').val();				// id 입력란
	         var pw = $('.pw').val();				// 비밀번호 입력란
	         var pwck = $('.pwck-input').val();		// 비밀번호 확인 입력란
	         var name = $('.name').val();           // 이름 입력란
	         var phone = $('.phone').val();			// 전화번호 확인 입력란
	         var mail = $('.email').val();          // 이메일 입력란
	         
	         /* 아이디 유효성검사 */
	         if(id == ""){
	             $('.final-id-ck').css('display','block');
	             idCheck = false;
	         }else{
	             $('.final-id-ck').css('display', 'none');
	             idCheck = true;
	         }
	         
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
	         
	         
	         /* 이름 유효성 검사 */
	         if(name == ""){
	             $('.final-name-ck').css('display','block');
	             nameCheck = false;
	         }else{
	             $('.final-name-ck').css('display', 'none');
	             nameCheck = true;
	         }
	         
	         /* 전화번호 유효성 검사 */
	         if(phone == ""){
	             $('.final-phone-ck').css('display','block');
	             phoneCheck = false;
	         }else{
	             $('.final-phone-ck').css('display', 'none');
	             phoneCheck = true;
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
	         if(idCheck&&idckCheck&&pwCheck&&pwckCheck&&pwckcorCheck&&nameCheck&&phoneCheck&&mailCheck&mailckCheck&&mailnumCheck ){
	        	 $("#joinForm").attr("action", "./success");
		 	     $("#joinForm").submit(); 
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
		
		$('.email').on("propertychange change keyup paste input", function() {

			var mail = $('.email').val(); // .id에 입력되는 값 
			var data = {email : mail} 	 // '컨트롤에 넘길 데이터 이름' : '데이터(.email에 입력되는 값) var mail에 들어가있는 값'
			
			$.ajax({ 
				type : "post",
				url : "./memberEmailChk",
				data : data,
				success : function(result){
				
					if(result != 'fail'){
						$('.email-input-re-1').css("display","inline-block");
						$('.email-input-re-2').css("display", "none"); 
						mailckCheck = true;
					} else {
						$('.email-input-re-2').css("display","inline-block");
						$('.email-input-re-1').css("display", "none");
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
		        checkResult.html("인증번호가 일치합니다.");
		        checkResult.attr("class", "correct");
		        mailnumCheck = true;
		    } else {                                             // 일치하지 않을 경우
		        checkResult.html("인증번호를 다시 확인해주세요.");
		        checkResult.attr("class", "incorrect");
		        mailnumCheck = false;
		    }  
		    
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
		 
		/* 입력 이메일 형식 유효성 검사 */
		function mailFormCheck(email){
			var form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
			return form.test(email);
		}
		
	</script>


</body>
</html>


