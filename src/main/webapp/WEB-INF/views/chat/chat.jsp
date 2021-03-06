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
					$('#divChatData').append('<div style="text-align:right;">' + msgData.senderId + '</div>');
					$('#divChatData').append('<div style="text-align:right;">' + msgData.content + '</div>');
					$('#divChatData').append('<div style="text-align:right;">' + msgData.sendDate + '</div>');
					
				}
				else{
					console.log("다른세션에서 날라왔다");
					$('#divChatData').append('<div style="text-align:left;">' + msgData.senderId + '</div>');
					$('#divChatData').append('<div style="text-align:left;">' + msgData.content + '</div>');
					$('#divChatData').append('<div style="text-align:left;">' + msgData.sendDate + '</div>');
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
<style>
#message-container {
	/* 채팅창 높이 */
	height: 700px;
	overflow-y: auto;
}

</style>

</head>
<body>
<form>
<button type="button" onclick="location.href='./chat.do?bang_id=2&id=test02'">test02</button>
<button type="button" onclick="location.href='./chat.do?bang_id=2&id=test03'">test03</button>
<button type="button" onclick="location.href='./chat.do?bang_id=2&id=test04'">test04</button>
</form>
<!-- 
	친구목록 리스트 -> foreach 돌린다.

 -->
<ul>
<c:forEach var="friend" items="${friends}">
	<li><a href="<c:url value = '/chat.do/${friend}' />">${friend}</a></li>
</c:forEach>
</ul>
<div id="message-container" style="width: 800px; height: 700px; padding: 10px; border: solid 1px #e1e3e9;">

	<div id="divChatData">
		<c:forEach var="message" items="${messages}">
			<div style="text-align: ${message.senderId eq sessionScope.user ? 'right' : 'left'}">${message.senderId}</div>
			<div style="text-align: ${message.senderId eq sessionScope.user ? 'right' : 'left'}">
				${message.content}
				<strong>${message.read}</strong>
			</div>
			<div style="text-align: ${message.senderId eq sessionScope.user ? 'right' : 'left'}">${message.sendDate}</div>
		</c:forEach>
	</div>
</div>
<div style="width: 100%; height: 10%; padding: 10px;">
	<input type="text" id="message" size="110" onkeypress="if(event.keyCode==13){webSocket.sendChat();}" />
	<input type="button" id="btnSend" value="채팅 전송" onclick="webSocket.sendChat()" />
</div>

<script>
$('#message-container')
	.stop()
    .animate({ scrollTop: $('#message-container')[0].scrollHeight }, 1000);
	
	var chat = io('http://localhost:8080/spring/chat.do/*');


// 메시지 수신시
chat.on('message', function(data) {
    var message = $(`<div class="alert alert-success" role="alert">${data.name} : ${data.msg}</div>`);

    $('#messages')
        .append(message)
        .stop()
        .animate({ scrollTop: $('#messages')[0].scrollHeight }, 1000);
});

</script>


</body>
</html>
