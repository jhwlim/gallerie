<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/jstl.jspf" %>

<html>
<head>



<title>Home</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
        integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<link rel="stylesheet" href="/spring/resources/css/mainpage/main.css?ver=2.1">

<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="<c:url value='/resources/css/article/write_modal.css?ver=1.0' />" />

<script src="https://kit.fontawesome.com/d3d6f2df1f.js" crossorigin="anonymous"></script>

</head>
<body>

	<%@ include file="/WEB-INF/include/nav.jspf" %>

    <div class="mt-4">
        <div class="container d-flex justify-content-center">
            <div class="col-9">
                <div class="row">
                    <div class="col-8">

                        <!-- START OF STORIES -->
                        <div class="story-container">
                            <ul>
                                <c:forEach var="follow" items="${follows}">
                                	<li onclick="location.href='/spring/myprofile/${follow.id}'" style="cursor: pointer;">
	                                    <div class="story">
	                                        <img src="<c:url value='/image/profile/${follow.imgPath}/'/>" class="story-img">
	                                    </div>
	                                    <span class="user">${follow.id}</span>
	                                </li>
                                </c:forEach>
                            </ul>
                        </div>
                        <!-- END OF STORIES -->

                        <div class="post-box">
                            <div class="post-box-inside" style="border-radius: max(0px, min(8px, ((100vw - 4px) - 100%) * 9999)) / 8px;">
                             <div aria-label="게시물 작성" class="post-label" role="region">
                                <div class="post-feeling">
                                    <h3 class="head-line" dir="auto">게시물 작성</h3>
                                    <a aria-label="Taewook Kang님의 타임라인" class="timeline" href="https://www.facebook.com/profile" role="link" tabindex="0"> <!--.php?id= 프로필 뒤에 아이디 넣기-->
                                     <div class="my-profile">
                                         <img class="profile-img" height="40" src="https://scontent-ssn1-1.xx.fbcdn.net/v/t1.30497-1/cp0/p40x40/143086968_2856368904622192_1959732218791162458_n.png?_nc_cat=1&amp;ccb=3&amp;_nc_sid=7206a8&amp;_nc_ohc=oRlR2bi78voAX_wZ1nf&amp;_nc_ht=scontent-ssn1-1.xx&amp;_nc_tp=30&amp;oh=7053e428da80ec059f1993fa56bb99a7&amp;oe=6063E723" width="40" alt="">
                                         <div class="profile-img-inside" style="height: 40px; width: 40px;">
                 
                                         </div>
                                     </div>
                                     <div class="profile-img-middle" data-visualcompletion="ignore">
                 
                                     </div>
                                 </a>
                                 <div class="text-box" role="button" tabindex="0">
                                         <div class="text-box-inside">
                                             <span class="text-text" id="writeOpenBtn" style="-webkit-box-orient: vertical; -webkit-line-clamp: 2; display: -webkit-box;">${sessionScope.user}님, 무슨 생각을 하고 계신가요?</span>
                                         </div>
                                         <div class="text-bottom" data-visualcompletion="ignore" style="border-radius: 20px;">
                 
                                         </div>
                                     </div>
                                 </div>
                                 <div class="category">
                                     <div class="category-button" role="button" tabindex="0">
                                         <div class="category-button-inside">
                                             <span class="category-img"><img src="/spring/resources/css/mainpage/images/live.png" ></span>
                                             <span class="category-box" dir="auto">
                                                 <span class="category-box-inside">라이브 방송</span>
                                             </span>
                                         </div>
                                         <div class="text-bottom" data-visualcompletion="ignore">
                 
                                         </div>
                                     </div>
                                     
                                     <input accept="image/*,image/heif,image/heic,video/*,video/mp4,video/x-m4v,video/x-matroska,.mkv" class="file-upload" name="file-upload" multiple="" type="file">
                                         <div class="category-button" role="button" tabindex="0">
                                             <div class="category-button-inside">
                                                 
                                                 <span class="category-img"><img src="/spring/resources/css/mainpage/images/free-icon-instagram-2111463.png" ></span>
                                                 <span class="category-box" dir="auto">
                                                     <span class="category-box-inside">사진/동영상</span>
                                                 </span>
                                             </div>
                                             <div class="text-bottom" data-visualcompletion="ignore"></div>
                                         </div>
                                     
                                     <div class="category-button" role="button" tabindex="0">
                                         <div class="category-button-inside">
                                             <span class="category-img"><img src="/spring/resources/css/mainpage/images/smile.png" ></span>
                                             <span class="category-box" dir="auto">
                                                 <span class="category-box-inside">기분/활동</span>
                                             </span>
                                         </div>
                                         <div class="text-bottom" data-visualcompletion="ignore">
                                         </div>
                                     </div>
                                 </div>
                             </div>
                         </div>
                     </div>
                        <!-- START OF POSTS -->
                        <div class="d-flex flex-column mt-4 mb-4" id="posts"></div>
                        <!-- END OF POSTS -->
                        <div class="loader">Loading...</div>
                    </div>

                    <div class="col-4">
                        <div class="d-flex flex-row align-items-center">
                            <div
                                class="rounded-circle overflow-hidden d-flex justify-content-center align-items-center border sidenav-profile-photo">
                                <img src="<c:url value='/image/profile/${sessionScope.userProfile}/'/>" alt="..."
                                    style="transform: scale(1.5); width: 100%; position: absolute; left: 0;">
                            </div>
                            <div class="profile-info ml-3">
                                <span class="profile-info-username">${sessionScope.user}</span>
                                <span class="profile-info-name">${sessionScope.userName }</span>
                            </div>
                        </div>

                        <div class="mt-4">
                            <div class="d-flex flex-row justify-content-between">
                                <small class="text-muted font-weight-normal">Suggestions For You</small>
                                <small>See All</small>
                            </div>
                            <div>
                            	<c:forEach var="f" items="${topFiveFollows}">
                            		<div class="d-flex flex-row justify-content-between align-items-center mt-3 mb-3">
	                                    <div class="d-flex flex-row align-items-center">
	                                        <div
	                                            class="rounded-circle overflow-hidden d-flex justify-content-center align-items-center border sugest-profile-photo">
	                                            <img src="<c:url value='/image/profile/${f.imgPath}/'/>" alt="..."
	                                                style="transform: scale(1.5); width: 100%; position: absolute; left: 0;">
	                                        </div>
	                                        <strong class="ml-3 sugest-username" onclick="location.href='/spring/myprofile/${f.id}'" style="cursor: pointer;">${f.id}</strong>
	                                    </div>
                                        <button class="btn btn-primary btn-sm p-0 btn-ig js-top5-follow-btn" data-seq-id="${f.seqId}">${!f.followed ? 'Follow' : 'Unfollow'}</button>    
	                                </div>
                            	</c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

<footer>
    <!-- JS, Popper.js, and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
        integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
        crossorigin="anonymous"></script>
</footer>

<div class="my-modal" id="writeModal">
    <div class="my-modal__container">
        <div class="write-modal__header">
            게시물 만들기
            <button class="write-modal__close" id="writeCloseBtn">X</button>
        </div>
        <div class="write__content">
            <div class="write__writer">
                <figure class="write__writer-figure">
                    <img src="<c:url value = '/image/profile/${sessionScope.userProfile}/' />" alt="" class="write__writer-image">
                </figure>
                <span class="write__writer-id">${sessionScope.user}</span>    
            </div>
            <textarea name="content" placeholder="${sessionScope.user}님, 무슨 생각을 하고 계신가요?" class="write__textarea" id="writeArea"></textarea>
            <div class="upload__file-preview" id="writeUploadFilePreview"></div>
            <label for="fileSelector" class="upload">
                <figure class="upload__icon-size">
                    <img src="<c:url value='/resources/image/static/photo.png'/>" alt="" class="upload__image">
                </figure>
                <p class="upload__text">게시물에 추가</p> 
            </label>
            <input type="file" multiple="multiple" accept=".png, .jpg, .gif" id="fileSelector" class="file" style="display: none;">
            <button class="write__post" id="writeBtn" disabled>게시</button>
        </div>
    </div>
</div>

<script
  src="https://code.jquery.com/jquery-3.6.0.js"
  integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
  crossorigin="anonymous"></script>
<script src="<c:url value = '/resources/js/article/write_modal.js' />"></script>
<script>
let fileList = [];

$('#writeOpenBtn').on('click', function(){
    $('#writeModal').show();
});

$('#writeCloseBtn').on('click', function() {
    $('#writeModal').hide();
});

$('#fileSelector').on('change', function() {
    var files = this.files;
    // 파일 형식 유효성 검사
    for (file of this.files) {
		if (!checkExtOfFile(file)) {
			return;					
		}
	}

    var filePreview = document.getElementById('writeUploadFilePreview');

    for (var file of files) {
        if (!hasSameFileName(file, fileList)) {
            // 파일 리스트에 추가
            fileList.push(file);
            
            // 업로드한 이미지 파일 미리보기 태그 추가
            var filePreview = document.getElementById('writeUploadFilePreview');

            var figure = document.createElement('figure');
            figure.classList.add('upload__preview-size');

            var img = document.createElement('img');
            img.setAttribute('src', URL.createObjectURL(file));
            img.classList.add('upload__image');
            figure.appendChild(img);
            filePreview.appendChild(figure);
            
            
            var div = document.createElement('div');
            div.classList.add('upload__preview-size', 'upload__preview-size--delete');
            figure.appendChild(div);
            
            var delImg = document.createElement('img');
            delImg.setAttribute('src', '/spring/resources/image/static/delete.png');
            delImg.classList.add('upload__delete');
            div.appendChild(delImg);

            delImg.addEventListener('click', function() {
                var figure = this.parentElement.parentElement;
                figure.remove();
                
                var idx = fileList.indexOf(file);
                fileList.splice(idx, 1);
            });
        }    
    }

    this.value = '';
});

$('#writeArea').on('keydown keyup', function() {
    // textarea 자동으로 높이 조절하기
    this.style.height = '1px';
    this.style.height = (12 + this.scrollHeight) + "px";

    const writeBtn = $('#writeBtn');
    var content = $('#writeArea').val();
    if (content.length == 0) {
        writeBtn.attr('disabled', true);
    } else {
        writeBtn.attr('disabled', false);
    }
});

$('#writeBtn').on('click', function(evt) {
	evt.preventDefault(); // 원래 브라우저가 가지고 있는 이벤트 방지
	
	var formData = new FormData();
	formData.append('content', $('#writeArea').val());
	
	for (file of fileList) {
		if (!checkExtOfFile(file)) {
			files = [];
			return;
		}
		formData.append('files', file);
	}
	console.log(fileList);
	
	$.ajax({
		url: "/spring/article/",
		type: 'post',
		data: formData,
		contentType: false,
		processData: false,
		success: function() {
			alert('게시물이 업로드되었습니다.');
			location.href = ".";
		}
	});
	
});
</script>

<!-- 게시물 템플릿 -->
<div class="card js-card-template" style="display: none; margin-bottom: 20px;">
    <div class="card-header p-3">
        <div class="d-flex flex-row align-items-center">
            <div
                class="rounded-circle overflow-hidden d-flex justify-content-center align-items-center border border-danger post-profile-photo mr-3">
                <img class="js-writer-img" src="" alt="..."
                    style="transform: scale(1.5); width: 100%; position: absolute; left: 0;">
            </div>
            <span class="font-weight-bold js-writer-id"></span>
        </div>
    </div>
    <div class="card-body p-0">
        <div class="embed-responsive embed-responsive-1by1" id="articles" style="height: auto;">
            <img class="embed-responsive-item js-file" src="" style="width: 100%; height: 100%; object-fit: scale-down"/>
        </div>

        <div class="d-flex flex-row justify-content-between pl-3 pr-3 pt-3 pb-1">
            <ul class="list-inline d-flex flex-row align-items-center m-0">
                <li class="list-inline-item">
                    <button class="btn p-0">
                        <div class="content js-heart">
                          <span class="heart"></span>
                        </div>
                    </button>
                </li>
                <li class="list-inline-item ml-2">
                    <button class="btn p-0">
                        <svg width="1.6em" height="1.6em" viewBox="0 0 16 16"
                            class="bi bi-chat" fill="currentColor"
                            xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd"
                                d="M2.678 11.894a1 1 0 0 1 .287.801 10.97 10.97 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8.06 8.06 0 0 0 8 14c3.996 0 7-2.807 7-6 0-3.192-3.004-6-7-6S1 4.808 1 8c0 1.468.617 2.83 1.678 3.894zm-.493 3.905a21.682 21.682 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a9.68 9.68 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105z" />
                        </svg>
                    </button>
                </li>
                <li class="list-inline-item ml-2">
                    <button class="btn p-0">
                        <svg width="1.6em" height="1.6em" viewBox="0 0 16 16"
                            class="bi bi-share" fill="currentColor"
                            xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd"
                                d="M11.724 3.947l-7 3.5-.448-.894 7-3.5.448.894zm-.448 9l-7-3.5.448-.894 7 3.5-.448.894z" />
                            <path fill-rule="evenodd"
                                d="M13.5 4a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3zm0 1a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5zm0 10a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3zm0 1a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5zm-11-6.5a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3zm0 1a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5z" />
                        </svg>
                    </button>
                </li>
            </ul>
            <div>
                <button class="btn p-0">
                    <svg width="1.6em" height="1.6em" viewBox="0 0 16 16" class="bi bi-hdd"
                        fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd"
                            d="M14 9H2a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1v-1a1 1 0 0 0-1-1zM2 8a2 2 0 0 0-2 2v1a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2v-1a2 2 0 0 0-2-2H2z" />
                        <path
                            d="M5 10.5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0zm-2 0a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0z" />
                        <path fill-rule="evenodd"
                            d="M4.094 4a.5.5 0 0 0-.44.26l-2.47 4.532A1.5 1.5 0 0 0 1 9.51v.99H0v-.99c0-.418.105-.83.305-1.197l2.472-4.531A1.5 1.5 0 0 1 4.094 3h7.812a1.5 1.5 0 0 1 1.317.782l2.472 4.53c.2.368.305.78.305 1.198v.99h-1v-.99a1.5 1.5 0 0 0-.183-.718L12.345 4.26a.5.5 0 0 0-.439-.26H4.094z" />
                    </svg>
                </button>
            </div>
        </div>

        <div class="pl-3 pr-3 pb-2">
            <strong class="d-block"><span class="js-like-count"></span> likes</strong>
            <p class="d-block mb-1 js-content" style="white-space: pre-wrap; flex-wrap;"></p>
            <button class="btn p-0">
                <span class="text-muted js-move">View all <span class="js-comment-count"></span> comments</span>
            </button>

            <div class="js-comments">
                <div class="js-comment">
                    <strong class="d-block js-comment-id"></strong>
                    <span class="js-comment-content"></span>
                    <small class="text-muted js-comment-date"></small>
                </div>
            </div>

            
        </div>

        <div class="position-relative comment-box">
            <div class="position-relative comment-box">
				<form name="commentInsertForm" class="commentInsertForm" action="/spring/comment/insert" method="POST">
					<input type="hidden" name="id" value="" class="js-form-id"/>
					<input type="text" name="content" class="w-100 border-0 p-3 input-post" placeholder="Add a comment...">
                    <button name="commentInsertBtn" class="btn btn-primary position-absolute btn-ig">Post</button>
                </form>
            </div>
        </div>


    </div>
</div>
<script>
function setArticles(articles) {
	for (var article of articles) {
		
		var card = $('.js-card-template').clone();
		$(card).removeClass('js-card-template');
		$(card).data('id', article.id);
		console.log($(card).data('id'));
		$(card).find('.js-writer-id').text(article.writerId);
		$(card).find('.js-writer-img').attr('src', "/spring/image/profile/" + article.imgPath + '/');
		$(card).find('.js-like-count').text(article.likeCount);
		$(card).find('.js-comment-count').text(article.comments.length);
		var content = $(card).find('.js-content');
		content.html(article.content);
		setTagHref($(content).find('a'));
		$(card).find('.content').click(function(){
	          $(this).find('.content').toggleClass("heart-active")
	          $(this).find('.text').toggleClass("heart-active")
	          $(this).find('.numb').toggleClass("heart-active")
	          $(this).find('.heart').toggleClass("heart-active")
	        });
		$(card).find('.js-form-id').val(article.id);
		
		var comments = $(card).find('.js-comments');
		var comment = $(card).find('.js-comment');
		
		comments.html('');
		
		$(card).find('.js-move').on('click', function() {
			
			location.href = '/spring/post/' + $(this).closest('.card').data('id');
		});
		
		if (article.files.length > 0) {
			$(card).find('.js-file').attr('src', '/spring/image/article/' + article.files[0].imgPath + '/');			
		} else {
			$(card).find('.js-file').parent().remove();
		}
		
		for (var i in article.comments) {
			if (i == 3) break;
			
			var com = article.comments[i];
			var c = comment.clone();
			$(c).find('.js-comment-id').text(com.writerId);
			$(c).find('.js-comment-content').text(com.content);
			$(c).find('.js-comment-date').text(com.writeDate);
			
			$(comments).append(c);
		}
		
		$(card).show();
		
		$('#posts').append(card);
		
		var heart = $(card).find('.js-heart');
		if (article.hasLike) {
			heart.click();
		}
		heart.data('id', article.id);
		
		$(heart).on('click', function() {
			var likeCnt = $(this).closest('.card-body').find('.js-like-count');
			var hasLike = $(this).children('span').hasClass('heart-active');
			console.log(hasLike);
			var data = {
					articleId : $(this).data('id')
			};
			
			if (!hasLike) { // 좋아요 상태
				$.ajax({
					url: "<c:url value = '/article/like'/> ",
					method: 'delete',
					contentType : "application/json",
					data: JSON.stringify(data),
					success: function() {
						likeCnt.text(parseInt(likeCnt.text())-1);
					}
				});
			} else {
				$.ajax({
					url: "<c:url value = '/article/like'/> ",
					method: 'POST',
					contentType : "application/json",
					data: JSON.stringify(data),
					success: function() {
						likeCnt.text(parseInt(likeCnt.text())+1);
					}
				});
			}
			
		});
	}
}
	

	let isAjaxFinished = true;

	getGallery = function getGallery() {
		if ($('.loader').length > 0 && $(window).scrollTop() + $(window).height() >= $('.loader').position().top) {
			if (isAjaxFinished) { // ajax 처리가 끝난 후에 다시 ajax 처리 진행
				isAjaxFinished = false;
				
			console.log('go');
				// 다음 페이지 정보 불러오기
				var cntOfArticle = $('#posts .card').length;
				console.log(cntOfArticle);
				const articleCount = 6;
				var articleIndex = Math.floor(cntOfArticle/articleCount);
				
				var data = {
					articleIndex : articleIndex,
				};
				
				$.ajax({
					type : "GET",
					url : "<c:url value='/article/all' />",
					data : data,
					success : function(result) {
						console.log(result);
						var hasMore = result.hasMore;
						var articles = result.articles;
						
						setArticles(articles);
						
						
						if (hasMore) {
							isAjaxFinished = true;					
						} else {
							$('.loader').remove();
						}
						
						if (result.length == 0) {
							$('.loader').remove();
						}
					}
				});
			}
		}
	}
	$(document).ready(getGallery);
	$(document).on('scroll', getGallery);

	function setTagHref(tags) {
		console.log(tags);
		for (var tag of tags) {
			console.log(tag);
			var text = tag.innerText;
			tag.href = "/spring/tag/" + text.substring(1);
		}
	}

	$('.js-top5-follow-btn').on('click', function() {
		 var btn = this;
		 var seqId = $(this).data('seq-id');
		 var isFollowed = $(this).text() == 'Unfollow';
		 console.log('isFollowed ? ' + isFollowed);
		 
		 if (isFollowed) {
			 $.ajax({
				url: "<c:url value = '/follow'/> ",
				method: 'DELETE',
				contentType : "application/json",
				data: JSON.stringify({followId : seqId}),
				complete : function() {
					$(btn).text('Follow');
				}
			});
		 } else {
			 $.ajax({
				url: "<c:url value = '/follow'/> ",
				method: 'POST',
				contentType : "application/json",
				data: JSON.stringify({followId : seqId}),
				complete : function() {
					$(btn).text('Unfollow');
				}
			});
		 }
	 });	
</script>



</body>
</html>
