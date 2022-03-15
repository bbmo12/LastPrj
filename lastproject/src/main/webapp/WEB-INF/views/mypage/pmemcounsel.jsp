<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags/" prefix="my"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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

	.flex {
		-webkit-box-flex: 1;
		-ms-flex: 1 1 auto;
		flex: 1 1 auto
	}

	.padding {
		padding: 5rem
	}

	.pl-3,
	.px-3 {
		padding-left: 1rem !important
	}

	.table th {
		font-size: 20px;
		font-weight: 500;
	}

	.table {
		width: 100%;
		max-width: 100%;
		margin-bottom: 1rem;
		background-color: transparent
	}
	
	.table-striped tbody tr:nth-of-type(odd) {
  		background-color: #f9f9fd;
 
 	}

	.table td {
		font-size: 16px;
		padding: .875rem 0.9375rem
	}

	.badge {
		font-size: 12px;
		line-height: 1;
		padding: .375rem .5625rem;
		font-weight: normal;
	}

	.badge-info {
		background-color: cornflowerblue;
		border: none;
	}
</style>

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
							<h4>${pmember.name }</h4>
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
				<div class="col-lg-9 posts-list" style="position: relative; top: -20px;">
					<div class="col-lg-12 col-md-12 blog_details">
						<div align="center">
							<h1>상담내역조회</h1>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="table-wrap">
									<form action="pmemcounsel" name="goform">
										<input type="hidden" name="pageNum" value="1">
										<table class="table table-striped">
											<thead>
												<tr style="text-align: center;">
													<th>동물이름</th>
													<th>상담회원</th>
													<th>상담내용</th>
													<th>상담상태</th>
													<th>작성일</th>
												</tr>
											</thead>
											<tbody style="text-align: center">
												<c:if test="${ fn:length(pmemcounsel) == 0  }">
													<tr>
														<td colspan="5" align="center">조회된 결과가 없습니다.</td>
													</tr>
												</c:if>
												<c:forEach items="${pmemcounsel }" var="counsel">
													<tr onclick="location.href='csDetail?p_id=${counsel.p_id }&m_id=${counsel.m_id }&pet_no=${counsel.pet_no }&c_no=${counsel.c_no}'">
														<td>${counsel.p_name }</td>
														<td>${counsel.m_id }</td>
														<td>${counsel.content}</td>
														<td><c:if test="${counsel.code eq 301}">
																<label class="badge badge-info">상담요청</label>
															</c:if> <c:if test="${counsel.code eq 302}">
																<label class="badge badge-warning">진행중</label>
															</c:if> <c:if test="${counsel.code eq 303}">
																<label class="badge badge-success">상담완료</label>
															</c:if></td>
														<td>${counsel.w_date }</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</form>
									<my:nav jsFunc="go_page" page="${page}" />
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<script>
		function go_page(p) {
			goform.pageNum.value = p;
			goform.submit();
		}
	</script>

</body>

</html>