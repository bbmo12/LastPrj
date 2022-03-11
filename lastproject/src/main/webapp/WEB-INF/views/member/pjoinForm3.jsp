<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="float: none; margin: 0 auto 0 auto;"
		class="col-8 grid-margin stretch-card">
		<div class="main-panel">
			<div class="content-wrapper">
				<div class="card">
					<div class="card-body">
						<h4 class="card-title">운영시간</h4>
								<div id="o_time_div" class="form-group">
									<select id ="w_day" name="w_day">
										<option value='' selected disabled>요일선택</option>
										<option value='월'>월</option>
										<option value='화'>화</option>
										<option value='수'>수</option>
										<option value='목'>목</option>
										<option value='금'>금</option>
										<option value='토'>토</option>
										<option value='일'>일</option>
									</select>
									<select id="starttime" name="starttime">
										<option value='' selected>오픈시간</option>
										<option value='9:00'>9:00</option>
										<option value='9:30'>9:30</option>
										<option value='10:30'>10:30</option>
										<option value='11:00'>11:00</option>
										<option value='12:00'>12:00</option>
										<option value='12:30'>12:30</option>
									</select>
									<select  id="endtime" name="endtime" >
										<option value='' selected>마감시간</option>
										<option value='13:00'>13:00</option>
										<option value='13:30'>13:30</option>
										<option value='14:00'>14:00</option>
										<option value='14:30'>14:30</option>
										<option value='15:00'>15:00</option>
										<option value='15:30'>15:30</option>
										<option value='16:00'>16:00</option>
										<option value='16:30'>16:30</option>
										<option value='17:00'>17:00</option>
										<option value='17:30'>17:30</option>
										<option value='18:00'>18:00</option>
										<option value='18:30'>18:30</option>
										<option value='19:00'>19:00</option>
										<option value='19:30'>19:30</option>
										<option value='20:00'>20:00</option>
										<option value='20:30'>20:30</option>
										<option value='21:00'>21:00</option>
									</select>
									<br>
									<input type="text" class="form-control" id="n_content" name="n_content">
									<button type="button" onclick="addO_Time()">추가</button>
								</div>
						<h4 class="card-title">회사 정보</h4>
						<form class="forms-sample" action="pjoin_3" method="post" enctype="multipart/form-data">
						<input type="hidden" class="form-control" id="p_id" name="p_id" value="${p_id.p_id}">
					<h4>여기 서비스내용 란.</h4>
					<div class="form-group">
								<label for="exampleInputPassword4">서비스 내용</label>
								<input type="text" class="form-control" id="title" name="title"	placeholder="서비스내용">
					</div>
					<div class="form-group">
								<label for="exampleInputPassword4">서비스 금액</label>
								<input type="text" class="form-control" id="price" name="price"	placeholder="서비스금액">
					</div>
					<div class="form-group">
								<label for="exampleInputPassword4">서비스 설명</label>
								<textarea class="form-control" id="content" name="content"
									placeholder="서비스 설명" rows="4" cols="130"></textarea>
                        		<button type="button" onclick="serviceadd()">+</button>
                        		<div id="serviceadd"></div>
					</div>
							<div class="form-group">
								<h4 class="card-title">서비스 가능한 동물</h4>
								<label>개
								<input type="radio" id="code" name="code" value="501"><span class="checkmark"></span></label>&emsp;
								<label>고양이
								<input type="radio" id="code" name="code" value="502"><span	class="checkmark"></span></label>&emsp; 
								<label>조류
								<input type="radio" id="code" name="code" value="503"><span class="checkmark"></span></label>&emsp; 
								<label>파충류
								<input type="radio" id="code" name="code" value="504"><span	class="checkmark"></span></label>&emsp;
								<label>어류
								<input type="radio" id="code" name="code" value="505"><span	class="checkmark"></span></label>&emsp; 
								<label>토끼
								<input type="radio" id="code" name="code" value="506"><span class="checkmark"></span></label>&emsp;
								<label>돼지
								<input type="radio" id="code" name="code" value="507"><span class="checkmark"></span></label>&emsp;
								<label>햄스터
								<input type="radio" id="code" name="code" value="508"><span	class="checkmark"></span></label>&emsp;
								<label>미어켓
								<input type="radio" id="code" name="code" value="509"><span	class="checkmark"></span></label>&emsp;
								<label>여우
								<input type="radio" id="code" name="code" value="510"><span class="checkmark"></span></label>&emsp; 
								<label>거미
								<input type="radio" id="code" name="code" value="511"><span	class="checkmark"></span></label>&emsp;
							</div>

						

							<h4 class="card-title">이미지를 등록하세요</h4>
						
							<div class="form-group">
								<label for="exampleInputPassword4">자격증 사진</label> <input
									type="file" name="multiFileList1" multiple class="form-control">
								<button type="button" onclick="addFile1()">+</button>
								<br>
								<div id="ffile1"></div>
							</div>

							<div class="form-group">
								<label for="exampleInputPassword4">활동 사진</label> <input
									type="file" name="multiFileList2" multiple class="form-control">
								<button type="button" onclick="addFile2()">+</button>
								<br>
								<div id="ffile2"></div>
							</div>

							<button type="submit" class="btn btn-primary mr-2">완료</button>
							<button type="button" class="btn btn-light" onclick="cancel()">취소</button>
						</form>
						
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script>
	function addO_Time(){
		var p_id = "${p_id.p_id}";
		var w_day = $("#w_day option:selected").val();
		var starttime = $("#starttime option:selected").val();
		var endtime =  $("#endtime option:selected").val();
		var n_content = $("#n_content").val();
		
		console.log(addO_Time);
		$.ajax({
			url : 'addO_Time',
			method: 'POST',
			data : {"p_id" : p_id,
					"w_day" : w_day,
					"starttime" : starttime ,
					"endtime" : endtime,
					"n_content" : n_content},
			success : function(res){
				var nice_div = $("#o_time_div")
				
				alert("추가되었습니다.");
				
				
				var $nice =	`<select id ="w_day" name="w_day">
				<option value='' selected disabled>요일선택</option>
				<option value='월'>월</option>
				<option value='화'>화</option>
				<option value='수'>수</option>
				<option value='목'>목</option>
				<option value='금'>금</option>
				<option value='토'>토</option>
				<option value='일'>일</option>
			</select>
			<select id="selectStart" name="starttime">
				<option value='' selected>오픈시간</option>
				<option value='9:00'>9:00</option>
				<option value='9:30'>9:30</option>
				<option value='10:30'>10:30</option>
				<option value='11:00'>11:00</option>
				<option value='12:00'>12:00</option>
				<option value='12:30'>12:30</option>
			</select>
			<select  id="selectEnd" name="endtime" >
				<option value='' selected>마감시간</option>
				<option value='13:00'>13:00</option>
				<option value='13:30'>13:30</option>
				<option value='14:00'>14:00</option>
				<option value='14:30'>14:30</option>
				<option value='15:00'>15:00</option>
				<option value='15:30'>15:30</option>
				<option value='16:00'>16:00</option>
				<option value='16:30'>16:30</option>
				<option value='17:00'>17:00</option>
				<option value='17:30'>17:30</option>
				<option value='18:00'>18:00</option>
				<option value='18:30'>18:30</option>
				<option value='19:00'>19:00</option>
				<option value='19:30'>19:30</option>
				<option value='20:00'>20:00</option>
				<option value='20:30'>20:30</option>
				<option value='21:00'>21:00</option>
			</select>
			<br>
			<input type="text" class="form-control" id="n_content" name="n_content">
			<button type="button" onclick="addO_Time()">추가</button>`
			nice_div.empty();
			nice_div.append($nice);
				$("select").niceSelect();
				
				
				
			}
		})
	}
         function addFile1(){
            var input = $('<input>').attr({
               'name' : 'multiFileList1',
               'type' : 'file'
            });
            
            $('#ffile1').append(input);
         }
         
         function addFile2(){
            var input = $('<input>').attr({
               'name' : 'multiFileList2',
               'type' : 'file'
            });
            
            $('#ffile2').append(input);
         }
         
         function serviceadd(){
             var input = $('<input>').attr({
                'name' : 'serviceadd',
                'type' : 'text'
             });
             
             $('#serviceadd').append(input);
          }
         
         function cancel(){
     		var p_id = "${p_id.p_id}";
     		console.log(p_id);
     		$.ajax({
     			url : 'joinCancel',
     			method : 'POST',
     			data : {"p_id" : p_id},
     			success : function(res){
     				alert("회원가입이 취소되었습니다.");
     				location.href="home";
     			}
     		})
     	}
         
      </script>
</body>
</html>