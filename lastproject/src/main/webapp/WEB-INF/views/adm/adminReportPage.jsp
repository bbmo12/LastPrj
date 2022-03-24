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
	font-family: 'NanumBarunGothic';
	font-style: normal;
	font-weight: 400;
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
</style>
<script>
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

</script>
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
		<div class="container" style="max-width: 1350px;">
			<div class="row">
				<div class="col-lg-3">
					<h2 align="center">AdminPage</h2>
					<br>
					<div class="blog_right_sidebar">
						<aside class="single_sidebar_widget author_widget">
							<img class="partner_img"
								src="resources/upload/${pmember.picture}"
								onerror="this.src='resources/upload/pet.PNG'"> <br> <br>
							<h4 id="Mainname">관리자님</h4>
							<div class="br"></div>
							<div id="myinfo">
								<i class="fa-solid fa-pen"></i>&nbsp;<a class="no_deco"
									href="confirmPass">차트,목록 페이지</a>
							</div>
						</aside>
					</div>
					<br>
					<div class="blog_right_sidebar">
						<aside class="single_sidebar_widget post_category_widget">
							<h4 class="widget_title">My menu</h4>
							<ul class="list cat-list nanumbarungothic">
								<li><a href="adminMemberPage"
									class="d-flex justify-content-between">
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
													<i class="fa fa-calendar-check fa-stack-1x fa-inverse"></i>
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
													<i class="fa fa-comments fa-stack-1x fa-inverse"></i>
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
													<i class="fa fa-feather-pointed fa-stack-1x fa-inverse"></i>
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
								<div class="card-header que">
									<i class="fa-solid fa-bell"></i>&nbsp;&nbsp;신고 제재 중인 회원
								</div>
								<div class="card-body anw" style="padding: 15px">
									<h4 class="card-title"></h4>
									<div class="card-footer">

										</ul>
									</div>
								</div>

							</div>
						</div>
						<div class="col-lg-12 col-md-12 blog_details">
							<br> <br>
							<div class="card">
								<div class="card-header que admPartChartA"
									onclick="admReporListBtn()">
									<i class="fa fa-flag" aria-hidden="true"></i>&nbsp; <i
										class="fa fa-users" aria-hidden="true"></i> &nbsp;&nbsp; 신고 제재
									대상 회원 <input type="hidden" value="one" id="admRepoorListInput">
								</div>
								<div class="card-body card_notice anw admRepoorListDiv"
									style="padding: 15px"></div>

								<div id="notice_footer"></div>
							</div>

						</div>

						<div class="col-lg-12 col-md-12 blog_details">
							<br> <br>
							<div class="card">
								<div class="card-header que" onclick="admQnAListBtn()">
									<i class="fa fa-users" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;QnA에
									대한 신고 목록 <input type="hidden" value="one" id="admQnAListInput">
								</div>
								<div class="card-body anw admQnAListDiv">
									<div class="row">
										<div class="table-wrap" style="width: 950px;">
											<form id="admDateForm" onsubmit="return false"
												autocomplete="off" onkeypress="eventkey();">
												<input type="hidden" name="code">
												<code>가입일 검색 :</code>
												&nbsp;&nbsp;&nbsp;&nbsp; <input type="hidden" name="pageNum"
													value="1">
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;from
												: <input type="text" id="datepickerA" name="fromDate">&nbsp;&nbsp;
												to : <input type="text" id="datepickerB" name="toDate"><br>
												<br>
												<code>이름,아이디로 검색 :</code>
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
											<code>조건 별 검색 :</code>
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
											<table class="table table-striped">
												<thead>
													<tr style="text-align: center;">
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
										<div class="card-footer">
											<span style="color: #0062ff"><i
												class="fa-solid fa-plus"></i>&nbsp;&nbsp;</span><span></span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-12 col-md-12 blog_details">
							<br> <br>
							<div class="card">
								<div class="card-header que" onclick="admReviewListBtn()">
									<i class="fa fa-users" aria-hidden="true"></i>Review에 대한 신고 목록<input
										type="hidden" value="one" id="admReviewListInput">
								</div>
								<div class="card-body anw admReviewListDiv">
									<div class="row">
										<div class="table-wrap" style="width: 950px;">
											<form id="admDateFormR" onsubmit="return false"
												autocomplete="off" onkeypress="eventkeyR();">
												<input type="hidden" name="code">
												<code>가입일 검색 :</code>
												&nbsp;&nbsp;&nbsp;&nbsp; <input type="hidden" name="repor">
												<input type="hidden" name="pageNum" value="1">
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;from
												: <input type="text" id="datepickerC" name="fromDateR">&nbsp;&nbsp;
												to : <input type="text" id="datepickerD" name="toDate">
												<br> <br>
												<code>이름,아이디로 검색 :</code>
												&nbsp;&nbsp;&nbsp;&nbsp; <select id="key" name="key">
													<option value="" selected>전 체</option>
													<option value="reporter">신고자</option>
													<option value="reported">신고당한사람</option>
												</select> <input type="text" id="data" name="data" size="20">&nbsp;
												<button type="submit" onclick="pagingListR();"
													class="btn btn-default">
													<i class="fa fa-search"></i>
												</button>
												<input type="reset">
											</form>
											<code>조건 별 검색 :</code>
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
											<table class="table table-striped">
												<thead>
													<tr>
														<th>신고자</th>
														<th>신고일</th>
														<th>신고 유형</th>
														<th>처리 밑 조회</th>
													</tr>
												</thead>
												<tbody id="myTableR">

												</tbody>
											</table>
											<div id="paginationR"></div>
										</div>
										<div class="card-footer">
											<span style="color: #0062ff"><i
												class="fa-solid fa-plus"></i>&nbsp;&nbsp;</span><span>반려동물
												추가</span>
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
	<!-- 회원 단건 조회 Modal -->
	<div class="modal fade" id="myModal">
		<div class="modal-dialog modal-xl modal-dialog-scrollable">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title" id="id"></h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">

					<div class="section-top-border">
						<h3 class="mb-30 title_color memberNAME"></h3>
						<div class="row">
							<div class="col-md-5 memberIMG">
								<!-- 회원사진 불러와야함 -->
								<img src="resources/assets/images/elements/d.jpg" alt=""
									class="img-fluid">
							</div>
							<div class="col-md-6 mt-sm-20 left-align-p memberINFO">
								<!-- 회원 정보 출력 -->
								<ul class="unordered-list">
									<li>Fta Keys</li>
									<li>For Women Only Your Computer Usage</li>
									<li>Facts Why Inkjet Printing Is Very Appealing
										<ul>
											<li>Addiction When Gambling Becomes
												<ul>
													<li>Protective Preventative Maintenance</li>
												</ul>
											</li>
										</ul>
									</li>
									<li>Dealing With Technical Support 10 Useful Tips</li>
									<li>Make Myspace Your Best Designed Space</li>
									<li>Cleaning And Organizing Your Computer</li>
								</ul>
							</div>
						</div>
					</div>

					<!-- style="margin-right: -60px; padding-right:50px" -->
					<div class="section-top-border">
						<h3 class="mb-30 title_color">차트</h3>
						<div class="row">
							<div class="col-md-6 mt-sm-20 left-align-p">
								<ul class="unordered-list">
									<li>Fta Keys</li>
									<li>For Women Only Your Computer Usage</li>
									<li>Facts Why Inkjet Printing Is Very Appealing
									<li>Addiction When Gambling Becomes
									<li>Protective Preventative Maintenance</li>
									<li>Dealing With Technical Support 10 Useful Tips</li>
									<li>Make Myspace Your Best Designed Space</li>
									<li>Cleaning And Organizing Your Computer</li>
								</ul>
							</div>
							<div class="col-md-5 Modalchart">
								<canvas id="myChart"></canvas>
							</div>
						</div>
					</div>
					<div class="section-top-border">
						<h3 class="mb-30 title_color">Block Quotes</h3>
						<div class="row">
							<div class="col-lg-12">
								<blockquote class="generic-blockquote">
									<!-- 회원의 자기 소개란 -->
								</blockquote>
							</div>
						</div>
					</div>
					<!-- chart.js -->
					<div class="card">
						<div class="card-body myChartBody">
							<h4 class="card-title">chart</h4>

						</div>
					</div>
					<!--end chart.js -->
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">

					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 모달 2 -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title" id="exampleModalLabel">진료작성</h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<!-- modal 몸통 -->
				<div class="modal-body">
					<div class="form-group">
						<input type="hidden" id="m_id" name="m_id"> <input
							type="hidden" id="p_id" name="p_id" value="${p_id }"> <input
							type="hidden" id="r_no" name="r_no"> <span
							id="span_d_name" style="width: 250px !important;">&nbsp;진단명
							: <input type="text" id="d_name" name="d_name">
						</span><br> <br> <span id="span_symptom"
							style="width: 250px !important;"> &nbsp; &nbsp; 증 상 : <input
							type="text" id="symptom" name="symptom">
						</span><br> <br> <span id="span_result"
							style="width: 250px !important;"> &nbsp; &nbsp; 처 방 : <input
							type="text" id="d_result" name="d_result">
						</span>
					</div>
				</div>
				<!-- modal 하단 버튼 -->
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">취소</button>
					<button id="sendDiaLog" name="sendReserv" type="button"
						class="btn btn-primary" data-dismiss="modal">작성완료</button>
				</div>
			</div>
		</div>
	</div>
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
	
	//===========신고처리 : admReportUpdate==========
	$("#admReportUpdate").on("click", function(e) {
		var str = $('#form').serialize();
		console.log("str의 값"+str);
		var rep_no = $("#rep_no").val();
		console.log("rep_no : "+rep_no);
		var state = $("#state").val();
		console.log("state : "+state);
		var repor = $("#repor").val();
		console.log("repor : "+repor);
		
			$.ajax({
				url : 'admReportUpdate',
				method : 'post',
				data : {
					"rep_no" : $("#rep_no").val(),
					"state" : $("#state").val(),
					"repor" : $("#repor").val()
				},
				success : function(result) {
					alert("신고 처리가 성공적으로 완료되었습니다");
					console.log(result);
					location.reload();
				},
				error : function(err) {
					alert("신고 처리가 성공적으로 실패했습니다. 관리자 호출!");

				}
			}) //end Ajax
		
	})
	//===========신고처리 : admReportUpdate========== 끝!
	
	//모달 내용 끌 떄 초기화
		$('#myModal').on('hidden.bs.modal', function(e) {
			$('#form').hide();
			$("#admReportUpdate").hide();
			$(this).find('ul').empty();
			$(this).find('form')[0].reset();
			$(this).find('#goDetail').remove();
			
	})//END 모달 내용 초기화
	
	//=============상세보기 페이지 새 창==============
	function goDetail(e) {
		var q_no = $(e).data('value');
		console.log("q_no : " +q_no);
		var url = `qnaDetail?q_no=\${q_no}`;
		console.log("url :"+url);
		window.open(url);
		
	}
	//=============상세보기 페이지 새 창============== 끝!
		
	
	// QNA =========================================
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
													+ "</li><li>신고자 : "
													+ res[0].reporter
													+ "</li><li>신고당한 : "
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
	
		
		
		function eventkeyQ() {
			if (event.keyCode == 13) {
				pagingListQ();
			} else {
				return false;
			}
		}//====================end enter 키================
		
		
	// QNA ========================================= END
	
	
	
	
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
		
	//해당 회원의 역대 신고 목록 출력 모달
	 function adminReporOne() {
		var id = $(event.target).parent().parent().children("#id").text();
		console.log(id); 
		
		$.ajax({
			url : 'adminReporOne',
			method : 'get',
			data : {'id' : id},
			success : function(res) {
				alert(' adminReporOne 성공');
				consol.log(res.list);
				consol.log(res.page);
				
			}
		})
		
		
	}; //end 해당 회원의 역대 신고 목록 출력 모달
	
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
			
			
			$("#adminReporListTbody").append("<tr><td id='id'>"+list[i].id+"</td><td>"
											+list[i].name+"</td><td>"+(list[i].role == 1 ? '일반회원' : '파트너회원')+"</td><td>"+list[i].c_report+"</td><td>"+list[i].startdate+	"</td><td>"
											+ "<td><button type='button' style='background-color: #38a4ff; border: none;' class='btn btn-primary' data-toggle='modal' onclick='adminReporOne()' data-target='#reviewWriteModal'>처리</button>"
											+ "</td></tr>");
			
		}) //end each
		
	} //end 
		
		
		
	
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
	
	
	//==============================================REVIEW
	
	function admReviewListBtn() {//Review에 대한 함수 실행
		
		var input;
		input = $("#admReviewListInput").val();
		
		if( input === 'one' ){
			$("#admReviewListInput").val('two');
			pagingListR()
			
			
		} else  {
			$("#admQnAListInput").val('one');
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
		
		// ==================================Modal 처리 : Review=========================================끝
		
		
	
	</script>
</body>

</html>