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
		var birthJ = false;
		var address = $('#mem_detailaddress');

		$(document).ready(function () {
			/* 아이디 중복체크 */
			$('form').on('submit', function () {
				var inval_Arr = new Array(5).fill(false);

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
					inval_Arr[4] = true;
				} else {
					inval_Arr[4] = false;
					alert('휴대폰 번호를 확인하세요.');
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
	<body class="my-login-page">
			<div class="container">
				<div class="row justify-content-md-center" style="margin-top: 7em; height: 1000px;">
					<div class="card-wrapper" style="width: 650px;">
						<div class="brand">
							<img src="resources/login/logo.jpg" alt="logo">
						</div>
						<div class="card fat" style="margin-top: -15px;">
							<div class="card-body">
								<h4 class="card-title">Register</h4>
								<form action="pjoin_1" method="post" enctype="multipart/form-data" class="my-login-validation">
									<div class="form-group">
										<label for="name">자격증번호</label>
										<input type="text" class="form-control" id="no" name="no" placeholder="자격증번호를 입력하세요">
									</div>							
										<label>수의사&emsp;<input type="radio" id="code" name="code" value="100"><span class="checkmark"></span></label>
										<label>미용사&emsp;<input type="radio" id="code" name="code" value="103"><span class="checkmark"></span></label>
										<label>펫시터&emsp;<input type="radio" id="code" name="code" value="102"><span class="checkmark"></span></label>
										<label>훈련사&emsp;<input type="radio" id="code" name="code" value="101"><span class="checkmark"></span></label>							
									<div class="form-group" style="margin-top: 10px;">
										<label for="name">이름</label>
										<input id="name" name="name" type="text" class="form-control" value="박박박" required autofocus>
										<div id="name_check"></div>
									</div>
									<div class="form-group">
										<label for="exampleInputEmail3">E-Mail 아이디</label>
										<input id="p_id" name="p_id" type="email" class="form-control" value="parkkk@a.com" required style="width: 450px;">
										<button type="button"  class="btn btn-primary mr-2" onclick="isIdCheck()" id="idCheck" value="NO" style="margin: -58px 0 0 29em;">중복체크</button>
										<div id="id_check"></div>
									</div>
									<div class="form-group">
										<label for="exampleInputPassword4">비밀번호</label>
										<input id="password" name="password" type="password" class="form-control" value="1234" required data-eye>
										<div id="pw_check"></div>
									</div>
									<div class="form-group">
										<label for="exampleInputPassword4">비밀번호확인</label>
										<input id="password1" name="password1" type="password"  value="1234" class="form-control" required data-eye>
										<div id="pw1_check"></div>
									</div>
									<div class="form-group">
										<label for="exampleSelectGender">전화번호&nbsp;휴대폰 번호('-'없이 번호만 입력해주세요)</label>
										<input id="tel" name="tel" type="text" class="form-control" value="01012345678" placeholder="tel">
										<div id="tel_check"></div>
									</div>
									<div class="form-group">
										<label for="profile">프로필사진</label>
										<div class="input-group col-xs-12">
											<input class="file-upload-browse btn btn-primary" type="file" id="file" name="file">
										</div>
									</div>
									<button type="submit" class="btn btn-primary mr-2"style="width: 100px;">다음</button>
									<button class="btn btn-light" onclick="location.href='home'" style="width: 100px;">취소</button>
									<div class="mt-4 text-center">이미 아이디가 있으신가요? <a href="loginForm">로그인</a>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		<script src="resources/login/my-login.js"></script>
		<script type="text/javascript">
			/* 아이디 중복체크 */
			function isIdCheck() {
				var id = $("#p_id").val();
				if (id != '') {
					//ajax
					$.ajax({
						url: "pajaxIsIdCheck",
						type: "post",
						data: {
							"p_id": id
						},
						success: function (result) {
							var b = (result === true); // 넘어온 값을 boolean 타입으로 변경 false = 0 true = 1
							if (b) {
								/* alert("사용가능한 아이디입니다."); */
								$("#idCheck").val("YES");
								//$("#idCheck").prop("disabled", true);
								$("#id_check").text('사용가능한 아이디입니다.');
								$("#id_check").css('color', 'blue');
								$("#member_password").focus();

							} else {
								/* alert("이미 사용중인 아이디입니다."); */
								$("#p_id").val('');
								$("#id_check").text('이미 사용중인 아이디입니다.');
								$("#id_check").css('color', 'red');
								$("#p_id").focus();
							}
						}
					});
				} else {
					$("#id_check").text('이메일을 입력해주세요.');
					$("#id_check").css('color', 'red');
					$("#p_id").focus();
				}
			}
		</script>