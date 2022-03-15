<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	display: inline-block;
	width: 200px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
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
					<div class="col-lg-12 col-md-12 blog_details">
						<form action="mycounsel" id="goform" name="goform">
							<input type="hidden" id="pageNum" name="pageNum" value="1">
							<table class="table">
								<thead>
									<tr>
										<th>반려동물</th>
										<th>증상</th>
										<th>파트너회원이름</th>
										<th>상태</th>
										<th>작성일</th>
										<th>상담내용보기</th>
										<th>후기</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${mycounsel }" var="mycounsel">
										<tr>
											<td>${mycounsel.p_name }</td>
											<td class="card-text">${mycounsel.content}</td>
											<td>${mycounsel.pm_name }</td>
											<td>${mycounsel.co_content }</td>
											<td>${mycounsel.w_date }</td>
											<td><button type="button" onclick="location.href='csDetail?p_id=${mycounsel.p_id }&m_id=${mycounsel.m_id }&pet_no=${mycounsel.pet_no }&c_no=${mycounsel.c_no}'">상담내용보기</button> </td>
											<c:choose>
												<c:when test="${mycounsel.code eq 303 }">
													<c:choose>
														<c:when test="${ mycounsel.r_check eq 0}">
															<td><button type="button" onclick=reviewWrith(event)> 리뷰 작성</button></td>
														</c:when>
														<c:otherwise>
															<td><button type="button" onclick="revieRead('${mycounsel.c_no}')" data-toggle="modal" > 리뷰보기</button></td>
														</c:otherwise>
													</c:choose>
												</c:when>
												<c:otherwise>
													<td><button>실패</button></td>
												</c:otherwise>
											</c:choose>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</form>
					</div>
				</div>
			</div>
		</div>
		<my:nav jsFunc="go_page" page="${page}" />
	</section>

	<script type="text/javascript">
		function go_page(p) {
			goform.pageNum.value = p;
			goform.submit();
		}
	</script>

</body>
</html>