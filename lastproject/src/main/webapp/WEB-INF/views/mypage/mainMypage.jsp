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

.no_deco {
	text-decoration: none !important;
	font-size: 0.8rem !important;
	color: black;
}

#my_section {
	margin-top: -70px;
    padding-bottom: 25px;
}

.blog_right_sidebar {
	box-shadow: 0 .15rem 1.75rem 0 rgba(58, 59, 69, .1) !important;
	border: 1px solid #e3e6f0;
	border-radius: 0.35rem;
	float: none !important;
	margin: 0 auto !important;
	background-color: white;
	width: 250px;
	font-family: 'Binggrae';
}

.card {
	box-shadow: 0 .15rem 1.75rem 0 rgba(58, 59, 69, .1) !important;
	border: 1px solid #e3e6f0;
	border-radius: 0.35rem
}

.card-header {
	background: white;
	font-size: 1.0rem;
	font-family: 'Binggrae';
	font-style: normal;
	font-weight: 500;
	color: black;
}

.card-footer {
	background: white;
	font-size: 1.0rem;
	font-style: normal;
	font-weight: 400;
}

#notice_footer {
	text-align: center;
	font-size: 1.0rem;
	font-style: normal;
	font-weight: 400;
}

.card_notice {
	font-size: 0.8rem;
	font-style: normal;
	font-weight: 400;
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

.pet_img {
	object-fit: cover;
	object-position: top;
	border-radius: 50%;
	width: 100px !important;
	height: 100px !important;
	float: none;
	margin-bottom: 10px;
}

.widget_title {
	background: #0062ff !important;
}

#cardTitle {
	font-size: 1.25rem;
	font-style: normal;
	font-weight: 700;
}

#myinfo {
	font-size: 0.8rem;
	font-style: normal;
	font-weight: 300;
}

#pet_img2 {
	display: inline-block;
	text-align: center;
	margin-right: 20px;
	font-size: 0.8rem;
	font-style: normal;
	font-weight: 400;
}

#Mainname {
	font-size: 1.5rem !important;
	font-family: 'Binggrae-bold' !important;
	font-style: normal !important;
	font-weight: 700 !important;
	color: gray;
}

#menu_bold {
	font-size: 1.0rem;
	font-style: normal;
	font-weight: 700;
	color: black;
}
.swal2-content {
		display: none;
}

.que:first-child {
	
}

.que {
	position: relative;
}

.que::before {
	display: inline-block;
}

.que.on>span {
	
}

.anw {
	display: none;
	overflow: hidden;
}

.anw::before {
	display: inline-block;
}
</style>

<body>
	<section class="department-area" style="padding: 30px 0 30px;">
		<div class="container">
			<div class="col-lg-6 offset-lg-3">
				<div class="section-top text-center">
					<br>
					<br>
					<br>
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
							<img class="partner_img" src="/upload/${member.pfile}"
								onerror="this.src='resources/upload/cat.jpg'" alt=""> <br>
							<br>
							<h4 id="Mainname">${member.name }님</h4>
							<div class="br"></div>
							<div id="myinfo">
								<i class="fa-solid fa-pen"></i>&nbsp;<a class="no_deco"
									href="mconfirmPass">내 정보 수정하기</a>
							</div>
						</aside>
					</div>
					<br>
					<div class="blog_right_sidebar">
						<aside class="single_sidebar_widget post_category_widget">
							<h4 class="widget_title">My menu</h4>
							<ul class="list cat-list">
								<p id="menu_bold">내 활동 내역</p>
								<li><a href="protocol"
									class="d-flex justify-content-between no_deco">
										<p>반려동물 진료기록</p>
								</a></li>
								<li><a href="reservationSelect"
									class="d-flex justify-content-between no_deco">
										<p>예약 내역</p>
								</a></li>
								<li><a href="myPay"
									class="d-flex justify-content-between no_deco">
										<p>결제 내역</p>
								</a></li>
								<li><a href="mycounsel"
									class="d-flex justify-content-between no_deco">
										<p>상담 내역</p>
								</a></li>
								<li><a href="myreport"
									class="d-flex justify-content-between no_deco">
										<p>신고 내역</p>
								</a></li>
								<li><a href="myfallow"
									class="d-flex justify-content-between no_deco">
										<p>팔로우</p>
								</a></li>
								<br>
								<br>
								<p id="menu_bold">회원 정보 관리</p>
								<li><a href="mconfirmPass"
									class="d-flex justify-content-between no_deco">
										<p>회원 정보 수정</p>
								</a></li>
								<li><a href="logout"
									class="d-flex justify-content-between no_deco">
										<p>로그아웃</p>
								</a></li>
								<li><a href="mdeleteForm"
									class="d-flex justify-content-between no_deco">
										<p>회원탈퇴</p>
								</a></li>
							</ul>
						</aside>
					</div>
				</div>
				<div class="col-lg-9 posts-list">
					<div class="single-post row">
						<div class="col-lg-12 col-md-12 blog_details">
							<div class="row">
								<div class="col-lg-4 col-md-4">
									<br>
									<br>
									<div class="card"
										style="border-left: 0.25rem solid #0062ff !important;">
										<div class="card-body text-center" style="padding: 20px">
											<div style="margin-right: 20px;">
												<span class="fa-stack fa-lg" style="margin-right: 10px;">
													<i class="fa fa-circle fa-stack-2x" style="color: #0062ff"></i>
													<i class="fa fa-calendar-check fa-stack-1x fa-inverse"></i>
												</span><span id="cardTitle">내 예약 횟수</span>
											</div>
											<h3>${cntR }</h3>
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-md-4">
									<br>
									<br>
									<div class="card"
										style="border-left: 0.25rem solid #36b9cc !important;">
										<div class="card-body text-center" style="padding: 20px;">
											<div style="margin-right: 20px;">
												<span class="fa-stack fa-lg" style="margin-right: 10px;">
													<i class="fa fa-circle fa-stack-2x" style="color: #36b9cc"></i>
													<i class="fa fa-comments fa-stack-1x fa-inverse"></i>
												</span><span id="cardTitle">내 상담 횟수</span>
											</div>
											<h3>${cntC }</h3>
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-md-4">
									<br>
									<br>
									<div class="card"
										style="border-left: 0.25rem solid #f6c23e !important;">
										<div class="card-body text-center" style="padding: 20px">
											<div style="margin-right: 20px;">
												<span class="fa-stack fa-lg" style="margin-right: 10px;">
													<i class="fa fa-circle fa-stack-2x" style="color: #f6c23e"></i>
													<i class="fa fa-feather-pointed fa-stack-1x fa-inverse"></i>
												</span><span id="cardTitle">내 리뷰 횟수</span>
											</div>
											<h3>${cntW }</h3>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-12 col-md-12 blog_details">
							<div class="card">
								<div class="card-header que">
									<i class="fa-solid fa-bell"></i>&nbsp;&nbsp;내 알림 목록
								</div>
								<div class="card-body card_notice anw" style="padding: 15px">
									<c:if test="${ fn:length(notices) == 0  }">
										<div align="center">조회된 결과가 없습니다.</div>
									</c:if>
									<c:forEach items="${notices}" var="noti">
										<div id="notice">
											<span class="fa-stack fa-lg"> <i
												class="fa fa-circle fa-stack-2x" style="color: #44ce42"></i>
												<i class="fa fa-calendar-day fa-stack-1x fa-inverse"></i>
											</span> <span>${noti.name}</span>&nbsp;&nbsp;&nbsp;<span
												class="text-gray ellipsis mb-0">${noti.content}</span>
											&nbsp;&nbsp;&nbsp;<span>${noti.w_date}</span>
											<hr>
										</div>
									</c:forEach>
								</div>
								<div id="notice_footer">
									<p>수신일로부터 7일이 지난 알림은 자동 삭제됩니다.</p>
								</div>
							</div>
						</div>

						<div class="col-lg-12 col-md-12 blog_details">
							<div class="card">
								<div class="card-header">
									<i class="fa-solid fa-paw"></i> 내 반려동물
								</div>
								<div class="card-body" style="padding: 15px">
									<c:if test="${ fn:length(pets) == 0  }">
										<div align="center">조회된 결과가 없습니다.</div>
									</c:if>
									<c:forEach items="${pets }" var="pet">
										<div id="pet_img2">
											<img class="pet_img" src="/upload/${pet.picture }"
												onerror="this.src='resources/upload/cat.jpg'" alt="">
											<br> <a class="no_deco"
												href="petDetail?pet_no=${pet.pet_no}">${pet.name }</a>
										</div>
									</c:forEach>
								</div>
								<div class="card-footer">
									<a href="mypetAddForm" class="no_deco"><span
										style="color: #0062ff"><i class="fa-solid fa-plus"></i>&nbsp;&nbsp;</span><span>반려동물
											추가</span></a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<script>
		//아코디언 함수
		$(document).on("click", ".que", function() {
			$(this).next(".anw").stop().slideToggle(300);
			$(this).toggleClass('on').siblings().removeClass('on');
			$(this).next(".anw").siblings(".anw").slideUp(300); // 1개씩 펼치기
		})//end 아코디언 함수
	</script>
	<script>
	if("${memberupdate}" != "" ){
		Swal.fire('개인정보가<br>변경되었습니다.');
	}
	</script>
	<script>
	if("${petadd}" != "" ){
		Swal.fire('반려동물이<br>등록되었습니다.');
	}
	</script>
	<script>
	if("${petupdate}" != "" ){
		Swal.fire('반려동물정보가<br>수정되었습니다.');
	}
	</script>
	<script>
	if("${petdelete}" != "" ){
		Swal.fire('반려동물이<br>삭제되었습니다.');
	}
	</script>
</body>

</html>