<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "java.util.Date" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%
	Date time = new Date();
	SimpleDateFormat formatter =
			new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="/spring/resources/css/chat/chat.css?ver=1.0">
<script
  src="https://code.jquery.com/jquery-1.12.4.js"
  integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU="
  crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/d3d6f2df1f.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="<c:url value="/resources/js/sockjs.js"/>"></script>

<script type="text/javascript">
var webSocket = {
		init: function(param) {
			this._url = param.url;
			this._initSocket();
		},
		sendChat: function() {
			this._sendMessage('${param.bang_id}', 'CMD_MSG_SEND', $('#message').val());
			$('#message').val('');
		},
		sendEnter: function() {
			this._sendMessage('${param.bang_id}', 'CMD_ENTER', $('#message').val());
			$('#message').val('');
		},
		receiveMessage: function(msgData) {

			// 정의된 CMD 코드에 따라서 분기 처리
			if(msgData.cmd == 'CMD_MSG_SEND') {	
				
				var flag = "${sessionScope.user}" === msgData.senderId;
				if(flag){
					console.log("아이디가 보냈다");
					
					$('#divChatData').append('<div class="message-column-box" role="listbox" tabindex="0"> <div class="message-column-in" style="-webkit-align-self: flex-end; -ms-flex-item-align: end; align-self: flex-end;"> <div class="message-column-position" role="listbox" tabindex="0"> <div class="message-column-margin"> <div class="message-column-message"> <div role="button" class="message-column-btn" tabindex="-1"> <div class="message-column-option" style="text-align:right;"> <div class="message-column-indiv"> <span style="text-align:right;">'+ msgData.content +'</span></div></div></div></div></div></div></div></div>');
					
					
				}
				else{
					console.log("다른세션에서 날라왔다");
					$('#divChatData').append('<div class="message-column-box" role="listbox" tabindex="0"> <div class="message-column-in" style="-webkit-align-self: flex-start; -ms-flex-item-align: start; align-self: flex-start;"> <div class="message-column-position" role="listbox" tabindex="0"> <div class="message-column-margin"> <div class="message-column-message"> <div role="button" class="message-column-btn" tabindex="-1"> <div class="message-column-option" style="text-align:left;"> <div class="message-column-indiv"> <span style="text-align:left;">'+ msgData.content +'</span></div></div></div></div></div></div></div></div>');
				}
				
				
			}
			// 입장
			else if(msgData.cmd == 'CMD_ENTER') {
				console.log(msgData.senderId, " : 입장");
				// $('#divChatData').append('<div>' + msgData.senderId + "님이 입장하셨습니다." + '</div>');
			}
			// 퇴장
			else if(msgData.cmd == 'CMD_EXIT') {
				console.log(msgData.senderId, " : 퇴장");
				// $('#divChatData').append('<div>' + msgData.senderId + "님이 퇴장하셨습니다." + '</div>');
			}
		},
		closeMessage: function(str) {
			$('#divChatData').append('<div>' + '연결 끊김 : ' + str + '</div>');
		},
		disconnect: function() {
			this._socket.close();
		},
		_initSocket: function() {
			this._socket = new SockJS(this._url);
			this._socket.onopen = function(evt) {
				webSocket.sendEnter();
			};
			this._socket.onmessage = function(evt) {
				webSocket.receiveMessage(JSON.parse(evt.data));
			};
			this._socket.onclose = function(evt) {
				webSocket.closeMessage(JSON.parse(evt.data));
			}
		},
		
		_sendMessage: function(bang_id, cmd, msg) {
			var msgData = {
					bang_id : bang_id,
					senderId : "${sessionScope.user}",
					receiverId : "${oldChat.receiver_id}",
					cmd : cmd,
					content : msg,
					roomId : ${roomId}
			};
			var jsonData = JSON.stringify(msgData);
			this._socket.send(jsonData);
		}
	};
</script>	
<script type="text/javascript">
	$(window).on('load', function () {
		webSocket.init({ url: '<c:url value="/chat" />' });	
	});
</script>


</head>
<body>
    <div>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container justify-content-center">
                <div class="d-flex flex-row justify-content-between align-items-center col-9">
                    <a class="navbar-brand" href="#">
                        <img src="assets/images/ig-logo.png" alt="" loading="lazy">
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
                                    <svg width="1.5em" height="1.5em" viewBox="0 0 16 16" class="bi bi-heart" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                        <path fill-rule="evenodd"
                                            d="M8 2.748l-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z" />
                                    </svg>
                                </a>
                            </li>
                            <li class="list-inline-item ml-2 align-middle">
                                <a href="#" class="link-menu">
                                    <div class="rounded-circle overflow-hidden d-flex justify-content-center align-items-center border topbar-profile-photo">
                                        <img src="assets/images/profiles/profile-6.jpg" alt="..."
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
                                                <div class="id-section-b">${sessionScope.user}</div>
                                            </div>
                                            <div class="icon-section">
                                                <span style="display: inline-block; transform: rotate(180deg);">
                                                    <svg aria-label="아래쪽 V자형 아이콘" class="v-icon-span" fill="#262626"
                                                        height="20" viewBox="0 0 48 48" width="20">
                                                        <path
                                                            d="M40 33.5c-.4 0-.8-.1-1.1-.4L24 18.1l-14.9 15c-.6.6-1.5.6-2.1 0s-.6-1.5 0-2.1l16-16c.6-.6 1.5-.6 2.1 0l16 16c.6.6.6 1.5 0 2.1-.3.3-.7.4-1.1.4z">
                                                        </path>
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
                                        <svg aria-label="새로운 메시지" class="p-icon-span" fill="#262626" height="24"
                                            viewBox="0 0 44 44" width="24">
                                            <path
                                                d="M33.7 44.12H8.5a8.41 8.41 0 01-8.5-8.5v-25.2a8.41 8.41 0 018.5-8.5H23a1.5 1.5 0 010 3H8.5a5.45 5.45 0 00-5.5 5.5v25.2a5.45 5.45 0 005.5 5.5h25.2a5.45 5.45 0 005.5-5.5v-14.5a1.5 1.5 0 013 0v14.5a8.41 8.41 0 01-8.5 8.5z">
                                            </path>
                                            <path
                                                d="M17.5 34.82h-6.7a1.5 1.5 0 01-1.5-1.5v-6.7a1.5 1.5 0 01.44-1.06L34.1 1.26a4.45 4.45 0 016.22 0l2.5 2.5a4.45 4.45 0 010 6.22l-24.3 24.4a1.5 1.5 0 01-1.02.44zm-5.2-3h4.58l23.86-24a1.45 1.45 0 000-2l-2.5-2.5a1.45 1.45 0 00-2 0l-24 23.86z">
                                            </path>
                                            <path
                                                d="M38.2 14.02a1.51 1.51 0 01-1.1-.44l-6.56-6.56a1.5 1.5 0 012.12-2.12l6.6 6.6a1.49 1.49 0 010 2.12 1.51 1.51 0 01-1.06.4z">
                                            </path>
                                        </svg>
                                    </div>
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="left-bottom-container-a">
                        <div class="left-bottom-container-b">
                            <div class="scroll-friend-list">
                                <div class="friend-list">
                                    <div style="flex-direction: column; padding-bottom: 0px; padding-top: 0px;">
                                        <div class="friend-box">
                                            <a class="friend-link"
                                                href="./test03" tabindex="0">
                                                <div aria-labelledby="f3f5b8b2e7dd90c f38b0de929975b8 fcdb6a166078a"
                                                    class="friend-label">
                                                    <div class="friend-profile-container">
                                                        <div class="friend-profile-picture">
                                                            <span class="friend-profile-span" role="link" tabindex="-1">
                                                                <img alt="test03님의 프로필 사진"
                                                                    class="friend-profile-img" crossorigin="anonymous"
                                                                    data-testid="user-avatar" draggable="false"
                                                                    src="https://scontent-ssn1-1.cdninstagram.com/v/t51.2885-19/s150x150/147208432_175950497277258_6886039917539978012_n.jpg?tp=1&amp;_nc_ht=scontent-ssn1-1.cdninstagram.com&amp;_nc_ohc=IjhP7di22bsAX8RTHhz&amp;oh=3691cca1f7e94f8232bf710a7291e2fe&amp;oe=606CB1C9"></span>
                                                        </div>
                                                    </div>
                                                    <div class="friend-text-box">
                                                        <div class="friend-text-id-box" id="f3f5b8b2e7dd90c">
                                                            <div class="friend-text-id">
                                                                <div class="friend-id-long">
                                                                    <div class="friend-id-short">
                                                                        <div class="friend-text-id">${receiverId }</div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="friend-activity-hr" id="f38b0de929975b8">
                                                            <div class="friend-activity-box">
                                                                <div class="friend-act-long">
                                                                    <span class="friend-act-short">
                                                                        <span class="friend-act-time">최근 활동: <%= formatter.format(time) %></span>
                                                                     </span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </a>
                                            <a class="friend-link"
                                                href="./test04" tabindex="0">
                                                <div aria-labelledby="f3f5b8b2e7dd90c f38b0de929975b8 fcdb6a166078a"
                                                    class="friend-label">
                                                    <div class="friend-profile-container">
                                                        <div class="friend-profile-picture">
                                                            <span class="friend-profile-span" role="link" tabindex="-1">
                                                                <img alt="test04님의 프로필 사진"
                                                                    class="friend-profile-img" crossorigin="anonymous"
                                                                    data-testid="user-avatar" draggable="false"
                                                                    src="https://scontent-ssn1-1.cdninstagram.com/v/t51.2885-19/s150x150/147208432_175950497277258_6886039917539978012_n.jpg?tp=1&amp;_nc_ht=scontent-ssn1-1.cdninstagram.com&amp;_nc_ohc=IjhP7di22bsAX8RTHhz&amp;oh=3691cca1f7e94f8232bf710a7291e2fe&amp;oe=606CB1C9"></span>
                                                        </div>
                                                    </div>
                                                    <div class="friend-text-box">
                                                        <div class="friend-text-id-box" id="f3f5b8b2e7dd90c">
                                                            <div class="friend-text-id">
                                                                <div class="friend-id-long">
                                                                    <div class="friend-id-short">
                                                                        <div class="friend-text-id">test04</div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="friend-activity-hr" id="f38b0de929975b8">
                                                            <div class="friend-activity-box">
                                                                <div class="friend-act-long">
                                                                    <span class="friend-act-short">
                                                                        <span class="friend-act-time">최근 활동: 7시간 전</span></span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                        <div class="next-friend-box"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
             
                <div class="right-container">
                        <div class="right-top-container">
                            <div class="right-top-box-a">
                                <div class="right-top-box-b">
                                    <div class="profile-top-side"></div>
                                    <div class="profile-top-a">
                                        <div class="profile-img-box">
                                            <div
                                                class="profile-img-box-b">
                                                <button class="profile-img-btn-b" type="button">
                                                    <div class="profile-img-btn-c">
                                                        <span class="profile-img-c" role="link" tabindex="-1">
                                                            <img alt="viva949494님의 프로필 사진" class="friend-profile-img-c" crossorigin="anonymous" data-testid="user-avatar" draggable="false" src="https://scontent-ssn1-1.cdninstagram.com/v/t51.2885-19/s150x150/147208432_175950497277258_6886039917539978012_n.jpg?tp=1&amp;_nc_ht=scontent-ssn1-1.cdninstagram.com&amp;_nc_ohc=Jkng2sE5gsIAX-SEpeF&amp;oh=430a8bb066db1313dad0f2ebc95b05e3&amp;oe=606CB1C9"></span>
                                                    </div>
                                                </button>
                                            </div>
                                            <div class="right-profile-container">
                                                <button class="right-profile-btn" type="button">
                                                    <div class="right-profile-id-box">
                                                        <div class="right-profile-id">
                                                            <div class="right-profile-id-b">${receiverId }</div>
                                                        </div>
                                                        <div class="right-profile-id-hr">
                                                            <div class="right-profile-time">최근 활동: 어제</div>
                                                        </div>
                                                    </div>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="right-info-container">
                                        <button class="right-info-btn" type="button">
                                            <div class="right-info-link">
                                                <svg aria-label="대화 상세 정보 보기" class="right-info-label" fill="#262626" height="24" viewBox="0 0 48 48" width="24">
                                                    <path
                                                        d="M24 48C10.8 48 0 37.2 0 24S10.8 0 24 0s24 10.8 24 24-10.8 24-24 24zm0-45C12.4 3 3 12.4 3 24s9.4 21 21 21 21-9.4 21-21S35.6 3 24 3z">
                                                    </path>
                                                    <circle clip-rule="evenodd" cx="24" cy="14.8" fill-rule="evenodd"
                                                        r="2.6"></circle>
                                                    <path
                                                        d="M27.1 35.7h-6.2c-.8 0-1.5-.7-1.5-1.5s.7-1.5 1.5-1.5h6.2c.8 0 1.5.7 1.5 1.5s-.7 1.5-1.5 1.5z">
                                                    </path>
                                                    <path
                                                        d="M24 35.7c-.8 0-1.5-.7-1.5-1.5V23.5h-1.6c-.8 0-1.5-.7-1.5-1.5s.7-1.5 1.5-1.5H24c.8 0 1.5.7 1.5 1.5v12.2c0 .8-.7 1.5-1.5 1.5z">
                                                    </path>
                                                </svg>
                                            </div>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="chat-panel-container">
                            <div class="chat-panel-top">
                                <div class="chat-panel-inside-a">
                                    <div class="chat-panel-inside-b">
                                        <div class="chat-panel-option">
                                            <div class="message-column-container" id="divChatData">
                                           		<c:forEach var="message" items="${messages}">
													
													<div class="message-column-box" role="listbox" tabindex="0"> <div class="message-column-in" style="-webkit-align-self: ${message.senderId eq sessionScope.user ? 'flex-end' : 'flex-start'}; -ms-flex-item-align: ${message.senderId eq sessionScope.user ? 'end' : 'start'}; align-self: ${message.senderId eq sessionScope.user ? 'flex-end' : 'flex-start'};"> <div class="message-column-position" role="listbox" tabindex="0"> <div class="message-column-margin"> <div class="message-column-message"> <div role="button" class="message-column-btn" tabindex="-1"> <div class="message-column-option" style="text-align:${message.senderId eq sessionScope.user ? 'right' : 'left'};"> <div class="message-column-indiv"> <span style="text-align:${message.senderId eq sessionScope.user ? 'right' : 'left'};">${message.content}</span></div></div></div></div></div></div></div></div>
																										
												</c:forEach>
                                         
		                                    </div>
		                                </div>
								    </div>		            
                                            
                                <div class="message-input-container-a">
                                    <div class="message-input-container-b">
                                        <div class="message-input-box">
                                            <div>
                                                <button class="special-input-btn" type="button">
                                                    <div class="special-input-emoji">
                                                        <svg aria-label="이모티콘" class="emoji-size" fill="#262626" height="24" viewBox="0 0 48 48" width="24">
                                                            <path
                                                                d="M24 48C10.8 48 0 37.2 0 24S10.8 0 24 0s24 10.8 24 24-10.8 24-24 24zm0-45C12.4 3 3 12.4 3 24s9.4 21 21 21 21-9.4 21-21S35.6 3 24 3z">
                                                            </path>
                                                            <path
                                                                d="M34.9 24c0-1.4-1.1-2.5-2.5-2.5s-2.5 1.1-2.5 2.5 1.1 2.5 2.5 2.5 2.5-1.1 2.5-2.5zm-21.8 0c0-1.4 1.1-2.5 2.5-2.5s2.5 1.1 2.5 2.5-1.1 2.5-2.5 2.5-2.5-1.1-2.5-2.5zM24 37.3c-5.2 0-8-3.5-8.2-3.7-.5-.6-.4-1.6.2-2.1.6-.5 1.6-.4 2.1.2.1.1 2.1 2.5 5.8 2.5 3.7 0 5.8-2.5 5.8-2.5.5-.6 1.5-.7 2.1-.2.6.5.7 1.5.2 2.1 0 .2-2.8 3.7-8 3.7z">
                                                            </path>
                                                        </svg>
                                                    </div>
                                                </button>
                                            </div>
                                            <div class="input-message">
                                            	<input type="text" id="message" onkeypress="if(event.keyCode==13){webSocket.sendChat();}" placeholder="메시지 입력..." />
                                                
                                            </div>
                                            <button class="special-input-btn" type="button">
                                                <div class="special-input-emoji">
                                                    <svg aria-label="사진 또는 동영상 추가" class="emoji-size" fill="#262626" height="24" viewBox="0 0 48 48" width="24">
                                                        <path
                                                            d="M38.5 0h-29C4.3 0 0 4.3 0 9.5v29C0 43.7 4.3 48 9.5 48h29c5.2 0 9.5-4.3 9.5-9.5v-29C48 4.3 43.7 0 38.5 0zM45 38.5c0 3.6-2.9 6.5-6.5 6.5h-29c-3.3 0-6-2.5-6.4-5.6l8.3-8.3c.1-.1.3-.2.4-.2.1 0 .2 0 .4.2l6.3 6.3c1.4 1.4 3.6 1.4 5 0L35.9 25c.2-.2.6-.2.8 0l8.3 8.3v5.2zm0-9.4l-6.2-6.2c-1.3-1.3-3.7-1.3-5 0L21.3 35.3c-.1.1-.3.2-.4.2-.1 0-.2 0-.4-.2L14.2 29c-1.3-1.3-3.7-1.3-5 0L3 35.2V9.5C3 5.9 5.9 3 9.5 3h29C42.1 3 45 5.9 45 9.5v19.6zM11.8 8.2c-1.9 0-3.5 1.6-3.5 3.5s1.6 3.5 3.5 3.5 3.5-1.6 3.5-3.5-1.6-3.5-3.5-3.5z">
                                                        </path>
                                                    </svg>
                                                </div>
                                            </button>
                                            <form enctype="multipart/form-data" method="POST" role="presentation">
                                                <input accept="image/jpeg,image/png" class="special-input-img" type="file"></form>
                                            <button class= "special-input-btn" type="button">
                                                <div class="special-input-emoji"><svg aria-label="좋아요" class="emoji-size" fill="#262626" height="24" viewBox="0 0 48 48" width="24">
                                                        <path
                                                            d="M34.6 6.1c5.7 0 10.4 5.2 10.4 11.5 0 6.8-5.9 11-11.5 16S25 41.3 24 41.9c-1.1-.7-4.7-4-9.5-8.3-5.7-5-11.5-9.2-11.5-16C3 11.3 7.7 6.1 13.4 6.1c4.2 0 6.5 2 8.1 4.3 1.9 2.6 2.2 3.9 2.5 3.9.3 0 .6-1.3 2.5-3.9 1.6-2.3 3.9-4.3 8.1-4.3m0-3c-4.5 0-7.9 1.8-10.6 5.6-2.7-3.7-6.1-5.5-10.6-5.5C6 3.1 0 9.6 0 17.6c0 7.3 5.4 12 10.6 16.5.6.5 1.3 1.1 1.9 1.7l2.3 2c4.4 3.9 6.6 5.9 7.6 6.5.5.3 1.1.5 1.6.5.6 0 1.1-.2 1.6-.5 1-.6 2.8-2.2 7.8-6.8l2-1.8c.7-.6 1.3-1.2 2-1.7C42.7 29.6 48 25 48 17.6c0-8-6-14.5-13.4-14.5z">
                                                        </path>
                                                    </svg>
                                                </div>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
      </div>
</div>

</body>
</html>
