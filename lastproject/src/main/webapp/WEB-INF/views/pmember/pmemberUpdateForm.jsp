<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

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
							<div class="col-lg-9 col-md-9 blog_details">
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
									<input type="password" id="password" name="password" style="width: 350px;"
										placeholder="영문자+숫자+특수문자 조합으로 8이상입력">
								</div>
								<div class="form-group">
									<h3 style="font-weight: bolder;">비밀번호 재확인</h3>
									<input type="password" id="password1" name="password1" required>
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
								<div class="form-group" style="display: inline-block;">
									<select id="selectday" onchange="Time(this)" style="display: inline-block;">
										<option value='' selected>=== 요일선택 ===</option>
										<option value='월'>월</option>
										<option value='화'>화</option>
										<option value='수'>수</option>
										<option value='목'>목</option>
										<option value='금'>금</option>
										<option value='토'>토</option>
										<option value='일'>일</option>
									</select>
								</div>
								<div class="form-group" style="display: inline-block;">
									<select id="selectStart" onchange="selectDay()" style="display: inline-block;">
										<option value='' selected>=== 오픈시간 ===</option>
										<option value='월'>월</option>
										<option value='화'>화</option>
										<option value='수'>수</option>
										<option value='목'>목</option>
										<option value='금'>금</option>
										<option value='토'>토</option>
										<option value='일'>일</option>
									</select>
								</div>
								<div class="form-group" style="display: inline-block;">
									<select id="selectEnd" onchange="selectDay()" style="display: inline-block;">
										<option value='' selected>=== 마감시간 ===</option>
										<option value='월'>월</option>
										<option value='화'>화</option>
										<option value='수'>수</option>
										<option value='목'>목</option>
										<option value='금'>금</option>
										<option value='토'>토</option>
										<option value='일'>일</option>
									</select>
								</div>
								<input type="hidden" name="w_day" id="day">
								<input type="hidden" name="starttime">
								<input type="hidden" name="endtime">
								<div class="form-group"><input type="text" id="content" name="content"
										value="${pmember.n_content}"></div>
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
		function selectDay() {
			var selectDay = $("#runtime option:selected").val();
			document.getElementById('day').value = selectDay;
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