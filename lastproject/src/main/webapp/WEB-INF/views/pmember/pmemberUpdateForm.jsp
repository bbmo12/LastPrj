<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<style>
	#my_section {
		padding: 50px;
	}
</style>

<body>
	<section class="banner-area other-page">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<h1>MyPage</h1>
					<a href="home">Home</a> <span>|</span> <a href="pmemberMyPage">MyPage</a>
				</div>
			</div>
		</div>
	</section>
	<section id="my_section">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="blog_right_sidebar">
						<aside class="single_sidebar_widget author_widget">
							<img class="author_img rounded-circle" src="resources/upload/${pmember.picture}"
								style="width: 210px" alt="">
							<div class="br"></div>
							<h4>${pmember.name }</h4>
							<div class="br"></div>
						</aside>
						<aside class="single_sidebar_widget post_category_widget">
							<h4 class="widget_title">My menu</h4>
							<ul class="list cat-list">
								<li><a href="pmemberMyPage" class="d-flex justify-content-between">
										<p>내 프로필</p>
									</a></li>
								<li><a href="#" class="d-flex justify-content-between">
										<p>예약 내역</p>
									</a></li>
								<li><a href="#" class="d-flex justify-content-between">
										<p>상담 내역</p>
									</a></li>
								<li><a href="#" class="d-flex justify-content-between">
										<p>신고 내역</p>
									</a></li>
								<li><a href="#" class="d-flex justify-content-between">
										<p>로그아웃</p>
									</a></li>
								<li><a href="#" class="d-flex justify-content-between">
										<p>회원탈퇴</p>
									</a></li>
							</ul>
						</aside>
					</div>
				</div>
				<div class="col-lg-9 posts-list">
					<div class="single-post row">
						<form action="pmemberUpdate" enctype="multipart/form-data" name="updatePage" method="post"
							onSubmit="return checkForm()">
							<div class="col-lg-9 col-md-9 blog_details" id="main-form">
								<div class="form-group">
									<h3 style="font-weight: bolder;">이름</h3>
									<input type="text" id="name" name="name" value="${pmember.name}">
								</div>
								<div class="form-group">
									<h3 style="font-weight: bolder;">아이디</h3>
									<input type="email" style="border: none" id="p_id" name="p_id"
										value="${pmember.p_id}" readonly>
								</div>
								<div class="form-group">
									<h3 style="font-weight: bolder;">비밀번호</h3>
									<input type="password" id="password" name="password" value="${pmember.password }"
										style="width: 350px;" placeholder="영문자+숫자+특수문자 조합으로 8이상입력">
								</div>
								<div class="form-group">
									<h3 style="font-weight: bolder;">비밀번호 재확인</h3>
									<input type="password" id="password1" name="password1" value="${pmember.password }"
										required>
								</div>
								<div class="form-group">
									<h3 style="font-weight: bolder;">전화번호</h3>
									<input type="tel" id="tel" name="tel" value="${pmember.tel}"
										placeholder="숫자만 입력하세요." maxlength="13">
								</div>
								<div class="form-group">
									<h3 style="font-weight: bolder;">사업장 이름</h3>
									<input type="text" id="w_name" name="w_name" value="${pmember.w_name}">
								</div>
								<div class="form-group">
									<h3 style="font-weight: bolder;">사업장 주소</h3>
									<input type="text" id="address" name="address" value="${pmember.w_address}"> <input
										type="text" id="address1" name="address1" value="${pmember.w_d_address }">
								</div>
								<div class="form-group">
									<h3 style="font-weight: bolder;">사업장 전화번호</h3>
									<input type="tel" id="w_tel" name="w_tel" value="${pmember.w_tel}" maxlength="13"
										placeholder="숫자만 입력하세요.">
								</div>
								<div class="form-group">
									<h3 style="font-weight: bolder;">운영안내</h3>
								</div>
								<div class="form-group" id="form-time">						
								<c:forEach items="${pmember.timeList }" var="timeList">
								<select id="selectday" name="selectday" onchange="addDay()">
											<option value='월' <c:if test="${timeList.w_day == '월' }">selected</c:if>>월</option>
											<option value='화'<c:if test="${timeList.w_day == '화' }">selected</c:if>>화</option>
											<option value='수'<c:if test="${timeList.w_day == '수' }">selected</c:if>>수</option>
											<option value='목'<c:if test="${timeList.w_day == '목' }">selected</c:if>>목</option>
											<option value='금'<c:if test="${timeList.w_day == '금' }">selected</c:if>>금</option>
											<option value='토'<c:if test="${timeList.w_day == '토' }">selected</c:if>>토</option>
											<option value='일'<c:if test="${timeList.w_day == '일' }">selected</c:if>>일</option>
										</select>
										<select id="selectStart" name="selectStart" onchange="startTime()">
											<option value='9:00'<c:if test="${timeList.starttime == '9:00' }">selected</c:if>>9:00</option>
											<option value='9:30'<c:if test="${timeList.starttime == '9:30' }">selected</c:if>>9:30</option>
											<option value='10:00'<c:if test="${timeList.starttime == '10:00' }">selected</c:if>>10:00</option>
											<option value='10:30'<c:if test="${timeList.starttime == '10:30' }">selected</c:if>>10:30</option>
											<option value='11:00'<c:if test="${timeList.starttime == '11:00' }">selected</c:if>>11:00</option>
											<option value='11:30'<c:if test="${timeList.starttime == '11:30' }">selected</c:if>>11:30</option>
											<option value='12:00'<c:if test="${timeList.starttime == '12:00' }">selected</c:if>>12:00</option>
											<option value='12:30'<c:if test="${timeList.starttime == '12:30' }">selected</c:if>>12:30</option>
										</select>
										<select id="selectEnd" name="selectEnd" onchange="endTime()">
											<option value='13:00'<c:if test="${timeList.endtime == '13:00' }">selected</c:if>>13:00</option>
											<option value='13:30'<c:if test="${timeList.endtime == '13:30' }">selected</c:if>>13:30</option>
											<option value='14:00'<c:if test="${timeList.endtime == '14:00' }">selected</c:if>>14:00</option>
											<option value='14:30'<c:if test="${timeList.endtime == '14:30' }">selected</c:if>>14:30</option>
											<option value='15:00'<c:if test="${timeList.endtime == '15:00' }">selected</c:if>>15:00</option>
											<option value='15:30'<c:if test="${timeList.endtime == '15:30' }">selected</c:if>>15:30</option>
											<option value='16:00'<c:if test="${timeList.endtime == '16:00' }">selected</c:if>>16:00</option>
											<option value='16:30'<c:if test="${timeList.endtime == '16:30' }">selected</c:if>>16:30</option>
											<option value='17:00'<c:if test="${timeList.endtime == '17:00' }">selected</c:if>>17:00</option>
											<option value='17:30'<c:if test="${timeList.endtime == '17:30' }">selected</c:if>>17:30</option>
											<option value='18:00'<c:if test="${timeList.endtime == '18:00' }">selected</c:if>>18:00</option>
											<option value='18:30'<c:if test="${timeList.endtime == '18:30' }">selected</c:if>>18:30</option>
											<option value='19:00'<c:if test="${timeList.endtime == '19:00' }">selected</c:if>>19:00</option>
											<option value='19:30'<c:if test="${timeList.endtime == '19:30' }">selected</c:if>>19:30</option>
											<option value='20:00'<c:if test="${timeList.endtime == '20:00' }">selected</c:if>>20:00</option>
											<option value='20:30'<c:if test="${timeList.endtime == '20:30' }">selected</c:if>>20:30</option>
											<option value='21:00'<c:if test="${timeList.endtime == '21:00' }">selected</c:if>>21:00</option>
										</select><br>	
																							
								</c:forEach>		
										<input name="w_day" id="w_day" value="">
									    <input name="starttime" id="starttime" value="">
									    <input name="endtime" id="endtime" value="">						                
								</div>
								<div class="form-group">
									<input type="text" id="content" name="content" value="${pmember.n_content}"></div>
								<div class="form-group">
									<h3 style="font-weight: bolder;">사업장 소개</h3>
									<textarea id="p_info" name="p_info" cols="100" rows="3">${pmember.p_info}</textarea>
								</div>
								<div class="form-group">
									<h3 style="font-weight: bolder;">경력</h3>
									<input type="text" id="career" name="career" value="${pmember.career}">
								</div>
								<div class="form-group">
									<h3 style="font-weight: bolder;">프로필 사진</h3>
									<div class="input-group col-xs-12">
										<input class="file-upload-browse btn btn-primary" type="file" id="file"
											name="file">
									</div>
								</div>
								<button type="submit" id="updatePage" class="genric-btn info radius">수정완료</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	 <script>
	 	function addDay() {
	 		var dayArray = [];	 		
	 		$('select[name=selectday] option:selected').each(function (index) {
				var day = $(this).attr('value');
				dayArray.push(day);
			});
	 		var insertday = $('input[name=w_day').val(dayArray);
	 		console.log(insertday);
	 	}
		function startTime() {
			var startArray = [];			
	 		$('select[name=selectStart] option:selected').each(function (index) {
				var day = $(this).attr('value');				
				startArray.push(day);						
			});	 	
			var start = $('input[name=starttime').val(startArray);
		}
		function endTime() {
			var endArray = [];
	 		$('select[name=selectEnd] option:selected').each(function (index) {
				var day = $(this).attr('value');				
				endArray.push(day);
			});	 	
			var end = $('input[name=endtime').val(endArray);
		} 
	
		function addFile() {
			var input = $('<input>').attr({
				'name': 'multiFileList',
				'type': 'file'
			});

			$('#ffile').append(input);
		}

		function checkForm() {
			if (updatePage.name.value == "") {
				alert("이름을 입력하세요.");
				updatePage.name.focus();
				return false;
			}
			if (updatePage.password.value == "") {
				alert("비밀번호 입력하세요.");
				updatePage.password.focus();
				return false;
			}
			/* 	
			var pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,}$/;
			        	         
			if(!pwdCheck.test(updatePage.password.value)){
				alert("비밀번호는 영문자+숫자+특수문자 조합으로 8이상 사용해야 합니다.");
				updatePage.password.focus(); 
				return false; 
			}
			if( updatePage.password.value !== updatePage.password1.value ){
				alert("비밀번호가 일치하지 않습니다."); 
				updatePage.password1.focus(); 
				return false; 
			} */
			if (updatePage.tel.value == "" || updatePage.w_tel.value == "") {
				alert("전화번호를 입력해주세요.");
				updatePage.tel.focus();
				return false;
			}
			if (updatePage.w_name.value == "") {
				alert("사업장 이름을 입력주세요.");
				updatePage.w_name.focus();
				return false;
			}
			if (updatePage.address.value == "" &&
				updatePage.address1.value == "") {
				alert("사업장 주소를 입력주세요.");
				updatePage.address1.focus();
				return false;
			}
		}
	</script>
</body>

</html>