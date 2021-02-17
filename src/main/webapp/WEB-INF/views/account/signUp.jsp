<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/spring/resources/css/member/join.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>

</head>
<body>
	<div class="wrapper">
		<form id="join_form" method="post">
			<div class="wrap">
				<div class="subjecet">
					<span>회원가입</span>
				</div>
				<div class="id_wrap">
					<div class="id_name">아이디</div>
					<div class="id_input_box">
						<input class="id" name="id">
					</div>
					<span class="id_input_re_1">사용 가능한 아이디입니다.</span>
					<span class="id_input_re_2">아이디가 이미 존재합니다.</span>
					<span class="final_id_ck">아이디를 입력해주세요.</span>
				</div>
				<div class="pw_wrap">
					<div class="pw_name">비밀번호</div>
					<div class="pw_input_box">
						<input class="pw" name="pw">
					</div>
					<span class="final_pw_ck">비밀번호를 입력해주세요.</span>
					
				</div>
				<div class="pwck_wrap">
					<div class="pwck_name">비밀번호 확인</div>
					<div class="pwck_input_box">
						<input class="pwck_input">
					</div>
					<span class="final_pwck_ck">비밀번호 확인을 입력해주세요</span>
					<span class="pwck_input_re_1">비밀번호가 일치합니다.</span>
                	<span class="pwck_input_re_2">비밀번호가 일치하지 않습니다.</span>
				</div>

				<div class="user_wrap">
					<div class="user_name">이름</div>
					<div class="user_input_box">
						<input class="name" name="name">
					</div>
					<span class="final_name_ck">이름을 입력해주세요.</span>
				</div>

				<div class="user_wrap">
					<div class="user_name">전화번호</div>
					<div class="user_input_box">
						<input class="phone" name="phone">
					</div>
					<span class="final_phone_ck">전화번호를 입력해주세요.</span>
				</div>

				<div class="mail_wrap">
					<div class="mail_name">이메일</div>
					<div class="mail_input_box">
						<input class="email" name="email">
					</div>
					<span class="final_mail_ck">이메일을 입력해주세요.</span>
					<div class="mail_check_wrap">
						<div class="mail_check_input_box" id="mail_check_input_box_false">
							<input class="mail_check_input" disabled="disabled">
						</div>
						<div class="mail_check_button">
							<span>인증번호 전송</span>
						</div>
						<div class="clearfix"></div>
						<span id="mail_check_input_box_warn"></span>
					</div>
				</div>
				<div class="address_wrap">
					<div class="profile_name">자기소개</div>
					<div class="address_input_3_wrap">
						<div class="address_input_3_box">
							<input class="profile" name="profile">
						</div>
					</div>
				</div>
				<div class="join_button_wrap">
					<input type="button" class="join_button" value="가입하기">
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
	 var mailnumCheck = false;        // 이메일 인증번호 확인
	 var addressCheck = false         // 주소
	 									
	
	var code = "";	//이메일전송 인증번호 저장위한 코드
	
	$(document).ready(function(){
		//회원가입 버튼(회원가입 기능 작동)
	    $(".join_button").click(function(){
	    	
	    	 var id = $('.id').val();				// id 입력란
	         var pw = $('.pw').val();				// 비밀번호 입력란
	         var pwck = $('.pwck_input').val();		// 비밀번호 확인 입력란
	         var name = $('.name').val();           // 이름 입력란
	         var phone = $('.phone').val();			// 전화번호 확인 입력란
	         var mail = $('.email').val();          // 이메일 입력란
	         
	         /* 아이디 유효성검사 */
	         if(id == ""){
	             $('.final_id_ck').css('display','block');
	             idCheck = false;
	         }else{
	             $('.final_id_ck').css('display', 'none');
	             idCheck = true;
	         }
	         
	         /* 비밀번호 유효성 검사 */
	         if(pw == ""){
	             $('.final_pw_ck').css('display','block');
	             pwCheck = false;
	         }else{
	             $('.final_pw_ck').css('display', 'none');
	             pwCheck = true;
	         }
	         
	         /* 비밀번호 확인 유효성 검사*/ 
	         if(pwck == ""){
	             $('.final_pwck_ck').css('display','block');
	             pwckCheck = false;
	         }else{
	             $('.final_pwck_ck').css('display', 'none');
	             pwckCheck = true;
	         }
	         
	         
	         /* 이름 유효성 검사 */
	         if(name == ""){
	             $('.final_name_ck').css('display','block');
	             nameCheck = false;
	         }else{
	             $('.final_name_ck').css('display', 'none');
	             nameCheck = true;
	         }
	         
	         /* 전화번호 유효성 검사 */
	         if(phone == ""){
	             $('.final_phone_ck').css('display','block');
	             phoneCheck = false;
	         }else{
	             $('.final_phone_ck').css('display', 'none');
	             phoneCheck = true;
	         }
	         
	         /* 이메일 유효성 검사 */
	         if(mail == ""){
	             $('.final_mail_ck').css('display','block');
	             mailCheck = false;
	         }else{
	             $('.final_mail_ck').css('display', 'none');
	             mailCheck = true;
	         }
	         
	         /* 최종 유효성 검사 */
	         if(idCheck&&idckCheck&&pwCheck&&pwckCheck&&pwckcorCheck&&nameCheck&&phoneCheck&&mailCheck&&mailnumCheck ){
	        	 $("#join_form").attr("action", "./success");
		 	     $("#join_form").submit(); 
	         } 

	         return false;
	 	        
	    });
	});
		
	
		$('.id').on("propertychange change keyup paste input", function() {

			/*console.log("keyup 테스트");*/

			var id = $('.id').val(); // .id_input에 입력되는 값 
			var data = {id : id} // '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'
			
			$.ajax({ 
				type : "post",
				url : "./memberIdChk",
				data : data,
				success : function(result){
					//console.log("성공 여부" + result);
					if(result != 'fail'){
						$('.id_input_re_1').css("display","inline-block");
						$('.id_input_re_2').css("display", "none"); 
						idckCheck = true;
					} else {
						$('.id_input_re_2').css("display","inline-block");
						$('.id_input_re_1').css("display", "none");
						idckCheck = false;
					}


					
				}// success 종료

			
				
			}); // ajax 종료

		});// function 종료
		
		/* 인증번호 이메일 전송 */
		$(".mail_check_button").click(function(){
		    
			var email = $(".email").val();        		// 입력한 이메일
			var checkBox = $(".mail_check_input");		// 인증번호 입력란
			var boxWrap = $(".mail_check_input_box");	// 인증번호 입력란 박스
			
			
			$.ajax({
		        
		        type:"GET",
		        url:"mailCheck?email=" + email,
		        success:function(data){
		        	
		        	/*console.log("data : " + data);*/
		        	checkBox.attr("disabled",false);
		        	boxWrap.attr("id", "mail_check_input_box_true");
		        	code = data;
		        }
		                
		    });
			
		});
		
		/* 인증번호 비교 */
		$(".mail_check_input").blur(function(){
			
			var inputCode = $(".mail_check_input").val();        // 입력코드    
		    var checkResult = $("#mail_check_input_box_warn");    // 비교 결과     
		    
		    
		    if(inputCode == code){                            // 일치할 경우
		        checkResult.html("인증번호가 일치합니다.");
		        checkResult.attr("class", "correct");
		        mailnumCheck = true;
		    } else {                                            // 일치하지 않을 경우
		        checkResult.html("인증번호를 다시 확인해주세요.");
		        checkResult.attr("class", "incorrect");
		        mailnumCheck = false;
		    }  
		    
		});

		/* 비밀번호 확인 일치 유효성 검사 */
		 
		$('.pwck_input').on("propertychange change keyup paste input", function(){
		        
			var pw = $('.pw').val();
		    var pwck = $('.pwck_input').val();
		    $('.final_pwck_ck').css('display', 'none');
		    
		    if(pw == pwck){
		        $('.pwck_input_re_1').css('display','block');
		        $('.pwck_input_re_2').css('display','none');
		        pwckcorCheck = true;
		    }else{
		        $('.pwck_input_re_1').css('display','none');
		        $('.pwck_input_re_2').css('display','block');
		        pwckcorCheck = false;
		    }        
			
		});    
		 


		

		
		
	</script>


</body>
</html>


