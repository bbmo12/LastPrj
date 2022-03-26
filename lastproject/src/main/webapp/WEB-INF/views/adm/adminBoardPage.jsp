<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib tagdir="/WEB-INF/tags" prefix="my"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>관리자: 목록 및 데쉬보드</title>

<link rel="stylesheet" type="text/css"	href="resources/table/css/multicheck.css"> 
<link href="resources/table/css/dataTables.bootstrap4.css"	rel="stylesheet">
<link href="resources/table/css/style.min.css" rel="stylesheet">

<!-- Modal -->
<!-- <link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous"> -->
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

		<script src="resources/table/js/jquery.min.js"></script>
	<!-- Bootstrap tether Core JavaScript -->
	<script src="resources/table/js/popper.min.js"></script>
	<script src="resources/table/js/bootstrap.min.js"></script>
	<!-- slimscrollbar scrollbar JavaScript -->
	<script src="resources/table/js/perfect-scrollbar.jquery.min.js"></script>
	<script src="resources/table/js/sparkline.js"></script>
	<!--Wave Effects -->
	<script src="resources/table/js/waves.js"></script>
	<!--Menu sidebar -->
	<script src="resources/table/js/sidebarmenu.js"></script>
	<!--Custom JavaScript -->
	<script src="resources/table/js/custom.min.js"></script>
	<!-- this page js -->
	<script src="resources/table/js/datatable-checkbox-init.js"></script>
	<script src="resources/table/js/datatables.min.js"></script>
<style>
</
head> <style>#my_section {
	margin-top: -70px;
	padding-bottom: 25px;
}

.card-footer {
	background: white;
	font-size: 1.0rem;
	/* font-family: 'NanumBarunGothic'; */
	font-style: normal;
	font-weight: 400;
}

.padding {
	padding: 5rem
}

.table th {
	text-align: center;
	font-size: 1.0rem;
	/* font-family: 'NanumBarunGothic'; */
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

.badge-pay {
	background-color: #38a4ff;
	color: #fff;
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

.card-body {
	font-size: 1.0rem;
	/* font-family: 'NanumBarunGothic'; */
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
	/* font-family: 'NanumBarunGothic'; */
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
					<br> <br> <br>
					<h2></h2>
				</div>
			</div>
		</div>
	</section>
	<section id="my_section">
		<div class="container" style="max-width: 1350px; margin-bottom: 60px;">
			<div class="row">
				<div class="col-lg-3">
					<h2 align="center">AdminPage</h2>
					<br>
					<div class="blog_right_sidebar">
						<aside class="single_sidebar_widget author_widget">
							<img class="partner_img" src=""
								onerror="this.src='resources/upload/cat.jpg'"> <br> <br>
							<h4 id="Mainname">관리자님</h4>
							<div class="br"></div>
							<div id="myinfo">
								<i class="fa-solid fa-pen"></i>&nbsp;<a class="no_deco"
									href="confirmPass">공지사항 관리 페이지</a>
							</div>
						</aside>
					</div>
					<br>
					<div class="blog_right_sidebar">
						<aside class="single_sidebar_widget post_category_widget">
							<h4 class="widget_title">Admin menu</h4>
							<ul class="list cat-list nanumbarungothic">
								<li><a href="adminMemberPage"
									class="d-flex justify-content-between no_deco">
										<p>차트.목록</p>
								</a></li>
								<li><a href="adminReportPage"
									class="d-flex justify-content-between no_deco">
										<p>신고 관리</p>
								</a></li>
								<li><a href="adminBoardPage"
									class="d-flex justify-content-between no_deco">
										<p>공지사항</p>
								</a></li>
								<li><a href="logout"
									class="d-flex justify-content-between no_deco">
										<p>로그아웃</p>
								</a></li>
							</ul>
						</aside>
					</div>
				</div>
				<div class="col-lg-9 posts-list">
					<div class="single-post row">
						<div class="col-lg-12 col-md-12 blog_details">
							<br> <br>
							<div class="card">
								<div class="card-header">
									<i class="fa-solid fa-paw"></i> 공지사항
								</div>
								<div class="card-body">
									<div class="row">
										<table id="zero_config"
											class="table table-striped table-bordered"
											style="padding: 15px">
											<thead>
												<tr>
													<th>번호</th>
													<th>제목</th>
													<th>작성날짜</th>
													<th>처리</th>

												</tr>
											</thead>
											<tbody>
												<c:if test="${boardList[0].b_no eq null}">
													<tr>
														<td colspan="6" align="center">데이터가 존재하지 않습니다.</td>
													</tr>
												</c:if>
												<c:if test="${boardList ne null }">
													<c:forEach items="${boardList }" var="boards">
														<tr>
															<td align="center">${boards.b_no }</td>
															<td align="center">${boards.title }</td>
															<td align="center">${boards.w_date }</td>
															<td align="center">
																<button type="button" class="btn btn-primary"
																	data-toggle="modal"
																	data-target=".bd-example-modal-lg${boards.b_no }">보기</button>
																<button name="btnDelete" id="btnDelete"
																	class="btn btn-primary"
																	onclick="location.href ='boardDelete?b_no=${boards.b_no }'">
																	삭제</button>

															</td>
														</tr>
														<div class="modal fade bd-example-modal-lg${boards.b_no }"
															tabindex="-1" role="dialog"
															aria-labelledby="myLargeModalLabel" aria-hidden="true">
															<div class="modal-dialog modal-lg">
																<div class="modal-content">
																	<div class="card">
																		<div class="card-body">
																			<h4 class="card-title">보기</h4>
																			<p class="card-description">공지사항 글</p>
																			<form class="forms-sample" action="boardUpdate"
																				method="post">
																				<div class="form-group">
																					<label for="title">제목</label> <input type="text"
																						class="form-control" id="title" name="title"
																						value="${boards.title}" required="required"
																						pattern=".{4,100}">
																				</div>
																				<input type="hidden" id="b_no" name="b_no"
																					value="${boards.b_no }">
																				<div class="form-group">
																					<label for="exampleTextarea1">내용</label>
																					<textarea class="form-control" id="content"
																						name="content" rows="5" value="${boards.content}"> ${boards.content}</textarea>
																				</div>
																				<button type="submit" class="btn btn-primary"
																					id="modify" name="modify">수정</button>
																				<button class="btn btn-primary" data-dismiss="modal">끄기</button>
																			</form>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</c:forEach>
												</c:if>
											</tbody>
										</table>
									</div>
								</div>
							</div>
							<div class="card-footer" id="boardInsert">
								<span style="color: #0062ff"><i class="fa-solid fa-plus"></i>&nbsp;&nbsp;</span><span>공지사항
									추가</span>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- 공지사항 새 글 쓰기 모달 -->
	<div class="modal fade bd-example-modal-lg boardInsertModal"
		id="boardInsertModal" tabindex="-1" role="dialog"
		aria-labelledby="myLargeModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="card">
					<div class="card-body">
						<h4 class="card-title">글쓰기</h4>
						<p class="card-description">공지사항 새 글</p>
						<form class="forms-sample" id="frmIN" action="boardInsert"
							method="post">
							<div class="form-group">
								<label for="title">제목</label> <input type="text" name="title"
									class="form-control" id="title" placeholder="제목" required>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail3">작성자</label> <input type="text"
									class="form-control writer" id="writer" value="admin"
									name="writer" readonly />
							</div>
							<div class="form-group">
								<label for="content">내용</label>
								<textarea class="form-control" name="content" id="content"
									placeholder="공지사항의 새 글 내용" rows="4"></textarea>
							</div>
							<button type="submit" class="btn btn-primary" id="insert"
								name="insert">등록</button>
							<button class="btn btn-primary" data-dismiss="modal">취소</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
		$('#boardInsert').on('click', function(e) {

			$('#boardInsertModal').modal('show');

		});

	/* 	$('#insert').on('click', function(e) {

			var str = $('#frmIN').serialize();
			console.log(str);
			
			$.ajax({
				url : 'boardInsert',
				method : 'POST',
				data : str,
				success : function(res) {
					toastr.success("공지사항에 새 글이 추가되었습니다.");

				},
				error : function() {
					alert("ajax 에러");
				}
			})
		}); */

		// 게시글 수정
		$('#zero_config').DataTable();
		$('.bd-example-modal-lg').on('hidden.bs.modal', function(e) {
			$(this).find('form')[0].reset();
		})
	</script>
</body>

</html>