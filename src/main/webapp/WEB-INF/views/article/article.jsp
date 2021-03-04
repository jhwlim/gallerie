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

<div>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container justify-content-center">
            <div class="d-flex flex-row justify-content-between align-items-center col-9">
                <a class="navbar-brand" href="#">
                    <img src="/spring/resources/css/mainpage/images/ig-logo.png" alt="" loading="lazy">
                </a>
                <div>
                    <form class="form-inline my-2 my-lg-0">
                        <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                    </form>
                </div>
                <div class="d-flex flex-row">
                    <ul class="list-inline m-0">
                        <li class="list-inline-item">
                            <a href="#" class="link-menu">
                                <svg width="1.5em" height="1.5em" viewBox="0 0 16 16" class="bi bi-house-door-fill"
                                    fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path
                                        d="M6.5 10.995V14.5a.5.5 0 0 1-.5.5H2a.5.5 0 0 1-.5-.5v-7a.5.5 0 0 1 .146-.354l6-6a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 .146.354v7a.5.5 0 0 1-.5.5h-4a.5.5 0 0 1-.5-.5V11c0-.25-.25-.5-.5-.5H7c-.25 0-.5.25-.5.495z" />
                                    <path fill-rule="evenodd"
                                        d="M13 2.5V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z" />
                                </svg>
                            </a>
                        </li>
                        <li class="list-inline-item ml-2">
                            <a href="#" class="link-menu">
                                <svg width="1.5em" height="1.5em" viewBox="0 0 16 16" class="bi bi-inboxes"
                                    fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd"
                                        d="M.125 11.17A.5.5 0 0 1 .5 11H6a.5.5 0 0 1 .5.5 1.5 1.5 0 0 0 3 0 .5.5 0 0 1 .5-.5h5.5a.5.5 0 0 1 .496.562l-.39 3.124A1.5 1.5 0 0 1 14.117 16H1.883a1.5 1.5 0 0 1-1.489-1.314l-.39-3.124a.5.5 0 0 1 .121-.393zm.941.83l.32 2.562a.5.5 0 0 0 .497.438h12.234a.5.5 0 0 0 .496-.438l.32-2.562H10.45a2.5 2.5 0 0 1-4.9 0H1.066zM3.81.563A1.5 1.5 0 0 1 4.98 0h6.04a1.5 1.5 0 0 1 1.17.563l3.7 4.625a.5.5 0 0 1-.78.624l-3.7-4.624A.5.5 0 0 0 11.02 1H4.98a.5.5 0 0 0-.39.188L.89 5.812a.5.5 0 1 1-.78-.624L3.81.563z" />
                                    <path fill-rule="evenodd"
                                        d="M.125 5.17A.5.5 0 0 1 .5 5H6a.5.5 0 0 1 .5.5 1.5 1.5 0 0 0 3 0A.5.5 0 0 1 10 5h5.5a.5.5 0 0 1 .496.562l-.39 3.124A1.5 1.5 0 0 1 14.117 10H1.883A1.5 1.5 0 0 1 .394 8.686l-.39-3.124a.5.5 0 0 1 .121-.393zm.941.83l.32 2.562A.5.5 0 0 0 1.884 9h12.234a.5.5 0 0 0 .496-.438L14.933 6H10.45a2.5 2.5 0 0 1-4.9 0H1.066z" />
                                </svg>
                            </a>
                        </li>
                        <li class="list-inline-item ml-2">
                            <a href="#" class="link-menu">
                                <svg width="1.5em" height="1.5em" viewBox="0 0 16 16" class="bi bi-compass"
                                    fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd"
                                        d="M8 15.016a6.5 6.5 0 1 0 0-13 6.5 6.5 0 0 0 0 13zm0 1a7.5 7.5 0 1 0 0-15 7.5 7.5 0 0 0 0 15z" />
                                    <path
                                        d="M6 1a1 1 0 0 1 1-1h2a1 1 0 0 1 0 2H7a1 1 0 0 1-1-1zm.94 6.44l4.95-2.83-2.83 4.95-4.95 2.83 2.83-4.95z" />
                                </svg>
                            </a>
                        </li>
                        <li class="list-inline-item ml-2">
                            <a href="#" class="link-menu">
                                <svg width="1.5em" height="1.5em" viewBox="0 0 16 16" class="bi bi-heart"
                                    fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd"
                                        d="M8 2.748l-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z" />
                                </svg>
                            </a>
                        </li>
                        <li class="list-inline-item ml-2 align-middle">
                            <a href="#" class="link-menu">
                                <div class="rounded-circle overflow-hidden d-flex justify-content-center align-items-center border topbar-profile-photo">
                                    <img src="/spring/resources/css/mainpage/images/profile-6.jpg" alt="..."
                                        style="transform: scale(1.5); width: 100%; position: absolute; left: 0;">
                                </div>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>
</div>

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
                                            <p class="d-block mb-1">${article.content}</p>
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
		// moveNextSlide(this.parentElement);
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
		// moveNextSlide(this.parentElement);
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
