<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
 <script src="https://uicdn.toast.com/tui.code-snippet/latest/tui-code-snippet.js"></script>
<script src="https://uicdn.toast.com/tui-calendar/latest/tui-calendar.js"></script>
<link rel="stylesheet" type="text/css" href="https://uicdn.toast.com/tui-calendar/latest/tui-calendar.css" />
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css" integrity="sha512-3pIirOrwegjM6erE5gPSwkUzO+3cTjpnV9lexlNZqvupR64iZBnOOTiiLPb9M36zpMScbmUNIcHUqKD47M719g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js" integrity="sha512-VEd+nq25CkR676O+pLBnDW09R7VQX9Mdiij052gVCp5yVH3jGtH70Ho/UUv4mJDsEdTvqRCFZg0NKGiojGnUCw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

</head>

<body>
<br><br><br><br><br><br>


<div id="calendar" style="height: 800px;"></div>

<script type="text/javascript">




$(document).ready(function(){

	
	var calendar = new tui.Calendar(document.getElementById('calendar'), {
	    defaultView: 'month',
	    taskView: true,    // Can be also ['milestone', 'task']
	    scheduleView: false,  // Can be also ['allday', 'time']
	    useCreationPopup : true,
	    useDetailPopup : true,
	    disableClick : true,
	    disableDblClick : true,
	    template: {
	    	milestone: function(schedule) {
	            return '<span class="calendar-font-icon ic-milestone-b"></span> <span style="background-color: ' + schedule.bgColor + '">' + schedule.title + '</span>';
	        },
	        milestoneTitle: function() {
	            return '<span class="tui-full-calendar-left-content">MILESTONE</span>';
	        },
	        time: function(schedule) {
	            return '<strong>' + moment(schedule.start.getTime()).format('HH:mm') + '</strong> ' + schedule.title;
	        },
	        goingDuration: function(schedule) {
	            return '<span class="calendar-icon ic-travel-time"></span>' + schedule.goingDuration + 'min.';
	        },
	        comingDuration: function(schedule) {
	            return '<span class="calendar-icon ic-travel-time"></span>' + schedule.comingDuration + 'min.';
	        },
	        monthMoreTitleDate: function(date, dayname) {
	            var day = date.split('.')[2];

	            return '<span class="tui-full-calendar-month-more-title-day">' + day + '</span> <span class="tui-full-calendar-month-more-title-day-label">' + dayname + '</span>';
	        },
	        monthMoreClose: function() {
	            return '<span class="tui-full-calendar-icon tui-full-calendar-ic-close"></span>';
	        },
	        monthGridHeader: function(dayModel) {
	            var date = parseInt(dayModel.date.split('-')[2], 10);
	            var classNames = ['tui-full-calendar-weekday-grid-date '];

	            if (dayModel.isToday) {
	                classNames.push('tui-full-calendar-weekday-grid-date-decorator');
	            }

	            return '<span class="' + classNames.join(' ') + '">' + date + '</span>';
	        },
	        monthGridHeaderExceed: function(hiddenSchedules) {
	            return '<span class="weekday-grid-more-schedules">+' + hiddenSchedules + '</span>';
	        },
	        monthGridFooter: function() {
	            return '';
	        },
	        monthGridFooterExceed: function(hiddenSchedules) {
	            return '';
	        },
	        monthDayname: function(model) {
	            return (model.label).toString().toLocaleUpperCase();
	        },
	        weekDayname: function(model) {
	            return '<span class="tui-full-calendar-dayname-date">' + model.date + '</span>&nbsp;&nbsp;<span class="tui-full-calendar-dayname-name">' + model.dayName + '</span>';
	        },
	        weekGridFooterExceed: function(hiddenSchedules) {
	            return '+' + hiddenSchedules;
	        },
	        dayGridTitle: function(viewName) {

	            // use another functions instead of 'dayGridTitle'
	            // milestoneTitle: function() {...}
	            // taskTitle: function() {...}
	            // alldayTitle: function() {...}

	            var title = '';
	            switch(viewName) {
	                case 'milestone':
	                    title = '<span class="tui-full-calendar-left-content">MILESTONE</span>';
	                    break;
	                case 'task':
	                    title = '<span class="tui-full-calendar-left-content">TASK</span>';
	                    break;
	                case 'allday':
	                    title = '<span class="tui-full-calendar-left-content">ALL DAY</span>';
	                    break;
	            }

	            return title;
	        },
	        schedule: function(schedule) {

	            // use another functions instead of 'schedule'
	            // milestone: function() {...}
	            // task: function() {...}
	            // allday: function() {...}

	            var tpl;

	            switch(category) {
	                case 'milestone':
	                    tpl = '<span class="calendar-font-icon ic-milestone-b"></span> <span style="background-color: ' + schedule.bgColor + '">' + schedule.title + '</span>';
	                    break;
	                case 'task':
	                    tpl = '#' + schedule.title;
	                    break;
	                case 'allday':
	                    tpl = getTimeTemplate(schedule, true);
	                    break;
	            }

	            return tpl;
	        },
	        collapseBtnTitle: function() {
	            return '<span class="tui-full-calendar-icon tui-full-calendar-ic-arrow-solid-top"></span>';
	        },
	        timezoneDisplayLabel: function(timezoneOffset, displayLabel) {
	            var gmt, hour, minutes;

	            if (!displayLabel) {
	                gmt = timezoneOffset < 0 ? '-' : '+';
	                hour = Math.abs(parseInt(timezoneOffset / 60, 10));
	                minutes = Math.abs(timezoneOffset % 60);
	                displayLabel = gmt + getPadStart(hour) + ':' + getPadStart(minutes);
	            }

	            return displayLabel;
	        },
	        timegridDisplayPrimayTime: function(time) {
	            // will be deprecated. use 'timegridDisplayPrimaryTime'
	            var meridiem = 'am';
	            var hour = time.hour;

	            if (time.hour > 12) {
	                meridiem = 'pm';
	                hour = time.hour - 12;
	            }

	            return hour + ' ' + meridiem;
	        },
	        timegridDisplayPrimaryTime: function(time) {
	            var meridiem = 'am';
	            var hour = time.hour;

	            if (time.hour > 12) {
	                meridiem = 'pm';
	                hour = time.hour - 12;
	            }

	            return hour + ' ' + meridiem;
	        },
	        timegridDisplayTime: function(time) {
	            return getPadStart(time.hour) + ':' + getPadStart(time.hour);
	        },
	        timegridCurrentTime: function(timezone) {
	            var templates = [];

	            if (timezone.dateDifference) {
	                templates.push('[' + timezone.dateDifferenceSign + timezone.dateDifference + ']<br>');
	            }

	            templates.push(moment(timezone.hourmarker).format('HH:mm a'));

	            return templates.join('');
	        },
	        popupIsAllDay: function() {
	            return 'All Day';
	        },
	        popupStateFree: function() {
	            return 'Free';
	        },
	        popupStateBusy: function() {
	            return 'Busy';
	        },
	        titlePlaceholder: function() {
	            return 'Subject';
	        },
	        locationPlaceholder: function() {
	            return 'Location';
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
	            return 'State : ' + schedule.state || 'Busy';
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
	    
	    },
	    month: {
	        daynames: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
	        startDayOfWeek: 0,
	    },
	});

 calendar.createSchedules([
    {
        id: '1',
        calendarId: '1',
        title: '예약',
        category: 'time',
        dueDateClass: '',
        start: '2022-2-25',
        end: '2022-2-26'
        // isReadOnly: true    schedule is read-only
    },
 {
        id: '2',
        calendarId: '2',
        title: '예약',
        category: 'time',
        dueDateClass: '',
        start: '2022-2-25',
        end: '2022-2-26'
    },
 {
        id: '3',
        calendarId: '3',
        title: '예약',
        category: 'time',
        dueDateClass: '',
        start: '2022-2-25',
        end: '2022-2-26'
    }

]);
 
 calendar.updateSchedule('1', '1', {
	    title: 'Changed schedule',
	    start: new Date('2022-02-11T09:00:00'),
	    end: new Date('2022-02-11T10:00:00'),
	    category: 'time'
	});
 
 
 });




 </script>



</body>
</html>