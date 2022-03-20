<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<style>

.single_sidebar_widget .post_category_widget {
	text-decoration: none !important;
	font-size : 2rem !important;
}
	#my_section {
		padding: 50px;
		background: #f9f9fd;
	}

	.blog_right_sidebar{
		box-shadow: 0 .15rem 1.75rem 0 rgba(58,59,69,.1)!important;
		border: 1px solid #e3e6f0;
    	border-radius: 0.35rem
	}
	.card{
		box-shadow: 0 .15rem 1.75rem 0 rgba(58,59,69,.1)!important;
		border: 1px solid #e3e6f0;
    	border-radius: 0.35rem
	}
	
	.card-header{
		background: white;
		font-size: 1.0rem;
	 font-family: 'NanumBarunGothic';
	 font-style: normal;
 	font-weight: 400;
	}
	
	.card-footer{
	background: white;
		font-size: 1.0rem;
	 font-family: 'NanumBarunGothic';
	 font-style: normal;
 	font-weight: 400;
	}
	.card_notice{
	font-size: 0.8rem;
	 font-family: 'NanumBarunGothic';
	 font-style: normal;
 	font-weight: 400;
	}
	
	.partner_img{
	object-fit: cover;
	object-position:top;
	border-radius:50%;
	width: 180px !important;
	height: 180px !important;
	float: none;
	margin: 0 auto;
}

.widget_title{
	background: #0062ff !important;
}

@font-face {
 font-family: 'NanumBarunGothic';
 font-style: normal;
 font-weight: 400;
 src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.eot');
 src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.eot?#iefix') format('embedded-opentype'), url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.woff') format('woff'), url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.ttf') format('truetype');
}

@font-face {
 font-family: 'NanumBarunGothic';
 font-style: normal;
 font-weight: 700;
 src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebBold.eot');
 src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebBold.eot?#iefix') format('embedded-opentype'), url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebBold.woff') format('woff'), url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebBold.ttf') format('truetype')
}

@font-face {
 font-family: 'NanumBarunGothic';
 font-style: normal;
 font-weight: 300;
 src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebLight.eot');
 src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebLight.eot?#iefix') format('embedded-opentype'), url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebLight.woff') format('woff'), url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebLight.ttf') format('truetype');
}

.nanumbarungothic * {
 font-family: 'NanumBarunGothic', sans-serif;
}

#cardTitle{
	 font-size: 1.25rem;
	 font-family: 'NanumBarunGothic';
	 font-style: normal;
 	font-weight: 700;
}

#myinfo{
	font-size: 0.8rem;
	 font-family: 'NanumBarunGothic';
	 font-style: normal;
 	font-weight: 300;
}
</style>

<body>
	<section class="department-area" style="padding: 30px 0 30px;">
		<div class="container">
				<div class="col-lg-6 offset-lg-3">
					<div class="section-top text-center">
						<br><br><br>
						<h2></h2>
					</div>
				</div>
		</div>
	</section>
	<section id="my_section">
		<div class="container" style="max-width: 1350px;">
			<div class="row">
				<div class="col-lg-3">
				<h2>MyPage</h2>
				<br>
				<div class="blog_right_sidebar" style="width: 250px;">
						<aside class="single_sidebar_widget author_widget">
							<img class="partner_img"
								src="resources/upload/${member.pfile}" onerror ="this.src='resources/upload/cat.jpg'"  style="width: 210px"
								alt="">
							<br><br>
							<h4>${member.name }님</h4>
							<div class="br"></div>
							<div id="myinfo">
							<i class="fa-solid fa-pen"></i>&nbsp;내 정보 수정하기
							</div>
						</aside>
					</div>
					<br>
					<div class="blog_right_sidebar" style="width: 250px;">
						<aside class="single_sidebar_widget post_category_widget">
							<h4 class="widget_title">My menu</h4>
							<ul class="list cat-list nanumbarungothic">
								<li><a href="memberMypage" class="d-flex justify-content-between">
										<p>내 프로필</p>
									</a></li>
								<li><a href="protocol" class="d-flex justify-content-between">
										<p>반려동물 진료기록</p>
									</a></li>
								<li><a href="reservationSelect" class="d-flex justify-content-between">
										<p>예약 내역</p>
									</a></li>
								<li><a href="myPay" class="d-flex justify-content-between">
										<p>결제 내역</p>
									</a></li>
								<li><a href="mycounsel" class="d-flex justify-content-between">
										<p>상담 내역</p>
									</a></li>
								<li><a href="myreport" class="d-flex justify-content-between">
										<p>신고 내역</p>
									</a></li>
								<li><a href="myfallow" class="d-flex justify-content-between">
										<p>팔로우</p>
									</a></li>
								<li><a href="logout" class="d-flex justify-content-between">
										<p>로그아웃</p>
									</a></li>
								<li><a href="mdeleteForm" class="d-flex justify-content-between">
										<p>회원탈퇴</p>
									</a></li>
							</ul>
						</aside>
					</div>
				</div>
				<div class="col-lg-9 posts-list">
					<div class="single-post row" style="margin-left: 40px;">
						<div class="col-lg-12 col-md-12 blog_details">
							<div class="row">
								<div class="col-lg-4 col-md-4">
								<br><br>
									<div class="card" style="border-left: 0.25rem solid #0062ff !important;">
										<div class="card-body text-center" style="padding:25px">
										<h5 id="cardTitle">내 예약 수</h5>
										<h3>3</h3>
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-md-4">
								<br><br>
									<div class="card" style="border-left: 0.25rem solid #36b9cc !important;">
										<div class="card-body text-center" style="padding:25px">
										<h5 id="cardTitle">내 상담 수</h5>
										<h3>3</h3>
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-md-4">
								<br><br>
									<div class="card" style="border-left: 0.25rem solid #f6c23e !important;">
										<div class="card-body text-center" style="padding:25px">
										<h5 id="cardTitle">내 리뷰 수</h5>
										<h3>3</h3>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-12 col-md-12 blog_details">
							<div class="card">
								<div class="card-header">
									<i class="mdi mdi-bell-outline"></i> 내 알림 목록
								</div>
								<div class="card-body card_notice" style="padding:15px">
									<div id="notice">
										<span class="fa-stack fa-lg"> 
										<i class="fa fa-circle fa-stack-2x" style="color: #44ce42"></i> 
										<i class="fa fa-calendar-day fa-stack-1x fa-inverse"></i>
										</span> 
										<span>김선생</span>&nbsp;&nbsp;&nbsp;<span class="text-gray ellipsis mb-0">예약이 완료되었습니다.</span>
										&nbsp;&nbsp;&nbsp;<span>2022-03-01</span>
										<hr>
									</div>
									<div id="notice">
										<span class="fa-stack fa-lg"> 
										<i class="fa fa-circle fa-stack-2x" style="color: #44ce42"></i> 
										<i class="fa fa-calendar-day fa-stack-1x fa-inverse"></i>
										</span> 
										<span>김선생</span>&nbsp;&nbsp;&nbsp;<span class="text-gray ellipsis mb-0">예약이 완료되었습니다.</span>
										&nbsp;&nbsp;&nbsp;<span>2022-03-01</span>
										<hr>
									</div>
								</div>
								<div class="card-footer">
								<p>수신일로부터 7일이 지난 알림은 자동 삭제됩니다.</p>
								</div>
							</div>
						</div>
						
						<div class="col-lg-12 col-md-12 blog_details">
							<div class="card">
								<div class="card-header">
									<i class="mdi mdi-bell-outline"></i> 내 반려동물
								</div>
								<div class="card-body" style="padding:15px">
								
								</div>
								<div class="card-footer">
								<span style="color:#0062ff"><i class="fa-solid fa-plus"></i>&nbsp;&nbsp;</span><span>반려동물 추가</span>
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