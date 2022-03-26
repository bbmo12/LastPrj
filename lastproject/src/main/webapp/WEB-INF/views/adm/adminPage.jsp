<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib tagdir="/WEB-INF/tags" prefix="my"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>Insert title here</title>



<!-- Chart.js 를 위한 CDN -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Modal을 위한 CDN -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- 모르겠음 -->
<script
	src="https://cdn.jsdelivr.net/gh/ethereum/web3.js@1.0.0-beta.37/dist/web3.min.js"></script>
<script src="template/js/diaLog.js"></script>


<!-- Air datepicker를 위한 CDN -->
<script
	src="resources/assets/js/vendor/jquery.datetimepicker.full.min.js"></script>
<link href="resources/dist/css/datepicker.min.css" rel="stylesheet"
	type="text/css" media="all">
<script src="resources/dist/js/datepicker.js"></script>
<script src="resources/dist/js/i18n/datepicker.ko.js"></script>


<!-- <script src="resources/adminJs/adminMemberPageJS.js"></script> -->

</head>
<style>
#my_section {
	margin-top: -70px;
	padding-bottom: 25px;
}

.card-footer {
	background: white;
	font-size: 1.0rem;
	/* font-family: 'NanumBarunGothic'; */
	font-style: normal;
	font-weight: 400;
}

.padding {
	padding: 5rem
}

.table th {
	text-align: center;
	font-size: 1.0rem;
	/* font-family: 'NanumBarunGothic'; */
	font-style: normal;
	font-weight: 500 !important;
	color: black;
}

.table {
	width: 100%;
	max-width: 100%;
	margin-bottom: 1rem;
	background-color: transparent
}

.table-striped tbody tr:nth-of-type(odd) {
	background-color: #f9f9fd;
}

.table td {
	font-size: 16px;
	padding: .875rem 0.9375rem
}

.badge {
	font-size: 12px;
	line-height: 1;
	padding: .375rem .5625rem;
	font-weight: normal;
}

.badge-info {
	background-color: cornflowerblue;
	border: none;
}

.badge-pay {
	background-color: #38a4ff;
	color: #fff;
}

.no_deco {
	text-decoration: none !important;
	font-size: 0.8rem !important;
	color: black;
}

.blog_right_sidebar {
	box-shadow: 0 .15rem 1.75rem 0 rgba(58, 59, 69, .1) !important;
	border: 1px solid #e3e6f0;
	border-radius: 0.35rem;
	float: none !important;
	margin: 0 auto !important;
	background-color: white;
	width: 250px;
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

#Mainname {
	font-size: 1.5rem !important;
	/* font-family: 'NanumBarunGothic' !important; */
	font-style: normal !important;
	font-weight: 700 !important;
	color: gray;
}

#myinfo {
	font-size: 0.8rem;
	/* font-family: 'NanumBarunGothic'; */
	font-style: normal;
	font-weight: 300;
}

#menu_bold {
	font-size: 1.0rem;
	/* font-family: 'NanumBarunGothic'; */
	font-style: normal;
	font-weight: 700;
	color: black;
}

.card-body {
	font-size: 1.0rem;
	/* font-family: 'NanumBarunGothic'; */
	font-style: normal;
	font-weight: 300;
	color: black;
}

.card {
	box-shadow: 0 .15rem 1.75rem 0 rgba(58, 59, 69, .1) !important;
	border: 1px solid #e3e6f0;
	border-radius: 0.35rem
}

.card-header {
	background: white;
	font-size: 1.0rem;
	/* font-family: 'NanumBarunGothic'; */
	font-style: normal;
	font-weight: 400;
	color: black;
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

/* #myChart {
	display:block; box-sizing: border-box; 
	width: 500px;
	height: 250px;
} */
</style>
<body>
	<section class="department-area" style="padding: 30px 0 30px;">
		<div class="container">
			<div class="col-lg-6 offset-lg-3">
				<div class="section-top text-center">
					<br> <br> <br>
					<h2></h2>
				</div>
			</div>
		</div>
	</section>
	<section id="my_section">
		<div class="container" style="max-width: 1350px;">
			<div class="row">
				<div class="col-lg-3">
					<h2 align="center">AdminPage</h2>
					<br>
					<div class="blog_right_sidebar">
						<aside class="single_sidebar_widget author_widget">
							<img class="partner_img"
								src="resources/upload/${pmember.picture}"
								onerror="this.src='resources/upload/pet.PNG'"> <br> <br>
							<h4 id="Mainname">관리자님</h4>
							<div class="br"></div>
							<div id="myinfo">
								<i class="fa-solid fa-pen"></i>&nbsp;메인 페이지
							</div>
						</aside>
					</div>
					<br>
					<div class="blog_right_sidebar">
						<aside class="single_sidebar_widget post_category_widget">
							<h4 class="widget_title">My menu</h4>
							<ul class="list cat-list nanumbarungothic">
								<li><a href="adminMemberPage"
									class="d-flex justify-content-between">
										<p>차트.목록</p>
								</a></li>
								<li><a href="adminReportPage"
									class="d-flex justify-content-between no_deco">
										<p>신고 관리</p>
								</a></li>
								<li><a href="adminBoardPage"
									class="d-flex justify-content-between no_deco">
										<p>공지사항</p>
								</a></li>
								<li><a href="logout"
									class="d-flex justify-content-between no_deco">
										<p>로그아웃</p>
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
												</span><span id="cardTitle">새로운 신고 수</span>
											</div>
											<h3 id="admMemberC"></h3>
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-md-4">
									<br> <br>
									<div class="card"
										style="border-left: 0.25rem solid #36b9cc !important;">
										<div class="card-body text-center" style="padding: 20px;">
											<div style="margin-right: 20px;">
												<span class="fa-stack fa-lg" style="margin-right: 10px;">
													<i class="fa fa-circle fa-stack-2x" style="color: #36b9cc"></i>
													<i class="fa fa-comments fa-stack-1x fa-inverse"></i>
												</span><span id="cardTitle">새로운 알람 수</span>
											</div>
											<h3 id="admPetC"></h3>
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-md-4">
									<br> <br>
									<div class="card"
										style="border-left: 0.25rem solid #f6c23e !important;">
										<div class="card-body text-center" style="padding: 20px">
											<div style="margin-right: 20px;">
												<span class="fa-stack fa-lg" style="margin-right: 10px;">
													<i class="fa fa-circle fa-stack-2x" style="color: #f6c23e"></i>
													<i class="fa fa-feather-pointed fa-stack-1x fa-inverse"></i>
												</span><span id="cardTitle">새로운 파트너회원 수</span>
											</div>
											<h3 id="admPmemberC"></h3>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-12 col-md-12 blog_details">
							<br> <br>
							<div class="card">
								<div class="card-header que admPetChartA">
									<i class="fa-solid fa-bell"></i>&nbsp;&nbsp;내 알림 목록
								</div>
								<div class="card-body anw" style="padding: 15px">
									<c:if test="${ fn:length(pets) == 0  }">
										<div align="center">조회된 결과가 없습니다.</div>
									</c:if>
									<c:forEach items="${pets }" var="pet">
										<div id="pet_img2">
											<img class="pet_img" src="resources/upload/${pet.picture }"
												onerror="this.src='resources/upload/cat.jpg'" alt="">
											<br> <a href="petDetail?pet_no=${pet.pet_no}">${pet.name }</a>
										</div>
									</c:forEach>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<script>
		// 아코디언 함수
		$(document).on("click", ".que", function() {
			$(this).next(".anw").stop().slideToggle(300);
			$(this).toggleClass('on').siblings().removeClass('on');
			$(this).next(".anw").siblings(".anw").slideUp(300); // 1개씩 펼치기
		})//end 아코디언 함수
	</script>
</body>

</html>