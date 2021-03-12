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
	href="<c:url value = '/resources/css/article/article.css?ver=2.2' />" />
<link rel="stylesheet"
	href="<c:url value = '/resources/css/article/article_modal.css?ver=1.0' />" />

</head>
<body style="overflow-y: scroll;">

	<%@ include file="/WEB-INF/include/nav.jspf"%>
	<header>
		<div class="container">
			<div class="profile">
				<div class="profile-image" style="justify-content: flex-end;">
					<figure class="summary__image-area" id="profileImgEditOpen">
						<img src="<c:url value = '/image/profile/tag.png/' />"
							class="summary__image" id="profileImg" />
					</figure>
				</div>
				<div class="profile-user-settings">
					<h1 class="profile-user-name">#${tag}</h1>
				</div>
				<div class="profile-stats">
					<ul>
						<li><span class="profile-stat-count">${totalCount}</span> posts</li>
					</ul>
				</div>
				
			</div>
			<!--            End of Profile Section-->
		</div>
		<!--        End of Container-->
	</header>
	<main>
		<div class="container">
			<!-- Gallery-->
			<div class="gallery" id="gallery" style="min-height: 400px;"></div>
			<div class="loader"></div>
		</div>
	</main>
	
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
										<div class="comments" id="comments" style="margin-top: 10px;"></div>
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
                                        <form name="commentInsertForm" class="commentInsertForm" action="/spring/comment/insert" method="POST">
                                            <input type="hidden" name="id" value="" id="commentInsertFormId"/>
						   					<input type="text" name="content" id="content" class="w-100 border-0 p-3 input-post" placeholder="Add a comment...">
                                            <button name="commentInsertBtn" class="btn btn-primary position-absolute btn-ig">Post</button>
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
			var loginId = "${sessionScope.user}";
			$("#comments").html("");
			
			for(comment of article.comments) {
				$("#comments").append(createCommentItem(comment, comment.writerId == loginId));
			}
			
			$('[name=commentDeleteBtn]').click(function(){
				var id = $(this).data('id') + "";
				var btn = this;
				if(confirm("삭제하시겠습니까?")) {
				    $.ajax({
				        url : '/spring/comment/delete',
				        type : 'post',
				        contentType : "application/json",
				        data : JSON.stringify({id: id}),
				        complete : function(){
				            alert("삭제되었습니다.");
				            $(btn).closest('.listComment').remove();
				        }
				    });
				}
			});
			
			$('#commentInsertFormId').val(article.id);
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
</script>
<script src="<c:url value ='/resources/js/article/get_article_modal.js?ver=1.0' />"></script>
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
		for (var tag of tags) {
			var text = tag.innerText;
			tag.href = "/spring/tag/" + text.substring(1);
		}
	}
	
	
</script>
</body>
</html>