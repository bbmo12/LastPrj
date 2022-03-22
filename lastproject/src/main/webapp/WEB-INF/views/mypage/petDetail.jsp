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
		font-family: 'NanumBarunGothic' !important;
		font-style: normal !important;
		font-weight: 700 !important;
		color: gray;
	}

	#myinfo {
		font-size: 0.8rem;
		font-family: 'NanumBarunGothic';
		font-style: normal;
		font-weight: 300;
	}

	#menu_bold {
		font-size: 1.0rem;
		font-family: 'NanumBarunGothic';
		font-style: normal;
		font-weight: 700;
		color: black;
	}

	.card {
		box-shadow: 0 .15rem 1.75rem 0 rgba(58, 59, 69, .1) !important;
		border: 1px solid #e3e6f0;
		border-radius: 0.35rem
	}

	.card-header, i{
		background: white;
		font-size: 1.0rem;
		font-family: 'NanumBarunGothic';
		font-style: normal;
		font-weight: 400;
		color: black;
	}

	.card_notice {
		font-size: 0.8rem;
		font-family: 'NanumBarunGothic';
		font-style: normal;
		font-weight: 400;
	}

	#formMain h3,
	input {
		display: inline-block;
		font-size: 18px;
	}

	#address {
		border: none;
		overflow: hidden;
		margin-bottom: -8px;
	}

	.row h3 {
		font-weight: bolder;
		text-align: center;
		margin-top: 10px;
	}

	#middle .doctor-text {
		display: inline-block;
		font-size: 18px;
	}

	.form-group {
		margin-bottom: 5px;
	}

	.swal2-content {
		display: none;
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
				<div id="formMain" style="width: 800px;">
				<div class="card">
							<div class="card-header">
							<i class="fa-solid fa-bell"></i>&nbsp;&nbsp;${pet.name }의 정보보기
							</div>
							<div class="card-body card_notice" style="padding:30px">
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
								<i class="fa-solid fa-mobile-screen"></i>
							<h3 style="font-weight: bolder;">품종&nbsp;:&nbsp;</h3>
								<input type="text" style="border: none" id="c_content"
									name="c_content" value="${pet.c_content}" readonly>
							</div>
							<div class="form-group">
								<i class="fa-solid fa-star"></i>
								<h3 style="font-weight: bolder;">몸무게&nbsp;:&nbsp;</h3>
								<input type="text" style="border: none" id="weight"
									name="weight" value="${pet.weight}" readonly>
							</div>

							<div align="right">
							<div style="display: inline-block;">
							<form action="mypetUpdateForm" method="post">
							<input type="hidden" name="pet_no" id="pet_no" value="${pet.pet_no }">
							<button type="submit"  class="btn btn-primary" name="pet_no" style="width: 200px" >반려동물 정보수정</button>
								</form>
								</div>
							<div style="display: inline-block;">
							<form action="mypetDelete" method="post">
							<input type="hidden" name="pet_no" id="pet_no" value="${pet.pet_no }">	
							<button type="submit" class="btn btn-primary" name="pet_no" style="width: 200px">  반려동물 삭제  </button>
						</form>
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