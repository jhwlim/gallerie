<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/jstl.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
<link rel="stylesheet"
	href="/spring/resources/css/mainpage/main.css?ver=1.0">
<link rel="stylesheet"
	href="/spring/resources/css/profile/profile.css?ver=1.1">
<link rel="stylesheet" href="/spring/resources/css/chat/standby.css?ver=1.0">
<script
  src="https://code.jquery.com/jquery-1.12.4.js"
  integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU="
  crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/d3d6f2df1f.js" crossorigin="anonymous"></script>

</head>
<body>

<%@ include file="/WEB-INF/include/nav.jspf"%>

<div class="chat-container">
        <div class="inside-container">
            <div class="main-container">
                <div class="left-container">
                    <div class="left-top-container">
                        <div class="id-container">
                            <div class="id-container-inside"></div>
                            <div class="id-container-a">
                                <div class="id-container-b">
                                    <button class="id-container-btn" type="button">
                                        <div class="id-container-c">
                                            <div class="id-section-a">
                                                <div class="id-section-b">wookang_minnit</div>
                                            </div>
                                            <div class="icon-section">
                                                <span style="display: inline-block; transform: rotate(180deg);">
                                                    <svg aria-label="아래쪽 V자형 아이콘" class="v-icon-span" fill="#262626" height="20" viewBox="0 0 48 48" width="20">
                                                        <path d="M40 33.5c-.4 0-.8-.1-1.1-.4L24 18.1l-14.9 15c-.6.6-1.5.6-2.1 0s-.6-1.5 0-2.1l16-16c.6-.6 1.5-.6 2.1 0l16 16c.6.6.6 1.5 0 2.1-.3.3-.7.4-1.1.4z"></path>
                                                    </svg>
                                                </span>
                                            </div>
                                        </div>
                                    </button>
                                </div>
                            </div>
                            <div class="new-message-container">
                                <button class="new-message-btn" type="button">
                                    <div class="message-icon">
                                        <svg aria-label="새로운 메시지" class="p-icon-span" fill="#262626"
                                            height="24" viewBox="0 0 44 44" width="24">
                                            <path
                                                d="M33.7 44.12H8.5a8.41 8.41 0 01-8.5-8.5v-25.2a8.41 8.41 0 018.5-8.5H23a1.5 1.5 0 010 3H8.5a5.45 5.45 0 00-5.5 5.5v25.2a5.45 5.45 0 005.5 5.5h25.2a5.45 5.45 0 005.5-5.5v-14.5a1.5 1.5 0 013 0v14.5a8.41 8.41 0 01-8.5 8.5z">
                                            </path>
                                            <path
                                                d="M17.5 34.82h-6.7a1.5 1.5 0 01-1.5-1.5v-6.7a1.5 1.5 0 01.44-1.06L34.1 1.26a4.45 4.45 0 016.22 0l2.5 2.5a4.45 4.45 0 010 6.22l-24.3 24.4a1.5 1.5 0 01-1.02.44zm-5.2-3h4.58l23.86-24a1.45 1.45 0 000-2l-2.5-2.5a1.45 1.45 0 00-2 0l-24 23.86z">
                                            </path>
                                            <path
                                                d="M38.2 14.02a1.51 1.51 0 01-1.1-.44l-6.56-6.56a1.5 1.5 0 012.12-2.12l6.6 6.6a1.49 1.49 0 010 2.12 1.51 1.51 0 01-1.06.4z">
                                            </path>
                                        </svg></div>
                                </button></div>
                        </div>
                    </div>
                    <div class="left-bottom-container-a">
                        <div class="left-bottom-container-b">
                            <div class="scroll-friend-list">
                                <div class="friend-list">
                                    <div style="flex-direction: column; padding-bottom: 0px; padding-top: 0px;">
                                        <div class="friend-box">
                                            <a class="friend-link" href="/direct/t/340282366841710300949128145298194403146" tabindex="0">
                                                <div aria-labelledby="f3f5b8b2e7dd90c f38b0de929975b8 fcdb6a166078a" class="friend-label">
                                                    <div class="friend-profile-container">
                                                        <div class="friend-profile-picture">
                                                            <span class="friend-profile-span" role="link" tabindex="-1">
                                                                <img
                                                                    alt="viva949494님의 프로필 사진" class="friend-profile-img"
                                                                    crossorigin="anonymous" data-testid="user-avatar"
                                                                    draggable="false"
                                                                    src="https://scontent-ssn1-1.cdninstagram.com/v/t51.2885-19/s150x150/147208432_175950497277258_6886039917539978012_n.jpg?tp=1&amp;_nc_ht=scontent-ssn1-1.cdninstagram.com&amp;_nc_ohc=IjhP7di22bsAX8RTHhz&amp;oh=3691cca1f7e94f8232bf710a7291e2fe&amp;oe=606CB1C9"></span>
                                                        </div>
                                                    </div>
                                                    <div class="friend-text-box">
                                                        <div class="friend-text-id-box" id="f3f5b8b2e7dd90c">
                                                            <div class="friend-text-id">
                                                                <div class="friend-id-long">
                                                                    <div class="friend-id-short">
                                                                        <div class="friend-text-id">viva949494</div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="friend-activity-hr" id="f38b0de929975b8">
                                                            <div class="friend-activity-box">
                                                                <div class="friend-act-long">
                                                                    <span class="friend-act-short">
                                                                        <span class="friend-act-time">최근
                                                                            활동: 1시간 전</span></span></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </a></div>
                                        <div class="next-friend-box"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="right-container">
                    <div class="right-inside-container">
                        
                        <img src="/spring/resources/css/chat/images/dm.png" alt="">
                        <div
                            class="my-message-box">
                            <div class="my-message-text">내 메시지</div>
                        </div>
                        <div class="message-paragraph-box">
                            <div class="message-paragraph-text">친구나 그룹에 비공개 사진과 메시지를 보내보세요.</div>
                        </div>
                        <div
                            class="send-message-btn-container">
                            <div
                                class="send-message-btn-box">
                                <button class="send-message-btn" type="button">메시지 보내기</button></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>