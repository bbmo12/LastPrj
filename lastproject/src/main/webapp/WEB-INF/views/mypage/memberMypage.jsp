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
	#formMain h3,
	input {
		display: inline-block;
	}
	#address{
		border: none; 
		overflow: hidden; 
		margin-bottom: -8px;
	}
	.row h3{
		font-weight: bolder; 
		text-align: center;
		margin-top: 10px;
	}
	#middle .doctor-text{
		display: inline-block;
	}
	#formMain .form-group{
		margin-bottom: 5px;
	}
</style>
<!-- <script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script> -->
<body>
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

	<section id="my_section">
		<div class="container" style="max-width: 1350px;">
			<div class="row">
				<div class="col-lg-3">
					<div class="blog_right_sidebar" style="margin-left: 40px; width: 300px;" >
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
						<div class="col-lg-9 col-md-9 blog_details" id="formMain">
							<div class="form-group">
								<h3 style="font-weight: bolder;">이름&nbsp;:&nbsp;</h3>
								<input type="text" style="border: none" id="name" name="name"
									value="${member.name}" readonly>
							</div>
							<div class="form-group">
								<h3 style="font-weight: bolder;">아이디&nbsp;:&nbsp;</h3>
								<input type="email" style="border: none" id="m_id" name="m_id"
									value="${member.m_id}" readonly>
							</div>
							<div class="form-group">
								<h3 style="font-weight: bolder;">비밀번호&nbsp;:&nbsp;</h3>
								<input type="password" style="border: none" id="name"
									name="password" readonly>
							</div>
							<div class="form-group">
								<h3 style="font-weight: bolder;">전화번호&nbsp;:&nbsp;</h3>
								<input type="text" style="border: none" id="tel" name="tel"
									value="${member.tel}" readonly>
							</div>
							<button type="button" onclick="location.href='memberUpdateForm'"
								class="genric-btn info radius">내정보 수정</button>
						</div>
					</div>
				</div>

			</div>
		</div>
	</section>
	
</body>
</html>