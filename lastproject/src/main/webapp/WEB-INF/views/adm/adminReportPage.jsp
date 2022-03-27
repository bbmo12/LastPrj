<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib tagdir="/WEB-INF/tags" prefix="my"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>관리자: 목록 및 데쉬보드</title>


<!-- Chart.js 를 위한 CDN -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Modal을 위한 CDN -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- 모르겠음 -->
<script
	src="https://cdn.jsdelivr.net/gh/ethereum/web3.js@1.0.0-beta.37/dist/web3.min.js"></script>
<script src="template/js/diaLog.js"></script>


<!-- Air datepicker를 위한 CDN -->
<script
	src="resources/assets/js/vendor/jquery.datetimepicker.full.min.js"></script>
<link href="resources/dist/css/datepicker.min.css" rel="stylesheet"
	type="text/css" media="all">
<script src="resources/dist/js/datepicker.js"></script>
<script src="resources/dist/js/i18n/datepicker.ko.js"></script>


<!-- <script src="resources/adminJs/adminMemberPageJS.js"></script> -->

</head>
<style>
#my_section {
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

.que:first-child {
	
}

.que {
	position: relative;
}

.que::before {
	display: inline-block;
}

.que.on>span {
	
}

.anw {
	display: none;
	overflow: hidden;
}

.anw::before {
	display: inline-block;
}

/* #myChart {
	display:block; box-sizing: border-box; 
	width: 500px;
	height: 250px;
} */
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
									href="confirmPass">신고 관리 페이지</a>
							</div>
						</aside>
					</div>
					<br>
					<div class="blog_right_sidebar">
						<aside class="single_sidebar_widget post_category_widget">
							<h4 class="widget_title">Admin menu</h4>
							<ul class="cat-list nanumbarungothic">
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
							<div class="row">
								<div class="col-lg-4 col-md-4">
									<br> <br>
									<div class="card"
										style="border-left: 0.25rem solid #0062ff !important;">
										<div class="card-body text-center" style="padding: 20px">
											<div style="margin-right: 20px;">
												<span class="fa-stack fa-lg" style="margin-right: 10px;">
													<i class="fa fa-circle fa-stack-2x" style="color: #0062ff"></i>
													<i class="fa-solid fa-bell fa-stack-1x fa-inverse"></i>
												</span><span id="cardTitle">총 신고 건수</span>
											</div>
											<h3 id="adminReportTotalCount"></h3>
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-md-4">
									<br> <br>
									<div class="card"
										style="border-left: 0.25rem solid #36b9cc !important;">
										<div class="card-body text-center" style="padding: 20px;">
											<div style="margin-right: 20px;">
												<span class="fa-stack fa-lg" style="margin-right: 10px;">
													<i class="fa fa-circle fa-stack-2x" style="color: #36b9cc"></i>
													<i class="fa-solid fa-bell fa-stack-1x fa-inverse"></i>
												</span><span id="cardTitle">신고 제재 대상 회원</span>
											</div>
											<h3 id="adminReporCount"></h3>
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-md-4">
									<br> <br>
									<div class="card"
										style="border-left: 0.25rem solid #f6c23e !important;">
										<div class="card-body text-center" style="padding: 20px">
											<div style="margin-right: 20px;">
												<span class="fa-stack fa-lg" style="margin-right: 10px;">
													<i class="fa fa-circle fa-stack-2x" style="color: #f6c23e"></i>
													<i class="fa-solid fa-bell fa-stack-1x fa-inverse"></i>
												</span><span id="cardTitle">신고 제재 중인 회원</span>
											</div>
											<h3 id="adminReportedCount"></h3>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-12 col-md-12 blog_details">
							<br> <br>
							<div class="card">
								<div class="card-header que admPetChartA">
									<i class="fa-solid fa-bell"></i>&nbsp; <i class="fa fa-users"
										aria-hidden="true"></i> &nbsp; 신고 제재 중인 회원
								</div>
								<div class="card-body anw" style="padding: 15px">
									<div class="card-body anw" style="padding: 15px"></div>
								</div>

							</div>
						</div>




						<div class="col-lg-12 col-md-12 blog_details">
							<br> <br>
							<div class="card">
								<div class="card-header que" onclick="admReporListBtn()">
									<i class="fa-solid fa-bell"></i>&nbsp; <i class="fa fa-users"
										aria-hidden="true"></i>&nbsp;&nbsp; 신고 제재 대상 회원 <input
										type="hidden" value="one" id="admRepoorListInput">
								</div>
								<div class="card-body anw admRepoorListDiv"
									style="padding: 15px"></div>
							</div>
						</div>



						<div class="col-lg-12 col-md-12 blog_details">
							<br> <br>
							<div class="card">
								<div class="card-header que" onclick="admQnAListBtn()">
									<i class="fa-solid fa-bell"></i>&nbsp;&nbsp;<i
										class="fa fa-pencil-square-o" aria-hidden="true"></i>&nbsp;&nbsp;QnA에
									대한 신고 목록 <input type="hidden" value="one" id="admQnAListInput">
								</div>
								<div class="card-body card_notice anw admQnAListDiv"
									style="padding: 15px;">
									<form id="admDateFormQ" onsubmit="return false"
										onkeypress="eventkeyQ();" autocomplete="off">
										<input type="hidden" name="code">
										<div>
											<code>가입일 검색 </code>
											<input type="hidden" name="repor"> <input
												type="hidden" name="pageNum" value="1"> <input
												style="margin-left: 7.5%;" type="text" id="datepickerA"
												name="fromDate">&nbsp;<i class="fa fa-calendar-o"
												aria-hidden="true"></i>&nbsp;&nbsp; ~ <input type="text"
												id="datepickerB" name="toDate"> <i
												class="fa fa-calendar-o" aria-hidden="true"></i>
										</div>
										&nbsp;&nbsp; <br>
										<code>이름,아이디로 검색 </code>
										&nbsp;&nbsp;&nbsp;&nbsp; <select id="key" name="key">
											<option value="" selected>전 체</option>
											<option value="reporter">신고자</option>
											<option value="reported">신고당한사람</option>
										</select> <input type="text" id="data" name="data" size="20">&nbsp;
										<button type="submit" onclick="pagingListQ();"
											class="btn btn-default">
											<i class="fa fa-search"></i>
										</button>
										<button type="reset" class="btn btn-default">
											<i class="fa fa-search-minus" aria-hidden="true"></i>
										</button>
									</form>
									<br>
									<div id="button">
										<code>조건 별 검색 </code>
										&nbsp;&nbsp;&nbsp;&nbsp;
										<button type="button"
											class="btn btn-link btn-rounded btn-fw codepQ" data-code=""
											data-repor="">전체</button>
										<button type="button"
											class="btn btn-link btn-rounded btn-fw codepQ"
											data-code="601" data-repor="">불법 광고 및 홍보</button>
										<button type="button"
											class="btn btn-link btn-rounded btn-fw codepQ"
											data-code="602" data-repor="">음란물/선정성 콘텐츠</button>
										<button type="button"
											class="btn btn-link btn-rounded btn-fw codepQ"
											data-code="603" data-repor="">욕설,비속어,모욕</button>
									</div>
									<div id="button2" style="padding-left: 150px;">
										<button type="button"
											class="btn btn-link btn-rounded btn-fw codepQ"
											data-code="604" data-repor="">사생활 침해</button>
										<button type="button"
											class="btn btn-link btn-rounded btn-fw codepQ"
											data-code="605" data-repor="">게시물 도배</button>
										<button type="button"
											class="btn btn-link btn-rounded btn-fw codepQ" data-code=""
											data-repor="701">미처리</button>
										<button type="button"
											class="btn btn-link btn-rounded btn-fw codepQ" data-code=""
											data-repor="702">기각처리</button>
										<button type="button"
											class="btn btn-link btn-rounded btn-fw codepQ" data-code=""
											data-repor="703">승인처리</button>
									</div>

									<table class="table table-striped" style="margin-top: 50px;">
										<thead>
											<tr>
												<th>신고자</th>
												<th>신고일</th>
												<th>신고 유형</th>
												<th>처리 밑 조회</th>
											</tr>
										</thead>
										<tbody id="myTableQ" align="center">

										</tbody>
									</table>
									<div id="paginationQ"></div>
								</div>
							</div>
						</div>



						<div class="col-lg-12 col-md-12 blog_details">
							<br> <br>
							<div class="card">
								<div class="card-header que" onclick="admReviewListBtn()">
									<i class="fa-solid fa-bell"></i>&nbsp;&nbsp;<i
										class="fa fa-pencil-square-o" aria-hidden="true"></i>&nbsp;&nbsp;후기에
									대한 신고 목록 <input type="hidden" value="one"
										id="admReviewListInput">
								</div>
								<div class="card-body anw admReviewListDiv">
									<div class="row">
										<div class="table-wrap" style="width: 950px;">
											<form id="admDateFormR" onsubmit="return false"
												autocomplete="off" onkeypress="eventkeyR();">
												<input type="hidden" name="code">
												<div>
													<code>가입일 검색 </code>
													<input type="hidden" name="repor"> <input
														type="hidden" name="pageNum" value="1"> <input
														style="margin-left: 7.5%;" type="text" id="datepickerC"
														name="fromDate">&nbsp;<i class="fa fa-calendar-o"
														aria-hidden="true"></i>&nbsp;&nbsp; ~ <input type="text"
														id="datepickerD" name="toDate"> <i
														class="fa fa-calendar-o" aria-hidden="true"></i>
												</div>
												&nbsp;&nbsp; <br>
												<code>이름,아이디로 검색 </code>
												&nbsp;&nbsp;&nbsp;&nbsp; <select id="key" name="key">
													<option value="" selected>전 체</option>
													<option value="reporter">신고자</option>
													<option value="reported">신고당한사람</option>
												</select> <input type="text" id="data" name="data" size="20">&nbsp;
												<button type="submit" onclick="pagingListR();"
													class="btn btn-default">
													<i class="fa fa-search"></i>
												</button>
												<button type="reset" class="btn btn-default">
													<i class="fa fa-search-minus" aria-hidden="true"></i>
												</button>
											</form>
											<br>
											<div>
												<code>조건 별 검색</code>
												&nbsp;&nbsp;&nbsp;&nbsp;
												<button type="button"
													class="btn btn-link btn-rounded btn-fw codepR" data-code=""
													data-repor="">전체</button>
												<button type="button"
													class="btn btn-link btn-rounded btn-fw codepR"
													data-code="601" data-repor="">불법 광고 및 홍보</button>
												<button type="button"
													class="btn btn-link btn-rounded btn-fw codepR"
													data-code="602" data-repor="">음란물/선정성 콘텐츠</button>
												<button type="button"
													class="btn btn-link btn-rounded btn-fw codepR"
													data-code="603" data-repor="">욕설,비속어,모욕</button>
											</div>
											<div style="padding-left: 150px;">
												<button type="button"
													class="btn btn-link btn-rounded btn-fw codepR"
													data-code="604" data-repor="">사생활 침해</button>
												<button type="button"
													class="btn btn-link btn-rounded btn-fw codepR"
													data-code="605" data-repor="">게시물 도배</button>
												<button type="button"
													class="btn btn-link btn-rounded btn-fw codepR" data-code=""
													data-repor="701">미처리</button>
												<button type="button"
													class="btn btn-link btn-rounded btn-fw codepR" data-code=""
													data-repor="702">기각처리</button>
												<button type="button"
													class="btn btn-link btn-rounded btn-fw codepR" data-code=""
													data-repor="703">승인처리</button>
											</div>

											<table class="table table-striped" style="margin-top: 50px;">
												<thead>
													<tr>
														<th>신고자</th>
														<th>신고일</th>
														<th>신고 유형</th>
														<th>처리 밑 조회</th>
													</tr>
												</thead>
												<tbody id="myTableR" align="center">

												</tbody>
											</table>
											<div id="paginationR"></div>

										</div>
										<!-- <div class="card-footer">
											<span style="color: #0062ff"><i
												class="fa-solid fa-plus"></i>&nbsp;&nbsp;</span><span>회원에게
												메시지 보내기</span>
										</div> -->
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- QNA  Modal 창 -->
		<div class="modal fade" id="myModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" style="margin-top: 200px;">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">신고내역</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">

						<ul id="repo" class="list-star">
							<!-- 신고 내역 -->
						</ul>

						<!-- 신고 처리 Form 태그 -->
						<form id="form" style="display: none;">
							<div class="form-group">
								<label for="amdReportOption">처리유형</label> <select class="repor"
									id="repor" name="repor">
									<option value="701" selected>미처리</option>
									<option value="702">기각</option>
									<option value="703">승인</option>
								</select>
							</div>
							<div class="form-group">
								<label for="message-text" class="col-form-label">처리사유</label>
								<textarea class="state" id="state" name="state"></textarea>
							</div>
						</form>
						<div class="modal-footer">
							<button type="button" id="admReportUpdate" name="admReportUpdate"
								style="display: none;" class="btn btn-primary">확 인</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--end Modal 창 -->
		<!-- 제재 대상 회원의 역대 신고 내역 보기 모달창 -->
		<!-- Modal -->
		<div class="modal fade" id="reviewWriteModal" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title" id="exampleModalLabel">후기작성</h3>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<form action="counselReviewInsert" method="post"
						enctype="multipart/form-data">
						<!-- modal 몸통 -->
						<div class="modal-body">

							<div align="center">
								<h3 align="center">후기를 남겨주세요!</h3>
								<div class="star-rating">
									<input type="radio" id="5-stars" name="rating" value="5" /> <label
										for="5-stars" class="star">&#9733;</label> <input type="radio"
										id="4-stars" name="rating" value="4" /> <label for="4-stars"
										class="star">&#9733;</label> <input type="radio" id="3-stars"
										name="rating" value="3" /> <label for="3-stars" class="star">&#9733;</label>
									<input type="radio" id="2-stars" name="rating" value="2" /> <label
										for="2-stars" class="star">&#9733;</label> <input type="radio"
										id="1-stars" name="rating" value="1" /> <label for="1-stars"
										class="star">&#9733;</label>
								</div>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword4">후기내용</label>
								<textarea class="form-control" id="content" name="content"
									placeholder="후기내용" rows="4" cols="80"></textarea>
							</div>
						</div>
						<!-- modal 하단 버튼 -->
						<div class="modal-footer">
							<input type="hidden" id="insert_c_no" name="c_no" value="">
							<button type="submit">작성</button>
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">취소</button>

						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	<script>
	

	
	   $("#datepickerC").datepicker({
			language: 'ko'
	 }); 
	   $("#datepickerD").datepicker({
		language: 'ko'
	 }); 
	   $("#datepickerA").datepicker({
			language: 'ko'
		 }); 
	   $("#datepickerB").datepicker({
			language: 'ko'
		 }); 

function admQnAListBtn() {//qna에 대한 함수 실행
	
	var input;
	input = $("#admQnAListInput").val();
	
	if( input === 'one' ){
		$("#admQnAListInput").val('two');
		pagingListQ();
		
		
	} else  {
		$("#admQnAListInput").val('one');
	};
};

function admReviewListBtn() {//qna에 대한 함수 실행
	
	var input;
	input = $("#admReviewListInput").val();
	
	if( input === 'one' ){
		$("#admReviewListInput").val('two');
		pagingListR();
		
		
	} else  {
		$("#admReviewListInput").val('one');
	};
};


 	
	//======================enter 키===================
	function eventkeyR() {
		if (event.keyCode == 13) {
			pagingListR();
		} else {
			return false;
		}
	}//====================end enter 키================
	
	let viewReviewListR = function(result) {
		$("#myTableR").empty();
		console.log(result);

		$
				.each(
						result,
						function(i) {
							if (result[i].repor === 701) {
								$("#myTableR")
										.append(
												"<tr><td>"
														+ result[i].reporter
														+ "</td><td>"
														+ result[i].reported
														+ "</td><td>"
														+ result[i].w_date
														+ "</td><td class='card-text'>"
														+ result[i].content
														+ "</td><td>"
														+ result[i].f_content
														+ "</td><td>"
														+ "<button id='reportModal' type='button' class='btn btn-danger btn-icon-text' onclick='showR("
														+ result[i].rep_no
														+ ")' value="
														+ result[i].rep_no
														+ " data-toggle='modal'  data-target='#exampleModal"
														+ result[i].rep_no
														+ "'>"
														+ "미처리</td></button></tr>");
							} else if (result[i].repor === 702) {

								$("#myTableR")
										.append(
												"<tr><td>"
														+ result[i].reporter
														+ "</td><td>"
														+ result[i].reported
														+ "</td><td>"
														+ result[i].w_date
														+ "</td><td class='card-text'>"
														+ result[i].content
														+ "</td><td>"
														+ result[i].f_content
														+ "</td>"
														+ "<td><button  type='button' onclick='showR("
														+ result[i].rep_no
														+ ")' class='btn btn-secondary' data-toggle='modal' data-target='#exampleModal'> "
														+ "기각처리</td></button></tr>");
							} else {

								$("#myTableR")
										.append(
												"<tr><td>"
														+ result[i].reporter
														+ "</td><td>"
														+ result[i].reported
														+ "</td><td>"
														+ result[i].w_date
														+ "</td><td class='card-text'>"
														+ result[i].content
														+ "</td><td>"
														+ result[i].f_content
														+ "</td>"
														+ "<td><button  type='button' class='btn btn-success' onclick='showR("
														+ result[i].rep_no
														+ ")'  data-toggle='modal' data-target='#exampleModal'>"
														+ "승인처리</td></button></tr>");
							}
							;
						});
	}
	//==============================end 리스트 만드는 함수 : viewReviewList============================
	
	
	// ============================Modal 처리 : Review=========================================
	 function showR(st) {
		console.log("st는 :"+st);
			$
					.ajax({
						url : 'admReportOneReview',
						method : 'post',
						data : {
							"rep_no" : st
						},
						success : function(res) {
							console.log(res[0].state);

							if(res[0].repor != 701  ){ //state 값이 있을 떄 + repor 가 선택 되어 있을 때 : 기각처리 / 승인처리 
								$("form").append("<input type='hidden' id='rep_no' value ="+res[0].rep_no+">");
								$("#repo").append(
										"<li>신고유형 : " + res[0].f_content
												+ "</li><li>신고날짜 : "
												+ res[0].w_date
												+ "</li><li>신고자 : "
												+ res[0].reporter
												+ "</li><li>신고당한 : "
												+ res[0].reported
												+ "</li><li>신고사유 : "
												+ res[0].content
												+ "</li><li>게시글 내용 : "
												+  res[0].rev_content
												+ "</li><li>신고처리 상태 : "
												+ (res[0].repor == 702 ? '기각처리' : '승인처리')
												+ "</li><li>해당처리 사유 : "
												+ res[0].state
												+ "</li>");
								
								$(".modal-footer").append("<button type='button' id='goDetail' data-value="+res[0].rev_no+" onclick='goDetail(this)' >상세페이지로..</button>");


								
							}else {   //미처리 state + repor 가 값이 담겨져 있지 않을 떄
								$('#form').show();
								$("#admReportUpdate").show();
								$("form")
										.append(
												"<input type='hidden' id='rep_no' value ="+res[0].rep_no+">");
								$("#repo").append(
										"<li>신고유형 : " + res[0].f_content
												+ "</li><li>신고날짜 : "
												+ res[0].w_date
												+ "</li><li>신고자 : "
												+ res[0].reporter
												+ "</li><li>신고당한 : "
												+ res[0].reported
												+ "</li><li>신고사유 : "
												+ res[0].content
												+ "</li><li>게시글 내용 : "
												+  res[0].rev_content
												+ "</li>");
								$(".modal-footer").append("<button type='button' id='goDetail' data-value="+res[0].rev_no+" onclick='goDetailR(this)' >상세페이지로..</button>");
								let html = 
									`<li data-value="701" class="option selected">미처리</li>
									<li data-value="702" class="option">기각</li>
									<li data-value="703" class="option">승인</li>`;	
								$(".list").append(html);
							}
						},
						error : function(er) {
							alert('오류가 났음. 개발자 호츌');
						} //end error
					})// end ajax
					$("#myModal").modal('show');
		
	} 
	// ==================================Modal 처리 : Review=========================================끝

	//모달 내용 초기화
	 $('#myModal').on('hidden.bs.modal', function(e) {
		$('#form').hide();
		$("#admReportUpdate").hide();
		$(this).find('ul').empty();
		$(this).find('form')[0].reset();
		$(this).find('#goDetail').remove(); 
		

	}) 
	//END 모달 내용 초기화

	//신고처리 : admReportUpdate
	/*  $("#admReportUpdate").on("click", function(e) {
		var str = $('#form').serialize();
		console.log("str의 값"+str);
		var rep_no = $("#rep_no").val();
		console.log("rep_no : "+rep_no);
		var state = $("#state").val();
		console.log("state : "+state);
		var repor = $("#repor").val();
		console.log("repor : "+repor);

		var flag = confirm("신고처리 하시겠습니까?");
		if (flag == true) {
			$.ajax({
				url : 'admReportUpdate',
				method : 'post',
				data : {
					"rep_no" : rep_no,
					"state" : state,
					"repor" : repor
				},
				success : function(result) {
					alert("신고 처리가 성공적으로 완료되었습니다");
					console.log(result);
					location.reload();
				},
				error : function(err) {
					alert("신고 처리가 실패했습니다. 개발자 호출!");

				}
			}) //end Ajax
		}//end If
	}) *///end 신고 처리 
		
		
	//===================리스트 호출 버튼==================
	$(".codepR").on('click', function() {
		var code = $(this).data('code');
		var repor = $(this).data('repor');
		console.log(code);
		console.log(repor);
		$('#admDateFormR')[0].code.value = code
		$('#admDateFormR')[0].repor.value = repor
		$('#admDateFormR')[0].pageNum.value = 1;
		pagingListR();
		
	});//===================end 리스트 호출 버튼================== 
	
	
	//===========리스트 ajax 호출==========
	function pagingListR() {
		var st;
		st = $('#admDateFormR').serialize();
		console.log(st);
		$.ajax({
			url : 'admRlistCode',
			method : 'post',
			data :st,
			//contentType : 'application/json',
			success : function(result) {
				if(result.list == ''){
					alert('해당 데이터가 없습니다.');
					$("#myTableR").empty();
					$("#paginationR").empty();
					
					$("#myTableR").append("<tr><td colspan='4' align='center'>데이터가 없습니다.</td></tr>");
				}else {
					viewReviewListR(result.list);
					viewPageR(result.page);
					
				};
			}
		});
	}//===========end  리스트 ajax 호출========== 끝!
		
	//===========페이징 처리==========
	function viewPageR(page) {
		console.log("얘로 페이지를 만든다!"+page);
		
		var nav =  `<nav class="blog-pagination justify-content-center d-flex">
		<ul class="pagination">`
		if(page.prev) {
			nav += `<li class="page-item">
			<a href="javascript:goPageR(\${page.startPage-1})" class="page-link"
				aria-label="Previous">
				<span aria-hidden="true">
					<span class="fa fa-angle-left"></span>
				</span></a>
			</li>`
		}
			for ( var i=page.startPage ; i <=  page.endPage; i++){
				nav += `<li class="page-item \${page.pageNum == i ? 'active' : '' }"><a
							href="javascript:goPageR(\${i})" class="page-link">\${i}</a>
							</li>`
			}
			
		if(page.next){
			nav += `<li class="page-item"><a href="javascript:goPageR(\${page.endPage+1})"
				class="page-link" aria-label="Next">
			<span aria-hidden="true">
				<span class="fa fa-angle-right"></span>
			</span></a>
	</li>`
	
		}
			
		nav += `</ul></nav>`
		$('#paginationR').html(nav);
		
	}
		
	function goPageR(pa) {
		$('#admDateFormR')[0].pageNum.value = pa;
		pagingListR();
	}
	//===========end 페이징 처리==========
function eventkeyQ() {
		if (event.keyCode == 13) {
			pagingListQ();
		} else {
			return false;
		}
	}//====================end enter 키================
	
	let viewReviewListQ = function(result) {
		$("#myTableQ").empty();
		console.log(result);

		$
				.each(
						result,
						function(i) {
							if (result[i].repor === 701) {
								$("#myTableQ")
										.append(
												"<tr><td>" 
														+ result[i].reporter
														+ "</td><td>"
														+ result[i].w_date
														+ "</td><td>"
														+ result[i].f_content
														+ "</td><td>"
														+ "<button id='reportModal' type='button' class='btn btn-danger btn-icon-text' onclick='showQ("
														+ result[i].rep_no
														+ ")' value="
														+ result[i].rep_no
														+ " data-toggle='modal'  data-target='#exampleModal"
														+ result[i].rep_no
														+ "'>"
														+ "미처리</td></button></tr>");
							} else if (result[i].repor === 702) {

								$("#myTableQ")
										.append(
												"<tr><td>"
														+ result[i].reporter
														+ "</td><td>"
														+ result[i].w_date
														+ "</td><td>"
														+ result[i].f_content
														+ "</td>"
														+ "<td><button  type='button' onclick='showQ("
														+ result[i].rep_no
														+ ")' class='btn btn-secondary' data-toggle='modal' data-target='#exampleModal'> "
														+ "기각처리</td></button></tr>");
							} else {

								$("#myTableQ")
										.append(
												"<tr><td>"
														+ result[i].reporter
														+ "</td><td>"
														+ result[i].w_date
														+ "</td><td>"
														+ result[i].f_content
														+ "</td>"
														+ "<td><button  type='button' class='btn btn-success' onclick='showQ("
														+ result[i].rep_no
														+ ")'  data-toggle='modal' data-target='#exampleModal'>"
														+ "승인처리</td></button></tr>");
							}
							
						});
	}
	//===================================================end 리스트 만드는 함수 : viewReviewList================================= 끝!
	
	// Modal 미처리 신고 
	function showQ(st) {
		console.log("st는 :"+st);
			$
					.ajax({
						url : 'admReportOneQna',
						method : 'post',
						data : {
							"rep_no" : st
						},
						success : function(res) {
							console.log(res[0].state);
							if (res == '') alert('해당 데이터가 없습니다');

							if(res[0].repor != 701  ){ //state 값이 있을 떄 + repor 가 선택 되어 있을 때 : 기각처리 / 승인처리 
								
								
								//$("form").append("<input type='hidden' id='rep_no' value ="+res[0].rep_no+">");
								$("#repo").append(
										"<li>신고유형 : " + res[0].f_content
												+ "</li><li>신고날짜 : "
												+ res[0].w_date
												+ "</li><li>신고 한 사람 : "
												+ res[0].reporter
												+ "</li><li>신고 당한 사람 : "
												+ res[0].reported
												+ "</li><li>신고사유 : "
												+ res[0].content
												+ "</li><li>게시글 내용 : "
												+ res[0].q_content
												+ "</li><li>신고처리 상태 : "
												+ (res[0].repor == 702 ? '기각처리' : '승인처리')
												+ "</li><li>해당처리 사유 : "
												+ (res[0].state == 'null' ? '없음' : res[0].state )
												+ "</li>");
								
								
								
								$(".modal-footer").append("<button class='btn btn-link' type='button' id='goDetail' data-value="+res[0].q_no+" onclick='goDetail(this)' >상세페이지로..</button>");

								
							}else {   //미처리 state + repor 가 값이 담겨져 있지 않을 떄
								$('#form').show();									
								$("#admReportUpdate").show();
								
								$("form")
										.append(
												"<input type='hidden' id='rep_no' value ="+res[0].rep_no+">");
								
								$("form")
									.append(
											"<input type='hidden' id='q_no' value ="+res[0].q_no+">");
								$("form")
								.append(
										"<input type='hidden' id='reported' value ="+res[0].reported+">");
								$("form")
								.append(
										"<input type='hidden' id='reporter' value ="+res[0].reporter+">");
								
								

								$("#repo").append(
										"<li>신고유형 : " + res[0].f_content
												+ "</li><li>신고날짜 : "
												+ res[0].w_date
												+ "</li><li>신고 한 사람 : "
												+ res[0].reporter
												+ "</li><li>신고 당한 사람 : "
												+ res[0].reported
												+ "</li><li>신고사유 : "
												+ res[0].content
												+ "</li><li>게시글 내용 : "
												+ res[0].q_content
												+ "</li>");
								$(".modal-footer").append("<button type='button' class='btn btn-link' id='goDetail' data-value="+res[0].q_no+" onclick='goDetail(this)' >상세페이지로..</button>");
								$(".list").html('');									
								$(".current").html('');
								let html = 
									`<li data-value="701" class="option selected">미처리</li>
									<li data-value="702" class="option">기각</li>
									<li data-value="703" class="option">승인</li>`;	
								$(".list").append(html);
								let htm = `<span class="current">미처리</span>`;
								$(".current").append(htm);
								
							}
							
					console.log("rep_no 는 " +res[0].rep_no);

						},
						error : function(er) {
							alert('오류가 났음. 개발자 호츌');
						} //end error
					})// end ajax
					$("#myModal").modal('show');
		
	}
	// end Show function Modal 신고 단건 ======끝!
	
	//=============상세보기 페이지 새 창==============
	function goDetail(e) {
		var q_no = $(e).data('value');
		console.log("q_no : " +q_no);
		var url = `qnaDetail?q_no=\${q_no}`;
		console.log("url :"+url);
		window.open(url);
		
	}
	//=============상세보기 페이지 새 창============== 끝!

	//모달 내용 끌 떄 초기화
	$('#myModal').on('hidden.bs.modal', function(e) {
		$('#form').hide();
		$("#admReportUpdate").hide();
		$(this).find('ul').empty();
		$(this).find('form')[0].reset();
		$(this).find('#goDetail').remove();
		
	})//END 모달 내용 초기화

	//===========신고처리 : admReportUpdate==========
	$("#admReportUpdate").on("click", function(e) {
	
		var q_no = $("#q_no").val();
		console.log("q_no :" + q_no);
		var reported = $("#reported").val();
		var reporter = $("#reporter").val();
		
		
			$.ajax({
				url : 'admReportUpdate',
				method : 'post',
				data : {
					"rep_no" : $("#rep_no").val(),
					"state" : $("#state").val(),
					"repor" : $("#repor").val(),
					"q_no" : $("#q_no").val()
				},
				success : function(result) {
					alert("신고 처리가 성공적으로 완료되었습니다");
					alert('해당 게시글이 삭제 처리 되었습니다');
					console.log(result);
					diaWebAlertFrom(reported);
					diaWebAlertTo(reporter);
					location.reload();
				},
				error : function(err) {
					alert("신고 처리가 성공적으로 실패했습니다. 관리자 호출!");

				}
			}) //end Ajax
		
	})
	//===========신고처리 : admReportUpdate========== 끝!
	
	function diaWebAlertFrom(reported) {

		
         var content = "작성하신 글이 신고처리 되어 삭제처리 되었습니다.";
         // 전송한 정보를 db에 저장   
         $.ajax({
            type: 'post',
            url: 'noticeInsert',
            dataType: 'text',
            data: {
               "n_to": reported,
               "content": content
            },
            success: function () { // db전송 성공시 실시간 알림 전송
               // 소켓에 전달되는 메시지
               // 위에 기술한 EchoHandler에서 ,(comma)를 이용하여 분리시킨다.
               socket.send(reported + "," + content);
               alert("전송되었습니다.");
            },
            error: function (error) {
               console.log(error);
               alert("실패");
       }
         })
	}
            
            function diaWebAlertTo(reporter) {
        		
                var content = "신고하신 글이 삭제처리 되었습니다.";
                 // 전송한 정보를 db에 저장   
                 $.ajax({
                    type: 'post',
                    url: 'noticeInsert',
                    dataType: 'text',
                    data: {
                       "n_to": reporter,
                       "content": content
                    },
                    success: function () { // db전송 성공시 실시간 알림 전송
                       // 소켓에 전달되는 메시지
                       // 위에 기술한 EchoHandler에서 ,(comma)를 이용하여 분리시킨다.
                       socket.send(reporter + "," + content);
                       alert("전송되었습니다.");
                    },
                    error: function (error) {
                       console.log(error);
                       alert("실패");
               }
                 })
            }
	
	

		
	
		
		
	//===================리스트 호출 버튼==================
	$(".codepQ").on('click', function() {
		var code;
		var repor;
	
		code = $(this).data('code');
		repor = $(this).data('repor');
		console.log(code);
		console.log(repor);
		$('#admDateFormQ')[0].code.value = code
		$('#admDateFormQ')[0].repor.value = repor
		$('#admDateFormQ')[0].pageNum.value = 1;
		pagingListQ();
		
	});//===================end 리스트 호출 버튼================== 끝!
	
	
	//===========리스트 ajax 호출==========
	function pagingListQ() {
		var str ;		
		str = $('#admDateFormQ').serialize();
		console.log(str);
		$.ajax({
			url : 'admQlistCode',
			method : 'post',
			data :str,
			//contentType : 'application/json',
			success : function(result) {
				if(result.list == ''){
					alert('해당 데이터가 없습니다.');
					$("#myTableQ").empty();
					$("#paginationQ").empty();
					$("#myTableQ").append("<tr><td colspan='4' align='center'>데이터가 없습니다.</td></tr>");
				}else {
					viewReviewListQ(result.list);
					viewPageQ(result.page);
					
				};
			}
		});
	}//===========end  리스트 ajax 호출========== 끝!
		
	//==============================페이징 처리==========================
	function viewPageQ(page) {
		console.log(page);
					
		var nav =  `<nav class="blog-pagination justify-content-center d-flex">
		<ul class="pagination">`
		if(page.prev) {
			nav += `<li class="page-item">
			<a href="javascript:goPageQ(\${page.startPage-1})" class="page-link"
				aria-label="Previous">
				<span aria-hidden="true">
					<span class="fa fa-angle-left"></span>
				</span></a>
			</li>`
		}
			for ( var i=page.startPage ; i <=  page.endPage; i++){
				nav += `<li class="page-item \${page.pageNum == i ? 'active' : '' }"><a
							href="javascript:goPageQ(\${i})" class="page-link">\${i}</a>
							</li>`
			}
			
		if(page.next){
			nav += `<li class="page-item"><a href="javascript:goPageQ(\${page.endPage+1})"
				class="page-link" aria-label="Next">
			<span aria-hidden="true">
				<span class="fa fa-angle-right"></span>
			</span></a>
	</li>`
	
		}
			
		nav += `</ul></nav>`
		$('#paginationQ').html(nav);
		
	}
		
	function goPageQ(pa) {
		$('#admDateFormQ')[0].pageNum.value = pa;
		pagingListQ();
	}
	//=============================end 페이징 처리============================= 끝!
//아코디언 함수
	$(document).on("click", ".que", function() {
		$(this).next(".anw").stop().slideToggle(300);
		$(this).toggleClass('on').siblings().removeClass('on');
		$(this).next(".anw").siblings(".anw").slideUp(300); // 1개씩 펼치기
	})//end 아코디언 함수
	
	
	//상단바 Count 호출 ajax
	adminReportCount();
	function adminReportCount() {
		$.ajax({
			url : 'adminReportCount',
			method : 'get',
			success : function(res) {
				console.log(res);
				$("#adminReportTotalCount").append(
						res.adminReportTotalCount);
				$("#adminReporCount").append(res.adminReporCount);
				$("#adminReportedCount").append(res.adminReportedCount);

			},
			eroor : function(error) {
				alert('엥??');
				window.reload();
			}
		})
	}//end 상단바 Count 호출 ajax
	
	//=============================================================================================================================================
	
	function admReporListBtn() {
		
		var input;
		input = $("#admRepoorListInput").val();
		 
		
		if( input === 'one' ){
			$("#admRepoorListInput").val('two');
			
			//실행시킬 함수 ===============
			let htmladmReporList;
	 		htmladmReporList = `
			<table class="table table-striped adminReporListTable">
			<thead>
				<tr style="text-align: center;">
					<th>아이디</th>
					<th>이름</th>
					<th>회원유형</th>
					<th>신고건수</th>
					<th>가입날짜</th>
					<th>보기</th>
					<th>제재</th>
				</tr>
			</thead>
			<tbody style="text-align: center" id="adminReporListTbody">

			</tbody>
		</table>
		<div id="pagination" class="admReporListPaging"></div>
	`; 
	$(".admRepoorListDiv").append(htmladmReporList);
		
				$.ajax({
						url:'adminReporList',
						method: 'get',
						success : function (res) {
								
							if(res.list == ''){
								alert('해당 데이터가 없습니다.');									
								$("#adminReporListTbody").append("<tr><td colspan='7' align='center'>조회된 결과가 없습니다.</td></tr>");
							
							} else {	
							
									console.log(res.list);
									console.log(res.page);
									
									viewadminReporList(res.list);
									viewpagingadminReporList(res.page);
										
								}// end if
							
						},// end success
						error : function(error) {
								alert('해당 회원의 목록을 불러오는 데 오류가 있습니다. 개발자에게 연락하십시오!');
							
						}//end error
					}) //end ajax
		
			
		} else  {
			$("#admRepoorListInput").val('one');
			$(".admRepoorListDiv").empty();
		};
	};// 신고 제재 대상 버튼~===================
	
	// ajax 호출 함수===============
		function viewpagingadminReporList(page) {
		console.log("얘로 페이지를 만든다!",page);
		
		var nav =  `<nav class="blog-pagination justify-content-center d-flex">
		<ul class="pagination">`
		if(page.prev) {
			nav += `<li class="page-item">
			<a href="javascript:goPage(\${page.startPage-1})" class="page-link"
				aria-label="Previous">
				<span aria-hidden="true">
					<span class="fa fa-angle-left"></span>
				</span></a>
			</li>`
		}
			for ( var i=page.startPage ; i <=  page.endPage; i++){
				nav += `<li class="page-item \${page.pageNum == i ? 'active' : '' }"><a
							href="javascript:goPage(\${i})" class="page-link">\${i }</a>
							</li>`
			}
			
		if(page.next){
			nav += `<li class="page-item"><a href="javascript:goPage(\${page.endPage+1})"
				class="page-link" aria-label="Next">
			<span aria-hidden="true">
				<span class="fa fa-angle-right"></span>
			</span></a>
	</li>`
	
		}
			
		nav += `</ul></nav>`
		$('.admReporListPaging').html(nav);
		
	} //end viewpagingadminReporList
	
	
	let viewadminReporList = function(list) {
		console.log(list);
		$("#adminReporListTbody").empty();
		/* <th>아이디</th>
		<th>이름</th>
		<th>회원유형</th>
		<th>신고건수</th>
		<th>가입날짜</th>
		<th>보기</th>
		<th>제재</th> */
		$.each(list,function(i){ //반복문 돌려
			
			var id = $("#id").val();
			console.log(id);
			if( id == list[i].id){
				return false;
			} else {
				
			
			$("#adminReporListTbody").append("<tr><td id='id'>"
											+list[i].id+"</td><td>"
											+list[i].name+"</td><td>"
											+(list[i].role == 1 ? '일반회원' : '파트너회원')+"</td><td>"
											+"<div class='progress'>"
											+"<div class='progress-bar bg-success' role='progressbar' style='width:"
											+list[i].c_report
											+ "%' aria-valuenow='70' aria-valuemin='0' aria-valuemax='100'>"
											+ "</div></div>"
											+"</td><td>"
											+list[i].startdate+	"</td><td>"
											+ "<td><button type='button' style='background-color: #38a4ff; border: none;' class='btn btn-primary' data-toggle='modal' onclick='adminReporOne()' data-target='#reviewWriteModal'>조회</button>"
											+ "</td></tr>");
			}
			
		}) //end each
		
	} //end 
	
	
	//해당 회원의 역대 신고 목록 출력 모달
	 function adminReporOne() {
		var id = $(event.target).parent().parent().children("#id").text();
		console.log(id); 
		
		/* $.ajax({
			url : 'adminReporOne',
			method : 'get',
			data : {'id' : id},
			success : function(res) {
				alert(' adminReporOne 성공');
				consol.log(res.list);
				consol.log(res.page);
				
			}
		}) */
		
		
	}; //end 해당 회원의 역대 신고 목록 출력 모달
		
	// ajax 호출 함수===============
	
	/* 
function admReporListBtn() {
		
		var input;
		input = $("#admRepoorListInput").val();
		 
		
		if( input === 'one' ){
			$("#admRepoorListInput").val('two');
			
			//실행시킬 함수 ===============
			let htmladmReporList;
	 		htmladmReporList = `
			<table class="table table-striped adminReporListTable">
			<thead>
				<tr style="text-align: center;">
					<th>아이디</th>
					<th>이름</th>
					<th>회원유형</th>
					<th>신고건수</th>
					<th>가입날짜</th>
					<th>보기</th>
					<th>제재</th>
				</tr>
			</thead>
			<tbody style="text-align: center" id="adminReporListTbody">

			</tbody>
		</table>
		<div id="pagination" class="admReporListPaging"></div>
	`; 
	$(".admRepoorListDiv").append(htmladmReporList);
		
				$.ajax({
						url:'adminReporList',
						method: 'get',
						success : function (res) {
								
							if(res.list == ''){
								alert('해당 데이터가 없습니다.');									
								$("#adminReporListTbody").append("<tr><td colspan='7' align='center'>조회된 결과가 없습니다.</td></tr>");
							
							} else {	
							
									console.log(res.list);
									console.log(res.page);
									
									viewadminReporList(res.list);
									viewpagingadminReporList(res.page);
										
								}// end if
							
						},// end success
						error : function(error) {
								alert('해당 회원의 목록을 불러오는 데 오류가 있습니다. 개발자에게 연락하십시오!');
							
						}//end error
					}) //end ajax
		
			
		} else  {
			$("#admRepoorListInput").val('one');
			$(".admRepoorListDiv").empty();
		};
	};// 신고 제재 대상 버튼~===================
	
	// ajax 호출 함수===============
		function viewpagingadminReporList(page) {
		console.log("얘로 페이지를 만든다!",page);
		
		var nav =  `<nav class="blog-pagination justify-content-center d-flex">
		<ul class="pagination">`
		if(page.prev) {
			nav += `<li class="page-item">
			<a href="javascript:goPage(\${page.startPage-1})" class="page-link"
				aria-label="Previous">
				<span aria-hidden="true">
					<span class="fa fa-angle-left"></span>
				</span></a>
			</li>`
		}
			for ( var i=page.startPage ; i <=  page.endPage; i++){
				nav += `<li class="page-item \${page.pageNum == i ? 'active' : '' }"><a
							href="javascript:goPage(\${i})" class="page-link">\${i }</a>
							</li>`
			}
			
		if(page.next){
			nav += `<li class="page-item"><a href="javascript:goPage(\${page.endPage+1})"
				class="page-link" aria-label="Next">
			<span aria-hidden="true">
				<span class="fa fa-angle-right"></span>
			</span></a>
	</li>`
	
		}
			
		nav += `</ul></nav>`
		$('.admReporListPaging').html(nav);
		
	} //end viewpagingadminReporList */
	
	
	
	
	
	
	
	
	
	</script>
</body>

</html>