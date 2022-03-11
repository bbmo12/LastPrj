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

	<body class="my-login-page">
		<div class="container">
			<div class="row justify-content-md-center" style="margin-top: 7em; height: 1230px;">
				<div class="card-wrapper" style="width: 650px;">
					<div class="brand">
						<img src="resources/login/logo.jpg" alt="logo">
					</div>
					<div class="card fat" style="margin-top: -15px;">
						<div class="card-body">
							<h4 class="card-title">사업자정보입력</h4>
							<form action="pjoin_2" method="post" class="my-login-validation">
								<div class="form-group">
									<input type="hidden" class="form-control" id="p_id" name="p_id" value="${p_id.p_id}">
								</div>
								<div class="form-group">
									<label for="name">회사명</label>
									<input type="text" class="form-control" id="w_name" name="w_name" placeholder="사업자명입력">
								</div>
								<div class="form-group">
									<label for="name">사업자번호</label>
									<input id="businessnumber" name="businessnumber" type="text" class="form-control"placeholder="사업자번호">
								</div>
								<div class="form-group">
									<label>주소</label>
									<input id="w_address" name="w_address" type="text" class="form-control" placeholder="사업장주소" style="width: 440px;">
									<button class="btn btn-primary mr-2" type="button" onclick="findAddr()" id="member_post" name="member_post" style="margin: -55px 0 0 28em;">주소찾기</button>
								</div>
								<div class="form-group">
									<label>상세 주소</label>
									<input id="w_d_address" name="w_d_address" type="text" class="form-control" placeholder="상세주소">
								</div>
								<div class="form-group">
									<label>사업장전화번호&nbsp;('-'없이 번호만 입력해주세요)</label>
									<input id="w_tel" name="w_tel" type="tel" class="form-control">
								</div>
								<div class="form-group">
									<label>이용안내</label>
									<textarea class="form-control" id="p_info" name="p_info" placeholder="이용안내" rows="4" cols="130"></textarea>
								</div>
								<div class="form-group">
									<label>대표경력</label>
									<textarea class="form-control" id="career" name="career" placeholder="대표경력" rows="4"cols="130"></textarea>
								</div>
								<div class="form-group">
									<label>전문분야</label>
									<textarea class="form-control" id="speciality" name="speciality" placeholder="전문분야"rows="4" cols="130"></textarea>
								</div>
								<button type="submit" class="btn btn-primary mr-2" style="width: 100px;">다음</button>
								<button class="btn btn-light" onclick="cancel()" style="width: 100px;">취소</button>
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
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>

</html>