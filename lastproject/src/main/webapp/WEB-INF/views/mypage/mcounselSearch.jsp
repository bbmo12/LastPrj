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
		padding: 0,14px,0,14px;
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
		padding: 0,14px,0,14px;
	}
	
	
	.no_deco {
		text-decoration: none !important;
		font-size : 0.8rem !important;
		color: black;
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
		font-family: 'NanumBarunGothic';
		font-style: normal;
		font-weight: 400;
		color: black;
	}
	
	.card-body{
		font-size: 1.0rem;
		font-family: 'NanumBarunGothic';
		font-style: normal;
		font-weight: 300;
		color: black;
		width: 100%;
		
	}
	
	.widget_title{
		background: #0062ff !important;
	}
	
	#myinfo{
		font-size: 0.8rem;
		font-family: 'NanumBarunGothic';
		font-style: normal;
	 	font-weight: 300;
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
		font-family: 'NanumBarunGothic'!important;
		font-style: normal !important;
	 	font-weight: 700 !important;
	 	color:gray;
	}
	
	#menu_bold{
		font-size: 1.0rem;
		font-family: 'NanumBarunGothic';
		font-style: normal;
 		font-weight: 700;
 		color: black;
	}
	.star-rating {
		display: flex;
		flex-direction: row-reverse;
		font-size: 1.5em;
		justify-content: space-around;
		padding: 0 .2em;
		text-align: center;
		width: 5em;
	}

	.star-rating input {
		display: none;
	}

	.star-rating label {
		color: #ccc;
		cursor: pointer;
	}

	.star-rating :checked~label {
		color: #f90;
	}

	.star-rating label:hover,
	.star-rating label:hover~label {
		color: #fc0;
	}

	.card-text {
		display: inline-block;
		width: 150px;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
	}
	.padding {
	padding: 5rem
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
				<div class="col-lg-3" style="padding:0px;">
				<h2 align="center">MyPage</h2>
				<br>
				<div class="blog_right_sidebar">
						<aside class="single_sidebar_widget author_widget">
							<img class="partner_img"
								src="resources/upload/${member.pfile}" onerror ="this.src='resources/upload/cat.jpg'" alt="">
							<br><br>
							<h4 id="Mainname">${member.name }님</h4>
							<div class="br"></div>
							<div id="myinfo">
							<i class="fa-solid fa-pen"></i>&nbsp;<a class="no_deco" href="mconfirmPass">내 정보 수정하기</a>
							</div>
						</aside>
					</div>
					<br>
					<div class="blog_right_sidebar">
						<aside class="single_sidebar_widget post_category_widget">
							<h4 class="widget_title">My menu</h4>
							<ul class="list cat-list nanumbarungothic">
							<p id="menu_bold">내 활동 내역</p>
								<li><a href="protocol" class="d-flex justify-content-between no_deco">
										<p>반려동물 진료기록</p>
									</a></li>
								<li><a href="reservationSelect" class="d-flex justify-content-between no_deco">
										<p>예약 내역</p>
									</a></li>
								<li><a href="myPay" class="d-flex justify-content-between no_deco">
										<p>결제 내역</p>
									</a></li>
								<li><a href="mycounsel" class="d-flex justify-content-between no_deco">
										<p>상담 내역</p>
									</a></li>
								<li><a href="myreport" class="d-flex justify-content-between no_deco">
										<p>신고 내역</p>
									</a></li>
								<li><a href="myfallow" class="d-flex justify-content-between no_deco">
										<p>팔로우</p>
									</a></li>
									<br><br><p id="menu_bold">회원 정보 관리</p>
								<li><a href="mconfirmPass" class="d-flex justify-content-between no_deco">
										<p>회원 정보 수정</p>
									</a></li>
								<li><a href="logout" class="d-flex justify-content-between no_deco">
										<p>로그아웃</p>
									</a></li>
								<li><a href="mdeleteForm" class="d-flex justify-content-between no_deco">
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
							<i class="fa-solid fa-flag"></i>&nbsp;&nbsp;&nbsp;나의상담내역
						</div>
					</div>
					<div class="card-body">
						<div class="row">
						<div>
							<div class="table-wrap" style="width: 848.958px">
									<form action="mycounsel" id="goform" name="goform">
										<input type="hidden" id="pageNum" name="pageNum" value="1">
										<table class="table table-striped" >
											<thead>
												<tr style="text-align: center;">
													<th>상담번호</th>
													<th>반려동물이름</th>
													<th>상담내용</th>
													<th>파트너이름</th>
													<th>상담상태</th>
													<th>상담신청일</th>
													<th>상담내용보기</th>
													<th>후기</th>
												</tr>
											</thead>
											<tbody style="text-align: center">
												<c:if test="${ fn:length(mycounsel) == 0  }">
													<tr>
														<td colspan="8" align="center">조회된 결과가 없습니다.</td>
													</tr>
												</c:if>
												<c:forEach items="${mycounsel }" var="mycounsel">
													<tr>
														<td><input type="hidden" id="c_no" name="c_no"
																value="${mycounsel.c_no}">${mycounsel.c_no } </td>
														<td>${mycounsel.p_name }</td>
														<td class="card-text">${mycounsel.content}</td>
														<td>${mycounsel.pm_name }</td>
														<td>
															<c:if test="${mycounsel.code eq 301}">
																<label class="badge badge-info">상담요청</label>
															</c:if> 
															<c:if test="${mycounsel.code eq 302}">
																<label class="badge badge-warning">진행중</label>
															</c:if> 
															<c:if test="${mycounsel.code eq 303}">
																<label class="badge badge-success">상담완료</label>
															</c:if>
														</td>
														<td>${mycounsel.w_date }</td>

														<td><button type="button" class="btn btn-primary" style="background-color: cornflowerblue; border: none;"
																onclick="location.href='csDetail?p_id=${mycounsel.p_id }&m_id=${mycounsel.m_id }&pet_no=${mycounsel.pet_no }&c_no=${mycounsel.c_no}'">상담내용보기</button>
														</td>
														<c:choose>
															<c:when test="${mycounsel.code eq 303 }">
																<c:choose>
																	<c:when test="${ mycounsel.r_check eq 0}">
																		<td><button type="button" style="background-color: #38a4ff; border: none;" 
																				class="btn btn-primary" data-toggle="modal" onclick='reviewadd("${mycounsel.c_no}");'
																				data-target="#reviewWriteModal">리뷰쓰기</button>
																		</td>
																	</c:when>
																	<c:otherwise>
																		<td><button type="button" class="btn btn-primary" data-toggle="modal"
																				onclick='reviewread("${mycounsel.c_no}");'data-target="#exampleModal1">리뷰보기</button>
																		</td>
																	</c:otherwise>
																</c:choose>
															</c:when>
															<c:otherwise>
																<td><button class="btn btn-primary" disabled style="background-color: cornflowerblue; border: none;">리뷰 작성</button></td>
															</c:otherwise>
														</c:choose>
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
		</div>
	</section>

	<!-- Modal -->
	<div class="modal fade" id="exampleModal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title" id="exampleModalLabel">리뷰보기</h3>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<!-- modal 몸통 -->
				<div class="modal-body">
					<div id="content"></div>
					<div class="star-rating">

					</div>
				</div>
				<!-- modal 하단 버튼 -->
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
					<button id="sendReserv" name="sendReserv" type="button" class="btn btn-primary"
						data-dismiss="modal">확인</button>
				</div>
			</div>
		</div>
	</div>






	<!-- 리뷰작성 모달창 -->
	<!-- Modal -->
	<div class="modal fade" id="reviewWriteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title" id="exampleModalLabel">후기작성</h3>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form action="counselReviewInsert" method="post" enctype="multipart/form-data">
					<!-- modal 몸통 -->
					<div class="modal-body">

						<div align="center">
							<h3 align="center">후기를 남겨주세요!</h3>
							<div class="star-rating">
								<input type="radio" id="5-stars" name="rating" value="5" /> <label for="5-stars"
									class="star">&#9733;</label> <input type="radio" id="4-stars" name="rating"
									value="4" /> <label for="4-stars" class="star">&#9733;</label> <input type="radio"
									id="3-stars" name="rating" value="3" /> <label for="3-stars"
									class="star">&#9733;</label>
								<input type="radio" id="2-stars" name="rating" value="2" /> <label for="2-stars"
									class="star">&#9733;</label> <input type="radio" id="1-stars" name="rating"
									value="1" /> <label for="1-stars" class="star">&#9733;</label>
							</div>
						</div>
						<div class="form-group">
							<label for="exampleInputPassword4">후기내용</label>
							<textarea class="form-control" id="content" name="content" placeholder="후기내용" rows="4"
								cols="80"></textarea>
						</div>
					</div>
					<!-- modal 하단 버튼 -->
					<div class="modal-footer">
						<input type="hidden" id="insert_c_no" name="c_no" value="">
						<button type="submit">작성</button>
						<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>

					</div>
				</form>
			</div>
		</div>
	</div>

	<!--리뷰 보는 모달창  -->
	<script type="text/javascript">
		/* 	
	$(function() {
		$('#example').barrating('set', 2);
	   
	   }); */

		function reviewread(e) {
			var c_no = e;
			$("#content").empty();
			$(".star-rating").empty();

			$.ajax({
				url: 'cnoreview',
				method: 'post',
				data: {
					'c_no': c_no
				},
				success: function (result) {

					console.log(result.content)
					var content = result.content;
					var rating = result.rating;
					console.log(rating);

					$('.star-rating').raty({
						readOnly: true,
						score: rating,
						path: "resources/star",
						width: 200
					});
					$('#content').append(content);
				}
			})
		}
	</script>
	<!-- 후기작성 모달창 -->
	<script type="text/javascript">
		function reviewadd(e) {
			console.log(e);
			var c_no = e;
			$("#content").empty();
			$("#rating").empty();
			$("#insert_c_no").val(c_no);
		}
	</script>


	<!-- 별점조회 -->
	<!--    <script type="text/javascript">
  //별점
		$(function () {
			$('.star').each(function (index, item) {
				$(this).raty({
					score: $(this).find('.rating').val(),
					path: "resources/star",
					width: 200,
					readOnly: true
				});
			})
		});
		</script>
	-->
	<script type="text/javascript">
		function go_page(p) {
			goform.pageNum.value = p;
			goform.submit();
		}
	</script>
</body>

</html>