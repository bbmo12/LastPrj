<%@ page contentType="text/html; charset=UTF-8" %>
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


<div id="calendar" style="height: 800px;"></div>

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
		    popupSave: function() {
		      return 'Save';
		    },
		    popupUpdate: function() {
		      return 'Update';
		    },
		    popupDetailDate: function(isAllDay, start, end) {
		      var isSameDate = moment(start).isSame(end);
		      var endFormat = (isSameDate ? '' : 'YYYY.MM.DD ') + 'hh:mm a';

		      if (isAllDay) {
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
		    taskView: true,    // Can be also ['milestone', 'task']
		    scheduleView: false,  // Can be also ['allday', 'time']
		    useCreationPopup : true,
		    useDetailPopup : true,
		    disableClick : true,
		    disableDblClick : true,
		    template: templates,
		    month: {
		        daynames: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
		        startDayOfWeek: 0,
		    },
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
	
 
 
 

//새 일정 생성이벤트
calendar.on('beforeCreateSchedule', scheduleData => {
  var schedule = {
    title: scheduleData.title,
    isAllDay: scheduleData.isAllDay,
    start: scheduleData.start,
    end: scheduleData.end,
    category: scheduleData.isAllDay ? 'allday' : 'time'
  }
  console.log(schedule);
  
  //데이터 날짜 형식 변환
  const formatDate = (current_datetime)=>{
    let formatted_date = current_datetime.getFullYear() + "-" + (current_datetime.getMonth() + 1) + 
    "-" + current_datetime.getDate() + " " + current_datetime.getHours() + ":" + current_datetime.getMinutes() + 
    ":" + current_datetime.getSeconds();
    return formatted_date;
}
  

  
  
  //원하는 값 잘라오기
  
  //end
  //var end = formatDate(schedule.end._date);
  var end = schedule.end._date.toISOString();
  var strEnd = end.slice(0,10);
  console.log(end);
  
  //start
  //var start = formatDate(schedule.start._date);
  var start = schedule.start._date.toISOString();
  var strStart = start.slice(0,10);
  console.log(start);
  
  
	$.ajax({
		url : "revsetinsert",
		method : "POST",
		data : {"title": scheduleData.title,
			    "c_start": start,
			    "c_end": end,
			    "category": scheduleData.isAllDay ? 'allday' : 'time'},
		success : function(res){
			console.log(res);
			revList();	
			alert('해당 예약일정을 등록하셨습니다.');
		}
	})
	

});
 //일정 수정이벤트
 calendar.on('beforeUpdateSchedule', function(event) {
    var schedule = event.schedule;
    var changes = event.changes;
    var end,start,category,title;
     
  //원하는 값 잘라오기
    //end,start 조건문
    console.log(schedule);
      if(typeof changes.end == 'undefined'){
    	end = null;
    }else{
    	//end = changes.end._date.toISOString().slice(0,16);
    	end = new Date(changes.end._date.getTime() - (changes.end._date.getTimezoneOffset() * 60000)).toISOString().slice(0,16);
    }
    
    if(typeof changes.start =='undefined'){
    	start = null;
    }else{
    	//start = changes.start._date.toISOString().slice(0,16);
    	start = new Date(changes.start._date.getTime() - (changes.start._date.getTimezoneOffset() * 60000)).toISOString().slice(0,16);
    }
    
    if(typeof changes.category =='undefined'){
    	category = null;
    }else{
    	category = changes.category;
    } 
    
    if(typeof changes.title =='undefined'){
    	title = null;
    }else{
    	title = changes.title;
    } 
    
    //end
    
    //start
   // var start = changes.start._date.toISOString();
    /* var strStart = start.slice(0,16);*/
    console.log(changes);
    console.log(start);
    
	  $.ajax({
		url : "revsetupdate",
		method : "POST",
		data : { "id" : schedule.id ,
				 "c_start": start,
				 "c_end" : end,
				 "title" : title,
				 "category" : category
				},
		success : function(res){
			
		    calendar.updateSchedule(schedule.id, schedule.calendarId, changes);
		    alert("수정 완료");
			
		}
	})  
});

//일정 삭제이벤트
calendar.on('beforeDeleteSchedule', scheduleData => {
		  const {schedule, start, end} = scheduleData;

		  schedule.start = start;
		  schedule.end = end;
		  $.ajax({
			  url : 'revsetdelete',
			  method : 'POST',
			  data : {"id" : schedule.id},
			  success : function(res){
				  console.log(res);
		  		calendar.deleteSchedule(schedule.id, schedule.calendarId);
		  		alert("해당 예약설정을 해제하였습니다.");
			  }
		  })
	});
 

 });




 </script>



</body>
</html>