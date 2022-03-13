<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
		integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="resources/login/my-login.css">
</head>

<body class="my-login-page">
	<div class="container">
		<div class="row justify-content-md-center" style="margin-top: 7em; height: 1000px;">
			<div class="card-wrapper" style="width: 650px;">
				<div class="brand">
					<img src="resources/login/logo.jpg" alt="logo">
				</div>
				<div class="card fat" style="margin-top: -15px;">
					<div class="card-body">
						<h4 class="card-title">사업자정보입력</h4>
						<label for="name">운영시간</label>
						<div class="form-group" id="o_time_div">
							<select id="w_day" name="w_day">
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
							<select id="endtime" name="endtime">
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
							<input type="text" class="form-control" id="n_content" name="n_content" style="width: 465px;margin-top: 10px;">
						</div>
						<button type="button" class="btn btn-primary mr-2" onclick="addO_Time()" style="margin: -87px 0 0 30em;">시간추가</button>
						<h4 class="card-title">서비스 정보를 입력해주세요.</h4>
						<div id="serviceMain">
							<div class="form-group">
								<label for="name">서비스명</label>
								<input id="title" name="title" type="text" class="form-control" placeholder="서비스명을 입력해주세요.">
							</div>
							<div class="form-group">		
								<label for="exampleInputPassword4">금 액</label>
								<input type="text" class="form-control" id="price" name="price"	placeholder="해당하는 서비스 금액을 입력해주세요.">
							</div>
							<div class="form-group">	
								<label for="exampleInputPassword4">서비스안내</label>
								<textarea class="form-control" id="content" name="content" placeholder="해당하는 서비스 추가 설명을 입력해주세요." rows="3" cols="130"></textarea>
							</div>
						</div>	
						<button type="button" class="btn btn-primary mr-2" onclick="addService()" style="position: relative; left: 445px;">서비스추가</button>
						<form action="pjoin_3" method="post" enctype="multipart/form-data" class="my-login-validation">
							<input type="hidden" class="form-control" id="p_id" name="p_id" value="${p_id.p_id}">
							<div class="form-group">
								<label>서비스 가능한 동물</label>
							</div>
							<label>개
								<input type="radio" id="code" name="code" value="501"><span class="checkmark"></span>
							</label>&emsp;
							<label>고양이
								<input type="radio" id="code" name="code" value="502"><span class="checkmark"></span>
							</label>&emsp;
							<label>조류
								<input type="radio" id="code" name="code" value="503"><span class="checkmark"></span>
							</label>&emsp;
							<label>파충류
								<input type="radio" id="code" name="code" value="504"><span class="checkmark"></span>
							</label>&emsp;
							<label>어류
								<input type="radio" id="code" name="code" value="505"><span class="checkmark"></span>
							</label>&emsp;
							<label>토끼
								<input type="radio" id="code" name="code" value="506"><span class="checkmark"></span>
							</label>&emsp;<br>
							<label>돼지
								<input type="radio" id="code" name="code" value="507"><span class="checkmark"></span>
							</label>&emsp;
							<label>햄스터
								<input type="radio" id="code" name="code" value="508"><span class="checkmark"></span>
							</label>&emsp;
							<label>미어켓
								<input type="radio" id="code" name="code" value="509"><span class="checkmark"></span>
							</label>&emsp;
							<label>여우
								<input type="radio" id="code" name="code" value="510"><span class="checkmark"></span>
								</label>&emsp;
							<label>거미
								<input type="radio" id="code" name="code" value="511"><span class="checkmark"></span>
								</label>&emsp;
							<h4 class="card-title" style="margin-top: 25px;">경력증명 이미지를 등록해주세요.</h4>
							<div class="form-group" style="margin-top: -10px;">
								<label>자격증</label>
								<input class="file-upload-browse btn btn-primary" type="file" name="multiFileList1" multiple="multiple">
								<button type="button" class="btn btn-primary btn-sm" onclick="addFile1()">+</button>
								<div id="ffile1"></div>
							</div>
							<div class="form-group">
								<label>활동사진</label>
								<input class="file-upload-browse btn btn-primary" type="file" name="multiFileList2" multiple="multiple">
								<button type="button" class="btn btn-primary btn-sm" onclick="addFile2()">+</button>
								<div id="ffile2"></div>
							</div>
							<button type="submit" class="btn btn-primary mr-2" style="width: 100px;">완료</button>
							<button class="btn btn-light" onclick="cancel()" style="width: 100px;">취소</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="resources/login/my-login.js"></script>
	<script>
		function addService() {
			var p_id = "${p_id.p_id}";
			var title = $('#title').val();
			var price = $('#price').val();
			var content =$('#content').val();
			$.ajax({
				url : 'addService',
				method : 'POST',
				data : {
					'p_id' : p_id,
					'title' : title,
					'price' : price,
					'content' : content
				},
				success: function (res) {
					console.log("ggggggggggggggggg"+res);
					var service_div = $('#serviceMain');
					alert("서비스가 추가되었습니다.");
					var $service =`
					<div class="form-group">
						<label for="name">서비스명</label>
						<input id="title" name="title" type="text" class="form-control" placeholder="서비스명을 입력해주세요.">
					</div>
					<div class="form-group">		
						<label for="exampleInputPassword4">금 액</label>
						<input type="text" class="form-control" id="price" name="price"	placeholder="해당하는 서비스 금액을 입력해주세요.">
					</div>
					<div class="form-group">	
						<label for="exampleInputPassword4">서비스안내</label>
						<textarea class="form-control" id="content" name="content" placeholder="해당하는 서비스 추가 설명을 입력해주세요." rows="3" cols="130"></textarea>
					</div>`
					service_div.empty();
					service_div.append($service);
				}
			});
		}
		function addO_Time() {
			var p_id = "${p_id.p_id}";
			var w_day = $("#w_day option:selected").val();
			var starttime = $("#starttime option:selected").val();
			var endtime = $("#endtime option:selected").val();
			var n_content = $("#n_content").val();
			$.ajax({
				url: 'addO_Time',
				method: 'POST',
				data: {
					"p_id": p_id,
					"w_day": w_day,
					"starttime": starttime,
					"endtime": endtime,
					"n_content": n_content
				},
				success: function (res) {
					var nice_div = $("#o_time_div")
					alert("운영 시간이 추가되었습니다.");
					var $nice = `
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
			<select id="endtime" name="endtime" >
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
			<input type="text" class="form-control" id="n_content" name="n_content" style="width: 465px; margin-top: 10px;">`
					nice_div.empty();
					nice_div.append($nice);
					$("select").niceSelect();
				}
			})
		}
		function addFile1() {
			var input = $('<input>').attr({
				'class': 'file-upload-browse btn btn-primary',
				'name': 'multiFileList1',
				'type': 'file'
			}).css('margin-top', '3px');
			$('#ffile1').append(input);
		}
		function addFile2() {
			var input = $('<input>').attr({
				'class': 'file-upload-browse btn btn-primary',
				'name': 'multiFileList2',
				'type': 'file'
			}).css('margin-top', '3px');
			$('#ffile2').append(input);
		}
		function serviceadd() {
			var input = $('<input>').attr({
				'name': 'serviceadd',
				'type': 'text'
			});

			$('#serviceadd').append(input);
		}

		function cancel() {
			var p_id = "${p_id.p_id}";
			console.log(p_id);
			$.ajax({
				url: 'joinCancel',
				method: 'POST',
				data: {
					"p_id": p_id
				},
				success: function (res) {
					alert("회원가입이 취소되었습니다.");
					location.href = "home";
				}
			})
		}
	</script>
</body>

</html>