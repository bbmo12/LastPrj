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
	<style type="text/css">

	
	*{margin: 0;padding: 0;box-sizing: border-box}
body{background-color: #f7f7f7;}
ul>li{list-style: none}
a{text-decoration: none;}
.clearfix::after{content: "";display: block;clear: both;}


#joinForm{width: 460px;margin: 0 auto;}
ul.join_box{border: 1px solid #ddd;background-color: #fff;}
.checkBox,.checkBox>ul{position: relative;}
.checkBox>ul>li{float: left;}
.checkBox>ul>li:first-child{width: 85%;padding: 15px;font-weight: 600;color: #888;}
.checkBox>ul>li:nth-child(2){position: absolute;top: 50%;right: 30px;margin-top: -12px;}
.checkBox textarea{width: 96%;height: 90px; margin: 0 2%;background-color: #f7f7f7;color: #888; border: none;}
.footBtwrap{margin-top: 15px;}
.footBtwrap>li{float: left;width: 50%;height: 60px;}
.footBtwrap>li>button{display: block; width: 100%;height: 100%; font-size: 20px;text-align: center;line-height: 60px;}
.fpmgBt1{background-color: #fff;color:#888}
.fpmgBt2{background-color: lightsalmon;color: #fff}
	</style>
</head>

<body>
	<script>
		//자격증번호 정규식
		var noJ = /^\d{3}-\d{2}-\d{5}$/;
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
				
				
				// 자격증 정규식
				if (noJ.test($('#no').val())) {
					inval_Arr[5] = true;
				} else {
					inval_Arr[5] = false;
					alert('자격증 번호를 확인하세요.');
					return false;
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
			
			
			//자격증번호 요휴성
			$("#no").blur(function () {
				if (noJ.test($(this).val())) {
					console.log(noJ.test($(this).val()));
					$("#no_check").text('');
				} else {
					$('#no_check').text('111-11-11111 형식으로 입력하세요');
					$('#no_check').css('color', 'red');
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
				<div class="row justify-content-md-center" style="margin-top: 7em; height: 1100px;">
					<div class="card-wrapper" style="width: 650px;">
						<div class="brand">
							<img src="resources/login/logo.jpg" alt="logo">
						</div>
						<div class="card fat" style="margin-top: -15px;">
							<div class="card-body">
								<form action="pjoin_1" method="post" enctype="multipart/form-data" class="my-login-validation">
									<div class="form-group">
										<label for="name">자격증번호</label>
										<input type="text" class="form-control" id="no" name="no" placeholder="000-00-00000">
										<div id="no_check"></div>
									</div>							
										<label>수의사&emsp;<input type="radio" id="code" name="code" value="100"><span class="checkmark"></span></label>
										<label>미용사&emsp;<input type="radio" id="code" name="code" value="103"><span class="checkmark"></span></label>
										<label>펫시터&emsp;<input type="radio" id="code" name="code" value="102"><span class="checkmark"></span></label>
										<label>훈련사&emsp;<input type="radio" id="code" name="code" value="101"><span class="checkmark"></span></label>							
									<div class="form-group" style="margin-top: 10px;">
										<label for="name">이름</label>
										<input id="name" name="name" type="text" class="form-control" value="" required autofocus>
										<div id="name_check"></div>
									</div>
									<div class="form-group">
										<label for="exampleInputEmail3">E-Mail 아이디</label>
										<input id="p_id" name="p_id" type="email" class="form-control" value="" required style="width: 450px;">
										<button type="button"  class="btn btn-primary mr-2" onclick="isIdCheck()" id="idCheck" value="NO" style="margin: -58px 0 0 29em;">중복체크</button>
										<div id="id_check"></div>
									</div>
									<div class="form-group">
										<label for="exampleInputPassword4">비밀번호</label>
										<input id="password" name="password" type="password" class="form-control" value="" required data-eye>
										<div id="pw_check"></div>
									</div>
									<div class="form-group">
										<label for="exampleInputPassword4">비밀번호확인</label>
										<input id="password1" name="password1" type="password"  value="" class="form-control" required data-eye>
										<div id="pw1_check"></div>
									</div>
									<div class="form-group">
										<label for="exampleSelectGender">전화번호&nbsp;휴대폰 번호('-'없이 번호만 입력해주세요)</label>
										<input id="tel" name="tel" type="text" class="form-control" value="" placeholder="tel">
										<div id="tel_check"></div>
									</div>
									<div class="form-group">
										<label for="profile">프로필사진</label>
										<div class="input-group col-xs-12">
											<input class="file-upload-browse btn btn-primary" type="file" id="file" name="file">
										</div>
									</div>
									<div class="form-group">
										<div class="custom-checkbox custom-control">
											<input type="checkbox" name="agree" id="agree"class="custom-control-input" required=""> 
											<label for="agree" class="custom-control-label">
											<a href="#"data-toggle="modal" data-target="#exampleModal">개인정보수집동의</a></label>
										</div>
									</div>							
									<button type="submit" class="btn btn-primary mr-2"style="width: 100px;">다음</button>
									<button type="button" class="btn btn-light" onclick="location.href='home'" style="width: 100px;"onclick="history.back()">취소</button>
									<div class="mt-4 text-center">이미 아이디가 있으신가요? <a href="loginForm">로그인</a>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalLabel"
	aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h3 class="modal-title" id="exampleModalLabel">개인정보 수집 및 이용 동의</h3>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
						<!-- modal 몸통 -->
			<div class="modal-body">
			    <form action="" id="joinForm">
        <ul class="join_box">
            <li class="checkBox check02">
                <ul class="clearfix">
                    <li>이용약관 동의(필수)</li>
                </ul>
                <textarea name="" id="">여러분을 환영합니다.
반반반 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 반반반 서비스의 이용과 관련하여 반반반 서비스를 제공하는 반반반 주식회사(이하 ‘반반반’)와 이를 이용하는 반반반 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 반반반 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
   </textarea>
            </li>
            <li class="checkBox check03">
                <ul class="clearfix">
                    <li>개인정보 수집 및 이용에 대한 안내(필수)</li>

                </ul>

                <textarea name="" id="">여러분을 환영합니다.
반반반 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 반반반 서비스의 이용과 관련하여 반반반 서비스를 제공하는 반반반 주식회사(이하 ‘반반반’)와 이를 이용하는 반반반 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 반반반 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
   </textarea>
            </li>
        </ul>
        <ul class="footBtwrap clearfix">
            <li><button class="btn btn-primary" data-dismiss="modal">비동의</button></li>
            <li><button class="btn btn-primary" data-dismiss="modal" onclick="checked_agree()">동의</button></li>
        </ul>
    </form>


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
		
		
		<script>

function checked_agree() {

  $('input[name="agree"]').prop('checked', true);

}

</script>