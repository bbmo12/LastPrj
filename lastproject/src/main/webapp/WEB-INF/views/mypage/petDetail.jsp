<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
#my_section {
		padding: 50px;
	}

	#main-form h3,
	input {
		display: inline-block;
	}

	#addDiv,
	#addService {
		margin-left: 36em;
		margin-top: -5px;
		color: #fff; 
    	background: #0062ff;
    	border: 1px solid transparent;	
	}
	#addDiv:hover,
	#addService:hover{
		color: #0062ff;
		border: 1px solid #0062ff;
		background: #fff;
	}
	#price-insert,
	#time-insert{
		color: #fff; 
    	background: #0062ff;
    	border: 1px solid transparent;	
	}
	
	#price-insert:hover,
	#time-insert:hover{
		color: #0062ff;
		border: 1px solid #0062ff;
		background: #fff;
	}

	#select-one {
		margin-top: -20px;
	}

	.form-control {
		padding: 5px;
		width: 250px;
		display: inline-block;
		border-radius: 20px;
	}

	.service-info {
		display: inline-grid;
	}

	.service-info input {
		width: 100px;
	}

	#p-info {
		margin-left: 9em;
		margin-top: -20px;
	}

	.delete-button {
		float: right;
		margin-top: 25px;
		margin-right: 100px;
		width: 62px;
	}

	#p_info {
		border: 1px solid rgba(151, 151, 151, 0.3);
	}
	#cancel{
		width: 113px;
    	height: 42px;
    	padding: 0 30px;
    	font-size: .8em;
    	text-align: center;
    	font-weight: 500;
	}
	#member_post{
		width: 100px;
    	margin-left: 51em;
    	margin-top: -70px;  	
    	color: #fff; 
    	background: #0062ff;
    	border: 1px solid transparent;	
	}
	#member_post:hover {
		color: #0062ff;
		border: 1px solid #0062ff;
		background: #fff;
	}
	#successUpdate{
		color: #fff; 
    	background: #0062ff;
    	border: 1px solid transparent;	
	}
	#successUpdate:hover {
		color: #0062ff;
		border: 1px solid #0062ff;
		background: #fff;
	}
	
	input:focus,
	textarea:focus{ 
		border: 3px solid;
	}
	
	#content{
		height: 45px;
    	padding: 12px;
   		width: 275px;
	}
	
		.card-text {
		width: 200px;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
	}

	.padding {
		padding: 5rem
	}

	.table th {
		text-align: center;
		font-size: 1.0rem;
		font-family: 'NanumBarunGothic';
		font-style: normal;
		font-weight: 500 !important;
		color: black;
		/* background-color: ghostwhite; */
	}

	.table {
		width: 100%;
		max-width: 100%;
		margin-bottom: 1rem;
		background-color: transparent;
	}

	.table-striped tbody tr:nth-of-type(odd) {
		background-color: #f9f9fd;
	}

	.table td {
		font-size: 16px;
		padding: .875rem 0.9375rem;
		text-align: center;
	}
	
	
	.no_deco {
		text-decoration: none !important;
		font-size : 0.8rem !important;
		color: black;
	}
	
	#my_section {
		padding: 50px;
		background: #f9f9fd;
	}
	
	.blog_right_sidebar{
		box-shadow: 0 .15rem 1.75rem 0 rgba(58,59,69,.1)!important;
		border: 1px solid #e3e6f0;
	   	border-radius: 0.35rem;
	   	float: none !important; margin: 0 auto !important;
	   	background-color: white;
	   	width: 250px;
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
		color: black;
	}
	
	.card-body{
		font-size: 1.0rem;
		font-family: 'NanumBarunGothic';
		font-style: normal;
		font-weight: 300;
		color: black;
		
	}
	
	.card-footer{
		background: white;
		font-size: 1.0rem;
		font-family: 'NanumBarunGothic';
		font-style: normal;
		font-weight: 400;
	}
	
	.widget_title{
		background: #0062ff !important;
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
	
	#pet_img2{
		display: inline-block;
		text-align: center;
		margin-right: 20px;
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
	
	#Mainname{
		font-size: 1.5rem !important;
		font-family: 'NanumBarunGothic'!important;
		font-style: normal !important;
	 	font-weight: 700 !important;
	 	color:gray;
	}
	
	#menu_bold{
	font-size: 1.0rem;
	font-family: 'NanumBarunGothic';
	font-style: normal;
 	font-weight: 700;
 	color: black;
}
</style>
<body>
		<section class="banner-area other-page">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<h1>MyPage</h1>
					<a href="home">Home</a> <span>|</span> <a href="memberMypage">MyPage</a>
				</div>
			</div>
		</div>
	</section>
	<section id="my_section">
		<div class="container" style="max-width: 1350px;">
			<div class="row">
				<div class="col-lg-3">
					<div class="blog_right_sidebar" style="margin-left: 40px; width: 300px;">
						<aside class="single_sidebar_widget author_widget">
							<img class="author_img rounded-circle"
								src="resources/upload/${member.picture}" onerror ="this.src='resources/upload/cat.jpg'"  style="width: 210px"
								alt="">
							<div class="br"></div>
							<h4>${member.name }</h4>
							<div class="br"></div>
						</aside>
						<aside class="single_sidebar_widget post_category_widget">
							<h4 class="widget_title">My menu</h4>
							<ul class="list cat-list">
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
					<div class="col-lg-12 col-md-12 blog_details" id="formMain">
						<div align="center">
								<br>
								<h1>${member.name }님의 반려동물 정보</h1><br>
							</div>
							<div class="form-group">
							<i class="fa-solid fa-user"></i>
								<h3 style="font-weight: bolder;">이름&nbsp;:&nbsp;</h3>
								<input type="text" style="border: none" id="name" name="name" value="${pet.name}" readonly>
							</div>

							<div class="form-group">
								<i class="fa-solid fa-address-card"></i>
								<h3 style="font-weight: bolder;">생년월일&nbsp;:&nbsp;</h3>
								<input type="text" style="border: none" id="birth" name="birth"
									value="${pet.birth}" readonly>
							</div>
							<div class="form-group">
								<h5>
								<i class="fa-solid fa-mobile-screen"></i>
									<h3 style="font-weight: bolder;">품종&nbsp;:&nbsp;</h3>
								</h5>
								<input type="text" style="border: none" id="c_content"
									name="c_content" value="${pet.c_content}" readonly>
							</div>
							<div class="form-group">
								<i class="fa-solid fa-star"></i>
								<h3 style="font-weight: bolder;">몸무게&nbsp;:&nbsp;</h3>
								<input type="text" style="border: none" id="weight"
									name="weight" value="${pet.weight}" readonly>
							</div>

							
							<form action="mypetUpdateForm" method="post">
							<input type="hidden" name="pet_no" id="pet_no" value="${pet.pet_no }">
							<button type="submit"  class="genric-btn info radius" name="pet_no" style="width: 200px" >반려동물 정보수정</button>
								</form>
							<form action="mypetDelete" method="post">
							<input type="hidden" name="pet_no" id="pet_no" value="${pet.pet_no }">	
							<button type="submit" class="genric-btn info radius" name="pet_no" style="width: 200px">  반려동물 삭제  </button>
								
						</form>
					</div>
	
				</div>

			</div>
		</div>
	</section>

</body>
</html>