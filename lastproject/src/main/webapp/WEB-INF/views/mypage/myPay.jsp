<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib tagdir="/WEB-INF/tags/" prefix="my"%>
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
		font-style: normal;
		font-weight: 400;
		color: black;
	}
	
	.card-body{
		font-size: 1.0rem;
		font-style: normal;
		font-weight: 300;
		color: black;
		
	}
	
	.card-footer{
		background: white;
		font-size: 1.0rem;
		font-style: normal;
		font-weight: 400;
	}
	
	.widget_title{
		background: #0062ff !important;
	}
	
	#cardTitle{
		font-size: 1.25rem;
		font-style: normal;
	 	font-weight: 700;
	}
	
	#myinfo{
		font-size: 0.8rem;
		font-style: normal;
	 	font-weight: 300;
	}
	
	#pet_img2{
		display: inline-block;
		text-align: center;
		margin-right: 20px;
		font-size: 0.8rem;
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
		font-style: normal !important;
	 	font-weight: 700 !important;
	 	color:gray;
	}
	
	#menu_bold{
	font-size: 1.0rem;
	font-style: normal;
 	font-weight: 700;
 	color: black;
}
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
				<div class="single-post row">
					<div class="col-lg-12 col-md-12 blog_details">
						<br><br>
						<div class="card">
					<div class="card-header">
						<div align="left">
							<i class="fa-solid fa-flag"></i>&nbsp;&nbsp;&nbsp;결제내역조회
						</div>
						</div>
								<div class="card-body">
						<div class="row">
						<div>
								<div class="table-wrap" style="width: 900px;">
								<table class="table table-striped">
										<thead>
											<tr style="text-align: center;">
												<th>반려동물</th>
												<th>증상</th>
												<th>파트너회원이름</th>
												<th>금액</th>
											</tr>
										</thead>
										<tbody style="text-align: center">
											<c:if test="${ fn:length(pay) == 0  }">
												<tr>
													<td colspan="9" align="center">조회된 결과가 없습니다.</td>
												</tr>
											</c:if>
											<c:forEach items="${pay }" var="pay">
												<tr>
													<td>${pay.p_name }</td>
													<td class="card-text">${pay.content}</td>
													<td>${pay.pm_name } </td>
													<td>${pay.price }</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<my:nav jsFunc="go_page" page="${page}" />
								</div>
							</div>
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