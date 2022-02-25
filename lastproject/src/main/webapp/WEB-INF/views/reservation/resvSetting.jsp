<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<!-- <link rel="stylesheet" href="https://uicdn.toast.com/tui-grid/latest/tui-grid.css" />
<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script> -->
<link rel="stylesheet" href="resources/static/css/tui-grid.css" type="text/css">
<script src="resources/static/js/tui-grid.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
</head>
<script>

window.onload = function(){
     $.ajax({
        url : "test",
        method :"GET",
        success : function(result){
        	console.log(result);
            grid.resetData(result);
        } 
    }); 
    var grid = new tui.Grid({
        el: document.getElementById('grid'),
        scrollX: false,
        scrollY: false,
        columns: [
          {
            header: '예약번호',
            name: 'r_no',
          },
          {
            header: '예약신청일',
            name: 'r_date'
          },
          {
            header: '예약일',
            name: 'startdate',
          },
          {
            header: '예약시간',
            name: 'time'
          },
          {
            header: '회원아이디',
            name: 'm_id',
          },
          {
              header: '승인여부',
              name: 'rccontent',
          }
        ]
      });
      };
 </script>
<body>
<br><br><br><br><br><br>
<div id="grid"></div>

</body>
</html>