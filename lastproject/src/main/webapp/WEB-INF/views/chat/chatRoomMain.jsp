<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript" src="resources/js/sockjs.js"></script>
</head>
<body>
	<section class="banner-area other-page">
		<div class="container">
			<div class="row">
				
			</div>
		</div>
	</section>


	<div class="col-12">
		<div class="col-8" style="float: left; text-align: center;">님과의
			1:1 상담</div>
	</div>

	<!-- 채팅 내용 -->
	<div class="col-12">
		<div class="col-11"
			style="margin: 0 auto; border: 1px solid #01D1FE; height: 400px; border-radius: 10px; overflow: scroll"
			id="chatArea">

			<div id="chatMessageArea" style="margin-top: 10px; margin-left: 10px;">
				<!-- 기존 상담 내역이 있을 경우 뿌려줌 -->
				
			
			</div>

		</div>
	</div>

	<!-- 채팅 입력창 -->
	<div class="col-12" style="margin-top: 20px; margin-bottom: 15px;">
		<div class="col-12" style="float: left">
			<textarea class="form-control"
				style="border: 1px solid #01D1FE; height: 65px; float: left; width: 80%"
				placeholder="Enter ..." id="message">


				</textarea>
			<span
				style="float: right; width: 18%; height: 65px; text-align: center; background-color: #01D1FE; border-radius: 5px;">
				<button type="button"
					style="margin-top: 30px; text-align: center; color: white; font-weight: bold;"
					id="sendBtn">
					<br>전송
				</button>
			</span>
		</div>

	</div>

	<input type="button" id="enterBtn" value="입장" style="display: none">
	<input type="button" id="exitBtn" value="나가기" style="display: none">
	<script type="text/javascript">
		
		//페이지 로딩과 함께 connect 함수 호출
		connect();

		function connect() {
			//websocket을 지정한 url로 연결한다.
			//chathandler로 이동
			sockChat = new SockJS("<c:url value="/chat"/>");
			
			//open socket
			sockChat.onopen = function() {
				console.log('open');
			};
			
			//evt : websocket이 보내준 데이터.
			sockChat.onmessage = function(evt) {
				var data = evt.data;
				console.log(data)
				var obj = JSON.parse(data)
				console.log(obj)
				appendMessage(obj.message_content);
			};
			
			//finalize socket
			sockChat.onclose = function() {
				appendMessage("연결을 끊었습니다.");
				console.log('close');
			};
		}

		//'전송' 버튼 클릭 시 수행되는 메소드.
		function send() {
			var msg = $("#message").val();
			if (msg != "") {
				message = {};
				message.message_content = $("#message").val()
				message.p_id = '${chatroomInfo.p_id}'
				message.m_id = '${chatroomInfo.m_id}'
				message.chat_id = '${chatroomInfo.chat_id}'
				message.msg_sender = '${chatroomInfo.m_id}'
				message.msg_receiver = '${chatroomInfo.p_id}'
			}
			
			//socket으로 메시지 전달.
			sockChat.send(JSON.stringify(message));
			$("#message").val("");
		}

		//메시지 전송 시간
		function getTimeStamp() {
			var d = new Date();
			var s = leadingZeros(d.getFullYear(), 4) + '-'
					+ leadingZeros(d.getMonth() + 1, 2) + '-'
					+ leadingZeros(d.getDate(), 2) + ' ' +

					leadingZeros(d.getHours(), 2) + ':'
					+ leadingZeros(d.getMinutes(), 2) + ':'
					+ leadingZeros(d.getSeconds(), 2);

			return s;
		}

		function leadingZeros(n, digits) {
			var zero = '';
			n = n.toString();

			if (n.length < digits) {
				for (i = 0; i < digits - n.length; i++)
					zero += '0';
			}
			return zero + n;
		}

		//메시지를 화면에 뿌려줌
		function appendMessage(msg) {

			if (msg == '') {
				return false;
			} else {
				var senttime = getTimeStamp();
				$("#chatMessageArea")
						.append(
								"<div class='col-12 row' style = 'height : auto; margin-top : 5px;'><div class='col-2' style = 'float:left; padding-right:0px; padding-left : 0px;'><div style='font-size:9px; clear:both;'>${user_name}</div></div><div class = 'col-10' style = 'overflow : y ; margin-top : 7px; float:right;'><div class = 'col-12' style = ' background-color:#ACF3FF; padding : 10px 5px; float:left; border-radius:10px;'><span style = 'font-size : 12px;'>"
										+ msg
										+ "</span></div><div col-12 style = 'font-size:9px; text-align:right; float:right;'><span style ='float:right; font-size:9px; text-align:right;' >"
										+ senttime + "</span></div></div></div>")

				var chatAreaHeight = $("#chatArea").height();
				var maxScroll = $("#chatMessageArea").height() - chatAreaHeight;
				$("#chatArea").scrollTop(maxScroll);

			}
		}

		//메시지 전송 메소드
		$(document).ready(function() {
			$('#message').keypress(function(event) {
				var keycode = (event.keyCode ? event.keyCode : event.which);
				if (keycode == '13') {
					send();
				}
				event.stopPropagation();
			});

			$('#sendBtn').click(function() {
				send();
			});/* $('#enterBtn').click(function() { connect(); }); $('#exitBtn').click(function() { disconnect(); }); */
		});
	</script>

</body>
</html>