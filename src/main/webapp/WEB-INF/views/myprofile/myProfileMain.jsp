<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/jstl.jspf" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%@ include file="/WEB-INF/include/commonCss.jspf" %>
<%@ include file="/WEB-INF/include/headerCss.jspf" %>

<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<!-- jquery.form.js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.form/4.3.0/jquery.form.min.js" integrity="sha384-qlmct0AOBiA2VPZkMY3+2WqkHtIQ9lSdAsAn5RUJD/3vA5MKDgSGcdmIv4ycVxyn" crossorigin="anonymous"></script>

<style>
.summary {
	margin: 0 auto;
	width: 100%;
	display: flex;
	justify-content: space-around;
	padding: 20px;
}
.summary__image-area {
	display: inline-block;
	width: 160px;
	height: 160px;
	border-radius: 50%;
	overflow: hidden;
}
.summary__image {
	width: 100%;
	height: 100%;
	object-fit: cover;
}
.summary__content {
	padding: 20px;
}
.summary_id {
	font-size: 30px;
}
.summary__row {
	margin-bottom: 20px;
}
.summary__row:last-child {
	margin-bottom: 0;
}
.summary__name {
	font-weight: bold;
}
.file-upload {
	display: none;
}
.profile-area {
	border-radius: 50%;
	width: 500px;
	height: 500px;
	border: 1px solid gray;
	overflow: hidden;
}
</style>
</head>
<body>

<%@ include file="/WEB-INF/include/header.jspf" %>

<div class="wrapper">
    <div class="container">
    	<div class="summary">
    		<figure class="summary__image-area profile-upload">
    			<img src="<c:url value = '/myprofile/image/${member.imgPath}/' />" class="summary__image" id="profileImg"/>
    		</figure>
    		<div class="summary__content">
    			<div class="summary__row">
    				<span class="summary_id">${member.id}</span>
    				&nbsp;&nbsp;
    				<button class="profile-upload">프로필 편집</button>
    				&nbsp;&nbsp;
    				<span>아이콘</span>
    			</div>
    			<div class="summary__row">
    				<span>게시물</span>
    				&nbsp;&nbsp;
    				<span>팔로워</span>
    				&nbsp;&nbsp;
    				<span>팔로우</span>
    			</div>
    			<div class="summary__row">
    				<span class="summary__name">${member.name}</span>
    			</div>
    		</div>
    		
    		
    	</div>
    	
    	
    </div>    
</div>

<form method="POST" action="<c:url value='/myprofile/upload' />" enctype="multipart/form-data" id="uploadForm">
	<input type="file" name="file" class="file-upload" id="ajax-file" />
	<input type="hidden" name="seqId" value="${member.seqId}" />
</form>

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
		console.log(xhr.responseText);
		$("#profileImg").attr("src", "<c:url value = '/myprofile/image/' />" + xhr.responseText + "/");
	}
});
</script>

</body>
</html>