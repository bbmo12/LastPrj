<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="http://code.jquery.com/jquery-3.5.1.js"></script>
<!DOCTYPE html>
<html>
<head>
<style>
</style>
<meta charset="UTF-8">
<title>글쓰기</title>
</head>
<style>
th, td {
	text-align: center;
}

th {
	background-color: #f5f5f5;
}

td {
	background-color: #fffafa;
}

.click {
	position: relative;
	left: 1370px;
	top: 40px;
	background-color: rgba(255, 255, 255, 0);
	border-color: rgba(255, 255, 255, 0);
	color: white;
}

.btn {
	position: relative;
	left: 1360px;
	top: 40px;
	background-color: rgba(255, 255, 255, 0);
	border-color: rgba(255, 255, 255, 0);
	color: white;
}

.title {
	position: relative;
	left: 440px;
	top: -10px;
}

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
	<div style="color: white;" class="title">
		<h1>글쓰기</h1>
	</div>
	<div style="margin-top: 150px">
		<form id="frm" action="boardInsert" method="post">
			<table width=53% height=500px border=1 align=center>
				<colgroup>
					<col width="15%">
					<col width="*">
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">제목</th>
						<td class="view_text">
						<td><input type="text" id="title" name="title"
							plcaeholder="제목..."></td>
					</tr>
					<tr>
						<th scope="row">내용</th>
						<td colspan="3" class="view_text"><textarea rows="20"
								cols="100" title="내용" id="content" name="content"
								plcaeholder="내용..."></textarea></td>
					</tr>
					<tr>
						<th scope="row">작성자</th>
						<td class="view_text">
						<td><input type="text" id="writer" name="writer"
							plcaeholder="작성자..."></td>
					</tr>
			</table>
			<div>
				<input type="submit" class="click" value="등 록">&nbsp;&nbsp;
				<input type="reset" class="btn" value="취 소" onclick="history.back()">
			</div>
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