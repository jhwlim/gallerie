<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="/spring/resources/css/member/join.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>
<body>

<div class="wrapper">
		<form id="pwForm" method="post">
			<div class="wrap">
				<div class="subjecet">
					<span>비밀번호 찾기</span>
				</div>
				<div class="id-wrap">
					<div class="id-name">비밀번호를 찾고자 하는 아이디를 입력해 주세요.</div>
					<div class="id-input-box">
						<input class="id" name="id">
					</div>
					
				</div>
				
				<div class="pw-button-wrap">
					<input type="button" class="pw-button" value="다음">
				</div>
			</div>
		</form>
	</div>
	

<script>

var idCheck = false;            	// 아이디
var idckCheck = false;              // 아이디 중복 검사

$(document).ready(function(){
	//회원가입 버튼(회원가입 기능 작동)
    $(".pw-button").click(function(){
    	
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