<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
  <head>
  
    <meta charset='utf-8' />
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    
  </head>
  <body>
  <br><br><br><br>
    <div align="center"><h1>일반회원 예약내역조회</h1></div>
    
    <table class="table">
		<thead>
			<tr>
				<th>예약번호</th>
				<th>수의사 이름</th>
				<th>예약신청일자</th>
				<th>예약시간</th>
				<th>예약내용</th>
				<th>품종</th>
				<th>예약여부</th>
				<th>취소사유</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${reservation }" var="res">
				<tr>
					<td><input  class="rno" type="hidden" value="${res.r_no }">${res.r_no }</td>
					<td>
						${res.name }</td>
					<td>${res.r_date}</td>
					<td>${res.time }시</td>
					<td>${res.rcontent }</td>
					<td>${res.pcontent }</td>
					<td>
						<input class="in_code" type="hidden" value="${res.rccontent }">
						${res.rccontent }</td>
					<td>${res.refuse}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
    <script>
		
		//table td값만
		var val = $(".in_code").parent();
		
		console.log (val);
		console.log(val.length);
		for(var i=0; i<val.length;i++){
				//예약결과코드 분류
			if(val[i].innerText == '결제가능'){
				
				console.log(val[i]);
				
				 val[i].classList.add("code");
				$(".code").empty();
			 	var check = $(".code").append(`<button class="payBtn">결제하기</button>`);
			 	
			}else if(val[i].innerText == '승인거절'){
				
				val[i].classList.add("refuse");
				
				
				
			}else if (val[i].innerText == '결제완료' ){
				
				 val[i].classList.add("complete");
					$(".complete").empty();
				 	var check = $(".complete").append(`<span>예약완료</span>`);
			} //else if문
		} //for문
		
		
		 /* function pay(){
			
			var rno = ;
			console.log(rno);
			
		}  */
		$(".payBtn").on('click',function(){
			console.log($(this).parent().parent().children().first().text());
			var rno = $(this).parent().parent().children().first().text();
			
			var flag =confirm("결제하시겠습니까?");
				
				if(flag==true){
					$.ajax({
						url : 'payupdate',
						method : 'post',
						data : {'rno' : rno},
						success : function(result){
							alert("결제가 완료되었습니다.");
							
							location.reload();
						},
						error : function(error){
							alert("결제실패")
						}
					})
				}else {
					alert("결제 취소되었습니다.");
				}
			})
		
	
	</script>
  </body>
</html>