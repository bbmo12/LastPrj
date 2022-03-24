<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<style>
	#my_section {
		margin-top: -70px;
    	padding-bottom: 25px;
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

	.card {
		box-shadow: 0 .15rem 1.75rem 0 rgba(58, 59, 69, .1) !important;
		border: 1px solid #e3e6f0;
		border-radius: 0.35rem
	}

	.card-header, i{
		background: white;
		font-size: 1.0rem;
		/* font-family: 'NanumBarunGothic'; */
		font-style: normal;
		font-weight: 400;
		color: black;
	}

	.card_notice {
		font-size: 0.8rem;
		/* font-family: 'NanumBarunGothic'; */
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
	.control-width{
	    width: 170px;
    	display: inline-block;
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
					<h2 align="center">MyPage</h2>
					<br>
					<div class="blog_right_sidebar">
						<aside class="single_sidebar_widget author_widget">
							<img class="partner_img" src="resources/upload/${pmember.picture}"
								onerror="this.src='resources/upload/pet.PNG'"style="width: 210px; height: 167px;">
							<br><br>
							<h4 id="Mainname">${pmember.name }님</h4>
							<div class="br"></div>
							<div id="myinfo">
								<i class="fa-solid fa-pen"></i>&nbsp;<a class="no_deco" href="confirmPass">내 정보 수정하기</a>
							</div>
						</aside>
					</div><br>
					<div class="blog_right_sidebar">
						<aside class="single_sidebar_widget post_category_widget">
							<h4 class="widget_title">My menu</h4>
							<ul class="list cat-list nanumbarungothic">
								<p id="menu_bold">내 활동 내역</p>
								<li><a href="reservationSetting" class="d-flex justify-content-between">
										<p>예약일정 설정</p>
									</a></li>
								<li><a href="preservationSelect" class="d-flex justify-content-between">
										<p>예약 내역</p>
									</a></li>
								<li><a href="pMemDiaList" class="d-flex justify-content-between">
										<p>진료 내역</p>
									</a></li>
								<li><a href="pMembenefit" class="d-flex justify-content-between">
										<p>결제 내역</p>
									</a></li>
								<li><a href="pmemcounsel" class="d-flex justify-content-between">
										<p>상담 내역</p>
									</a></li>
								<li><a href="pmemreport" class="d-flex justify-content-between">
										<p>신고 내역</p>
									</a></li>
								<br><br>
								<p id="menu_bold">회원 정보 관리</p>
								<li><a href="confirmPass" class="d-flex justify-content-between no_deco">
										<p>회원 정보 수정</p>
									</a></li>
								<li><a href="logout" class="d-flex justify-content-between">
										<p>로그아웃</p>
									</a></li>
								<li><a href="pmdeleteForm" class="d-flex justify-content-between">
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
								<i class="fa-solid fa-bell"></i>&nbsp;&nbsp;My Page
							</div>
							<div class="card-body card_notice" style="padding:30px">
								<div class="form-group">
									<div class="control-width"><i class="fa-solid fa-user"></i>
									<h3 style="font-weight: bolder;">이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름</h3></div>
									<input type="text" style="border: none" id="name" name="name"value="${pmember.name}" readonly>
								</div>
								<div class="form-group">
									<div class="control-width"><i class="fa-solid fa-address-card"></i>
									<h3 style="font-weight: bolder;">아이디</h3></div>
									<input type="email" style="border: none" id="p_id" name="p_id"value="${pmember.p_id}" readonly>
								</div>
								<div class="form-group">
									<div class="control-width"><i class="fa-solid fa-mobile-screen"></i>
									<h3 style="font-weight: bolder;">전화번호&nbsp;&nbsp;</h3></div>
									<input style="border: none" id="tel" name="tel" value="${pmember.tel}" readonly>
								</div>
								<div class="form-group">
									<div class="control-width"><i class="fa-solid fa-building"></i>
									<h3 style="font-weight: bolder;">사업장 이름&nbsp;&nbsp;</h3></div>
									<input style="border: none" id="w_name" name="w_name" value="${pmember.w_name}"readonly>
								</div>
								<div class="form-group">
									<div class="control-width"><i class="fa-solid fa-map-location-dot"></i>
									<h3 style="font-weight: bolder;">사업장 주소&nbsp;&nbsp;</h3></div>
									<textarea style="border: none; overflow: hidden; margin-bottom: -8px; font-size: 18px;" id="address"
										name="address" readonly cols="50"rows="1">${pmember.w_address}  ${pmember.w_d_address }</textarea>
								</div>
								<div class="form-group">
									<i class="fa-solid fa-square-phone"></i>
									<h3 style="font-weight: bolder;">사업장 전화번호&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h3>
									<input type="text" style="border: none" id="w_tel" name="w_tel"value="${pmember.w_tel}" readonly>
								</div>
								<div class="form-group">
									<div class="control-width"><i class="fa-solid fa-star"></i>
									<h3 style="font-weight: bolder;">경력&nbsp;&nbsp;</h3></div>
									<input type="text" style="border: none" id="career" name="career"value="${pmember.career}" readonly>
								</div>
								<div class="form-group">
									<div class="control-width"><i class="fa-solid fa-award"></i>
									<h3 style="font-weight: bolder;">전문분야&nbsp;&nbsp;</h3></div>
									<input type="text" style="border: none" id="speciality" name="speciality"value="${pmember.speciality}" readonly>
								</div>
								
								
								<div class="form-group">
									<div class="control-width"><i class="fa-solid fa-award"></i>
									<h3 style="font-weight: bolder;">진료가능한 동물&nbsp;&nbsp;</h3></div>
									<h3 style="font-weight: normal">
									<c:forEach items="${pets }" var="pets" >
													${pets.c_content }&nbsp;
									</c:forEach>
								</h3>
								
								
								
								
								
								<div class="form-group" style="width: 800px;">
									<div class="row" id="middle">
										<div class="col-6" style="padding-left: 10px;">
											<div class="control-width"><i class="fa-solid fa-calendar-days"></i>
											<h3>운영시간</h3></div><br>
											<c:forEach items="${time }" var="time">
												<div class="doctor-text text-center" style="margin-top: -10px;">
													<h3 style="font-weight: normal">${time.w_day}&nbsp;${time.starttime}
														&nbsp;-&nbsp;${time.endtime }</h3>
												</div>
												<div class="doctor-text text-center" style="color: black;">
													${time.n_content}</div><br>
											</c:forEach>
										</div>
										<div class="col-6">
											<div class="control-width"><i class="fa-solid fa-clipboard-list"></i>
											<h3>서비스정보</h3></div><br>
											<c:forEach items="${price }" var="price">
												<div class="doctor-text text-center"style="height: 22px; margin-top: -10px;">
													<h3 style="font-weight: normal">${price.title}&nbsp;:&nbsp;${price.price}</h3>
												</div><br>
												<div class="doctor-text text-center" style="margin-bottom: 10px;">
													${price.content }</div><br>
											</c:forEach>
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="control-width"><i class="fa-solid fa-street-view"></i>
									<h3 style="font-weight: bolder;">자기 소개</h3></div>
									<textarea style="border: none; overflow: hidden; font-size: 18px;" id="p_info" name="p_info" readonly
										cols="73" rows="5">${pmember.p_info}</textarea>
								</div>
								<div class="form-group">
									<div class="control-width"><i class="fa-solid fa-images"></i>
									<h3 style="font-weight: bolder;">활동사진</h3></div><br>
									<c:forEach items="${pimage}" var="image">
										<img src="resources/upload/${image.picture}" style="width: 200px; height:200px;"alt="등록된 사진이 없습니다.">
									</c:forEach>
								</div>
								<div class="form-group">
									<div class="control-width"><i class="fa fa-file-image-o"></i>
									<h3 style="font-weight: bolder;">자격증</h3></div><br>
									<c:forEach items="${plicense}" var="plicense">
										<img src="resources/upload/${plicense.picture}"
											style="width: 200px; height:200px;" alt="등록된 사진이 없습니다.">
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
		if ("${update}" != "") {
			Swal.fire('회원정보가<br>수정되었습니다.');
		}
	</script>
</body>

</html>