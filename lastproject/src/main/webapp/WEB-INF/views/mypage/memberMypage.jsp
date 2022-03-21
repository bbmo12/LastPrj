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
#w_address::placeholder {
	color: #fff;
}

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

.card-header, i {
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

#formMain h3, input {
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
							<img class="author_img rounded-circle"
								src="resources/upload/${member.picture}"
								onerror="this.src='resources/upload/cat.jpg'"
								style="width: 210px" alt=""> <br>
							<br>
							<h4 id="Mainname">${member.name }</h4>
							<div class="br"></div>
							<div id="myinfo">
								<i class="fa-solid fa-pen"></i>&nbsp;<a class="no_deco"
									href="confirmPass">내 정보 확인</a>
							</div>
						</aside>
					</div>
					<br>
					<div class="blog_right_sidebar">
						<aside class="single_sidebar_widget post_category_widget">
							<h4 class="widget_title">My menu</h4>
							<ul class="list cat-list nanumbarungothic">
								<p id="menu_bold">내 활동 내역</p>
								<li><a href="reservationSetting"
									class="d-flex justify-content-between">
										<p>예약일정 설정</p>
								</a></li>
								<li><a href="preservationSelect"
									class="d-flex justify-content-between">
										<p>예약 내역</p>
								</a></li>
								<li><a href="pMemDiaList"
									class="d-flex justify-content-between">
										<p>진료 내역</p>
								</a></li>
								<li><a href="pMembenefit"
									class="d-flex justify-content-between">
										<p>결제 내역</p>
								</a></li>
								<li><a href="pmemcounsel"
									class="d-flex justify-content-between">
										<p>상담 내역</p>
								</a></li>
								<li><a href="pmemreport"
									class="d-flex justify-content-between">
										<p>신고 내역</p>
								</a></li>
								<br>
								<br>
								<p id="menu_bold">회원 정보 관리</p>
								<li><a href="confirmPass"
									class="d-flex justify-content-between no_deco">
										<p>회원 정보 수정</p>
								</a></li>
								<li><a href="logout" class="d-flex justify-content-between">
										<p>로그아웃</p>
								</a></li>
								<li><a href="pmdeleteForm"
									class="d-flex justify-content-between">
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
								<i class="fa-solid fa-bell"></i>&nbsp;&nbsp;내 정보
							</div>
							<div class="card-body card_notice" style="padding: 30px">

								<div class="form-group">
									<i class="fa-solid fa-user"></i>
									<h3 style="font-weight: bolder;">이름&nbsp;:&nbsp;</h3>
									<input type="text" style="border: none" id="name" name="name"
										value="${member.name}" readonly>
								</div>
								<div class="form-group">
									<i class="fa-solid fa-address-card"></i>
									<h3 style="font-weight: bolder;">아이디&nbsp;:&nbsp;</h3>
									<input type="email" style="border: none" id="m_id" name="m_id"
										value="${member.m_id}" readonly>
								</div>
								<div class="form-group">
									<i class="fa-solid fa-mobile-screen"></i>
									<h3 style="font-weight: bolder;">전화번호&nbsp;:&nbsp;</h3>
									<input type="text" style="border: none" id="tel" name="tel"
										value="${member.tel}" readonly>
								</div>
								<div align="right">
								<button type="button" onclick="location.href='mconfirmPass'"
									class="btn btn-primary" id="button-update">내정보
									수정</button>
									</div>
							</div>
						</div>
					</div>
				<div id="formMain" style="width: 800px;">
						<div class="card">
							<div class="card-header">
								<i class="fa-solid fa-bell"></i>&nbsp;&nbsp;내 반려동물
							</div>
					<div class="card-body card_notice" style="padding: 30px">
					
					<div class="row" id="data-container">
						<c:if test="${ fn:length(pets) == 0  }">
							<span>조회된 결과가 없습니다.</span>>
						</c:if>
						<c:forEach items="${pets }" var="pet">
							<div class="col-lg-3 col-sm-6" style="margin-left: 40px;">
								<div class="single-doctor mb-3 mb-lg-0">
									<div class="doctor-img">
										<img src="resources/upload/${pet.picture }" class="img-fluid"
											onerror="this.src='resources/upload/cat.jpg'" alt=""
											style="width: 195px; height: 200px;">
									</div>
									<div class="content-area">
										<div class="doctor-name text-center">
											<a href="petDetail?pet_no=${pet.pet_no}">
												<h3>${pet.name }</h3>
											</a>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
					<div align="right">
					<form action="mypetAddForm" method="post">
						<button type="submit" class="btn btn-primary"
							id="button-insert">반려동물 등록</button>
					</form>
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