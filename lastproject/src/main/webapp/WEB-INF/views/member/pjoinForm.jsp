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
									<div class="form-group">
									<div class="custom-checkbox custom-control">
										<input type="checkbox" name="agree" id="agree" class="custom-control-input">
										<label for="agree" id="agree" class="custom-control-label"><a href="#" data-toggle="modal" data-target="#exampleModal">개인정보수집동의</a></label>
										
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
				
				 개인정보 수집 및 이용 동의(필수)



개인정보보호법에 따라 반반반에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간, 동의 거부권 및 동의 거부 시 불이익에 관한 사항을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.

1. 수집하는 개인정보
이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등 대부분의 반반반 서비스를 회원과 동일하게 이용할 수 있습니다. 이용자가 메일, 캘린더, 카페, 블로그 등과 같이 개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우, 반반반는 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다.

회원가입 시점에 반반반가 이용자로부터 수집하는 개인정보는 아래와 같습니다.
- 회원 가입 시에 ‘아이디, 비밀번호, 이름, 생년월일, 성별, 휴대전화번호’를 필수항목으로 수집합니다. 만약 이용자가 입력하는 생년월일이 만14세 미만 아동일 경우에는 법정대리인 정보(법정대리인의 이름, 생년월일, 성별, 중복가입확인정보(DI), 휴대전화번호)를 추가로 수집합니다. 그리고 선택항목으로 이메일 주소를 수집합니다.
- 단체아이디로 회원가입 시 단체아이디, 비밀번호, 단체이름, 이메일주소, 휴대전화번호를 필수항목으로 수집합니다. 그리고 단체 대표자명을 선택항목으로 수집합니다.
서비스 이용 과정에서 이용자로부터 수집하는 개인정보는 아래와 같습니다.
- 회원정보 또는 개별 서비스에서 프로필 정보(별명, 프로필 사진)를 설정할 수 있습니다. 회원정보에 별명을 입력하지 않은 경우에는 마스킹 처리된 아이디가 별명으로 자동 입력됩니다.

- 반반반 내의 개별 서비스 이용, 이벤트 응모 및 경품 신청 과정에서 해당 서비스의 이용자에 한해 추가 개인정보 수집이 발생할 수 있습니다. 추가로 개인정보를 수집할 경우에는 해당 개인정보 수집 시점에서 이용자에게 ‘수집하는 개인정보 항목, 개인정보의 수집 및 이용목적, 개인정보의 보관기간’에 대해 안내 드리고 동의를 받습니다.

서비스 이용 과정에서 IP 주소, 쿠키, 서비스 이용 기록, 기기정보, 위치정보가 생성되어 수집될 수 있습니다. 또한 이미지 및 음성을 이용한 검색 서비스 등에서 이미지나 음성이 수집될 수 있습니다.
구체적으로 1) 서비스 이용 과정에서 이용자에 관한 정보를 자동화된 방법으로 생성하여 이를 저장(수집)하거나,
2) 이용자 기기의 고유한 정보를 원래의 값을 확인하지 못 하도록 안전하게 변환하여 수집합니다. 서비스 이용 과정에서 위치정보가 수집될 수 있으며,
반반반에서 제공하는 위치기반 서비스에 대해서는 '반반반 위치정보 이용약관'에서 자세하게 규정하고 있습니다.
이와 같이 수집된 정보는 개인정보와의 연계 여부 등에 따라 개인정보에 해당할 수 있고, 개인정보에 해당하지 않을 수도 있습니다.

2. 수집한 개인정보의 이용
반반반 및 반반반 관련 제반 서비스(모바일 웹/앱 포함)의 회원관리, 서비스 개발・제공 및 향상, 안전한 인터넷 이용환경 구축 등 아래의 목적으로만 개인정보를 이용합니다.

- 회원 가입 의사의 확인, 연령 확인 및 법정대리인 동의 진행, 이용자 및 법정대리인의 본인 확인, 이용자 식별, 회원탈퇴 의사의 확인 등 회원관리를 위하여 개인정보를 이용합니다.
- 콘텐츠 등 기존 서비스 제공(광고 포함)에 더하여, 인구통계학적 분석, 서비스 방문 및 이용기록의 분석, 개인정보 및 관심에 기반한 이용자간 관계의 형성, 지인 및 관심사 등에 기반한 맞춤형 서비스 제공 등 신규 서비스 요소의 발굴 및 기존 서비스 개선 등을 위하여 개인정보를 이용합니다.
- 법령 및 반반반 이용약관을 위반하는 회원에 대한 이용 제한 조치, 부정 이용 행위를 포함하여 서비스의 원활한 운영에 지장을 주는 행위에 대한 방지 및 제재, 계정도용 및 부정거래 방지, 약관 개정 등의 고지사항 전달, 분쟁조정을 위한 기록 보존, 민원처리 등 이용자 보호 및 서비스 운영을 위하여 개인정보를 이용합니다.
- 유료 서비스 제공에 따르는 본인인증, 구매 및 요금 결제, 상품 및 서비스의 배송을 위하여 개인정보를 이용합니다.
- 이벤트 정보 및 참여기회 제공, 광고성 정보 제공 등 마케팅 및 프로모션 목적으로 개인정보를 이용합니다.
- 서비스 이용기록과 접속 빈도 분석, 서비스 이용에 대한 통계, 서비스 분석 및 통계에 따른 맞춤 서비스 제공 및 광고 게재 등에 개인정보를 이용합니다.
- 보안, 프라이버시, 안전 측면에서 이용자가 안심하고 이용할 수 있는 서비스 이용환경 구축을 위해 개인정보를 이용합니다.
3. 개인정보의 보관기간
회사는 원칙적으로 이용자의 개인정보를 회원 탈퇴 시 지체없이 파기하고 있습니다.
단, 이용자에게 개인정보 보관기간에 대해 별도의 동의를 얻은 경우, 또는 법령에서 일정 기간 정보보관 의무를 부과하는 경우에는 해당 기간 동안 개인정보를 안전하게 보관합니다.

이용자에게 개인정보 보관기간에 대해 회원가입 시 또는 서비스 가입 시 동의를 얻은 경우는 아래와 같습니다.
- 부정 가입 및 이용 방지
부정 이용자의 가입인증 휴대전화번호 또는 DI (만14세 미만의 경우 법정대리인DI) : 탈퇴일로부터 6개월 보관
탈퇴한 이용자의 휴대전화번호(복호화가 불가능한 일방향 암호화(해시처리)) : 탈퇴일로부터 6개월 보관
- QR코드 복구 요청 대응
QR코드 등록 정보:삭제 시점으로부터6개월 보관
- 스마트플레이스 분쟁 조정 및 고객문의 대응
휴대전화번호:등록/수정/삭제 요청 시로부터 최대1년
- 반반반 플러스 멤버십 서비스 혜택 중복 제공 방지
암호화처리(해시처리)한DI :혜택 제공 종료일로부터6개월 보관
- 지식iN eXpert 재가입 신청 및 부정 이용 방지
ID : 서비스 탈퇴 후 6개월 보관
eXpert 서비스 및 eXpert 센터 가입 등록정보 : 신청일로부터 6개월(등록 거절 시, 거절 의사 표시한 날로부터 30일) 보관
전자상거래 등에서의 소비자 보호에 관한 법률, 전자금융거래법, 통신비밀보호법 등 법령에서 일정기간 정보의 보관을 규정하는 경우는 아래와 같습니다. 반반반는 이 기간 동안 법령의 규정에 따라 개인정보를 보관하며, 본 정보를 다른 목적으로는 절대 이용하지 않습니다.
- 전자상거래 등에서 소비자 보호에 관한 법률
계약 또는 청약철회 등에 관한 기록: 5년 보관
대금결제 및 재화 등의 공급에 관한 기록: 5년 보관
소비자의 불만 또는 분쟁처리에 관한 기록: 3년 보관
- 전자문서 및 전자거래 기본법
공인전자주소를 통한 전자문서 유통에 관한 기록 : 10년 보관
- 통신비밀보호법
로그인 기록: 3개월

참고로 반반반는 ‘개인정보 유효기간제’에 따라 1년간 서비스를 이용하지 않은 회원의 개인정보를 별도로 분리 보관하여 관리하고 있습니다.

4. 개인정보 수집 및 이용 동의를 거부할 권리
이용자는 개인정보의 수집 및 이용 동의를 거부할 권리가 있습니다. 회원가입 시 수집하는 최소한의 개인정보, 즉, 필수 항목에 대한 수집 및 이용 동의를 거부하실 경우, 회원가입이 어려울 수 있습니다.

			</div>
			<!-- modal 하단 버튼 -->
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-dismiss="modal">취소</button>
				<button id="sendReserv" name="sendReserv" type="button"
					class="btn btn-primary" data-dismiss="modal" onclick="checked_agree()">동의</button>
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