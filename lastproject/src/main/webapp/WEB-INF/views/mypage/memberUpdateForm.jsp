<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<style>
.no_deco {
	text-decoration: none !important;
	font-size : 0.8rem !important;
	color: black;
}
	#my_section {
		padding: 50px;
		background: #f9f9fd;
	}

	.blog_right_sidebar{
		box-shadow: 0 .15rem 1.75rem 0 rgba(58,59,69,.1)!important;
		border: 1px solid #e3e6f0;
    	border-radius: 0.35rem;
    	float: none !important; margin: 0 auto !important;
    	background-color: white;
    	width: 250px;
	}
	.card{
		box-shadow: 0 .15rem 1.75rem 0 rgba(58,59,69,.1)!important;
		border: 1px solid #e3e6f0;
    	border-radius: 0.35rem
	}
	
	.card-header{
	background: white;
	font-size: 1.0rem;
	font-family: 'NanumBarunGothic';
	font-style: normal;
 	font-weight: 400;
 	color: black;
	}
	
	.card-footer{
	background: white;
	font-size: 1.0rem;
	font-family: 'NanumBarunGothic';
	font-style: normal;
 	font-weight: 400;
	}
	
	#notice_footer{
	text-align: center;
	font-size: 1.0rem;
	font-family: 'NanumBarunGothic';
	font-style: normal;
 	font-weight: 400;
	}
 	
	.card_notice{
	font-size: 0.8rem;
	 font-family: 'NanumBarunGothic';
	 font-style: normal;
 	font-weight: 400;
	}
	
	.partner_img{
	object-fit: cover;
	object-position:top;
	border-radius:50%;
	width: 180px !important;
	height: 180px !important;
	float: none;
	margin: 0 auto;
}

.pet_img{
	object-fit: cover;
	object-position:top;
	border-radius:50%;
	width: 100px !important;
	height: 100px !important;
	float: none;
	margin-bottom: 10px;
}

.widget_title{
	background: #0062ff !important;
}

#cardTitle{
	font-size: 1.25rem;
	font-family: 'NanumBarunGothic';
	font-style: normal;
 	font-weight: 700;
}

#myinfo{
	font-size: 0.8rem;
	font-family: 'NanumBarunGothic';
	font-style: normal;
 	font-weight: 300;
}

#pet_img2{
	display: inline-block;
	text-align: center;
	margin-right: 20px;
	font-size: 0.8rem;
	font-family: 'NanumBarunGothic';
	font-style: normal;
 	font-weight: 400;
}

#Mainname{
	font-size: 1.5rem !important;
	font-family: 'NanumBarunGothic'!important;
	font-style: normal !important;
 	font-weight: 700 !important;
 	color:gray;
}

#menu_bold{
	font-size: 1.0rem;
	font-family: 'NanumBarunGothic';
	font-style: normal;
 	font-weight: 700;
 	color: black;
}

	#my_section {
		padding: 50px;
	}

	#main-form h3,
	input {
		display: inline-block;
	}

	#addDiv,
	#addService {
		margin-left: 36em;
		margin-top: -5px;
		color: #fff; 
    	background: #0062ff;
    	border: 1px solid transparent;	
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
		margin-left: 9em;
		margin-top: -20px;
	}

	.delete-button {
		float: right;
		margin-top: 25px;
		margin-right: 100px;
		width: 62px;
	}

	#p_info {
		border: 1px solid rgba(151, 151, 151, 0.3);
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
    	margin-left: 51em;
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
   		width: 275px;
	}
</style>

<body>
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
		// 이메일 정규표현식
		var emailJ = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
		var birthJ = false;
		var address = $('#mem_detailaddress');

		$(document).ready(function () {
			/* 아이디 중복체크 */
			$('form').on('submit', function () {
				var inval_Arr = new Array(6).fill(false);
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

				// 이름 정규식
				if (nameJ.test($('#name').val())) {
					inval_Arr[2] = true;
				} else {
					inval_Arr[2] = false;
					alert('이름을 확인하세요.');
					return false;
				}


				// 휴대폰번호 정규식
				if (phoneJ.test($('#tel').val())) {
					console.log(phoneJ.test($('#tel').val()));
					inval_Arr[3] = true;
				} else {
					inval_Arr[3] = false;
					alert('휴대폰 번호를 확인하세요.');
					return false;
				}
				//이메일 정규표현식
				if (emailJ.test($('#m_id').val())) {
					inval_Arr[4] = true;
				} else {
					inval_Arr[4] = false;
					alert('이메일을 확인하세요.');
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

			//이름에 특수문자 들어가지 않도록 설정
			$("#name").blur(function () {
				if (nameJ.test($(this).val())) {
					console.log(nameJ.test($(this).val()));
					$("#name_check").text('');
				} else {
					$('#name_check').text('한글 2~4자 이내로 입력하세요. (특수기호, 공백 사용 불가)');
					$('#name_check').css('color', 'red');
				}
			});

			//이메일 유효성검사
			$("#m_id").blur(function () {
				if (emailJ.test($(this).val())) {
					console.log(emailJ.test($(this).val()));
					$("#m_id_check").text('');
				} else {
					$('#m_id_check').text('이메일형식으로 입력하세요.');
					$('#m_id_check').css('color', 'red');
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

		});
	</script>

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
		<div class="container"  style="max-width: 1350px;">
			<div class="row">
				<div class="col-lg-3" style="padding:0px;">
				<h2 align="center">정보 수정</h2>
				<br>
					<div class="blog_right_sidebar">
						<aside class="single_sidebar_widget author_widget">
							<img class="partner_img" src="resources/upload/${member.picture}"
								onerror="this.src='resources/upload/cat.jpg'" style="width: 210px" alt="">
							<br><br>
							<h4 id="Mainname">${member.name }님</h4>
							<div class="br"></div>
							<div id="myinfo">
							<i class="fa-solid fa-pen"></i>&nbsp;<a class="no_deco" href="mconfirmPass">내 정보 수정하기</a>
							</div>
						</aside>
						</div>
						<br>
						
						<div class="blog_right_sidebar">
						<aside class="single_sidebar_widget post_category_widget">
							<h4 class="widget_title">My menu</h4>
							<ul class="list cat-list nanumbarungothic">
							<p id="menu_bold">내 활동 내역</p>
								<li><a href="protocol" class="d-flex justify-content-between no_deco">
										<p>반려동물 진료기록</p>
									</a></li>
								<li><a href="reservationSelect" class="d-flex justify-content-between no_deco">
										<p>예약 내역</p>
									</a></li>
								<li><a href="myPay" class="d-flex justify-content-between no_deco">
										<p>결제 내역</p>
									</a></li>
								<li><a href="mycounsel" class="d-flex justify-content-between no_deco">
										<p>상담 내역</p>
									</a></li>
								<li><a href="myreport" class="d-flex justify-content-between no_deco">
										<p>신고 내역</p>
									</a></li>
								<li><a href="myfallow" class="d-flex justify-content-between no_deco">
										<p>팔로우</p>
									</a></li>
									<br><br><p id="menu_bold">회원 정보 관리</p>
								<li><a href="mconfirmPass" class="d-flex justify-content-between no_deco">
										<p>회원 정보 수정</p>
									</a></li>
								<li><a href="logout" class="d-flex justify-content-between no_deco">
										<p>로그아웃</p>
									</a></li>
								<li><a href="mdeleteForm" class="d-flex justify-content-between no_deco">
										<p>회원탈퇴</p>
									</a></li>
							</ul>
						</aside>
					</div>
				</div>
				<div class="col-lg-9 posts-list">
					<div class="single-post row">
						<form action="memberUpdate" enctype="multipart/form-data" method="post">
							<div class="col-lg-12 col-md-12 blog_details">
								<div class="form-group">
								<i class="fas fa-user"></i>
									<label for="name"></label>
									<h3 style="font-weight: bolder;">이름</h3>
									<input type="text" id="name" name="name" class="form-control" value="${member.name}">
									<div id="name_check"></div>
								</div>
								<div class="form-group">
								<i class="fas fa-id-card"></i>
									<h3 style="font-weight: bolder;">아이디</h3>
									<input type="email" style="border: none" id="m_id" name="m_id" class="form-control"
										value="${member.m_id}" readonly>
								</div>
								<div class="form-group">
									<i class="fa fa-unlock-alt"></i>
									<h3 style="font-weight: bolder;">비밀번호</h3>
									<input type="password" id="password" name="password" class="form-control" >
									<div id="pw_check"></div>
								</div>
								<div class="form-group">
									<i class="fa fa-unlock-alt"></i>
									<h3 style="font-weight: bolder;">비밀번호 재확인</h3>
									<input type="password" id="password1" name="password1" class="form-control" >
									<div id="pw1_check"></div>
								</div>
								<div class="form-group">
								<i class="fa-solid fa-mobile-screen"></i>
								<h3 style="font-weight: bolder;">전화번호('-'없이 번호만 입력해주세요)</h3>
									<input type="text" id="tel" name="tel" value="${member.tel}" class="form-control">
									<div id="tel_check"></div>
								</div>
								<div class="form-group">
									<label>프로필 사진</label>
									<div class="input-group col-xs-12">
										<input class="file-upload-browse btn btn-primary" type="file" id="file"
											name="file">
									</div>
								</div>
								<button type="submit" onclick="location.href='memberUpdateForm'" id="update-button"
									class="genric-btn info radius">수정 완료</button>
								<button type="button" id="cancel" class="btn btn-secondary btn-lg" 
								onclick="location.href='memberMypage'">취소</button>
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
	</script>
</body>

</html>