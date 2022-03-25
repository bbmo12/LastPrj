<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags/" prefix="my"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.card-text {
	display: inline-block;
	width: 200px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.padding {
	padding: 5rem
}

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
}

.card {
	box-shadow: 0 .15rem 1.75rem 0 rgba(58, 59, 69, .1) !important;
	border: 1px solid #e3e6f0;
	border-radius: 0.35rem
}

.card-header {
	background: white;
	font-size: 1.0rem;
	font-style: normal;
	font-weight: 400;
	color: black;
}

.card-body {
	font-size: 1.0rem;
	font-style: normal;
	font-weight: 300;
	color: black;
}

.widget_title {
	background: #0062ff !important;
}

#myinfo {
	font-size: 0.8rem;
	font-style: normal;
	font-weight: 300;
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
							<br> <br>
							<div class="card">
								<div class="card-header">
									<div align="left">
										<i class="fa-solid fa-flag"></i>&nbsp;&nbsp;&nbsp;나의팔로우
									</div>
								</div>
								<div class="card-body">
									<div class="row">
										<c:if test="${fn:length(follow)==0 }">
												<h4 style="margin-left: 23em;">등록된 팔로우가 없습니다.</h4>
										</c:if>
										<c:forEach items="${follow }" var="follow">
											<div class="col-lg-3 col-sm-6">
												<div class="single-doctor mb-3 mb-lg-0">
													<div class="doctor-img">
														<img src="/upload/${follow.pfile }" alt=""
															class="img-fluid" onerror="this.src='resources/upload/cat.jpg'"
															style="width: 195px; height: 200px;">
													</div>
													<div class="content-area">
														<div class="doctor-name text-center">
															<a href="pmemberDetail?id=${follow.p_id}">
																<h3>${follow.p_id }</h3>
															</a>
														</div>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

</body>

</html>