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
	<input type="file" multiple="multiple" accept=".png, .jpg, .gif" id="file" style="display: none;"> <br>
	<button id="submitBtn">전송</button>
	
	<script>
		function checkExtOfFile(file) {
			const extArr = ['png', 'jpg', 'gif'];
			var fileName = file.name;
			var ext = fileName.substring(fileName.lastIndexOf('.')+1);
			
			if (extArr.indexOf(ext) >= 0) {
				return true;
			} else {
				alert(fileName + ' 파일은 지원하지 않은 파일 형식입니다.');
				return false;
			}
		}
		function hasSameFileName(file, fileList) {
			for (f of fileList) {
				if (f.name == file.name) {
					console.log("?");
					alert(f.name + ' 파일은 이미 추가되었습니다.');
					return true;
				}
			}
			return false;
		}
	</script>
	<script>
		let fileList = [];
		
		$('#file').on('change', function() {
			for (file of this.files) {
				if (!checkExtOfFile(file)) {
					return;					
				}
			}
			
			for (file of this.files) {
				if (!hasSameFileName(file, fileList)) {
					fileList.push(file);				
				}
			}
			
			this.value = '';
		});
		
		$('#submitBtn').on('click', function(evt) {
			evt.preventDefault(); // 원래 브라우저가 가지고 있는 이벤트 방지
			
			var formData = new FormData();
			formData.append('content', $('#content').val());
			
			for (file of fileList) {
				if (!checkExtOfFile(file)) {
					files = [];
					return;
				}
				formData.append('files', file);
			}
			
			$.ajax({
				url: "/spring/article/",
				type: 'post',
				data: formData,
				contentType: false,
				processData: false,
				success: function() {
					alert('게시물이 업로드되었습니다.');
					location.href = "/spring/article/test/write";
				}
			});
			
		});
	</script>
	
</body>
</html>