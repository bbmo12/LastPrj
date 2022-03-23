<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags/"  prefix="my"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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

	.card-text {
		display: inline-block;
		width: 200px;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
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

	.card-body {
		font-size: 1.0rem;
		font-family: 'NanumBarunGothic';
		font-style: normal;
		font-weight: 300;
		color: black;

	}

	.card {
		box-shadow: 0 .15rem 1.75rem 0 rgba(58, 59, 69, .1) !important;
		border: 1px solid #e3e6f0;
		border-radius: 0.35rem
	}

	.card-header {
		background: white;
		font-size: 1.0rem;
		font-family: 'NanumBarunGothic';
		font-style: normal;
		font-weight: 400;
		color: black;
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
								onerror="this.src='resources/upload/pet.PNG'" style="width: 210px; height: 167px;">
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
					<div class="single-post row">
						<div class="col-lg-12 col-md-12 blog_details">
							<br><br>
							<div class="card">
								<div class="card-header">
									<div align="left">
										<i class="fa-solid fa-flag"></i>&nbsp;&nbsp;&nbsp;나의신고내역
									</div>
								</div>
								<div class="card-body">
									<div class="row">
										<div class="table-wrap" style="width: 900px;">
											<form action="pmemreport" name="goform">
												<input type="hidden" name="pageNum" value="1">
												<table class="table table-striped">
													<thead>
														<tr style="text-align: center;">
															<th>신고회원</th>
															<th>신고내용</th>
															<th>신고날짜</th>
															<th>신고유형</th>
															<th>처리상태</th>
															<th>기각사유</th>
														</tr>
													</thead>
													<tbody style="text-align: center">
														<c:if test="${ fn:length(pmemreport) == 0  }">
															<tr>
																<td colspan="6" align="center">조회된 결과가 없습니다.</td>
															</tr>
														</c:if>
														<c:forEach items="${pmemreport }" var="report">
															<tr>														
																<td>${report.reported }</td>
																<td class="card-text">${report.content}</td>
																<td>${report.w_date } </td>
																<td>
																	<c:if test="${report.code eq 601}">
																		불법 광고 및 홍보
																	</c:if>
																	<c:if test="${report.code eq 602}">
																		음란물/선정성 콘텐츠
																	</c:if>
																	<c:if test="${report.code eq 603}">
																		욕설/비속어/모욕
																	</c:if>
																	<c:if test="${report.code eq 604}">
																		사생활침해
																	</c:if>
																	<c:if test="${report.code eq 605}">
																		게시물 도배
																	</c:if>
																</td>
																<td>
																	<c:if test="${report.repor eq 701}">
																		<label class="badge badge-info">신고대기</label>
																	</c:if>
																	<c:if test="${report.repor eq 702}">
																		<label class="badge badge-danger">신고기각</label>
																	</c:if>
																	<c:if test="${report.repor eq 703}">
																		<label class="badge badge-success">신고승인</label>
																	</c:if>
																</td>
																<td>
																	<c:if test="${report.repor eq 702}">
																		<button type="button" class="btn btn-primary" data-toggle="modal"
																			data-target="#exampleModalCenter${report.rep_no }" style="border: none;">사유확인</button>
																		<!-- Modal -->
																		<div class="modal fade" id="exampleModalCenter${report.rep_no }"tabindex="-1" role="dialog"
																			aria-labelledby="exampleModalCenterTitle"aria-hidden="true">
																			<div class="modal-dialog modal-dialog-centered"role="document">
																				<div class="modal-content">
																					<div class="modal-header">
																						<h3 class="modal-title" id="exampleModalLongTitle">신고기각사유</h3>
																						<button type="button"class="close"data-dismiss="modal"aria-label="Close">
																							<span aria-hidden="true">&times;</span>
																						</button>
																					</div>
																					<div class="modal-body">${report.state }</div>
																					<div class="modal-footer">
																						<button type="button"class="btn btn-primary"data-dismiss="modal">확인</button>
																					</div>
																				</div>
																			</div>
																		</div>
																	</c:if>
																</td>
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
			</div>
		</div>
	</section>
	<script>
		function go_page(p) {
			goform.pageNum.value = p;
			goform.submit();
		}
		
		$("#exampleModalCenter").on('hidden.bs.modal',function(e){
			$(this).find('.modal-body').text('');
		}); 
		
	</script>
</body>

</html>