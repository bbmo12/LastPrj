<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세보기</title>
</head>
<style>
				 /*  th, td{
				  	text-align:center;
				  } */
				  th {
				    background-color: #f5f5f5;
				  }
				  td {
				    background-color: #fffafa;
				  }

.click{
position: relative;
left:1430px;
top: 40px;
}
.btn{
position: relative;
left:1340px;
top: 40px;
}
.hr{
position: relative;
padding:-10%;
}
</style>
<body>
	<div style="margin-top:130px">
	<table width=53% height=500px border=1 align=center>
	<tr height=30px>
	<td align="center" colspan="1">제목</td>
	<td align="center" colspan="3">${boards.title}</td>
	</tr>
	<tr>
	<td align="center" width=25%>작성자</td>
	<td align="center" width=25%>${boards.writer}</td>
	<td align="center" width=25%>작성일</td>
	<td align="center" width=25%>${boards.w_date}</td>
	</tr>
	<tr>
	<td align="center" colspan="4">내 용</td>
	</tr>
	<tr height = 500px>
	<td style="vertical-align : top;"  colspan="4" class="hr" >${boards.content}</td>
	</tr>
</table>
	<button style="color:white;" class="click" onclick="history.back()">확인</button>
	<a href="noticeUpdateForm.do?notice_id=${notices.notice_id}&notice_title=${notices.notice_title }"><role="button" style="color:white;" class="btn btn-outline-info">수정</a>
</body>