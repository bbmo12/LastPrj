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
</head>
<script>

window.onload = function(){
     $.ajax({
        url : "test",
        method :"GET",
        dataType : "JSON",
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
            header: '1234',
            name: 'startdate',
          },
          {
            header: '2345',
            name: 'r_date'
          },
          {
            header: '4566',
            name: 'time'
          },
          {
            header: '5677',
            name: 'm_id',
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