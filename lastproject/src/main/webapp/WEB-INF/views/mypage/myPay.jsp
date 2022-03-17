<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	
	.card-text {
		width: 290px;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
	}
	.padding {
	padding: 5rem
	}

	.table th {
	font-size: 20px;
	font-weight: 500;
	text-align: center;
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
					<div class="blog_right_sidebar" style="margin-left: 46px; width: 300px;">
						<aside class="single_sidebar_widget author_widget">
							<img class="author_img rounded-circle" src="resources/upload/${member.picture}"
								style="width: 210px" alt="">
							<div class="br"></div>
							<h4> ${member.name }</h4>
							<div class="br"></div>
						</aside>
						<aside class="single_sidebar_widget post_category_widget">
							<h4 class="widget_title">My menu</h4>
							<ul class="list cat-list">
								<li><a href="memberMypage" class="d-flex justify-content-between">
										<p>내 프로필</p>
									</a></li>
								<li><a href="petmemberForm" class="d-flex justify-content-between">
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
				<div class="col-lg-9 posts-list" style="position: relative; top: 20px;">
					<div class="col-lg-12 col-md-12 blog_details">
						<div align="center">
							<h1>결제내역조회</h1>
						</div>
						<div class="row">
							<div class="col-md-12" style="margin: 20px 0 0 -6px;">
								<div class="table-wrap">
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