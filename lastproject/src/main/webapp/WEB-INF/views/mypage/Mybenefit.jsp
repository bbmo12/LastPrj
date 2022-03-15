<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

	body {
		background-color: #f9f9fa
	}

	.flex {
		-webkit-box-flex: 1;
		-ms-flex: 1 1 auto;
		flex: 1 1 auto
	}


	.padding {
		padding: 5rem
	}

	.card {
		box-shadow: none;
		-webkit-box-shadow: none;
		-moz-box-shadow: none;
		-ms-box-shadow: none
	}

	.pl-3,
	.px-3 {
		padding-left: 1rem !important
	}

	.card {
		position: relative;
		display: flex;
		flex-direction: column;
		min-width: 0;
		word-wrap: break-word;
		background-color: #fff;
		background-clip: border-box;
		border: 1px solid #d2d2dc;
		border-radius: 0
	}

	.card .card-title {
		color: #000000;
		margin-bottom: 0.625rem;
		text-transform: capitalize;
		font-size: 0.875rem;
		font-weight: 500
	}

	.card .card-description {
		margin-bottom: .875rem;
		font-weight: 400;
		color: #76838f
	}

	.card-text {
		display: inline-block;
		width: 200px;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
	}

	.table-responsive {
		display: block;
		width: 100%;
		overflow-x: auto;
		-webkit-overflow-scrolling: touch;
		-ms-overflow-style: -ms-autohiding-scrollbar
	}

	.table th {
		font-size: 20px;
		font-weight: bold;
	}

	.table {
		width: 100%;
		max-width: 100%;
		margin-bottom: 1rem;
		background-color: transparent
	}

	.table td {
		font-size: 16px;
		padding: .875rem 0.9375rem
	}

	.badge {
		font-size: 12px;
		line-height: 1;
		padding: .375rem .5625rem;
		font-weight: normal
	}

	.badge-info {
		background-color: cornflowerblue;
		border: none;
	}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>

<body>
	<section class="banner-area other-page">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<h1>MyPage</h1>
					<a href="home">Home</a> <span>|</span> <a href="pmemberMyPage">MyPage</a>
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
							<img class="author_img rounded-circle" src="resources/upload/${pmember.picture}"
								style="width: 210px" alt="">
							<div class="br"></div>
							<h4> ${pmember.name }</h4>
							<div class="br"></div>
						</aside>
						<aside class="single_sidebar_widget post_category_widget">
							<h4 class="widget_title">My menu</h4>
							<ul class="list cat-list">
								<li><a href="pmemberMyPage" class="d-flex justify-content-between">
										<p>내 프로필</p>
									</a></li>
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
								<li><a href="#" class="d-flex justify-content-between">
										<p>로그아웃</p>
									</a></li>
								<li><a href="#" class="d-flex justify-content-between">
										<p>회원탈퇴</p>
									</a></li>
							</ul>
						</aside>
					</div>
				</div>
				<div class="col-lg-9 posts-list" style="position: relative; top: -20px;">
					<div class="col-lg-12 col-md-12 blog_details">
						<div align="center">
							<h1> ${pmember.name }님의 수익내역</h1>
						</div>
						<div class="page-content page-container" id="page-content" style="margin-top: 20px;">
							<div class="row container d-flex justify-content-center">
								<div class="card" style="width: 100%">
									<div class="card-body" style="padding: 25px;">
										<div class="table-responsive" style="width: 100%">
											<table id="htmltable" class="table">
												<thead>
													<tr style="text-align: center;">
														<th>서비스시작일</th>
														<th>서비스상태</th>
														<th>서비스내용</th>
														<th>회원이름</th>
														<th>금액</th>
													</tr>
												</thead>
												<tbody style="text-align: center">
													<c:forEach items="${pMembenefit }" var="benefit">
														<tr>
															<td>${benefit.startdate }</td>
															<c:if test="${benefit.enddate eq null }">
																<td><label class="badge badge-warning">서비스 진행중</label></td>
															</c:if>
															<c:if test="${benefit.enddate ne null }">
																<td>${benefit.enddate}&nbsp;<label class="badge badge-success">종료</label></td>
															</c:if>
															<td>${benefit.content }</td>
															<td>${benefit.m_id } </td>
															<td>${benefit.price }</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
											<h4 align="center">총 수익은 ${totalPrice.total_price }원 입니다.</h4>
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