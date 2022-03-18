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

<link rel="stylesheet" href="resources/assets/css/nice-select.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
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
        <button type="button" class="btn btn-default btn-sm move-day" data-action="move-prev">
          <i class="calendar-icon ic-arrow-line-left" data-action="move-prev">이전</i>
        </button>
        <button type="button" class="btn btn-default btn-sm move-today" data-action="move-today">Today</button>
          <span id="renderRange" class="render-range"></span>
        <button type="button" class="btn btn-default btn-sm move-day" data-action="move-next">
          <i class="calendar-icon ic-arrow-line-right" data-action="move-next">다음</i>
        </button>
      </span>
    
    </div>

    <div id="calendar" style ="width: 35%; display: inline-block;"></div>
    <div style="width: 20px; height: 600px; display: inline-block;" ></div>
  
  <div id="tableDiv" style ="width: 45%; height : 600px; display: inline-block;">  
	<table class="table" style="width : 95%;" >
		<thead>
             <tr>
                <th>예약가능일자</th>
                <th>예약시간</th>
                <th>예약가능여부</th>
             </tr>
          </thead>
	</table>
	
</div>
	
					<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalLabel"
	aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h3 class="modal-title" id="exampleModalLabel">예약하기</h3>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<!-- modal 몸통 -->
			<div class="modal-body">
				<form>
				 <span id="dvalue">  <input type ="hidden" id="date_value" ></span> <br>
				 <span id="tvalue">  <input type ="hidden" id="time_value"></span> <br>
				 <span> 예약내용(증상)   : <input type="text" id ="r_content" placeholder="증상 입력" style="font-size: 15px; "></span><br>
				 <input type="hidden" id = "AutoCode" >
		   		 
		   		 <select class="animalNo" onchange="NoSelection(event)">
		   		 	<option value="" disabled selected  >펫 번호(이름)</option>
					 <c:forEach items="${petList}" var="pet">
		   		 			<option value="${pet.pet_no }"> <%-- ${pet.pet_no } --%>${pet.name }</option>
		   		 	   </c:forEach>
		   		 </select>
		   		 </form>
			</div>
			<!-- modal 하단 버튼 -->
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-dismiss="modal">취소</button>
				<button id="sendReserv" name="sendReserv" type="button"
					class="btn btn-primary" data-dismiss="modal">예약하기</button>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">


$(document).ready(function(){
	
	var today = new Date();
	var day = today.toLocaleDateString().substr(5,6).split('.');
	var month = parseInt(day[0]); 
	var year = today.toLocaleDateString().substr(0,4);
	var hours = today.getHours();
	
	var nowDate = year+"-"+month+"-"+parseInt(day[1]);
	var nowTime = hours+"시"
	
	$("#renderRange").text(year+'년'+month+'월');
	revList();
	
	var p_id="${pmember.p_id}";
	console.log("p_id======================"+p_id)
	//달력 템플릿
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
	
	//예약조회
	function revList(){
		p_id = "${pmember.p_id}";
		console.log(p_id);
		
		$("#calendar").empty();
		CreateCalendar();
		$.ajax({
			url : "revsetlist",
			method : "POST",
			data : {"p_id" : p_id},
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
				var bgColor = result[i].bgColor;
				
					calendar.createSchedules([
						{
							id: id,
						    title: title,
						    start: start,
						    end: end,
						    category: category,
						    bgColor : bgColor
						}
					]);
				}
			}
		});
	}
	

	//일정 클릭 후 해당예약일자 테이블 표출
	calendar.on('clickSchedule', function(event) {
		var today = new Date();
		var day = today.toLocaleDateString().substr(5,6).split('.');
		var month = parseInt(day[0]); 
		var year = today.toLocaleDateString().substr(0,4);
		var hours = today.getHours();
		var nowDate = year+"-"+month+"-"+parseInt(day[1]);
		var nowTime = hours+"시"
		
		console.log("현재시간"+nowTime);
		
		
		
		var title = event.schedule.title;
		if ( title=='예약불가'){
			$(".table tbody").empty();
			$("#reservModal").empty();
		}else{
			var id = event.schedule.id;
			console.log(id);
			$.ajax({
				url : 'revSetUpdateSelect',
				method : 'POST',
				data : {"id" :id},
				success : function(res){
					p_id = res.schedule.p_id;
					console.log("dddddddddddddddd",res.timeList);
					$(".table").empty();
					var i=0;
					var $tbody,tdval;
					var len = res.schedule.c_end.replaceAll('-','')-res.schedule.c_start.replaceAll('-','')+1;
					var split = res.schedule.c_start.split('-');
	
					var sp2 = split[2]
					var ab = String(parseInt(split[2]));
					//종료일 - 시작일 +1 로 반복횟수 설정
					for( i; i<len;i++){
			               var ex = ((parseInt(sp2))+i);
			               console.log(ex);
			               if(ex.toString().length == 1){
			                  console.log(ex.toString().length);
			                  tdval = split[0]+'-'+split[1]+'-0';
			               }else{
			                  console.log(ex.toString().length);
			                  tdval = split[0]+'-'+split[1]+'-';
			               }
			              
			               $tbody =` 
			                  <tbody>
			                        <tr>
			                           <td class="tdvalCheck">`+tdval+ex+`</td>
										<td>
											<input type="radio" name="selectTime" value="09시">09:00~10:00
											<input type="radio" name="selectTime" value="10시">10:00~11:00
											<input type="radio" name="selectTime" value="11시">11:00~12:00
											<input type="radio" name="selectTime" value="14시">14:00~15:00
											<input type="radio" name="selectTime" value="15시">15:00~16:00
											<input type="radio" name="selectTime" value="16시">16:00~17:00
											<input type="radio" name="selectTime" value="17시">17:00~18:00
										</td>
									
									</tr>
									
							</tbody> `;
							if(nowDate == split[0]+'-'+parseInt(split[1])+"-"+ex){
								if(parseInt(nowTime) <= 9){
									$tbody = ` 
						                  <tbody>
						                        <tr>
						                           <td class="tdvalCheck">`+tdval+ex+`</td>
														<td>
															<input type="radio" name="selectTime" value="10시">10:00~11:00
															<input type="radio" name="selectTime" value="11시">11:00~12:00
															<input type="radio" name="selectTime" value="14시">14:00~15:00
															<input type="radio" name="selectTime" value="15시">15:00~16:00
															<input type="radio" name="selectTime" value="16시">16:00~17:00
															<input type="radio" name="selectTime" value="17시">17:00~18:00
														</td>
													 <td></td>
												</tr>
										</tbody> `;
								}else if (parseInt(nowTime) <= 10){
									$tbody = ` 
						                  <tbody>
						                        <tr>
						                           <td class="tdvalCheck">`+tdval+ex+`</td>
														<td>
																<input type="radio" name="selectTime" value="11시">11:00~12:00
																<input type="radio" name="selectTime" value="14시">14:00~15:00
																<input type="radio" name="selectTime" value="15시">15:00~16:00
																<input type="radio" name="selectTime" value="16시">16:00~17:00
																<input type="radio" name="selectTime" value="17시">17:00~18:00
														</td>
													 <td></td>
												</tr>
										</tbody> `;
								}else if (parseInt(nowTime) <= 12){
									$tbody = ` 
						                  <tbody>
						                        <tr>
						                           <td class="tdvalCheck">`+tdval+ex+`</td>
														<td>
																<input type="radio" name="selectTime" value="14시">14:00~15:00
																<input type="radio" name="selectTime" value="15시">15:00~16:00
																<input type="radio" name="selectTime" value="16시">16:00~17:00
																<input type="radio" name="selectTime" value="17시">17:00~18:00
														</td>
													 <td></td>
												</tr>
										</tbody> `;
								}else if (parseInt(nowTime) <= 14){
									$tbody = ` 
						                  <tbody>
						                        <tr>
						                           <td class="tdvalCheck">`+tdval+ex+`</td>
														<td>
																<input type="radio" name="selectTime"  value="15시">15:00~16:00
																<input type="radio" name="selectTime"  value="16시">16:00~17:00
																<input type="radio" name="selectTime"  value="17시">17:00~18:00
														</td>
													 <td></td>
												</tr>
										</tbody> `;
								}else if (parseInt(nowTime) <= 15){
									$tbody = ` 
						                  <tbody>
						                        <tr>
						                           <td class="tdvalCheck">`+tdval+ex+`</td>
														<td>
																<input type="radio" name="selectTime"  value="16시">16:00~17:00
																<input type="radio" name="selectTime"  value="17시">17:00~18:00
														</td>
													 <td></td>
												</tr>
										</tbody> `;
								}else {
									$tbody = ` 
						                  <tbody>
						                        <tr>
						                           <td class="tdvalCheck">`+tdval+ex+`</td>
														<td>
															<input type="radio" name="selectTime"  value="17시">17:00~18:00
														</td>
													 <td></td>
												</tr>
										</tbody> `;
								}
							}
						$(".table").append($tbody);
						}
						$("#tableDiv").append(`<button id="reservModal" type="button" class="btn btn-secondary"
							  	data-toggle="modal" data-target="#exampleModal">예약</button>`);
						for(var i=0; i<res.timeList.length;i++){
							$('.tdvalCheck:contains("'+res.timeList[i].reserv_date+'")').parent().find("[value='"+res.timeList[i].reserv_time+"']").attr('disabled',true)
						}
				}//ajax success 부분
			})
		}
	});
 	 //달력 다음버튼 클릭 이벤트
	$(".ic-arrow-line-left").on('click',function(event){
		month = month-1;
		if(month == 0){
			year = parseInt(year)-1;
			month = 12;
		}
		calendar.prev();
		$("#renderRange").text(year+'년'+month+'월');
		
	});
 	//달력 이전버튼 클릭 이벤트
	$(".ic-arrow-line-right").on('click',function(event){
		month = month+1;
		if(month == 13){
			year = parseInt(year)+1;
			month = 1;
		}
		calendar.next();
		$("#renderRange").text(year+'년'+month+'월');
	});
 	//달력 Today 클릭 이벤트
 	$(".move-today").on('click',function(event){
 		
 		calendar.today();
 		day = today.toLocaleDateString().substr(5,6).split('.');
 		month = parseInt(day[0]); 
 		year = today.toLocaleDateString().substr(0,4);
 		$("#renderRange").text(year+'년'+month+'월');
 	})
});

//옵션값 설정 후 예약가능/불가 출력
function changeSelection(event){
	var reserv_time = $(event.target).val();
	var tdvalue = $(event.target).parent().prev().text();
	var p_id = "${pmember.p_id}";
	$("#dvalue").text('예약일 : ' + tdvalue);
	$("#tvalue").text('예약시간 : ' + reserv_time);
	$.ajax({
		url : 'reservcount',
		method : 'POST',
		data : {"reserv_date": tdvalue,
				"reserv_time": reserv_time,
				"p_id" : p_id},
		success : function(res){
			//console.log(event.target);
			if((res.reserv_date != null && res.reserv_time != null)){
				$(event.target).parent().next().text('예약불가');
			}else{
				$(".selectTime").parent().next().text('');
				$(event.target).parent().next().append(`<button id="reservModal" type="button" class="btn btn-secondary"
					  	data-toggle="modal" data-target="#exampleModal">예약</button>`);
			}
		}
	})
}

function NoSelection(event){
	var pet_no = $(event.target).val();
	console.log(pet_no);
	$.ajax({
		url : "autoCode",
		method : "POST",
		data : {"pet_no" : pet_no},
		success : function(res){
			$("#AutoCode").val(res);
			console.log($("#AutoCode").val());
		}
	})
}

//모달창 값 보내기
$("#sendReserv").on('click',function(){
	//모달창 예약일자
	var date_value = $("#dvalue").text().slice(6);
	//모달창 예약시간
	var time_value = $("#tvalue").text().slice(7);
	//모달창 증상
	var r_content = $("#r_content").val();
	//모달창 품종코드
	var animalType = $(".animalType option:selected").val();
	
	//파트너회원아이디값
	var p_id = "${pmember.p_id}";
	//펫번호
	var pet_no = $(".animalNo option:selected").val();
	
	//파트너회원 해당코드
	var code = ${pmember.code};
	
	
	$.ajax({
		url : 'reservinsert',
		method : 'POST',
		data : {"r_date" : date_value,
				"time" : time_value,
				"rcontent" : r_content,
				"r_code" : animalType,
				"pet_no" : pet_no,
				"p_id" : p_id
				},
		success : function(res){
			console.log(res);
			alert("예약신청이 완료되었습니다.");
			$(".table").empty();
			
		},
		error : function(){
			alert("ajax 에러");
		}
	})
})
$('#exampleModal').on('hidden.bs.modal', function(e) {
         $(this).find('form')[0].reset();
         $(".current").text("펫번호(이름)");
})

 </script>
</body>
</html>