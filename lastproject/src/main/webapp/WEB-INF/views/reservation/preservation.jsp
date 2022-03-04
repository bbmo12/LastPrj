<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
</head>
<body>	
<br><br><br><br>
    <div align="center"><h1>파트너회원 예약내역조회</h1></div>
    
    <table class="table">
		<thead>
			<tr>
				<th>예약번호</th>
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
							<td><input  class="rno" type="hidden" value="${pres.r_no }">${pres.r_no }</td>
							<td>${pres.r_date}</td>
							<td>${pres.startdate } &nbsp; ${pres.time }</td>
							<td>${pres.m_id }</td>
							<td>${pres.pcontent }
							<td>${pres.rcontent }</td>
							<td><input class="in_code" type="hidden" value="${pres.rccontent }">${pres.rccontent }</td>
						</tr>
			</c:forEach>
		</tbody>
	</table>
	<script>
		var val = $(".in_code").parent();
		console.log (val);
		console.log(val.length);
		for(var i=0; i<val.length;i++){
			if(val[i].innerText == '승인대기'){
				console.log(val[i]);
				 val[i].classList.add("code");
				$(".code").empty();
			 	var check = $(".code").append(`<button onclick="ok(event)">승인</button> 
						       				   <button onclick="no(event)">거절</button>`);
			} 
		}
		function ok(event){
			var rno = $(event.target).parent().parent().children().first().text();
			console.log(rno);
			var flag = confirm("해당 예약신청을 승인하시겠습니까?");
			if(flag == true){
				$.ajax({
					url : 'okupdate',
					method : 'post',
					data : {"rno" : rno},
					success : function(result){
							console.log(result);
							alert("해당 승인신청이 성공적으로 완료되었습니다.");
								location.reload();
						},
					error : function(error){
						alert ("승인확인도중 오류가 발생하였습니다."); 
					}
				});
			}else{
				alert("예약신청 승인을 취소하셨습니다.");
			}
		}
		function no(event){
			var rno = $(event.target).parent().parent().children().first().text();
			var flag = confirm("해당 예약신청을 거절하시겠습니까?");
			
			var refuse = prompt("거절사유를 작성해주세요."+"");
			console.log(refuse);
			if(flag == true){
				$.ajax({
					url : 'noupdate',
					method : 'post',
					data : {'rno' : rno ,
							'refuse' : refuse },
					success : function(result){
						alert("작성완료.");
						location.reload();
					},
					error : function(error){
						alert("거절사유 작성중 오류발생")
					}
				})
				alert("해당 예약신청을 거절하셨습니다.");
			}
		}
	
	</script>
</body>
</html>