<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	#my_section {
		margin-top: -70px;
    	padding-bottom: 25px;
	}

	#main-form h3,
	input {
		display: inline-block;
	}

	#addDiv,
	#addService {
		margin: -5px 0 0 35em;
		color: #fff; 
    	background: #0062ff;
    	border: 1px solid transparent;	
    	width: 115px;
	}
	#addDiv:hover,
	#addService:hover{
		color: #0062ff;
		border: 1px solid #0062ff;
		background: #fff;
	}
	#price-insert,
	#time-insert{
		color: #fff; 
    	background: #0062ff;
    	border: 1px solid transparent;	
	}
	
	#price-insert:hover,
	#time-insert:hover{
		color: #0062ff;
		border: 1px solid #0062ff;
		background: #fff;
	}

	#select-one {
		margin-top: -20px;
	}

	.form-control {
		padding: 5px;
		width: 250px;
		display: inline-block;
		border-radius: 20px;
	}

	.service-info {
		display: inline-grid;
	}

	.service-info input {
		width: 100px;
	}

	#p-info {
		margin-left: 5em;
		margin-top: -20px;
	}

	.delete-button {
		float: right;
		margin: 27px 200px 0 0;
		width: 62px;
	}

	#p_info {
		border: 1px solid rgba(151, 151, 151, 0.3);
		width: 700px;
	}
	#cancel{
		width: 113px;
    	height: 42px;
    	padding: 0 30px;
    	font-size: .8em;
    	text-align: center;
    	font-weight: 500;
	}
	#member_post{
		width: 100px;
    	margin-left: 53em;
    	margin-top: -70px;  	
    	color: #fff; 
    	background: #0062ff;
    	border: 1px solid transparent;	
	}
	#member_post:hover {
		color: #0062ff;
		border: 1px solid #0062ff;
		background: #fff;
	}
	#successUpdate{
		color: #fff; 
    	background: #0062ff;
    	border: 1px solid transparent;	
	}
	#successUpdate:hover {
		color: #0062ff;
		border: 1px solid #0062ff;
		background: #fff;
	}
	
	input:focus,
	textarea:focus{ 
		border: 3px solid;
	}
	
	#content{
		height: 45px;
    	padding: 12px;
   		width: 285px;
	}
	
	.no_deco {
		text-decoration: none !important;
		font-size: 0.8rem !important;
		color: black;
	}

	.blog_right_sidebar {
		box-shadow: 0 .15rem 1.75rem 0 rgba(58, 59, 69, .1) !important;
		border: 1px solid #e3e6f0;
		border-radius: 0.35rem;
		float: none !important;
		margin: 0 auto !important;
		background-color: white;
		width: 250px;
	}

	.partner_img {
		object-fit: cover;
		object-position: top;
		border-radius: 50%;
		width: 180px !important;
		height: 180px !important;
		float: none;
		margin: 0 auto;
	}

	#Mainname {
		font-size: 1.5rem !important;
		/* font-family: 'NanumBarunGothic' !important; */
		font-style: normal !important;
		font-weight: 700 !important;
		color: gray;
	}

	#myinfo {
		font-size: 0.8rem;
		/* font-family: 'NanumBarunGothic'; */
		font-style: normal;
		font-weight: 300;
	}

	#menu_bold {
		font-size: 1.0rem;
		/* font-family: 'NanumBarunGothic'; */
		font-style: normal;
		font-weight: 700;
		color: black;
	}
	.card {
		box-shadow: 0 .15rem 1.75rem 0 rgba(58, 59, 69, .1) !important;
		border: 1px solid #e3e6f0;
		border-radius: 0.35rem;
		padding: 20px;
	}
	.card-header{
		background: white;
		font-size: 1.0rem;
		/* font-family: 'NanumBarunGothic'; */
		font-style: normal;
		font-weight: 400;
		color: black;
		width: 797px;
		margin: -17px 0 20px -20px;
		padding-left: 15px;
	}
	i{
		color: black;
	}
	
	.control-width{
	    width: 160px;
    	display: inline-block;
	}
	
	.checkout__input input.checkout__input__add {
	margin-bottom: 20px;
}

.checkout__input input::placeholder {
	color: #b2b2b2;
}

.checkout__input__checkbox {
	margin-bottom: 10px;
}

.checkout__input__checkbox label {
	position: relative;
	font-size: 16px;
	color: #1c1c1c;
	padding-left: 40px;
	cursor: pointer;
}

.checkout__input__checkbox label input {
	position: absolute;
	visibility: hidden;
}

.checkout__input__checkbox label input:checked~.checkmark {
	background: #7fad39;
	border-color: #7fad39;
}

.checkout__input__checkbox label input:checked~.checkmark:after {
	opacity: 1;
}

.checkout__input__checkbox label .checkmark {
	position: absolute;
	left: 0;
	top: 4px;
	height: 16px;
	width: 14px;
	border: 1px solid #a6a6a6;
	content: "";
	border-radius: 4px;
}

.checkout__input__checkbox label .checkmark:after {
	position: absolute;
	left: 1px;
	top: 1px;
	width: 10px;
	height: 8px;
	border: solid white;
	border-width: 3px 3px 0px 0px;
	-webkit-transform: rotate(127deg);
	-ms-transform: rotate(127deg);
	transform: rotate(127deg);
	content: "";
	opacity: 0;
}
	
	
</style>
<script>
		
		
		//모든 공백 체크 정규식
		var empJ = /\s/g;
		//아이디 정규식
		var idJ = /^[a-z0-9][a-z0-9_\-]{4,19}$/;
		// 비밀번호 정규식
		var pwJ = /^[A-Za-z0-9]{4,12}$/;
		// 이름 정규식
		var nameJ = /* /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/; */ RegExp(/^[가-힣]{2,4}$/);
		// 이메일 검사 정규식
		var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		// 휴대폰 번호 정규식
		var phoneJ = /^01([016789])([0-9]{3,4})([0-9]{4})$/;
		var birthJ = false;
		
		// 회사번호 정규식
		
		var w_telJ = /^([0-9]{10,11})$/;
		var w_d_addressJ = /^[a-zA-Z0-9가-힣]*$/;
		var p_infoJ = /^.{1,300}$/;
		var w_nameJ = /^.{1,30}$/;
		
		$(document).ready(function () {
			/* 아이디 중복체크 */
			$('form').on('submit', function () {
				var inval_Arr = new Array(11).fill(false);
				if ($('#idCheck').val() === 'NO') {
					alert("아이디 중복체크를 해주세요.");
					inval_Arr[0] = false;
					return false;
				} else if ($('#idCheck').val() === 'YES') {
					inval_Arr[0] = true;
				}
				if ($("#password").val() != $("#password1").val()) {
					alert("패스워드가 일치하지 않습니다.");
					$("#password").val('');
					$("#password1").val('');
					$("#password").focus();
					inval_Arr[1] = false;
					return false;
				} else {
					inval_Arr[1] = true;
				}
				
				
				// 상세주소 정규식
				if (w_d_addressJ.test($('#w_d_address').val())) {
					inval_Arr[2] = true;
				} else {
					inval_Arr[2] = false;
					alert('주소를 확인하세요.');
					return false;
				}
				
				
				// 자기소개 정규식
				if (p_infoJ.test($('#p_info').val())) {
					inval_Arr[3] = true;
				} else {
					inval_Arr[3] = false;
					alert('회사소개를 확인하세요.');
					return false;
				}
				
				// 경력 정규식
				if (p_infoJ.test($('#career').val())) {
					inval_Arr[4] = true;
				} else {
					inval_Arr[4] = false;
					alert('경력소개를 확인하세요.');
					return false;
				}
				
				// 자기소개 정규식
				if (p_infoJ.test($('#speciality').val())) {
					inval_Arr[5] = true;
				} else {
					inval_Arr[5] = false;
					alert('전문분야를 확인하세요.');
					return false;
				}
				
				// 자격증 정규식
				if (noJ.test($('#no').val())) {
					inval_Arr[6] = true;
				} else {
					inval_Arr[6] = false;
					alert('자격증 번호를 확인하세요.');
					return false;
				}
				
				// 이름 정규식
				if (nameJ.test($('#name').val())) {
					inval_Arr[7] = true;
				} else {
					inval_Arr[7] = false;
					alert('이름을 확인하세요.');
					return false;
				}
				// 휴대폰번호 정규식
				if (phoneJ.test($('#tel').val())) {
					console.log(phoneJ.test($('#tel').val()));
					inval_Arr[8] = true;
				} else {
					inval_Arr[8] = false;
					alert('휴대폰 번호를 확인하세요.');
					return false;
				}
				
				// 회사이름 정규식
				if (w_nameJ.test($('#w_name').val())) {
					inval_Arr[9] = true;
				} else {
					inval_Arr[9] = false;
					alert('회사이름을 확인하세요.');
					return false;
				}
				
				// 회사번호 정규식
				if (w_telJ.test($('#w_tel').val())) {
					inval_Arr[10] = true;
				} else {
					inval_Arr[10] = false;
					alert('회사전화번호를 확인하세요.');
					return false;
				}
				
				return true;
			});
			$('#password').blur(function () {
				if (pwJ.test($('#password').val())) {
					console.log('true');
					$('#pw_check').text('');
				} else {
					console.log('false');
					$('#pw_check').text('4~12자의 숫자 , 문자로만 사용 가능합니다.');
					$('#pw_check').css('color', 'red');
				}
			});
			//1~2 패스워드 일치 확인
			$('#password1').blur(function () {
				if ($('#password').val() != $(this).val()) {
					$('#pw1_check').text('비밀번호가 일치하지 않습니다.');
					$('#pw1_check').css('color', 'red');
				} else {
					$('#pw1_check').text('');
				}
			});
			
			//상세주소
			$('#w_d_address').blur(function () {
				if (w_d_addressJ.test($('#w_d_address').val())) {
					console.log('true');
					$('#w_d_address_check').text('');
				} else {
					console.log('false');
					$('#w_d_address_check').text('주소 확인부탁드립니다..');
					$('#w_d_address_check').css('color', 'red');
				}
			});
			
			//자기 소개
			$('#p_info').blur(function () {
				if (p_infoJ.test($('#p_info').val())) {
					console.log('true');
					$('#p_info_check').text('');
				} else {
					console.log('false');
					$('#p_info_check').text('자기소개 확인부탁드립니다..');
					$('#p_info_check').css('color', 'red');
				}
			});
			
			//경력 소개
			$('#career').blur(function () {
				if (p_infoJ.test($('#career').val())) {
					$('#career_check').text('');
				} else {
					console.log('false');
					$('#career_check').text('경력확인 부탁드립니다..');
					$('#career_check').css('color', 'red');
				}
			});
			
			
			//전문분야 소개
			$('#speciality').blur(function () {
				if (p_infoJ.test($('#speciality').val())) {
					$('#speciality_check').text('');
				} else {
					console.log('false');
					$('#speciality_check').text('전문분야 소개 확인부탁드립니다..');
					$('#speciality_check').css('color', 'red');
				}
			});
			
			//이름에 특수문자 들어가지 않도록 설정
			$("#name").blur(function () {
				if (nameJ.test($(this).val())) {
					console.log(nameJ.test($(this).val()));
					$("#name_check").text('');
				} else {
					$('#name_check').text('한글 3자 이내로 입력하세요. (특수기호, 공백 사용 불가)');
					$('#name_check').css('color', 'red');
				}
			});
			
		
			
			// 휴대전화
			$('#tel').blur(function () {
				if (phoneJ.test($(this).val())) {
					console.log(phoneJ.test($(this).val()));
					$("#tel_check").text('');
				} else {
					$('#tel_check').text('휴대폰번호를 확인해주세요 ');
					$('#tel_check').css('color', 'red');
				}
			});
			
			//회사이름
			$("#w_name").blur(function () {
				if (w_nameJ.test($(this).val())) {
					console.log(w_nameJ.test($(this).val()));
					$("#w_name_check").text('');
				} else {
					$('#w_name_check').text('회사이름을 확인해주세요.');
					$('#w_name_check').css('color', 'red');
				}
			});
			
			//전문분야 소개
			$('#w_tel').blur(function () {
				if (w_telJ.test($('#w_tel').val())) {
					$('#w_tel_check').text('');
				} else {
					console.log('false');
					$('#w_tel_check').text('전문분야 소개 확인부탁드립니다..');
					$('#w_tel_check').css('color', 'red');
				}
			});
			
		});
	</script>



<body>
	<section class="department-area" style="padding: 30px 0 30px;">
		<div class="container">
			<div class="col-lg-6 offset-lg-3">
				<div class="section-top text-center">
					<br><br><br>
					<h2></h2>
				</div>
			</div>
		</div>
	</section>
	<section id="my_section">
		<div class="container" style="max-width: 1350px;">
			<div class="row">
				<div class="col-lg-3">
					<h2 align="center">MyPage</h2>
					<br>
					<div class="blog_right_sidebar">
						<aside class="single_sidebar_widget author_widget">
							<img class="partner_img" src="resources/upload/${pmember.picture}"
								onerror="this.src='resources/upload/pet.PNG'"style="width: 210px; height: 167px;">
							<br><br>
							<h4 id="Mainname">${pmember.name }님</h4>
							<div class="br"></div>
							<div id="myinfo">
								<i class="fa-solid fa-pen"></i>&nbsp;<a class="no_deco" href="confirmPass">내 정보 수정하기</a>
							</div>
						</aside>
					</div><br>
					<div class="blog_right_sidebar">
						<aside class="single_sidebar_widget post_category_widget">
							<h4 class="widget_title">My menu</h4>
							<ul class="list cat-list nanumbarungothic">
								<p id="menu_bold">내 활동 내역</p>
								<li><a href="reservationSetting" class="d-flex justify-content-between">
										<p>예약일정 설정</p>
									</a></li>
								<li><a href="preservationSelect" class="d-flex justify-content-between">
										<p>예약 내역</p>
									</a></li>
								<li><a href="pMemDiaList" class="d-flex justify-content-between">
										<p>진료 내역</p>
									</a></li>
								<li><a href="pMembenefit" class="d-flex justify-content-between">
										<p>결제 내역</p>
									</a></li>
								<li><a href="pmemcounsel" class="d-flex justify-content-between">
										<p>상담 내역</p>
									</a></li>
								<li><a href="pmemreport" class="d-flex justify-content-between">
										<p>신고 내역</p>
									</a></li>
								<br><br>
								<p id="menu_bold">회원 정보 관리</p>
								<li><a href="confirmPass" class="d-flex justify-content-between no_deco">
										<p>회원 정보 수정</p>
									</a></li>
								<li><a href="logout" class="d-flex justify-content-between">
										<p>로그아웃</p>
									</a></li>
								<li><a href="pmdeleteForm" class="d-flex justify-content-between">
										<p>회원탈퇴</p>
									</a></li>
							</ul>
						</aside>
					</div>
				</div>
				<div class="col-lg-9 posts-list">
						<form action="pmemberUpdate" enctype="multipart/form-data" id="f" name="updatePage" method="post" onsubmit="return checkForm()">
							<div id="main-form"  style="width: 800px;">
							<div class="card">
							<div class="card-header">
								<i class="fa-solid fa-bell"></i>&nbsp;&nbsp;내정보수정
							</div>
								<div class="form-group">
									<div class="control-width"><i class="fas fa-user"></i>
									<h3 style="font-weight: bolder;">이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름</h3></div>
									<input type="text" id="name" name="name" class="form-control"value="${pmember.name}" style="width:350px;">
									<div id="name_check"></div>
								</div>
								<div class="form-group">
									<div class="control-width"><i class="fas fa-id-card"></i>
									<h3 style="font-weight: bolder;">아이디</h3></div>
									<input type="email" style="border: none" id="p_id" name="p_id"
										class="form-control" value="${pmember.p_id}" readonly>
								</div>
								<div class="form-group">
									<div class="control-width"><i class="fa fa-unlock-alt"></i>
									<h3 style="font-weight: bolder;">비밀번호</h3></div>
									<input type="password" id="password" name="password" class="form-control" value=""
										style="width: 350px;" placeholder="4~12자의 숫자 , 문자로만 사용 가능합니다.">
										<div id="pw_check"></div>
								</div>
								<div class="form-group">
									<div class="control-width"><i class="fa fa-unlock-alt"></i>
									<h3 style="font-weight: bolder;">비밀번호 재확인</h3></div>
									<input type="password" id="password1" name="password1"class="form-control" value=""
										style="width: 350px;">
										<div id="pw1_check"></div>
								</div>
								<div class="form-group">	
									<div class="control-width"><i class="fa-solid fa-mobile-screen"></i>
									<h3 style="font-weight: bolder;">전화번호</h3></div>
									<input type="tel" id="tel" name="tel" class="form-control" value="${pmember.tel}" 
									style="width:350px;" placeholder="숫자만 입력하세요." maxlength="13">
									<div id="tel_check"></div>
								</div>
								<div class="form-group">
									<div class="control-width"><i class="fa-solid fa-building"></i>
									<h3 style="font-weight: bolder;">사업장 이름</h3></div>
									<input type="text" id="w_name" name="w_name"class="form-control" style="width:350px;" value="${pmember.w_name}">
									<div id="w_name_check"></div>		
								</div>
								<div class="form-group">
									<div class="control-width"><i class="fa-solid fa-map-location-dot"></i>
									<h3 style="font-weight: bolder;">사업장 주소</h3></div>
									<input type="text" id="w_address" name="w_address"class="form-control" value="${pmember.w_address}"> 
									<input type="text" id="w_d_address" name="w_d_address" class="form-control"
										style="width:210px;" value="${pmember.w_d_address }">	
										<div id="w_d_address_check"></div>							
									<button class="btn btn-primary mr-2" type="button" onclick="findAddr()" id="member_post" name="member_post">주소찾기</button>								
								</div>				
								<div class="form-group" style="margin-top:-15px;">
									<i class="fa-solid fa-square-phone"></i>
									<h3 style="font-weight: bolder;">사업장 전화번호&nbsp;&nbsp;&nbsp;</h3>
									<input type="tel" id="w_tel" name="w_tel" class="form-control" value="${pmember.w_tel}" maxlength="13"
										style="width:350px;"placeholder="숫자만 입력하세요.">
										<div id="w_tel_check"></div>
								</div>
								<div class="form-group">
									<i class="fa-solid fa-street-view"></i>
									<h3 style="font-weight: bolder;">자기소개</h3>
									<textarea id="p_info" name="p_info" cols="100" rows="3">${pmember.p_info}</textarea>
									<div id="p_info_check"></div>
								</div>
								<div class="form-group">
									<div class="control-width"><i class="fa-solid fa-star"></i>
									<h3 style="font-weight: bolder;">경력</h3></div>
									<input type="text" id="career" name="career" class="form-control" style="width: 350px;" value="${pmember.career}">
									<div id="career_check"></div>
								</div>
								<div class="form-group">
									<div class="control-width"><i class="fa-solid fa-award"></i>
									<h3 style="font-weight: bolder;">전문분야</h3></div>
									<input type="text" id="speciality" name="speciality"class="form-control" style="width: 350px;" value="${pmember.speciality}">
									<div id="speciality_check"></div>
								</div>
								
								
								<div class="form-group">
								<h3 style="font-weight: bolder;">서비스 가능한 동물</h3>
							</div>
							<div class="checkout__input__checkbox">
							<label for="code0">개
								<input type="checkbox" id="code0" name="code" value="501"><span class="checkmark"></span></label>&emsp;
							<label for="code1">고양이
								<input type="checkbox" id="code1" name="code" value="502"><span class="checkmark"></span></label>&emsp;
							<label for="code2">조류
								<input type="checkbox" id="code2" name="code" value="503"><span class="checkmark"></span></label>&emsp;
							<label for="code3">파충류
								<input type="checkbox" id="code3" name="code" value="504"><span class="checkmark"></span></label>&emsp;
							<label for="code4">어류
								<input type="checkbox" id="code4" name="code" value="505"><span class="checkmark"></span></label>&emsp;
							<label for="code5">토끼
								<input type="checkbox" id="code5" name="code" value="506"><span class="checkmark"></span></label>&emsp;<br>
							<label for="code6">돼지
								<input type="checkbox" id="code6" name="code" value="507"><span class="checkmark"></span></label>&emsp;
							<label for="code7">햄스터
								<input type="checkbox" id="code7" name="code" value="508"><span class="checkmark"></span></label>&emsp;
							<label for="code8">미어켓
								<input type="checkbox" id="code8" name="code" value="509"><span class="checkmark"></span></label>&emsp;
							<label for="code9">여우
								<input type="checkbox" id="code9" name="code" value="510"><span class="checkmark"></span></label>&emsp;
							<label for="code10">거미
								<input type="checkbox" id="code10" name="code" value="511"><span class="checkmark"></span></label>&emsp;
								</div>
								
								
								
								
								
								<div class="form-group">
									<i class="fa-solid fa-calendar-days"></i>
									<h3 style="font-weight: bolder;">운영시간</h3>
								</div>
								<div id="select-one">
									<div class="form-group" id="form-time">
										<c:forEach items="${time }" var="timeList" varStatus="status">
											<div>
												<input type="hidden" name="timeVOList[${status.index}].o_no"value="${timeList.o_no}" id=${ status.index}> 
												<select id="selectday" name="timeVOList[${status.index}].w_day">
													<option value='월'<c:if test="${timeList.w_day == '월' }">selected</c:if>>월</option>
													<option value='화'<c:if test="${timeList.w_day == '화' }">selected</c:if>>화</option>
													<option value='수'<c:if test="${timeList.w_day == '수' }">selected</c:if>>수</option>
													<option value='목'<c:if test="${timeList.w_day == '목' }">selected</c:if>>목</option>
													<option value='금'<c:if test="${timeList.w_day == '금' }">selected</c:if>>금</option>
													<option value='토'<c:if test="${timeList.w_day == '토' }">selected</c:if>>토</option>
													<option value='일'<c:if test="${timeList.w_day == '일' }">selected</c:if>>일</option>
												</select> 
												<select id="selectStart"name="timeVOList[${status.index}].starttime">
													<option value='9:00'<c:if test="${timeList.starttime == '9:00' }">selected</c:if>>9:00</option>
													<option value='9:30'<c:if test="${timeList.starttime == '9:30' }">selected</c:if>>9:30</option>
													<option value='10:00'<c:if test="${timeList.starttime == '10:00' }">selected</c:if>>10:00</option>
													<option value='10:30'<c:if test="${timeList.starttime == '10:30' }">selected</c:if>>10:30</option>
													<option value='11:00'<c:if test="${timeList.starttime == '11:00' }">selected</c:if>>11:00</option>
													<option value='11:30'<c:if test="${timeList.starttime == '11:30' }">selected</c:if>>11:30</option>
													<option value='12:00'<c:if test="${timeList.starttime == '12:00' }">selected</c:if>>12:00</option>
													<option value='12:30'<c:if test="${timeList.starttime == '12:30' }">selected</c:if>>12:30</option>
												</select> 
												<select id="selectEnd"name="timeVOList[${status.index}].endtime">
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
												</select> 
												<input type="text" id="n_content" name="timeVOList[${status.index}].n_content" class="form-control" value="${timeList.n_content}">
												<div style="display: inline-block; width:62px;">
													<button class="genric-btn info-border circle" id="time-insert" type="button"onclick="deleteTime('${timeList.o_no}')">X</button>
												</div><br> 
												<input type="hidden"name="timeVOList[${status.index}].p_id" value="${pmember.p_id}">
											</div>
										</c:forEach>
									</div>
								</div>
								<button type="button" class="genric-btn info radius" id="addDiv" onclick="plusTime()">시간추가</button><br>
								<p>운영시간을 더 추가 하시러면 시간추가 버튼을 눌러주세요.</p>
								<div class="form-group" style="margin-bottom: 0px;">
									<i class="fa-solid fa-clipboard-list"></i>
									<h3 style="font-weight: bolder;" id="add-service">서비스정보</h3><br>
								</div>
								<div id="plus-div">  
									<div id="add-div">
										<c:forEach items="${price }" var="price" varStatus="status">
											<div class="form-group" id="service-main" style="margin-bottom: 10px;">
												<input type="hidden"name="priceVOList[${status.index }].price_no"value="${price.price_no}" id="service${ status.index}">
												<div class="service-info">
													<label for="name">서비스명</label> 
													<input id="title" name="priceVOList[${status.index }].title" type="text" class="form-control" value="${price.title}">
												</div>
												<div class="service-info">
													<label>금 액</label> 
													<input type="text" class="form-control"id="price" name="priceVOList[${status.index }].price" value="${price.price}">
												</div>
												<div style="display: inline-grid;">
													<label>서비스안내</label>
													<textarea class="form-control" id="content" name="priceVOList[${status.index }].content" rows="2"cols="50">${price.content }</textarea>
												</div>
												<div class="delete-button">
													<button class="genric-btn info-border circle" id="price-insert" type="button" onclick="deleteService('${price.price_no}')">X</button>
												</div><br> 
												<input type="hidden"name="priceVOList[${status.index }].p_id" value="${pmember.p_id}">
											</div>
										</c:forEach>
									</div>
								</div>
								<button type="button" class="genric-btn info radius"id="addService" onclick="plusService()" style="width: 126px;">서비스추가</button>
								<p id="p-info">서비스를 더 추가 하시러면 서비스 추가 버튼을 눌러주세요.</p>
								<div class="form-group">
									<i class="far fa-id-badge"></i>
									<h3 style="font-weight: bolder;">프로필 사진</h3>
									<div class="input-group col-xs-12">
										<input class="file-upload-browse btn btn-primary" type="file"id="file" name="file">
									</div>
								</div>
								<div class="form-group" style="margin-bottom: 0px;">
									<i class="fa fa-file-image-o"></i>
									<h3 style="font-weight: bolder;">자격증</h3>
								</div>	
								<div class="form-group">
									<input class="file-upload-browse btn btn-primary" type="file" name="multiFileList1" multiple="multiple">
									<button type="button" class="btn btn-primary btn-sm" onclick="addFile1()">+</button>
									<div id="ffile1"></div>
								</div>
								<div class="form-group" style="margin-bottom: 0px;">
									<i class="fa-solid fa-images"></i>
									<h3 style="font-weight: bolder;">활동사진</h3>
								</div>	
								<div class="form-group">
									<input class="file-upload-browse btn btn-primary" type="file" name="multiFileList2" multiple="multiple">
									<button type="button" class="btn btn-primary btn-sm"onclick="addFile2()">+</button>
									<div id="ffile2"></div>
								</div>
								<div align="right"> 
								<button type="submit" id="successUpdate"class="genric-btn info radius">수정완료</button>
								<button type="button" id="cancel" class="btn btn-secondary btn-lg" 
								onclick="location.href='pmemberMyPage'">취소</button>
								</div>
							</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</section>

	<script>	

		function addFile1() {
			var input = $('<input>').attr({
				'class': 'file-upload-browse btn btn-primary',
				'name': 'multiFileList1',
				'type': 'file'
			}).css({
				'margin-top': '3px',
				'display': 'block'
			});
			$('#ffile1').append(input);
		}

		function addFile2() {
			var input = $('<input>').attr({
				'class': 'file-upload-browse btn btn-primary',
				'name': 'multiFileList2',
				'type': 'file'
			}).css({
				'margin-top': '3px',
				'display': 'block'
			});
			$('#ffile2').append(input);
		}

		/* 시간삭제 */
		function deleteTime(o_no) {
			var o_no = o_no;
			var target = event.target.parentElement.parentElement;
			$.ajax({
				type: 'POST',
				url: 'deleteTime',
				data: {
					"o_no": o_no,
				},
				success: function (result) {
					console.log(result);
					target.remove();
				}
			});
		}
		/* 서비스삭제  */
		function deleteService(price_no) {
			var price_no = price_no;
			var target = event.target.parentElement.parentElement;
			$.ajax({
				type: 'POST',
				url: 'deleteService',
				data: {
					"price_no": price_no,
				},
				success: function (result) {
					target.remove();
				}
			});
		}
		var countService=0;
		function plusService() {
			countService++;
			var select = document.getElementById('plus-div');
			var div = document.getElementById('add-div');
			var eleCount = ${fn:length(price)};
			var formValue = Number(document.getElementById("service" + (eleCount-1)).value);
			var tagData =$(`<div class="form-group" style="margin-bottom: 10px;">
					<input type="hidden" name="priceVOList[\${eleCount+countService}].price_no" value="\${formValue+countService}" id="service\${eleCount+countService}">
					<div class="service-info">
						<label for="name">서비스명</label>
						<input id="title" name="priceVOList[\${eleCount+countService}].title" value="" type="text" class="form-control">
					</div>
					<div class="service-info">
						<label>금 액</label>
						<input type="text" class="form-control" id="price" name="priceVOList[\${eleCount+countService}].price" value="">
					</div>
					<div style="display: inline-grid;">
						<label>서비스안내</label>
						<textarea class="form-control" id="content" name="priceVOList[\${eleCount+countService}].content" rows="2" cols="50"
							style="height: 45px;"></textarea>
					</div><br>
					<input type="hidden"name="priceVOList[\${eleCount+countService}].p_id" value="${pmember.p_id}">
				</div>`);
			$('#add-div').append(tagData);
			select.append(div);
		}
		
		var count=0;
		function plusTime() {
			count++;
			var select = document.getElementById('select-one');
			var form = document.getElementById('form-time');
			var eleCount = ${fn:length(time)};//form.childElementCount; // /* div갯수 구하기 */
			var formValue = Number(document.getElementById(eleCount - 1).value);
			var tagData = 	
				$(`		<div>
						<input type="hidden" name="timeVOList[\${eleCount+count}].o_no" value="\${formValue+count}" id="\${eleCount+count}"> 
						<select class="selectday\${eleCount}" name="timeVOList[\${eleCount+count}].w_day">
						<option value='' selected>요일선택</option>
						<option value='월'>월</option>
						<option value='화'>화</option>
						<option value='수'>수</option>
						<option value='목'>목</option>
						<option value='금'>금</option>
						<option value='토'>토</option>
						<option value='일'>일</option>
					</select>																	
					<select class="selectday\${eleCount+count}" name="timeVOList[\${eleCount+count}].starttime">
						<option value='' selected>오픈시간</option>
						<option value='9:00'>9:00</option>
						<option value='9:30'>9:30</option>
						<option value='10:30'>10:30</option>
						<option value='11:00'>11:00</option>
						<option value='12:00'>12:00</option>
						<option value='12:30'>12:30</option>				
					</select>																					
					<select class="selectday\${eleCount+count}" name="timeVOList[\${eleCount+count}].endtime">
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
					<input type="text" id="n_content" name="timeVOList[\${eleCount+count}].n_content" class="form-control" value=""><br>
					<input type="hidden" name="timeVOList[\${eleCount+count}].p_id" value="${pmember.p_id}">
					</div>`);
			$('#form-time').append(tagData);
			select.append(form);
			$('select').niceSelect();
		}

		function checkForm() {
			if (updatePage.name.value == "") {
				alert("이름을 입력하세요.");
				updatePage.name.focus();
				return false;
			} else if (updatePage.password.value == "") {
				alert("비밀번호 입력하세요.");
				updatePage.password.focus();
				return false;
			}
	
		/* 	var pwdCheck = /^[A-Za-z0-9]{4,12}$/; 
			if(!pwdCheck.test(updatePage.password.value)){
				alert("4~12자의 숫자 , 문자로만 사용 가능합니다.);
				updatePage.password.focus(); 
				return false; 
			}
			if( updatePage.password.value !== updatePage.password1.value ){
				alert("비밀번호가 일치하지 않습니다."); 
				updatePage.password1.focus(); 
				return false;   
			}   */

			else if (updatePage.tel.value == "" && updatePage.w_tel.value == "") {
				alert("전화번호를 입력해주세요.");
				updatePage.tel.focus();
				return false;
			} else if (updatePage.w_name.value == "") {
				alert("사업장 이름을 입력주세요.");
				updatePage.w_name.focus();
				return false;
			} else if (updatePage.w_address.value == "" && updatePage.w_d_address.value == "") {
				alert("사업장 주소를 입력주세요.");
				updatePage.w_address.focus();
				return false;
			} else {
				return true;
			}

		}

		function test() {
			var formData = new FormData(document.getElementById('f'));
			for (var pair of formData.entries()) {
				console.log(pair[0] + ', ' + pair[1]);
			}
		}
	</script>
	<script>
		function findAddr() {
			new daum.Postcode({
				oncomplete: function (data) {
					console.log(data);
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var roadAddr = data.roadAddress; // 도로명 주소 변수
					var jibunAddr = data.jibunAddress; // 지번 주소 변수
				// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById('member_post').value = data.zonecode;
					if (roadAddr !== '') {
						document.getElementById("w_address").value = roadAddr;
					} else if (jibunAddr !== '') {
						document.getElementById("w_address").value = jibunAddr;
					}
				}
			}).open();
		}
	</script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>

</html>