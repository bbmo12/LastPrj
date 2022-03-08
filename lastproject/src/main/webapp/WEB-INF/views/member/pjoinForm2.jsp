<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="float: none; margin: 0 auto 0 auto;"
		class="col-8 grid-margin stretch-card">
		<div class="main-panel">
			<div class="content-wrapper">
				<div class="card">
					<div class="card-body">
						<h4 class="card-title">회사 정보</h4>
						<form class="forms-sample" action="pjoin_2" method="post">
							<div class="form-group">
								<input type="hidden" class="form-control" id="p_id" name="p_id" value="${p_id.p_id}">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword4">회사명</label> <input
									type="text" class="form-control" id="w_name" name="w_name"
									placeholder="회사명">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword4">사업자번호</label> <input
									type="text" class="form-control" id="businessnumber"
									name="businessnumber" placeholder="사업자번호">
							</div>
							<div class="form-group">
							<button type="button" readonly onclick="findAddr()" id="member_post" name = "member_post">버튼</button>
								<label for="exampleInputPassword4">주소</label> <input type="text"
									class="form-control" id="w_address" name="w_address"
									placeholder="회사주소">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword4">상세 주소</label> <input
									type="text" class="form-control" id="w_d_address"
									name="w_d_address" placeholder="상세주소">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword4">전화번호</label> <input
									type="text" class="form-control" id="w_tel" name="w_tel"
									placeholder="회사전화번호">
							</div>
							<h4 class="card-title">소개 글</h4>
							<div class="form-group">
								<label for="exampleInputPassword4">이용 안내</label>
								<textarea class="form-control" id="p_info" name="p_info"
									placeholder="이용안내" rows="10" cols="130">
                        </textarea>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword4">대표경력</label>
								<textarea class="form-control" id="career" name="career"
									placeholder="대표경력" rows="4" cols="130">
                        </textarea>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword4">전문분야</label>
								<textarea class="form-control" id="speciality" name="speciality"
									placeholder="전문분야" rows="4" cols="130">
                        </textarea>
							</div>

							<button type="submit" class="btn btn-primary mr-2">다음</button>
							<button class="btn btn-light" onclick="location.href='home'">취소</button>
							</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		function findAddr() {
			new daum.Postcode(
					{
						oncomplete : function(data) {

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