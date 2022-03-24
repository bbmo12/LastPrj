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
.single_sidebar_widget .post_category_widget {
	text-decoration: none !important;
	font-size: 2rem !important;
}

.col-lg-3{
	padding:50px;
}
.posts-list {
margin-top:1.9%;
}

#my_section {
	margin-top: -70px;
    padding-bottom: 25px;
}

.blog_right_sidebar {
	box-shadow: 0 .15rem 1.75rem 0 rgba(58, 59, 69, .1) !important;
	border: 1px solid #e3e6f0;
	border-radius: 0.35rem
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

.card-footer {
	background: white;
	font-size: 1.0rem;
	/* font-family: 'NanumBarunGothic'; */
	font-style: normal;
	font-weight: 400;
}

#notice_footer {
	text-align: center;
	font-size: 1.0rem;
	/* font-family: 'NanumBarunGothic'; */
	font-style: normal;
	font-weight: 400;
}

.card_notice {
	font-size: 0.8rem;
	/* font-family: 'NanumBarunGothic'; */
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
	margin-bottom: 5px;
}

.widget_title {
	background: #0062ff !important;
}

#cardTitle {
	font-size: 1.25rem;
	/* font-family: 'NanumBarunGothic'; */
	font-style: normal;
	font-weight: 700;
}

#myinfo {
	font-size: 0.8rem;
	/* font-family: 'NanumBarunGothic'; */
	font-style: normal;
	font-weight: 300;
}

#pet_img2 {
	display: inline-block;
	text-align: center;
	margin-right: 15px;
	font-size: 0.8rem;
	/* font-family: 'NanumBarunGothic'; */
	font-style: normal;
	font-weight: 400;
}
h1{
	color: white;
}

	#banner_content{
		color: white;
	}
	.swal2-content{
		display: none;
	}

</style>

<body>
<!-- <br><br><br><br><br>
     Banner Area Starts
    <section class="banner-area">
        <div class="container">
            <div class="row">

                <div class="col-lg-10" style="margin-left: 50px;">
                <br><br><br><br><br>
                    <h1>관리자 페이지</h1>
                    <h1>관리자님 반갑습니다.</h1>
                </div>
            </div>
        </div>
    </section> -->
	<section id="my_section">
		<div class="container" style="max-width: 1350px;">
			<div class="row">
				<div class="col-lg-3">
					<h5><a href="adminPage">메인 페이지</a></h5>
					<br>
					<div class="blog_right_sidebar" style="width: 250px;">
						<aside class="single_sidebar_widget author_widget">
							<img class="partner_img" src="resources/upload/${member.pfile}"
								onerror="this.src='resources/upload/cat.jpg'" alt=""> <br>
							<br>
							<h4>관리자님</h4>
							<div class="br"></div>
							<div id="myinfo">
								<i class="fa-solid fa-pen"></i>&nbsp;해야할 일
							</div>
						</aside>
					</div>
					<br>
					<div class="blog_right_sidebar" style="width: 250px;">
						<aside class="single_sidebar_widget post_category_widget">
							<h4 class="widget_title">My menu</h4>
							<ul class="list cat-list nanumbarungothic">
								<li><a href="adminChartPage"
									class="d-flex justify-content-between">
										<p>차트</p>
								</a></li>
								<li><a href="adminMemberPage"
									class="d-flex justify-content-between">
										<p>목록</p>
								</a></li>
								<li><a href="adminReportPage"
									class="d-flex justify-content-between">
										<p>신고 관리</p>
								</a></li>
								<li><a href="adminBoardPage"
									class="d-flex justify-content-between">
										<p>공지사항</p>
								</a></li>
								<li><a href="logout" class="d-flex justify-content-between">
										<p>로그아웃</p>
								</a></li>
							</ul>
						</aside>
					</div>
				</div>
				<div class="col-lg-9 posts-list" > 
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
												</span><span id="cardTitle">해야할 일 수</span>
											</div>
											<h3>3</h3>
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
												</span><span id="cardTitle"></span>
											</div>
											<h3>3</h3>
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
												</span><span id="cardTitle">새로운 파트너 신청</span>
											</div>
											<h3>3</h3>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-12 col-md-12 blog_details">
							<div class="card">
								<div class="card-header">
									<i class="fa-solid fa-bell"></i>&nbsp;&nbsp;내 알림 목록
								</div>
								<div class="card-body card_notice" style="padding: 15px">
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
											<img class="pet_img" src="resources/upload/${pet.picture }"
												onerror="this.src='resources/upload/cat.jpg'" alt="">
											<br> <a href="petDetail?pet_no=${pet.pet_no}">${pet.name }</a>
										</div>
									</c:forEach>
								</div>
								<div class="card-footer">
									<span style="color: #0062ff"><i class="fa-solid fa-plus"></i>&nbsp;&nbsp;</span><span>반려동물
										추가</span>
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