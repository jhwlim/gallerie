<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>

<style>
.article__textarea {
	width: 300px;
	height: 100px;
	resize: none;
	padding: 10px;
	font-family: 'Noto Sans KR', sans-serif;
	overflow: auto;
}
</style>
</head>
<body>
	<h1>게시글 입력 테스트 페이지</h1>
	
	<textarea name="content" class="article__textarea" id="content"></textarea> <br>
	<label for="file">파일업로드</label>
	<input type="file" multiple="multiple" id="file" style="display: none;"> <br>
	<button id="submitBtn">전송</button>

	<script>
		let files = [];
		
		$('#file').on('change', function() {
			for (file of this.files) {
				files.push(file);
			}
			console.log(files);
		});
		
		$('#submitBtn').on('click', function(evt) {
			evt.preventDefault(); // 원래 브라우저가 가지고 있는 이벤트 방지
			
			var formData = new FormData();
			formData.append('content', $('#content').val());
			console.log($('#content').val());
			console.log(formData);
			for (file of files) {
				formData.append('files', file);
			}
			console.log(formData);
			
			$.ajax({
				url: "/spring/article/test/save",
				data: formData,
				type: 'post',
				contentType: false,
				processData: false,
				success: function() {
					console.log('complete');
				}
			});
			
		});
	</script>
	
</body>
</html>