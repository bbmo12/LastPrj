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
</style>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
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
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="blog_right_sidebar">

						<aside class="single_sidebar_widget author_widget">
							<img class="author_img rounded-circle"
								src="resources/upload/${pmember.picture}" style="width: 210px"
								alt="">
							<div class="br"></div>
							<h4> ${pmember.name }</h4>

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
								<li><a href="preservationSelect" class="d-flex justify-content-between">
										<p>예약 내역</p>
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
				<div class="col-lg-9 posts-list">
				<div class="col-lg-12 col-md-12 blog_details">
							<table class="table">
							<thead>
								<tr>
									<th>서비스시작일</th>
									<th>서비스종료일</th>
									<th>서비스내용</th>
									<th>회원이름</th>
									<th>금액</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${ fn:length(pMembenefit) == 0  }">
									<tr>
										<td colspan="5" align="center">조회된 결과가 없습니다.</td>
									</tr>
								</c:if>
								<c:forEach items="${pMembenefit }" var="benefit">
									<tr>
										<td>${benefit.startdate }</td>
										<c:if test="${benefit.enddate eq null }">
											<td>서비스 진행중</td>
										</c:if>
										<c:if test="${benefit.enddate ne null }">
											<td>${benefit.enddate}</td>
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
	</section>
</body>
</html>