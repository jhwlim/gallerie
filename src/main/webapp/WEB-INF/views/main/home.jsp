<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/jstl.jspf" %>

<html>
<head>



<title>Home</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
        integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<link rel="stylesheet" href="/spring/resources/css/mainpage/main.css?ver=2.0">

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
                                <li>
                                    <div class="story">
                                        <img src="/spring/resources/css/mainpage/images/profile-1.jpg">
                                    </div>
                                    <span class="user">Your Story</span>
                                </li>
                                <li class="has-story">
                                    <div class="story">
                                        <img src="/spring/resources/css/mainpage/images/profile-2.jpg">
                                    </div>
                                    <span class="user">John Doe</span>
                                </li>
                                <li class="has-story">
                                    <div class="story">
                                        <img src="/spring/resources/css/mainpage/images/profile-3.jpg">
                                    </div>
                                    <span class="user">Instagram</span>
                                </li>
                                <li class="has-story">
                                    <div class="story">
                                        <img src="/spring/resources/css/mainpage/images/profile-4.png">
                                    </div>
                                    <span class="user">DC</span>
                                </li>
                                <li class="has-story">
                                    <div class="story">
                                        <img src="/spring/resources/css/mainpage/images/profile-5.jpg">
                                    </div>
                                    <span class="user">Nick</span>
                                </li>
                                <li class="has-story">
                                    <div class="story">
                                        <img src="/spring/resources/css/mainpage/images/profile-6.jpg">
                                    </div>
                                    <span class="user">Anna</span>
                                </li>
                                <li class="has-story">
                                    <div class="story">
                                        <img src="/spring/resources/css/mainpage/images/profile-7.jpg">
                                    </div>
                                    <span class="user">Raissa</span>
                                </li>
                                <li class="has-story">
                                    <div class="story">
                                        <img src="/spring/resources/css/mainpage/images/profile-7.jpg">
                                    </div>
                                    <span class="user">Raissa</span>
                                </li>
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
                                             <span class="text-text" id="writeOpenBtn" style="-webkit-box-orient: vertical; -webkit-line-clamp: 2; display: -webkit-box;">Taewook Kang님, 무슨 생각을 하고 계신가요?</span>
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
                        <div class="d-flex flex-column mt-4 mb-4">

                            <div class="card">
                                <div class="card-header p-3">
                                    <div class="d-flex flex-row align-items-center">
                                        <div
                                            class="rounded-circle overflow-hidden d-flex justify-content-center align-items-center border border-danger post-profile-photo mr-3">
                                            <img src="/spring/resources/css/mainpage/images/profile-1.jpg" alt="..."
                                                style="transform: scale(1.5); width: 100%; position: absolute; left: 0;">
                                        </div>
                                        <span class="font-weight-bold">samkolder</span>
                                    </div>
                                </div>
                                <div class="card-body p-0">
                                    <div class="embed-responsive embed-responsive-1by1">
                                        <img class="embed-responsive-item" src="/spring/resources/css/mainpage/images/post-1.jpg" />
                                    </div>

                                    <div class="d-flex flex-row justify-content-between pl-3 pr-3 pt-3 pb-1">
                                        <ul class="list-inline d-flex flex-row align-items-center m-0">
                                            <li class="list-inline-item">
                                                <button class="btn p-0">
                                                    <div class="content">
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
                                        <strong class="d-block">365.354 likes</strong>
                                        <strong class="d-block">samkolder</strong>
                                        <p class="d-block mb-1">Lil drone shot I got a while back but never posted.</p>
                                        <button class="btn p-0">
                                            <span class="text-muted">View all 2,247 comments</span>
                                        </button>

                                        <div>
                                            <div>
                                                <strong class="d-block">a.7.m3ff</strong>
                                                <span>❤️💓💓💓💓💓</span>
                                            </div>
                                            <div>
                                                <strong class="d-block">adri_rez77</strong>
                                                <span>Hi</span>
                                            </div>
                                        </div>

                                        <small class="text-muted">4 HOURS AGO</small>
                                    </div>

                                    <div class="position-relative comment-box">
                                        <form>
                                            <input class="w-100 border-0 p-3 input-post" placeholder="Add a comment...">
                                            <button class="btn btn-primary position-absolute btn-ig">Post</button>
                                        </form>
                                    </div>


                                </div>
                            </div>

                        </div>
                        <!-- END OF POSTS -->
                    </div>

                    <div class="col-4">
                        <div class="d-flex flex-row align-items-center">
                            <div
                                class="rounded-circle overflow-hidden d-flex justify-content-center align-items-center border sidenav-profile-photo">
                                <img src="/spring/resources/css/mainpage/images/profile-6.jpg" alt="..."
                                    style="transform: scale(1.5); width: 100%; position: absolute; left: 0;">
                            </div>
                            <div class="profile-info ml-3">
                                <span class="profile-info-username">codingvenue</span>
                                <span class="profile-info-name">Coding Venue</span>
                            </div>
                        </div>

                        <div class="mt-4">
                            <div class="d-flex flex-row justify-content-between">
                                <small class="text-muted font-weight-normal">Suggestions For You</small>
                                <small>See All</small>
                            </div>
                            <div>
                                <div class="d-flex flex-row justify-content-between align-items-center mt-3 mb-3">
                                    <div class="d-flex flex-row align-items-center">
                                        <div
                                            class="rounded-circle overflow-hidden d-flex justify-content-center align-items-center border sugest-profile-photo">
                                            <img src="/spring/resources/css/mainpage/images/profile-3.jpg" alt="..."
                                                style="transform: scale(1.5); width: 100%; position: absolute; left: 0;">
                                        </div>
                                        <strong class="ml-3 sugest-username">instagram</strong>
                                    </div>
                                    <button class="btn btn-primary btn-sm p-0 btn-ig ">Follow</button>
                                </div>
                                <div class="d-flex flex-row justify-content-between align-items-center mt-3 mb-3">
                                    <div class="d-flex flex-row align-items-center">
                                        <div
                                            class="rounded-circle overflow-hidden d-flex justify-content-center align-items-center border sugest-profile-photo">
                                            <img src="/spring/resources/css/mainpage/images/profile-4.png" alt="..."
                                                style="transform: scale(1.5); width: 100%; position: absolute; left: 0;">
                                        </div>
                                        <strong class="ml-3 sugest-username">dccomics</strong>
                                    </div>
                                    <button class="btn btn-primary btn-sm p-0 btn-ig ">Follow</button>
                                </div>
                                <div class="d-flex flex-row justify-content-between align-items-center mt-3 mb-3">
                                    <div class="d-flex flex-row align-items-center">
                                        <div
                                            class="rounded-circle overflow-hidden d-flex justify-content-center align-items-center border sugest-profile-photo">
                                            <img src="/spring/resources/css/mainpage/images/profile-5.jpg" alt="..."
                                                style="transform: scale(1.5); width: 100%; position: absolute; left: 0;">
                                        </div>
                                        <strong class="ml-3 sugest-username">thecw</strong>
                                    </div>
                                    <button class="btn btn-primary btn-sm p-0 btn-ig">Follow</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <script>
    $(document).ready(function(){
      $('.content').click(function(){
        $('.content').toggleClass("heart-active")
        $('.text').toggleClass("heart-active")
        $('.numb').toggleClass("heart-active")
        $('.heart').toggleClass("heart-active")
      });
    });
  </script>

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
    <script>
      $(document).ready(function(){
        $('.content').click(function(){
          $('.content').toggleClass("heart-active")
          $('.text').toggleClass("heart-active")
          $('.numb').toggleClass("heart-active")
          $('.heart').toggleClass("heart-active")
        });
      });
    </script>
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
            <textarea name="content" placeholder="Jonghwan Lim님, 무슨 생각을 하고 계신가요?" class="write__textarea" id="writeArea"></textarea>
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

<form action="/spring/logout" method="post">

    <button type="submit">로그아웃</button>
</form>
<form action="/spring/sessiondel" method="post">
    <button type="submit">세션삭제 후 리다이렉트</button>
</form>
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
</body>
</html>
