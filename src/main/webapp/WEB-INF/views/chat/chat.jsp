<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<script
  src="https://code.jquery.com/jquery-1.12.4.js"
  integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU="
  crossorigin="anonymous"></script>
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
				}
				else{
					console.log("다른세션에서 날라왔다");
				}
				
				$('#divChatData').append('<span>' + msgData.senderId + '</span>');
				$('#divChatData').append('<div>' + msgData.content + '</div>');
				$('#divChatData').append('<div>' + msgData.sendDate + '</div>');
			}
			// 입장
			else if(msgData.cmd == 'CMD_ENTER') {
				$('#divChatData').append('<div>' + msgData.senderId + "님이 입장하셨습니다." + '</div>');
			}
			// 퇴장
			else if(msgData.cmd == 'CMD_EXIT') {					
				$('#divChatData').append('<div>' + msgData.senderId + '</div>');
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
		
		/*
		private String senderId;
		private String receiverId;
		private String content;
		@DateTimeFormat(pattern = "yyyy-MM-dd")
		private Date sendDate;
		private String result; // 테스트 값
		*/
		_sendMessage: function(bang_id, cmd, msg) {
			var msgData = {
					bang_id : bang_id,
					senderId : "${sessionScope.user}",
					receiverId : "${receiver_id}",
					cmd : cmd,
					content : msg
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
<div style="width: 800px; height: 700px; padding: 10px; border: solid 1px #e1e3e9;">
	<div id="divChatData"></div>
</div>
<div style="width: 100%; height: 10%; padding: 10px;">
	<input type="text" id="message" size="110" onkeypress="if(event.keyCode==13){webSocket.sendChat();}" />
	<input type="button" id="btnSend" value="채팅 전송" onclick="webSocket.sendChat()" />
</div>



</body>
</html>
