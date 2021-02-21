<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/jstl.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<!-- jquery.form.js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.form/4.3.0/jquery.form.min.js" integrity="sha384-qlmct0AOBiA2VPZkMY3+2WqkHtIQ9lSdAsAn5RUJD/3vA5MKDgSGcdmIv4ycVxyn" crossorigin="anonymous"></script>
<title>Insert title here</title>
<style>
.profile-area {
	border-radius: 50%;
	width: 500px;
	height: 500px;
	border: 1px solid gray;
	overflow: hidden;
}
.profile-img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}
.file-upload {
	display: none;
}
</style>
</head>
<body>
	<h1>Myprofile img 업로드 테스트</h1>
	
	<form method="POST" action="<c:url value='/myprofile/upload' />" enctype="multipart/form-data" 
		id="uploadForm">
		<input type="file" name="file" class="file-upload" id="ajax-file" />
	</form>
	<div id="percent"></div>
	<div id="status">ready</div>
	
	
	<div class="profile-area profile-upload">
		<img class="profile-img" src="getImage"/>
	</div>
	
	<button class="profile-upload">프로필 수정하기</button> <br>
	
	<a class="profile-upload">프로필 수정하기</a> <br>
	
	<script>
	const $percent = $('#percent'),
		  $status = $('#status');

	$(".profile-upload").on("click", function(event) {
		$('.file-upload').click();
	});
	
	$(".file-upload").on('change', function() {
		console.log(this.files);
		
		$("#uploadForm").submit();
	});

	$('#uploadForm').ajaxForm({
		beforeSend: function() {
			$status.empty();
			$percent.html('0%');
		},
		uploadProgress: function(event, position, total, percentComplete) {
			$status.html('uploading...');
			$percent.html(percentComplete + '%');
		},
		complete: function(xhr) {
			$status.html("OK");
		}
	});
	</script>
</body>
</html>