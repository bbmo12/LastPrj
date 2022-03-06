<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset='utf-8' />
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
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
<%-- ${sessionScope.mId } --%>
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



	<br>
	<br>
	<br>
	<br>
	<div align="center">
		<h1>일반회원 예약내역조회</h1>
	</div>

	<section id="my_section">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="blog_right_sidebar">
						<aside class="single_sidebar_widget author_widget">
							<img class="author_img rounded-circle"
								src="resources/upload/${member.picture}" style="width: 210px"
								alt="">
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
								<li><a href="petmemberForm"
									class="d-flex justify-content-between">
										<p>반려동물 프로필</p>
								</a></li>
								<li><a href="#" class="d-flex justify-content-between">
										<p>예약 내역</p>
								</a></li>
								<li><a href="#" class="d-flex justify-content-between">
										<p>결제 내역</p>
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
					<div class="col-lg-12 col-md-12 blog_details">
						<table class="table">
							<thead>
								<tr>
									<th>예약번호</th>
									<th>수의사 이름</th>
									<th>예약신청일자</th>
									<th>예약시간</th>
									<th>예약내용</th>
									<th>품종</th>
									<th>예약여부</th>
									<th>취소사유</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${reservation }" var="res">
									<tr>
										<td><input class="rno" type="hidden" value="${res.r_no }">${res.r_no }</td>
										<td>${res.name }</td>
										<td>${res.r_date}</td>
										<td>${res.time }</td>
										<td>${res.rcontent }</td>
										<td>${res.pcontent }</td>
										<td><input class="in_code" type="hidden"
											value="${res.rccontent }"> ${res.rccontent }</td>
										<td>${res.refuse}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</section>

	<script>
		//table td값만
		var val = $(".in_code").parent();

		console.log(val);
		console.log(val.length);
		for (var i = 0; i < val.length; i++) {
			//예약결과코드 분류
			if (val[i].innerText == '결제가능') {

				console.log(val[i]);

				val[i].classList.add("code");
				$(".code").empty();
				var check = $(".code").append(
						`<button class="payBtn">결제하기</button>`);

			} else if (val[i].innerText == '승인거절') {

				val[i].classList.add("refuse");

			} else if (val[i].innerText == '결제완료') {

				val[i].classList.add("complete");
				$(".complete").empty();
				var check = $(".complete").append(`<span>예약완료</span>`);
			} //else if문
		} //for문
		//결제후 코드 업데이트
		function payUpdate(){
			
		}//코드 업데이트 끝부분
		
		$(".payBtn").on('click', function() {
			var rno = $(this).parent().parent().children().first().text();
			console.log($(this).parent().parent().children().first().text());
			var m_id = "${sessionScope.mId }";
			
			var IMP = window.IMP; // 생략가능
			IMP.init('imp48272965');
			// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
			// ''안에 띄어쓰기 없이 가맹점 식별코드를 붙여넣어주세요. 안그러면 결제창이 안뜹니다.
			IMP.request_pay({
				pg: 'kakao',
				pay_method: 'card',
				merchant_uid: 'merchant_' + new Date().getTime(),
				/* 
				 *  merchant_uid에 경우 
				 *  https://docs.iamport.kr/implementation/payment
				 *  위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
				 */
				name: '예약결제',
				// 결제창에서 보여질 이름
				// name: '주문명 : ${auction.a_title}',
				// 위와같이 model에 담은 정보를 넣어 쓸수도 있습니다.
				amount: 1000000,
				// amount: ${bid.b_bid},
				// 가격 
				buyer_name: '이름',
				// 구매자 이름, 구매자 정보도 model값으로 바꿀 수 있습니다.
				// 구매자 정보에 여러가지도 있으므로, 자세한 내용은 맨 위 링크를 참고해주세요.
				buyer_postcode: '123-456',
			}, function (rsp) {
				console.log(rsp);
				if (rsp.success) {
					var msg = '결제가 완료되었습니다.';
					msg += '결제 금액 : ' + rsp.paid_amount;
					// success.submit();
					
					
					// 결제 성공 시 정보를 넘겨줘야한다면 body에 form을 만든 뒤 위의 코드를 사용하는 방법이 있습니다.
					// 자세한 설명은 구글링으로 보시는게 좋습니다.
				} else {
					var msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;
				}
				alert(msg);
			});
				
				//결제 완료 후 결제 내역 등록
				$.ajax({
				url : 'payupdate',
				method : 'post',
				data : {
					'rno' : rno,
					'm_id': m_id
				},
				success : function(result) {
				},
				error : function(error) {
					alert("결제실패")
				}
			})
			
			
			

		})
	</script>
</body>
</html>