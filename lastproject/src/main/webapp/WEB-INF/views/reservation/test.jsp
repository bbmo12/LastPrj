<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="https://uicdn.toast.com/tui-calendar/latest/tui-calendar.css" />

<!-- If you use the default popups, use this. -->
<link rel="stylesheet" type="text/css" href="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.css" />
<link rel="stylesheet" type="text/css" href="https://uicdn.toast.com/tui.time-picker/latest/tui-time-picker.css" />

<script src="https://uicdn.toast.com/tui.code-snippet/v1.5.2/tui-code-snippet.min.js"></script>
<script src="https://uicdn.toast.com/tui.time-picker/latest/tui-time-picker.min.js"></script>
<script src="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.min.js"></script>
<script src="https://uicdn.toast.com/tui-calendar/latest/tui-calendar.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
</head>
<style>
#calendar > div > div.tui-full-calendar-floating-layer.tui-view-13 > div > div.tui-full-calendar-popup-container > div:nth-child(3) > div{
	display: none;
}
#calendar > div > div.tui-full-calendar-floating-layer.tui-view-13 > div > div.tui-full-calendar-popup-container > div.tui-full-calendar-popup-section.tui-full-calendar-dropdown.tui-full-calendar-close.tui-full-calendar-section-state > button{
	display: none;
}


</style>
<body>
<br><br><br><br><br><br>

 <div id="menu">
      <span id="menu-navi">
        <button type="button" class="btn btn-default btn-sm move-today" data-action="move-today">Today</button>
        <button type="button" class="btn btn-default btn-sm move-day" data-action="move-prev">
          <i class="calendar-icon ic-arrow-line-left" data-action="move-prev">이전</i>
        </button>
        <button type="button" class="btn btn-default btn-sm move-day" data-action="move-next">
          <i class="calendar-icon ic-arrow-line-right" data-action="move-next">다음</i>
        </button>
      </span>
      <span id="renderRange" class="render-range"></span>
    </div>

    <div id="calendar" style ="width: 700px"></div>
    
<table class="table" ></table>

<script type="text/javascript">



$(document).ready(function(){
	
	revList();
	
	
	var templates = {
		    popupIsAllDay: function() {
		      return 'All Day';
		    },
		    titlePlaceholder: function() {
		      return 'Subject';
		    },
		    startDatePlaceholder: function() {
		      return 'Start date';
		    },
		    endDatePlaceholder: function() {
		      return 'End date';
		    },
		    popupDetailDate: function(isAllDay, start, end) {
		      var isSameDate = moment(start).isSame(end);
		      var endFormat = (isSameDate ? '' : 'YYYY.MM.DD ') + 'hh:mm a';
		      if (isAllDay) {
		    	  console.log(start);
		        return moment(start).format('YYYY.MM.DD') + (isSameDate ? '' : ' - ' + moment(end).format('YYYY.MM.DD'));
		      }

		      return (moment(start).format('YYYY.MM.DD hh:mm a') + ' - ' + moment(end).format(endFormat));
		    },
		    popupDetailLocation: function(schedule) {
		      return 'Location : ' + schedule.location;
		    },
		    popupDetailUser: function(schedule) {
		      return 'User : ' + (schedule.attendees || []).join(', ');
		    },
		    popupDetailState: function(schedule) {
		      return 'State : ' + schedule.state || 'Free';
		    },
		    popupDetailRepeat: function(schedule) {
		      return 'Repeat : ' + schedule.recurrenceRule;
		    },
		    popupDetailBody: function(schedule) {
		      return 'Body : ' + schedule.body;
		    },
		    popupEdit: function() {
		      return 'Edit';
		    },
		    popupDelete: function() {
		      return 'Delete';
		    }
		  };
	var calendar;
	//캘린더 생성
	function CreateCalendar(){
			calendar = new tui.Calendar(document.getElementById('calendar'), {
		    defaultView: 'month',
		    scheduleView: false,  // Can be also ['allday', 'time']
		    disableClick : true,
		    disableDblClick : true,
		    isReadOnly : false,
		    isAlways6Week : false,
		    template: templates,
		    month: {
		        daynames: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
		        startDayOfWeek: 0,
		    }
		});
	}
	
	//예약설정조회
	function revList(){
		$("#calendar").empty();
		CreateCalendar();
		$.ajax({
			url : "revsetlist",
			dataType : "JSON",
			success : function(result){
				console.log(result);
				for(var i =0;i<result.length;i++){
					
				var id = result[i].id;
				var calendarid = result[i].calendarid;
				var start = result[i].c_start;
				var end = result[i].c_end;
				var time = result[i].c_time;
				var category = result[i].category;
				var title = result[i].title;
				var pid = result[i].p_id;
				var ctime = result[i].c_time;
				
					calendar.createSchedules([
						{
							id: id,
						    title: title,
						    start: start,
						    end: end,
						    category: category
						}
					]);
				}
			}
		});
	}
	calendar.on('clickSchedule', function(event) {
		var id = event.schedule.id;
		console.log(id);
		$.ajax({
			url : 'revSetUpdateSelect',
			method : 'POST',
			data : {"id" :id},
			success : function(res){
				$(".table").empty();
				//종료일 - 시작일 +1 로 반복횟수 설정
				var i,$thead,$tbody;
				var len = res[0].c_end.replaceAll('-','')-res[0].c_start.replaceAll('-','')+1;
				var split = res[0].c_end.split('-');
				console.log(parseInt(split[0]+split[1]+split[2]));
				
				for( i =0; i<len;i++){
					$thead = `
						<thead>
							<tr>
								<th>예약가능일자</th>
								<th>예약시간</th>
								<th>예약가능여부</th>
							</tr>
						</thead>`
					$tbody =` 
						<tbody>
								<tr>
									<td>`+split[0]+'-'+split[1]+'-'+(parseInt(split[2])+i)+`</td>
										<td><select class="selectTime" name="예약시간" onchange="changeSelection()">
												<option value="">예약시간</option>
												<option value="9시">09:00~10:00</option>
												<option value="10시">10:00~11:00</option>
												<option value="11시">11:00~12:00</option>
												<option value="2시">14:00~15:00</option>
												<option value="3시">15:00~16:00</option>
												<option value="4시">16:00~17:00</option>
												<option value="5시">17:00~18:00</option>
											</select>
										</td>
									 <td class="resvAble">`+ res[0].c_check +`</td>
								</tr>
						</tbody> `;
					$(".table").append($tbody);
								}
				$(".table").append($thead);
			}//ajax success 부분
		})
		
		
	});
 
	$(".ic-arrow-line-left").on('click',function(event){
		calendar.prev();
	});
	$(".ic-arrow-line-right").on('click',function(event){
		calendar.next();
	});
	
	$(".selectTime>option").on("click",function(){
		console.log("왜");
	})
	
});
function changeSelection(){
	var date = $(".selectTime").parent().prev().text();
	var val = $(".selectTime option:selected").val();
	console.log(date);
	console.log(val);
	$.ajax({
		url : 'reservcount',
		method : 'POST',
		data : {"reserv_date": date,
				"reserv_time": val},
		success : function(res){
			console.log(res);
		}
	})
	
}


 </script>



</body>
</html>