<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<!-- 파트너회원예약조회 -->
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>	
<br><br><br><br>
    <!-- <div id='calendar'></div> -->
    <div align="center"><h1>파트너회원 예약내역조회</h1></div>
    
    <table class="table">
		<thead>
			<tr>
				<th>예약신청일자</th>
				<th>예약시간</th>
				<th>예약자 이름</th>
				<th>품종</th>
				<th>증상</th>
				<th>승인여부</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${preservation }" var="pres">
		<tr>
		<td>${pres.startdate }</td>
		<td>${pres.r_date} &nbsp; ${pres.time }시</td>
		<td>${pres.m_id }</td>
		<td>${pres.content }</td>
		<td>${pres.d_name }</td>
		<td>예약승인코드자리</td>
		</tr>
		</c:forEach>
		</tbody>
	</table>
</body>
</html>