<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/jstl.jspf"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">


<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
	crossorigin="anonymous"></script>
<!-- jquery.form.js -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery.form/4.3.0/jquery.form.min.js"
	integrity="sha384-qlmct0AOBiA2VPZkMY3+2WqkHtIQ9lSdAsAn5RUJD/3vA5MKDgSGcdmIv4ycVxyn"
	crossorigin="anonymous"></script>

<!-- css -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
<link rel="stylesheet"
	href="/spring/resources/css/mainpage/main.css?ver=1.0">
<link rel="stylesheet"
	href="/spring/resources/css/profile/profile.css?ver=1.1">
<link rel="stylesheet"
	href="<c:url value = '/resources/css/profile/profile_img_edit.css?ver=1.0' />" />
<link rel="stylesheet"
	href="<c:url value = '/resources/css/article/article.css?ver=2.0' />" />

<style>
.article-modal {
	display: none;
	position: fixed;
	z-index: 10;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.8);
	justify-content: center;
	align-items: center;
}

.article-modal__container {
	display: flex;
	justify-content: center;
}

.article-modal__close {
	border: 0;
	color: white;
	background-color: transparent;
	font-size: 20px;
	width: 34px;
	height: 34px;
	position: absolute;
	top: 10px;
	right: 10px;
	cursor: pointer;
	padding: 5px;
}
</style>
</head>
<body style="overflow-y: scroll;">

	<%@ include file="/WEB-INF/include/nav.jspf"%>

	<main>
		<div class="container">
			<!-- Gallery-->
			<div class="gallery" id="gallery" style="min-height: 400px;"></div>
			<div class="loader"></div>
		</div>
	</main>
	<footer>
		<h1>FOOTER</h1>
	</footer>
	<!-- Article Modal -->
	<button id="articleModalOpen" style="display: none">모달버튼</button>

	<div class="article-modal" id="articleModal">
		<div class="container article-modal__container">
			<div class="col-9">
				<div class="row">
					<div class="col-8" style="padding: 0;">
						<div class="d-flex flex-column mt-4 mb-4">
							<div class="article" id="article"></div>
						</div>
					</div>
					<div class="col-4" style="padding: 0;">
						<div class="d-flex flex-column mt-4 mb-4">
							<div class="card" style="height: 500px;">
								<div class="card-header" style="padding: 12px 16px;">
									<div class="d-flex flex-row align-items-center">
										<div
											class="rounded-circle overflow-hidden d-flex justify-content-center border align-items-center post-profile-photo mr-3"
											style="width: 36px; height: 36px;">
											<img id="articleModalWriterImg"
												src="<c:url value = '/image/profile/${article.imgPath}/'/>"
												alt="..."
												style="transform: scale(1.5); width: 100%; position: absolute; left: 0;">
										</div>
										<span class="font-weight-bold" id="articleModalWriterId"></span>
									</div>
								</div>
								<div class="card-body p-0">
									<div class="pl-3 pr-3 pb-2"
										style="height: 280px; overflow: auto; padding-top: 16px;">
										<p class="d-block mb-1" style="white-space: pre-wrap;" id="articleModalContent"></p>
										<small class="text-muted">4 HOURS AGO</small>
										<div class="comments" style="margin-top: 10px;">

											<div class="comment">
												<div class="comment__profile">
													<img src="<c:url value = '/image/profile/${"imgPath"}/'/>"
														alt="" class="comment__image" />
												</div>
												<div class="comment__text">
													<div class="comment__writer">a.7.m3ff</div>
													<div>❤️💓💓💓💓💓</div>
													<span class="comment__date">2 HOURS AGO</span>
												</div>
											</div>
											<div class="comment">
												<div class="comment__profile">
													<img src="<c:url value = '/image/profile/${"imgPath"}/'/>"
														alt="" class="comment__image" />
												</div>
												<div class="comment__text">
													<div class="comment__writer">adri_rez77</div>
													<div>Hi</div>
													<span class="comment__date">4 HOURS AGO</span>
												</div>
											</div>
											<div class="comment">
												<div class="comment__profile">
													<img src="<c:url value = '/image/profile/${"imgPath"}/'/>"
														alt="" class="comment__image" />
												</div>
												<div class="comment__text">
													<div class="comment__writer">samkolder</div>
													<div>Lorem ipsum dolor sit amet, consectetur
														adipisicing elit. Non aliquid adipisci eveniet praesentium
														culpa officia ullam illum delectus vel totam dolorem illo
														ratione cumque nemo numquam incidunt eos aspernatur
														aliquam.</div>
													<span class="comment__date">1 HOURS AGO</span>
												</div>
											</div>
										</div>
									</div>

									<div
										class="d-flex flex-row justify-content-between pl-3 pr-3 pt-3 pb-1 article__btns">
										<ul class="list-inline d-flex flex-row align-items-center m-0">
											<li class="list-inline-item">
												<button class="btn p-0" id="articleModalLikeBtn">
													<div id="articleModalHeart" class="content">
														<span class="heart"></span>
													</div>
												</button>
											</li>
											<li class="list-inline-item ml-2">
												<button class="btn p-0">
													<svg width="1.6em" height="1.6em" viewBox="0 0 16 16"
														class="bi bi-chat" fill="currentColor"
														xmlns="http://www.w3.org/2000/svg">
                                                     <path
															fill-rule="evenodd"
															d="M2.678 11.894a1 1 0 0 1 .287.801 10.97 10.97 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8.06 8.06 0 0 0 8 14c3.996 0 7-2.807 7-6 0-3.192-3.004-6-7-6S1 4.808 1 8c0 1.468.617 2.83 1.678 3.894zm-.493 3.905a21.682 21.682 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a9.68 9.68 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105z" />
                                                 </svg>
												</button>
											</li>
											<li class="list-inline-item ml-2">
												<button class="btn p-0">
													<svg width="1.6em" height="1.6em" viewBox="0 0 16 16"
														class="bi bi-share" fill="currentColor"
														xmlns="http://www.w3.org/2000/svg">
                                                     <path
															fill-rule="evenodd"
															d="M11.724 3.947l-7 3.5-.448-.894 7-3.5.448.894zm-.448 9l-7-3.5.448-.894 7 3.5-.448.894z" />
                                                     <path
															fill-rule="evenodd"
															d="M13.5 4a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3zm0 1a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5zm0 10a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3zm0 1a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5zm-11-6.5a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3zm0 1a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5z" />
                                                 </svg>
												</button>
											</li>
										</ul>
										<div>
											<button class="btn p-0">
												<svg width="1.6em" height="1.6em" viewBox="0 0 16 16"
													class="bi bi-hdd" fill="currentColor"
													xmlns="http://www.w3.org/2000/svg">
                                                 <path
														fill-rule="evenodd"
														d="M14 9H2a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1v-1a1 1 0 0 0-1-1zM2 8a2 2 0 0 0-2 2v1a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2v-1a2 2 0 0 0-2-2H2z" />
                                                 <path
														d="M5 10.5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0zm-2 0a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0z" />
                                                 <path
														fill-rule="evenodd"
														d="M4.094 4a.5.5 0 0 0-.44.26l-2.47 4.532A1.5 1.5 0 0 0 1 9.51v.99H0v-.99c0-.418.105-.83.305-1.197l2.472-4.531A1.5 1.5 0 0 1 4.094 3h7.812a1.5 1.5 0 0 1 1.317.782l2.472 4.53c.2.368.305.78.305 1.198v.99h-1v-.99a1.5 1.5 0 0 0-.183-.718L12.345 4.26a.5.5 0 0 0-.439-.26H4.094z" />
                                             </svg>
											</button>
										</div>
									</div>
									<div class="article__likes" id="articleModalLikeCnt"
										style="font-weight: bold; padding: 0 16px;">
										<span></span> likes
									</div>
									<div class="position-relative comment-box">
										<form>
											<input class="w-100 border-0 p-3 input-post"
												placeholder="Add a comment...">
											<button class="btn btn-primary position-absolute btn-ig">Post</button>
										</form>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
		<button class="article-modal__close" id="articleModalClose">X</button>
	</div>

	<script>
    $('#articleModalOpen').on('click', function(){
        $('#articleModal').css('display', 'flex');
    });

    $('#articleModalClose').on('click', function() {
        $('#articleModal').hide();
    });
</script>

	<c:if test="${member.signedIn}">
		<form method="POST" action="<c:url value='/image/profile' />"
			enctype="multipart/form-data" id="uploadForm">
			<input type="file" accept="image/jpeg, image/png" name="file"
				class="file-upload" /> <input type="hidden" name="seqId"
				value="${member.seqId}" />
		</form>

		<div class="profile-img-edit" id="profileImgEdit">
			<div class="profile-img-edit__container">
				<header class="profile-img-edit__header"> 프로필 사진 바꾸기 </header>
				<ul class="profile-img-edit__list">
					<li
						class="profile-img-edit__option profile-img-edit__option--upload profile-upload">사진
						업로드</li>
					<li
						class="profile-img-edit__option profile-img-edit__option--delete"
						id="profileImgDelete">현재 사진 삭제</li>
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
	<script src="<c:url value='/resources/js/article/gallery.js'/> "></script>
	<script>
let isAjaxFinished = true;

getGallery = function getGallery() {
	if ($('.loader').length > 0 && $(window).scrollTop() + $(window).height() >= $('.loader').position().top) {
		if (isAjaxFinished) { // ajax 처리가 끝난 후에 다시 ajax 처리 진행
			isAjaxFinished = false;
			
			// 다음 페이지 정보 불러오기
			var cntOfArticle = $('.gallery').children().length;
			const articleCount = 6;
			var articleIndex = Math.floor(cntOfArticle/articleCount);
			
			var data = {
				tagName : "${tag}",
				articleIndex : articleIndex,
			};
			console.log(data);
			
			$.ajax({
				type : "GET",
				url : "<c:url value='/article/' />",
				data : data,
				success : function(result) {
					var hasMore = result.hasMore;
					var articles = result.articles;
					
					for (var article of articles) {
						var galleryItem = addGalleryItem(article);
						$(galleryItem).on('click', function() {
							openArticleModal($(this).data('id'));
						});
					}
					
					if (hasMore) {
						isAjaxFinished = true;					
					} else {
						$('.loader').remove();
					}
				}
			});
		}
	}
}
$(document).ready(getGallery);
$(document).on('scroll', getGallery);

</script>
	<script>
function openArticleModal(id) {
	$.ajax({
		type : "GET",
		url : "<c:url value='/article/' />" + id,
		success : function(article) {
			// 모달 값 세팅하기
			$('#articleModalWriterImg').attr('src', '/spring/image/profile/' + article.imgPath + "/");
			$('#articleModalWriterId').text(article.writerId);
			$('#articleModalContent').html(article.content);
			setTagHref($('#articleModalContent a'));
			$('#articleModalLikeBtn').val(article.id);
			if (article.hasLike) {
				$('#articleModalHeart, #articleModalHeart span').addClass('heart-active');
			} else {
				$('#articleModalHeart, #articleModalHeart span').removeClass('heart-active');
			}
			$('#articleModalLikeCnt span').text(article.likeCount);
			
			// 이미지 값 설정하기
			var files = article.files;
			
			$('.article').html("");
			$('.article').append(createArticleItems());
			
			if (files.length == 0) {
				$('.article__items').append(createArticleItem('100%', "<c:url value = '/resources/image/article/alternative.jpg'/>"));
			} else {
				var len = files.length;
				$('.article__items').css('width', (100 * len) + '%');
				for (var i in files) {
					var el = createArticleItem((100 / len) + '%', "<c:url value = '/image/article/'/>" + files[i].imgPath + "/");
					if (i == 0) {
						$(el).addClass('article__on');
					}
					$('.article__items').append(el);
				}
				var prevBtn = createArticlePrevBtn();
				$(prevBtn).on('click', function() {
					addArticlePrevBtn();
				});
				$('.article').append(prevBtn);
				
				var nextBtn = createArticleNextBtn();
				$(nextBtn).on('click', function() {
					addArticleNextBtn();
				});
				$('.article').append(nextBtn);
			}

			$('#articleModalOpen').click();
		},
		error : function() {
			location.href = "/spring/";
		}
	});
}

$('#articleModalOpen').on('click', function(){
    $('#articleModal').css('display', 'flex');
    $('body').css('overflow-y', 'hidden');
});

$('#articleModalClose').on('click', function() {
    $('#articleModal').hide();
    $('body').css('overflow-y', 'scroll');
});

function createArticleItems() {
	articleItems = document.createElement('div');
	articleItems.classList.add('article__items');
	return articleItems;
}
function createArticleItem(width, src) {
	articleItem = document.createElement('div');
	articleItem.classList.add('article__item');
	articleItem.style.width = width;
	
	articleImage = document.createElement('img');
	articleImage.classList.add('article__image');
	articleImage.src = src;
	articleItem.appendChild(articleImage);
	return articleItem;
}
function createArticlePrevBtn() {
	articleBtn = document.createElement('figure');
	articleBtn.classList.add('article__btn', 'article__btn--prev');
	
	btnImage = document.createElement('img');
	btnImage.classList.add('article__btn-image');
	btnImage.src = '/spring/resources/image/static/prev_btn.png';
	articleBtn.appendChild(btnImage);
	return articleBtn;
}
function createArticleNextBtn() {
	articleBtn = document.createElement('figure');
	articleBtn.classList.add('article__btn', 'article__btn--next');
	
	btnImage = document.createElement('img');
	btnImage.classList.add('article__btn-image');
	btnImage.src = '/spring/resources/image/static/next_btn.png';
	articleBtn.appendChild(btnImage);
	return articleBtn;
}

</script>
	<script>
	$(document).ready(function(){
		$('.content').click(function(){
			$('.content').toggleClass("heart-active")
		  	$('.text').toggleClass("heart-active")
		  	$('.numb').toggleClass("heart-active")
		  	$('.heart').toggleClass("heart-active")
		});
	});

	function getIndexOfSlide(articleItems) {
		var articleItems = articleItems[0];
		var children = articleItems.children;
		
		// article__on 이 붙은 article의 index 찾기
		for (var i = 0; i < children.length; i++) {
			if (children[i].classList.contains("article__on")) {
				return i;
			}
		}
		return -1;
	}
	
	function addArticlePrevBtn() {
		var articleItems = $(".article__items");
		
		var idx = getIndexOfSlide(articleItems);
		articleItems[0].children[idx].classList.remove('article__on');
		
		var slideLen = articleItems[0].children.length;
		idx = (idx - 1) % slideLen;
		if (idx < 0) {
			idx += slideLen;
		}
		articleItems[0].children[idx].classList.add('article__on');
		
		moveSlide(articleItems, idx);
	}
	
	function addArticleNextBtn() {
		var articleItems = $(".article__items");
		
		var idx = getIndexOfSlide(articleItems);
		articleItems[0].children[idx].classList.remove('article__on');
		
		var slideLen = articleItems[0].children.length;
		idx = (idx + 1) % slideLen;
		articleItems[0].children[idx].classList.add('article__on');
		
		moveSlide(articleItems, idx);	
	}
	
	function moveSlide(target, idx) {
		var width = $('.article').width();
	
		target.stop().animate({
			'margin-left': -width * idx
		});
	}
	
	$(window).resize(function() {
		var article = $('.article');
		var articleItemsList = article.children('.article__items');
		var width = article.width();
		if (articleItemsList.length > 1) {
			$.each(articleItemsList, function(i, item) {
				articleItems = $(item);
				var idx = getIndexOfSlide(articleItems);
				articleItems.css({
					'margin-left': -width * idx
				});	
			})
		}
	});
	
	$('.content').on('click', function() {
		var $like = $(this).parents('.article__btns').next('.article__likes');
		var likeCnt = $($like).children('span');
		var hasLike = $(this).hasClass('heart-active');
		
		var data = {
				articleId : $(this).parent().val()
		};
		
		if (hasLike) { // 좋아요 상태
			$.ajax({
				url: "<c:url value = '/article/like'/> ",
				method: 'DELETE',
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
	
	function setTagHref(tags) {
		console.log(tags);
		for (var tag of tags) {
			console.log(tag);
			var text = tag.innerText;
			tag.href = "/spring/tag/" + text.substring(1);
		}
	}

</script>
</body>
</html>