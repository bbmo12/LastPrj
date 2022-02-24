<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글쓰기</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<style>
#loading {
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	position: fixed;
	display: block;
	opacity: 0.6;
	background: #e4e4e4;
	z-index: 99;
	text-align: center;
}

#loading>img {
	position: absolute;
	top: 50%;
	left: 50%;
	z-index: 100;
}

#loading>p {
	position: absolute;
	top: 57%;
	left: 43%;
	z-index: 101;
}
</style>
<body>
	<div class="container">
		<h2>게시판 내용 확인 및 수정</h2>
		<form id="frm" action="boardUpdate.do" method="post">
			<div class="form-group">
				<label for="b_no"></label> <input type="hidden" class="form-control"
					id="b_no" name="b_no" value="${boards.b_no}">
			</div>
			<div class="form-group">
				<label for="title">제목</label> <input type="text"
					class="form-control" id="title" placeholder="제목 입력(4-100)"
					name="title" maxlength="100" required="required"
					value="${boards.title}">
			</div>
			<div class="form-group">
				<label for="content">내용</label>
				<textarea class="form-control" rows="5" id="content" name="content"
					placeholder="내용 작성">${boards.content}</textarea>
			</div>
			<button type="submit" class="btn btn-default">등록</button>
		</form>
	</div>

	<div id="loading" style="margin-left: 0px;">
		<img src="resources/assets123/images/Spinner-2.gif">
		<p>변환중입니다..잠시기다려주세요.</p>
	</div>
	<script>
		$(document).ready(function() {

			$('#loading').hide();
			$('#frm').submit(function() {
				$('#loading').show();
				return true;
			});
		});
	</script>
</body>
</html>


