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
		padding: 50px;
	}
</style>

<body>
	<section class="banner-area other-page">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<h1>MyPage</h1>
					<a href="home">Home</a> <span>|</span>
					<a href="pmemberMyPage">MyPage</a>
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
							<img class="author_img rounded-circle" src="resources/upload/${pmember.picture}"
								style="width: 210px" alt="">
							<div class="br"></div>
							<h4>${pmember.name }</h4>
							<div class="br"></div>
						</aside>
						<aside class="single_sidebar_widget post_category_widget">
							<h4 class="widget_title">My menu</h4>
							<ul class="list cat-list">
								<li><a href="pmemberMyPage" class="d-flex justify-content-between">
										<p>내 프로필</p>
									</a></li>
								<li><a href="#" class="d-flex justify-content-between">
										<p>예약 내역</p>
									</a></li>
								<li><a href="#" class="d-flex justify-content-between">
										<p>결제 내역</p>
									</a></li>
								<li><a href="pmemcounsel" class="d-flex justify-content-between">
										<p>상담 내역</p>
									</a></li>
								<li><a href="#" class="d-flex justify-content-between">
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
									<th>동물이름</th>
									<th>상담회원</th>
									<th>상담내용</th>
									<th>상담상태</th>
									<th>작성일</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${pmemcounsel }" var="counsel">
									<tr>
										<td>${counsel.p_name }</td>
										<td>${counsel.m_id } </td>
										<td>${counsel.content}</td>
										<td>${counsel.code } </td>
										<td>${counsel.w_date }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>

</html>