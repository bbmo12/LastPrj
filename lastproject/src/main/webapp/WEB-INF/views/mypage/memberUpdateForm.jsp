<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
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
				 if (emailJ.test($('#m_id').val())){
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

	<section class="banner-area other-page">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<h1>MyPage</h1>
					<a href="index.html">Home</a> <span>|</span> <a
						href="blog-details.html">MyPage</a>
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
							
							<div class="br"></div>
							<h4>${member.name }</h4>

							<div class="br"></div>
						</aside>

						<aside class="single_sidebar_widget post_category_widget">
							<h4 class="widget_title">My menu</h4>
							<ul class="list cat-list">
															<li><a href="memberMypage"
									class="d-flex justify-content-between">
										<p>내 프로필</p>
								</a></li>
								<li><a href="protocol" class="d-flex justify-content-between">
										<p>반려동물 진료기록</p>
								</a></li>
								<li><a href="reservationSelect" class="d-flex justify-content-between">
										<p>예약 내역</p>
								</a></li>
								<li><a href="myPay" class="d-flex justify-content-between">
										<p>결제 내역</p>
								</a></li>
								<li><a href="mycounsel" class="d-flex justify-content-between">
										<p>상담 내역</p>
								</a></li>
								<li><a href="myreport" class="d-flex justify-content-between">
										<p>신고 내역</p>
								</a></li>
								<li><a href="myfallow" class="d-flex justify-content-between">
										<p>팔로우</p>
								</a></li>
								<li><a href="logout" class="d-flex justify-content-between">
										<p>로그아웃</p>
								</a></li>
								<li><a href="mdeleteForm" class="d-flex justify-content-between">
										<p>회원탈퇴</p>
								</a></li>
							</ul>

						</aside>
					</div>
				</div>

				<div class="col-lg-9 posts-list">
					<div class="single-post row">
						<div class="col-lg-12">
							<div class="feature-img">
								<img class="img-fluid"
									src="resources/assets/images/blog-details/feature-img1.jpg"
									alt="">
							</div>
						</div>
						<form action="memberUpdate" enctype="multipart/form-data" method="post">
							<div class="col-lg-12 col-md-12 blog_details">
								<div class="form-group">
									<label for="name">이름</label>
									<input type="text"  id="name" name="name"
										value="${member.name}">
										<div id="name_check"></div>
								</div>

								<div class="form-group">
									<label for="email">E-Mail 아이디</label>
									<input type="email" style="border: none" id="m_id" name="m_id"
										value="${member.m_id}" readonly>
								</div>
								<div class="form-group">
									<label for="password">비밀번호</label>
									<input type="password" id="password" name="password">
									<div id="pw_check"></div>
								</div>
								<div class="form-group">
									<label for="password">비밀번호 재확인</label>
									<input type="password"  id="password1"	name="password1">
									<div id="pw1_check"></div>
								</div>
								<div class="form-group">
									<label for="tel">전화번호&nbsp;휴대폰 번호('-'없이 번호만 입력해주세요)</label>
									<input type="text"  id="tel" name="tel"
										value="${member.tel}" >
										<div id="tel_check"></div>
								</div>
								<div class="form-group">
									<label>프로필 사진</label>
									<div class="input-group col-xs-12">
										<input class="file-upload-browse btn btn-primary" type="file"
											id="file" name="file">
									</div>
								</div>
								<button type="submit" onclick="location.href='memberUpdateForm'"
									class="genric-btn info radius">수정 완료</button>

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
				'name' : 'multiFileList',
				'type' : 'file'
			});

			$('#ffile').append(input);
		}
	</script>
</body>
</html>