<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/jstl.jspf" %>

<html>
<head>

<title>Article</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
        integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<script src="https://kit.fontawesome.com/d3d6f2df1f.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/spring/resources/css/mainpage/main.css?ver=1.0">
<link rel="stylesheet" href="<c:url value = '/resources/css/article/article.css?ver=1.0' />" />

</head>
<body>

	<%@ include file="/WEB-INF/include/nav.jspf" %>

    <div class="mt-4">
        <div class="container d-flex justify-content-center">
            <div class="col-9">
                <div class="row">
                    <div class="col-8" style="padding: 0;">
                        <div class="d-flex flex-column mt-4 mb-4">
		                    <div class="article">
		                    	<c:choose>
		                    		<c:when test="${fn:length(article.files) eq 0}">
			                    		<div class="article__items" style="width: 100%;">
				                    	    <div class="article__item" style="width: 100%;">
			                                    <img src="<c:url value = '/resources/image/article/alternative.jpg'/>" class="article__image" />
			                                </div>
			                            </div>
		                    		</c:when>
		                    		<c:otherwise>
		                    			<div class="article__items" style="width: calc(100% * ${fn:length(article.files)});">
					                    	<c:forEach var="file" items="${article.files}" varStatus="status">
				                                <div class="article__item ${status.first ? 'article__on' : ''}" style="width: calc(100% / ${fn:length(article.files)})">
				                                    <img src="<c:url value = '/image/article/${file.imgPath}/' />" class="article__image" />
				                                </div>
					                    	</c:forEach>
			                            </div>
				                    	<figure class="article__btn article__btn--prev">
											<img src="<c:url value = '/resources/image/static/prev_btn.png' />" alt="" class="article__btn-image" />
										</figure>
		                               	<figure class="article__btn article__btn--next">
		                               		<img src="<c:url value = '/resources/image/static/next_btn.png' />" alt="" class="article__btn-image" />
		                               	</figure>
		                    		</c:otherwise>
		                    	</c:choose>
		                    </div>
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
                                            <img src="<c:url value = '/image/profile/${article.imgPath}/'/>" alt="..."
                                                style="transform: scale(1.5); width: 100%; position: absolute; left: 0;">
                                        </div>
                                        <span class="font-weight-bold">${article.writerId}</span>
                                    </div>
                                </div>
                                <div class="card-body p-0">
                                    <div class="pl-3 pr-3 pb-2" style="height: 280px; overflow: auto; padding-top: 16px;">
                                            <p class="d-block mb-1" style="white-space: pre-wrap; flex-wrap;">${article.content}</p>
	                                        <small class="text-muted">4 HOURS AGO</small>
    									<div class="comments" style="margin-top: 10px;">
 
                                        	<div class="comment">
    											<div class="comment__profile">
    												<img src="<c:url value = '/image/profile/${"imgPath"}/'/>" alt="" class="comment__image"/>
    											</div>
    											<div class="comment__text">
    												<div class="comment__writer">a.7.m3ff</div>
	    											<div>❤️💓💓💓💓💓</div>
	    											<span class="comment__date">2 HOURS AGO</span>
	    										</div>
    										</div>
                                        	<div class="comment">
    											<div class="comment__profile">
    												<img src="<c:url value = '/image/profile/${"imgPath"}/'/>" alt="" class="comment__image"/>
    											</div>
    											<div class="comment__text">
    												<div class="comment__writer">adri_rez77</div>
	    											<div>Hi</div>
	    											<span class="comment__date">4 HOURS AGO</span>
	    										</div>
    										</div>
                                        	<div class="comment">
    											<div class="comment__profile">
    												<img src="<c:url value = '/image/profile/${"imgPath"}/'/>" alt="" class="comment__image"/>
    											</div>
    											<div class="comment__text">
    												<div class="comment__writer">samkolder</div>
	    											<div>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Non aliquid adipisci eveniet praesentium culpa officia ullam illum delectus vel totam dolorem illo ratione cumque nemo numquam incidunt eos aspernatur aliquam.</div>
    												<span class="comment__date">1 HOURS AGO</span>
    											</div>
    										</div>
                                        </div>
									</div>
									
									<div class="d-flex flex-row justify-content-between pl-3 pr-3 pt-3 pb-1 article__btns">
                                        <ul class="list-inline d-flex flex-row align-items-center m-0">
                                            <li class="list-inline-item">
                                                <button class="btn p-0" value="${article.id}">
                                                    <div class="content ${article.hasLike ? 'heart-active' : ''}">
                                                      <span class="heart ${article.hasLike ? 'heart-active' : ''}"></span>
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
                                    <div class="article__likes" style="font-weight: bold; padding: 0 16px;">
                                    	<span>${article.likeCount}</span> likes
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
                    </div>
                </div>
            </div>
        </div>
    </div>

                                        
    

<footer>
       
    
</footer>
<!-- JS, Popper.js, and jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
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
</script>
<c:if test="${fn:length(article.files) ne 0}">
	<script>
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
	$('.article__btn--prev').on('click', function() {
		var articleItems = $(this).parent().children(".article__items");
		var idx = getIndexOfSlide(articleItems);
		articleItems[0].children[idx].classList.remove('article__on');
		
		var slideLen = articleItems[0].children.length;
		idx = (idx - 1) % slideLen;
		if (idx < 0) {
			idx += slideLen;
		}
		articleItems[0].children[idx].classList.add('article__on');
		
		moveSlide(articleItems, idx);
	});
	
	$('.article__btn--next').on('click', function() {
		var articleItems = $(this).parent().children(".article__items");
		var idx = getIndexOfSlide(articleItems);
		articleItems[0].children[idx].classList.remove('article__on');
		
		var slideLen = articleItems[0].children.length;
		idx = (idx + 1) % slideLen;
		articleItems[0].children[idx].classList.add('article__on');
		
		moveSlide(articleItems, idx);
	});
	
	function moveSlide(target, idx) {
		var width = $('.article').width();
	
		target.stop().animate({
			'margin-left': -width * idx
		});
	}
	
	$(window).resize(function() {
		var article = $('.article');
		var articleItemsList = $('.article__items');
		var width = $('.article').width();
		
		$.each(articleItemsList, function(i, item) {
			articleItems = $(item);
			var idx = getIndexOfSlide(articleItems);
			articleItems.css({
				'margin-left': -width * idx
			});	
		})
		
	});
	
	$('.article__image').on('error', function() {
		this.src = "<c:url value = '/resources/image/article/alternative.jpg'/>";
	});
	</script>
</c:if>
<script>

</script>
</body>
</html>
