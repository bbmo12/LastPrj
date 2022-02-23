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
<body>
	<div class="container">
		<h2>게시판 수정</h2>
		<form action="boardUpdate.do" method="post">
			<div class="form-group">
				<label for="title">제목</label> 
				<input type="text" class="form-control" id="title" placeholder="제목 입력(4-100)"
					name="title" maxlength="100" required="required" pattern=".{4,100}" value="${boards.title}">
			</div>
			<div class="form-group">
				<label for="content">내용</label>
				<textarea class="form-control" rows="5" id="content" name="content"
					placeholder="내용 작성" value="${boards.content}"></textarea>
			</div>
			<button type="submit" class="btn btn-default">등록</button>
		</form>
	</div>
</body>
</html>


