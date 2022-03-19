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
	#my_section {
		padding: 50px;
	}

	#formMain h3,
	input {
		display: inline-block;
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
	}

	#formMain .form-group {
		margin-bottom: 5px;
	}
	#button-update{
		color: #fff; 
    	background: #0062ff;
    	border: 1px solid transparent;
    	margin-left: 50em;	
	}
	#button-insert{
		color: #fff; 
    	background: #0062ff;
    	border: 1px solid transparent;
    	margin-left: 53em;	
	}
	#button-update:hover,
	#button-insert:hover {
		color: #0062ff;
		border: 1px solid #0062ff;
		background: #fff;
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
							<img class="author_img rounded-circle" src="resources/upload/${member.picture}"
								onerror="this.src='resources/upload/cat.jpg'" style="width: 210px" alt="">
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
								<h1>${member.name }님의 정보조회</h1><br>
							</div>
							<div class="form-group">
								<i class="fa-solid fa-user"></i>
								<h3 style="font-weight: bolder;">이름&nbsp;:&nbsp;</h3>
								<input type="text" style="border: none" id="name" name="name" value="${member.name}"
									readonly>
							</div>
							<div class="form-group">
								<i class="fa-solid fa-address-card"></i>
								<h3 style="font-weight: bolder;">아이디&nbsp;:&nbsp;</h3>
								<input type="email" style="border: none" id="m_id" name="m_id" value="${member.m_id}"
									readonly>
							</div>
							<div class="form-group">
								<i class="fa-solid fa-mobile-screen"></i>
								<h3 style="font-weight: bolder;">전화번호&nbsp;:&nbsp;</h3>
								<input type="text" style="border: none" id="tel" name="tel" value="${member.tel}"
									readonly>
							</div>
							<button type="button" onclick="location.href='mconfirmPass'"class="genric-btn info radius" id="button-update" >내정보 수정</button>
						</div>
					</div>
					<div align="center">
						<br>
						<h1>${member.name }님의 반려동물조회</h1><br>
					</div>
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
					<form action="mypetAddForm" method="post">
						<button type="submit" class="genric-btn info radius" id="button-insert">반려등물등록</button>
					</form>
				</div>
			</div>
		</div>
	</section>

</body>

</html>