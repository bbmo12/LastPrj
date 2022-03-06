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
	<div class="modal fade" id="exampleModal" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalLabel"
	aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h3 class="modal-title" id="exampleModalLabel">진료작성</h3>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<!-- modal 몸통 -->
			<div class="modal-body">
					<div class="form-group">
							<input type="hidden" id="p_id" name="p_id" value="${sessionScope.pId }">
							<input type="hidden" id="r_no" name ="r_no">
							<span id ="span_d_name" style="width: 250px !important;">&nbsp;진단명 : <input type="text" id="d_name" name="d_name"></span><br><br>
							<span id ="span_symptom" style="width: 250px !important;"> &nbsp; &nbsp; 증 상 : <input type="text" id="symptom" name="symptom"></span><br><br>
							<span id ="span_result" style="width: 250px !important;"> &nbsp; &nbsp; 처 방 : <input type="text" id="d_result" name="d_result"></span>
					</div>
			</div>
			<!-- modal 하단 버튼 -->
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-dismiss="modal">취소</button>
				<button id="sendDiaLog" name="sendReserv" type="button"
					class="btn btn-primary" data-dismiss="modal">작성완료</button>
			</div>
		</div>
	</div>
</div>
	
	
	
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
			}else if(val[i].innerText == '결제완료'){
				val[i].classList.add("diaLog");
				$(".diaLog").empty();
			 	var check = $(".diaLog").append(`<button id="diaLogModal" type="button" class="btn btn-secondary diaLogModal"
						  						data-toggle="modal" data-target="#exampleModal">진료기록작성</button>`);
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
		
		$(".diaLogModal").on('click',function(){
			var r_no = $(this).parent().prev().prev().prev().prev().prev().prev().text();
			$("#r_no").val(r_no);
			
		});
		//모달창 값 보내기
		$("#sendDiaLog").on('click',function(){
			
			var p_id = $("#p_id").val();
			var d_name = $("#d_name").val();
			var symptom =$("#symptom").val();
			var result = $("#d_result").val();
			var dia_r_no = $("#r_no").val();
				 $.ajax({
					url : 'diaInsert',
					method : 'post',
					data : {'r_no' : dia_r_no ,
							'p_id' : p_id,
							'd_name' : d_name,
							'symptom' : symptom,
							'result' : result },
					success : function(res){
						alert("작성완료");
						location.reload();
						
					}
				}); 
		});
		
		
	</script>
</body>
</html>