<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
</head>
<body>
	<section class="banner-area other-page">
		<div class="container">
			<div class="row"></div>
		</div>
	</section>
	<section class="blog_area">

		<div class="container">
			<div>
				<h2>1:1 채팅 상담</h2>
			</div>

			<div class="row">
				<!-- chatHistory -->
				<div id="content">
					<c:forEach var="chatRoom" items="${chatHistory }">
						<p>
							<span id="chatUser">${chatroom.user }</span><br> <span
								id="chatContent">${chatroom.content }</span><br> <span
								id="chatSendTime">${chatroom.sendTime }</span>
						</p>
					</c:forEach>
				</div>

				<!-- 메시지 입력창 & 전송 -->
				<div class="row_3">
					<div>
						<input type="text" placeholder="메시지를 입력하세요..."
							class="form-control" />
						<div>
							<span><button id="send" class="btn btn-primary"
									onclick="send()">전송</button></span> <span><input type="hidden"
								value="${chatRoomInfo.sender_id }" id="sender_id" /> <input
								type="hidden" value="${chatRoomInfo.c_no }" id="c_no" /> <input
								type="hidden" value="${chatRoomInfo.receiver_id }"
								id="receiver_id"></span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- STOMP & SockJS import -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.2/sockjs.js"></script>

	<script>
	var stompClient = null;
	var receiver_id = $('#receiver_id').val();
	var sender_id = $('#sender_id').val();
	var c_no = $('#c_no').val();
	
	<!-- invoke when DOM(Documents Object Model; HTML(<head>, <body>...etc) is ready -->
	$(document).ready(connect());
	$(document).ready(ajaxChatRead());
	
	function connect() {
		<!-- map URL using SockJS-->
		console.log("connected");
		var socket = new SockJS('/broadcast');
		var url = '/user/' + c_no + '/queue/messages';
		
		<!-- webSocket 대신 SockJS을 사용하므로 Stomp.client()가 아닌 Stomp.over()를 사용함-->
		stompClient = Stomp.over(socket);
		
		console.log("connect ajaxRead");
		
		<!-- connect(header, connectCallback(==연결에 성공하면 실행되는 메서드))-->
		stompClient.connect({}, function() {
			
			console.log("connected STOMP");
			<!-- url: 채팅방 참여자들에게 공유되는 경로-->
			<!-- callback(function()): 클라이언트가 서버(Controller broker로부터)로부터 메시지를 수신했을 때 실행 -->
			stompClient.subscribe(url, function(output) {
				<!-- JSP <body>에 append할 메시지 contents-->
				showBroadcastMessage(createTextNode(JSON.parse(output.body)));
			});
			}, 
				<!-- connect() 에러 발생 시 실행-->
					function (err) {
						alert('error' + err);
		});
	};
	
	<!-- WebSocket broker 경로로 JSON형태 String 타입 메시지 데이터를 전송함 -->
	function sendBroadcast(json) {
		
		stompClient.send("/app/broadcast", {}, JSON.stringify(json));
	}
	
	<!-- 보내기 버튼 클릭시 실행되는 메서드-->
	function send() {
		var content = $('#message').val();
		sendBroadcast({
			'c_no': c_no,
			'receiver_id': receiver_id,
			'sender_id' : sender_id,
			'content': content
			});
		$('#message').val("");
	}
	
	<!-- 메시지 입력 창에서 Enter키로 보내기 -->
	var inputMessage = document.getElementById('message'); 
	inputMessage.addEventListener('keyup', function enterSend(event) {
		
		if (event.keyCode === null) {
			event.preventDefault();
		}
		
		if (event.keyCode === 13) {
			send();
		}
	});
	
	<!-- 입력한 메시지를 HTML 형태로 가공 -->
	function createTextNode(messageObj) {
		console.log("createTextNode");
		console.log("messageObj: " + messageObj.content);
        return '<p><div class="row alert alert-info"><div class="col_8">' +
        messageObj.user +
        '</div><div class="col_4 text-right">' +
        messageObj.content+
        '</div><div>[' +
        messageObj.sendTime +
        ']</div></p>';
    }
	
	<!-- HTML 형태의 메시지를 화면에 출력해줌 -->
	<!-- 해당되는 id 태그의 모든 하위 내용들을 message가 추가된 내용으로 갱신해줌 -->
	function showBroadcastMessage(message) {
        $("#content").html($("#content").html() + message);
    }
	
	<!-- 읽음처리 -->
	function ajaxChatRead() {
		console.log("hi");
		
		$.ajax({
			url:'/chatread/product/ajax',
			type: 'POST',
			data: JSON.stringify({
				c_no: c_no,
				sender_id : sender_id
			}),
			dataType: 'json',
			contentType: 'application/json'
		})
	}
		
	</script>
</body>
</html>