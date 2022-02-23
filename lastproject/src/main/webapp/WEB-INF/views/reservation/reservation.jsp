<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
  <head>
  
  <!-- 일반회원예약내역조회  -->
    <meta charset='utf-8' />
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <link href='resources/fullcalendar/main.css' rel='stylesheet' />
    <script src='resources/fullcalendar/main.js'></script> -->
    <!-- <script>
	
      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          
          selectable: true,
          select: function(arg) {
              var title = prompt('예약일정');
              if (title) {
                calendar.addEvent({
                  title: title,
                  start: arg.start,
                  end: arg.end,
                  allDay: arg.allDay
                })
              }
              calendar.unselect()
           },
          eventClick: function(arg) {
              if (confirm('삭제하시겠습니까?')) {
                arg.event.remove()
              }
          },
          events : function(info,successCallback,failureCallback){
        	  $.ajax({ 
		        	  url:"reservationSelect", 
		        	  dataType:"json",
		        	  success : function(cal){
		        		  var events =[];
		        		  $.each(cal,function(){
		        		  console.log(cal);
		        		  console.log(cal[0].r_date);
		        			  events.push({title : '예약',
		        				  		   start : cal[0].r_date,
		        				  		   end : cal[0].r_date})
		        		  
		        		  });
		        	  }
        	  });
        	  
          } 

        	  
          
        });
        calendar.render();
      });

    </script> -->
  </head>
  <body>
  <br><br><br><br>
    <!-- <div id='calendar'></div> -->
    <div align="center"><h1>일반회원 예약내역조회</h1></div>
    
    <table class="table">
		<thead>
			<tr>
				<th>수의사 아이디</th>
				<th>예약신청일자</th>
				<th>예약시간</th>
				<th>예약내용</th>
				<th>품종</th>
				<th>예약여부</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${reservation }" var="res">
				<tr>
					<td>${res.name }</td>
					<td>${res.r_date}</td>
					<td>${res.time }시</td>
					<td>${res.content }</td>
					<td>강아지</td>
					<td><input class="in_code" type="hidden" value="${code.content }">${res.code }</td>
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
			 	var check = $(".code").append(`<button onclick="pay">결제하기</button>`);
			 	
			}else if(val[i].innerText == '승인거절'){
				
				val[i].classList.add("refuse");
				$(".refuse").on('click',function(){
				$(".refuse").empty();
			 	var refuse = $(".refuse").append(`<span>그냥</span>`);
					
				})
			}else if (val[i].innerText == '결제완료' ){
				
				 val[i].classList.add("complete");
					$(".complete").empty();
				 	var check = $(".complete").append(`<span>예약완료</span>`);
			}
		}
		/* function pay(){
			$.ajax({
				url : '',
				method : '',
				data : '',
				success : ''
				
			})
		} */
		
	
	</script>
  </body>
</html>