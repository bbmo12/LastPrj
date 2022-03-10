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
									style="width: 350px;" required>
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
								<div id="select-one">
								<div class="form-group" id="form-time">						
								<c:forEach items="${time }" var="timeList" varStatus="status">
									<select id="selectday" name="timeVOList[${status.index}].w_day">
										<option value='월' <c:if test="${timeList.w_day == '월' }">selected</c:if>>월</option>
										<option value='화' <c:if test="${timeList.w_day == '화' }">selected</c:if>>화</option>
										<option value='수' <c:if test="${timeList.w_day == '수' }">selected</c:if>>수</option>
										<option value='목' <c:if test="${timeList.w_day == '목' }">selected</c:if>>목</option>
										<option value='금' <c:if test="${timeList.w_day == '금' }">selected</c:if>>금</option>
										<option value='토' <c:if test="${timeList.w_day == '토' }">selected</c:if>>토</option>
										<option value='일' <c:if test="${timeList.w_day == '일' }">selected</c:if>>일</option>
									</select>
									<select id="selectStart" name="timeVOList[${status.index}].starttime">
										<option value='9:00' <c:if test="${timeList.starttime == '9:00' }">selected</c:if>>9:00</option>
										<option value='9:30' <c:if test="${timeList.starttime == '9:30' }">selected</c:if>>9:30</option>
										<option value='10:00' <c:if test="${timeList.starttime == '10:00' }">selected</c:if>>10:00</option>
										<option value='10:30' <c:if test="${timeList.starttime == '10:30' }">selected</c:if>>10:30</option>
										<option value='11:00' <c:if test="${timeList.starttime == '11:00' }">selected</c:if>>11:00</option>
										<option value='11:30' <c:if test="${timeList.starttime == '11:30' }">selected</c:if>>11:30</option>
										<option value='12:00' <c:if test="${timeList.starttime == '12:00' }">selected</c:if>>12:00</option>
										<option value='12:30' <c:if test="${timeList.starttime == '12:30' }">selected</c:if>>12:30</option>
									</select>
									<select id="selectEnd" name="timeVOList[${status.index}].endtime" >
										<option value='13:00' <c:if test="${timeList.endtime == '13:00' }">selected</c:if>>13:00</option>
										<option value='13:30' <c:if test="${timeList.endtime == '13:30' }">selected</c:if>>13:30</option>
										<option value='14:00' <c:if test="${timeList.endtime == '14:00' }">selected</c:if>>14:00</option>
										<option value='14:30' <c:if test="${timeList.endtime == '14:30' }">selected</c:if>>14:30</option>
										<option value='15:00' <c:if test="${timeList.endtime == '15:00' }">selected</c:if>>15:00</option>
										<option value='15:30' <c:if test="${timeList.endtime == '15:30' }">selected</c:if>>15:30</option>
										<option value='16:00' <c:if test="${timeList.endtime == '16:00' }">selected</c:if>>16:00</option>
										<option value='16:30' <c:if test="${timeList.endtime == '16:30' }">selected</c:if>>16:30</option>
										<option value='17:00' <c:if test="${timeList.endtime == '17:00' }">selected</c:if>>17:00</option>
										<option value='17:30' <c:if test="${timeList.endtime == '17:30' }">selected</c:if>>17:30</option>
										<option value='18:00' <c:if test="${timeList.endtime == '18:00' }">selected</c:if>>18:00</option>
										<option value='18:30' <c:if test="${timeList.endtime == '18:30' }">selected</c:if>>18:30</option>
										<option value='19:00' <c:if test="${timeList.endtime == '19:00' }">selected</c:if>>19:00</option>
										<option value='19:30' <c:if test="${timeList.endtime == '19:30' }">selected</c:if>>19:30</option>
										<option value='20:00' <c:if test="${timeList.endtime == '20:00' }">selected</c:if>>20:00</option>
										<option value='20:30' <c:if test="${timeList.endtime == '20:30' }">selected</c:if>>20:30</option>
										<option value='21:00' <c:if test="${timeList.endtime == '21:00' }">selected</c:if>>21:00</option>
									</select><br>
									<input type="hidden" name="timeVOList[${status.index}].p_id" value="${pId}">
								</c:forEach>
								</div>
								</div>
								<button type="button" class="genric-btn info radius" id="addDiv" onclick="plusTime()">시간추가</button><br>						                
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
								<button type="submit" class="genric-btn info radius">수정완료</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	 <script>	
		function addFile() {
			var input = $('<input>').attr({
				'name': 'multiFileList',
				'type': 'file'
			});

			$('#ffile').append(input);
		}

		function plusTime() {
			var select = document.getElementById('select-one');
			var form = document.getElementById('form-time');
			form.innerHTML += `							
					<select id="selectday" name="selectday">
					<option value='' selected>요일선택</option>
					<option value='월'>월</option>
					<option value='화'>화</option>
					<option value='수'>수</option>
					<option value='목'>목</option>
					<option value='금'>금</option>
					<option value='토'>토</option>
					<option value='일'>일</option>
				</select>																	
				<select id="selectStart" name="selectStart">
					<option value='' selected>오픈시간</option>
					<option value='9:00'>9:00</option>
					<option value='9:30'>9:30</option>
					<option value='10:30'>10:30</option>
					<option value='11:00'>11:00</option>
					<option value='12:00'>12:00</option>
					<option value='12:30'>12:30</option>				
				</select>																					
				<select id="selectEnd" name="selectEnd">
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
				</select><br>`;
			select.append(form);
			$('select').niceSelect();
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
			var pwdCheck = /^[A-Za-z0-9]{4,12}$/;
				         
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