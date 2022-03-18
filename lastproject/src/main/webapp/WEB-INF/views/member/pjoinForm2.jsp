<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css"
	href="resources/login/my-login.css">
</head>

<body class="my-login-page">
	<script>
		//자격증번호 정규식
		var businessnumberJ = /^\d{3}-\d{2}-\d{5}$/;
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
		var phoneJ = /^(\d{2,3}[ ,-]-?\d{2,4}[ ,-]-?\d{4})$/;
		var birthJ = false;
		
		var w_d_addressJ = /^[a-zA-Z0-9가-힣]*$/;
		var p_infoJ = /^.{1,300}$/;

		$(document).ready(function () {
			/* 아이디 중복체크 */
			$('form').on('submit', function () {
				var inval_Arr = new Array(10).fill(false);

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
					inval_Arr[6] = true;
				} else {
					inval_Arr[6] = false;
					alert('주소를 확인하세요.');
					return false;
				}
				
				
				// 자기소개 정규식
				if (p_infoJ.test($('#p_info').val())) {
					inval_Arr[7] = true;
				} else {
					inval_Arr[7] = false;
					alert('회사소개를 확인하세요.');
					return false;
				}
				
				// 자기소개 정규식
				if (p_infoJ.test($('#career').val())) {
					inval_Arr[8] = true;
				} else {
					inval_Arr[8] = false;
					alert('경력소개를 확인하세요.');
					return false;
				}
				
				// 자기소개 정규식
				if (p_infoJ.test($('#speciality').val())) {
					inval_Arr[9] = true;
				} else {
					inval_Arr[9] = false;
					alert('전문분야를 확인하세요.');
					return false;
				}
				
				
				
				// 자격증 정규식
				if (businessnumberJ.test($('#businessnumber').val())) {
					inval_Arr[3] = true;
				} else {
					inval_Arr[3] = false;
					alert('사업자등록증 번호를 확인하세요.');
					return false;
				}
				
				// 이름 정규식
				if (nameJ.test($('#w_name').val())) {
					inval_Arr[4] = true;
				} else {
					inval_Arr[4] = false;
					alert('이름을 확인하세요.');
					return false;
				}

				// 휴대폰번호 정규식
				if (phoneJ.test($('#w_tel').val())) {
					inval_Arr[5] = true;
				} else {
					inval_Arr[5] = false;
					alert('전화번호를 확인하세요.');
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
					console.log('true');
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
			$("#w_name").blur(function () {
				if (nameJ.test($(this).val())) {
					$("#w_name_check").text('');
				} else {
					$('#w_name_check').text('한글 2~4자 이내로 입력하세요. (특수기호, 공백 사용 불가)');
					$('#w_name_check').css('color', 'red');
				}
			});
			
			
			//자격증번호 요휴성
			$("#businessnumber").blur(function () {
				if (businessnumberJ.test($(this).val())) {
					$("#businessnumber_check").text('');
				} else {
					$('#businessnumber_check').text('111-11-11111 형식으로 입력하세요');
					$('#businessnumber_check').css('color', 'red');
				}
			});
			
			// 휴대전화
			$('#w_tel').blur(function () {
				if (phoneJ.test($(this).val())) {
					$("#w_tel_check").text('');
				} else {
					$('#w_tel_check').text('휴대폰번호를 확인해주세요 ');
					$('#w_tel_check').css('color', 'red');
				}
			});
		});
	</script>

	<div class="container">
		<div class="row justify-content-md-center"
			style="margin-top: 7em; height: 1230px;">
			<div class="card-wrapper" style="width: 650px;">
				<div class="brand">
					<img src="resources/login/logo.jpg" alt="logo">
				</div>
				<div class="card fat" style="margin-top: -15px;">
					<div class="card-body">
						<h4 class="card-title">사업자정보입력</h4>
						<form action="pjoin_2" method="post" class="my-login-validation">
							<div class="form-group">
								<input type="hidden" class="form-control" id="p_id" name="p_id"
									value="${p_id.p_id}">
							</div>
							<div class="form-group">
								<label for="name">회사명</label> <input type="text"
									class="form-control" id="w_name" name="w_name"
									placeholder="사업자명입력">
								<div id="w_name_check"></div>
							</div>
							<div class="form-group">
								<label for="name">사업자번호</label> <input id="businessnumber"
									name="businessnumber" type="text" class="form-control"
									placeholder="사업자번호">
								<div id="businessnumber_check"></div>
							</div>
							<div class="form-group">
								<label>주소</label> <input id="w_address" name="w_address"
									type="text" class="form-control" placeholder="사업장주소"
									style="width: 440px;">
								<button class="btn btn-primary mr-2" type="button"
									onclick="findAddr()" id="member_post" name="member_post"
									style="margin: -55px 0 0 28em;">주소찾기</button>
								
							</div>
							<div class="form-group">
								<label>상세 주소</label> <input id="w_d_address" name="w_d_address"
									type="text" class="form-control" placeholder="상세주소">
								<div id="w_d_address_check"></div>
							</div>
							<div class="form-group">
								<label>전화번호&nbsp;</label> <input id="w_tel"
									name="w_tel" type="tel" class="form-control">
								<div id="w_tel_check"></div>
							</div>
							<div class="form-group">
								<label>자기소개</label>
								<textarea class="form-control" id="p_info" name="p_info"
									placeholder="소개입력" rows="4" cols="130"></textarea>
								<div id="p_info_check"></div>
							</div>
							<div class="form-group">
								<label>대표경력</label>
								<textarea class="form-control" id="career" name="career"
									placeholder="대표경력" rows="4" cols="130"></textarea>
								<div id="career_check"></div>
							</div>
							<div class="form-group">
								<label>전문분야</label>
								<textarea class="form-control" id="speciality" name="speciality"
									placeholder="전문분야" rows="4" cols="130"></textarea>
								<div id="speciality_check"></div>
							</div>
							<button type="submit" class="btn btn-primary mr-2"
								style="width: 100px;">다음</button>
							<button class="btn btn-light" onclick="cancel()"
								style="width: 100px;">취소</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="resources/login/my-login.js"></script>
	<script>
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
				}
			})
		}
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
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>

</html>