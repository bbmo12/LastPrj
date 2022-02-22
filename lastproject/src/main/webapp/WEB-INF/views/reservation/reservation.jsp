<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
  <head>
  <!-- 일반회원예약내역조회  -->
    <meta charset='utf-8' />
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
				<th>증상</th>
				<th>품종</th>
				<th>예약여부</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${reservation }" var="res">
		<tr>
		<td>${res.p_id }</td>
		<td>${res.r_date}</td>
		<td>${res.time }</td>
		<td>구토</td>
		<td>강아지</td>
		<td>${res.code }</td>
		</tr>
		</c:forEach>
		</tbody>
	</table>
    
  </body>
</html>