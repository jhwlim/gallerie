<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/jstl.jspf" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
        integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">


<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<!-- jquery.form.js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.form/4.3.0/jquery.form.min.js" integrity="sha384-qlmct0AOBiA2VPZkMY3+2WqkHtIQ9lSdAsAn5RUJD/3vA5MKDgSGcdmIv4ycVxyn" crossorigin="anonymous"></script>

<!-- css -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
<link rel="stylesheet" href="/spring/resources/css/mainpage/main.css?ver=1.0">
<link rel="stylesheet" href="/spring/resources/css/profile/profile.css?ver=1.1">

<style>
.profile-img-edit {
    display: none;
    position: fixed;
    z-index: 10;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    background-color: rgba(0, 0, 0, 0.6);
    justify-content: center;
    align-items: center;
}
.profile-img-edit__container {
    background-color: #ffffff;
    width: 380px;
    height: auto;
    border-radius: 12px;
    text-align: center;
}
.profile-img-edit__header {
    font-size: 20px;
    padding: 30px;
    font-weight: 600;
    letter-spacing: 1px;
}
.profile-img-edit__option {
    border-top: 1px solid #cccccc;
    padding: 15px;
    cursor: pointer;
    font-weight: 500;
}
.profile-img-edit__option--upload {
    color: rgb(0, 110, 255);
}
.profile-img-edit__option--delete {
    color: red;
}
</style>

</head>
<body style="overflow:scroll;">

<%@ include file="/WEB-INF/include/nav.jspf" %>

<header>
        <div class="container">
            <div class="profile">
                <div class="profile-image">
                    <figure class="summary__image-area" id="profileImgEditOpen"> 
		   					<img src="<c:url value = '/image/profile/${member.imgPath}/' />" class="summary__image" id="profileImg"/>
	    			</figure>
                </div>
                <div class="profile-user-settings">
                    <h1 class="profile-user-name">${member.id}</h1>
                    <button class="profile-btn profile-edit-btn">Edit Profile</button>
                    <button class="profile-btn profile-settings-btn" aria-label="Profile Settings"><i class="fas fa-cog" aria-hidden=""></i></button>
                </div>
                <div class="profile-stats">
                    <ul>
                        <li><span class="profile-stat-count">${fn:length(articles)}</span> posts</li>
                        <li><span class="profile-stat-count">188</span> followers</li>
                        <li><span class="profile-stat-count">206</span> following</li>
                    </ul>
                </div>
                <div class="profile-bio">
                    <p><span class="profile-real-name">${member.name}</span> ${member.profile}</p>
                </div>
            </div>
<!--            End of Profile Section-->
        </div>
<!--        End of Container-->
    </header>
    <main>
        <div class="container">
            <div class="gallery">
            	<c:forEach var="article" items="${articles}">
	            	<div class="gallery-item" tabindex="0" onclick="location.href='<c:url value='/article/${article.id}'/>'">
	                    <img src="<c:url value = '/image/article/${article.imgPath}/' />" alt="" class="gallery-image" >
	                    <div class="gallery-item-info">
	                        <ul>
	                            <li class="gallery-item-likes"><span class="visually-hidden">Likes:</span><i class="fas fa-heart" aria-hidden></i> ${article.likeCount}</li>
	                            <li class="gallery-item-comments"><span class="visually-hidden">Comments:</span><i class="fas fa-comment" aria-hidden></i> ${article.commentCount}</li>
	                        </ul>
	                    </div>
	                </div>            		
            	</c:forEach>
            </div>
    <!--        End of Gallery-->
        </div>
        <div class="loader"></div>
    </main>

<c:if test="${member.signedIn}">
	<form method="POST" action="<c:url value='/image/profile' />" enctype="multipart/form-data" id="uploadForm">
		<input type="file" accept="image/jpeg, image/png" name="file" class="file-upload" />
		<input type="hidden" name="seqId" value="${member.seqId}" />
	</form>
	
	<div class="profile-img-edit" id="profileImgEdit">
        <div class="profile-img-edit__container">
            <header class="profile-img-edit__header">
                프로필 사진 바꾸기
            </header>
            <ul class="profile-img-edit__list">
                <li class="profile-img-edit__option profile-img-edit__option--upload profile-upload">사진 업로드</li>
                <li class="profile-img-edit__option profile-img-edit__option--delete" id="profileImgDelete">현재 사진 삭제</li>
                <li class="profile-img-edit__option" id="profileImgEditClose">취소</li>
            </ul>
        </div>
    </div>

    <script>
        $('#profileImgEditOpen').on('click', function(){
            $('#profileImgEdit').css('display', 'flex');
        });

        $('#profileImgEditClose').on('click', function() {
            $('#profileImgEdit').hide();
        });
    </script>
    
    <script>
	var profileImgEdit = document.getElementById('profileImgEdit');
	var hasImg = ${member.hasImg};
	var prevImgPath = null;
	
	if (!hasImg) { // 프로필 이미지가 설정되어 있지 않다면
		$("#profileImgEditOpen").off('click'); // 모달창 생성하지 못하게 이벤트 제거
		$('#profileImgEditOpen').on('click', function() { // 파일 업로드창 띄우기
			$('.file-upload').click();
		});
	}

	$(".profile-upload").on('click', function(event) {
		$('.file-upload').click();
	});
	
	$(".file-upload").on('change', function() {
		if (this.files.length == 1) {
			$("#uploadForm").submit();	
			this.value = '';
		}
	});
	
	$('#uploadForm').ajaxForm({
		beforeSend: function() {
			prevImgPath = $('#profileImg').attr('src');
			$("#profileImg").attr("src", "<c:url value = '/image/profile/loading.gif/' />");
			$("#profileImgEditClose").click();
			$("#profileImgEditOpen").off('click'); // 파일 업로드창 띄우는 이벤트 제거			
		},
		success: function(fileName, status, xhr) {
			switch (status) {
			case "nocontent" : // 서버에 전송된 파일이 null 인 경우
				$("#profileImg").attr("src", prevImgPath);
				break;
			case "success" :
				$("#profileImg").attr("src", "<c:url value = '/image/profile/' />" + fileName + "/");
				$("#navProfileImg").attr("src", "<c:url value = '/image/profile/' />" + fileName + "/"); // 네비게이션 프로필 이미지 변경
				
				$('#profileImgEditOpen').on('click', function(){ // 모달창 생성
		            $('#profileImgEdit').css('display', 'flex');
		        });
				break;
			}
		},
		error: function() {
			alert("이미지 파일 업로드에 실패하였습니다.")
		}
	});
	
	$('#profileImgDelete').on('click', function() {
		$.ajax({
			type : "DELETE",
			url : "<c:url value='/image/profile' />",
			dataType : "text",
			data : "${member.seqId}",
			beforeSend: function() {
				$("#profileImg").attr("src", "<c:url value = '/image/profile/loading.gif/' />");
				$("#profileImgEditClose").click();
				$("#profileImgEditOpen").off('click'); // 모달창 생성하지 못하게 이벤트 제거
			},
			complete : function() {
				$("#profileImg").attr("src", "<c:url value = '/image/profile/' />");
				$("#navProfileImg").attr("src", "<c:url value = '/image/profile/' />"); // 네비게이션 프로필 이미지 변경
				$('#profileImgEditOpen').on('click', function() { // 파일 업로드창 띄우기
					$('.file-upload').click();
				});
			}
		})
	});
	
	
	</script>
</c:if>

</body>
</html>