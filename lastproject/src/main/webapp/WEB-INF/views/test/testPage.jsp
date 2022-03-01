<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>

<section class="banner-area other-page">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<h1>Test</h1>
					<a href="index.html">Test</a> <span>|</span> <a
						href="blog-details.html">Test</a>
				</div>
			</div>
		</div>
	</section>

<div id="testbtn">
	<button type="button" onclick="clickBtn()">보내기</button>
</div>
<script>
function clickBtn(){
	var n_to = "test1@a.com"
	    var content = "예약이 승인되었습니다.";
	    
	    // 전송한 정보를 db에 저장	
	    $.ajax({
	        type: 'post',
	        url: 'noticeInsert',
	        dataType: 'text',
	        data: {
	            n_to: n_to,
	            content: content
	        },
	        success: function(){    // db전송 성공시 실시간 알림 전송
	            // 소켓에 전달되는 메시지
	            // 위에 기술한 EchoHandler에서 ,(comma)를 이용하여 분리시킨다.
	            socket.send(n_to+","+content);
	        	alert("전송되었습니다.");
	        },
	        error: function(error){
	        	console.log(error);
	        	alert("실패");
	        }
	    });
}
</script>
</body>
</html>