<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style>
</style>
<meta charset="UTF-8">
<title>글쓰기</title>
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
}
</style>
<body>
	<div class="col-12 grid-margin stretch-card">
		<div class="card">
			<div class="card-body">
				<h4 class="card-title">글쓰기</h4>
				<p class="card-description">공지사항 새 글</p>
				<form class="forms-sample" id="frm" action="boardInsert"
					method="post">
					<div class="form-group">
						<label for="title">제목</label> <input type="text" name="title"
							class="form-control" id="title" placeholder="제목.." required>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail3">작성자</label> <input
							type="text" class="form-control writer" id="writer"
							value="세션값으로 관리자" name="writer" required>
					</div>
					<div class="form-group">
						<label for="exampleSelectGender">태그</label> 
						<select	class="form-control" id="btag" name="btag">
							<option disabled selected>선택해주세요.</option>
							<option value="pmtag">파트너회원</option>
							<option value="mtag">일반회원</option>
							<option value="pettag">펫</option>
							<option value="stag">서비스</option>
						</select>
					</div>
					<div class="form-group">
						<label for="content">내용</label>
						<textarea class="form-control" name="content" id="content"
							rows="4"></textarea>
					</div>
					<button type="submit" class="btn btn-primary mr-2">등록</button>
					<button class="btn btn-light" onclick="history.back()">취소</button>
				</form>
			</div>
		</div>
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