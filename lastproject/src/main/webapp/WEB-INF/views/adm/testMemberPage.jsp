<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
</body>
<script>

//모달 내부 그리기
$(document).ready(function modalInput() {
		
	//이름
	$(".memberNAME").append();
	
	//사진
	$(".memberIMG").append('<img src="assets/images/elements/d.jpg" alt="" class="img-fluid">');
	
	//
	
	let blockquoteHtml = $;
	$(".generic-blockquote").append(blockquoteHtml);
	$(".memberNAME").append();
	
	
})

// end 모달 내부 그리기
//-----------------------------------//-----------------------------------//-----------------------------------//-----------------------------------//-----------------------------------

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
								<i class="fa-solid fa-pen"></i>&nbsp;차트,목록 페이지
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
							<div class="row">
								<div class="col-lg-4 col-md-4">
									<br> <br>
									<div class="card"
										style="border-left: 0.25rem solid #0062ff !important;">
										<div class="card-body text-center" style="padding: 20px">
											<div style="margin-right: 20px;">
												<span class="fa-stack fa-lg" style="margin-right: 10px;">
													<i class="fa fa-circle fa-stack-2x" style="color: #0062ff"></i>
													<i class="fa fa-users fa-stack-1x fa-inverse" aria-hidden="true"></i>
												</span><span id="cardTitle">일반회원 가입자 수</span>
											</div>
											<h3 id="admMemberC"></h3>
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
													<i class="fa fa-users fa-stack-1x fa-inverse" aria-hidden="true"></i>
												</span><span id="cardTitle">파트너 가입자 수</span>
											</div>
											<h3 id="admPmemberC"></h3>
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
													<i class="fa-solid fa-paw fa-stack-1x fa-inverse"></i>
												</span><span id="cardTitle">펫 마릿수</span>
											</div>
											<h3 id="admPetC"></h3>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-12 col-md-12 blog_details">
							<br> <br>
							<div class="card">
								<div class="card-header que admPetChartA">
									<i class="fa-solid fa-paw"></i>&nbsp;<i class="fa fa-bar-chart"
										aria-hidden="true"></i>&nbsp;&nbsp; 반려동물 품종 별 차트
								</div>
								<div class="card-body anw" style="padding: 15px">
									<p class="card-description mainCount" id="petCount">
									<h4 class="card-title">펫 품종별 비율</h4>
									<p class="card-description mainCount" id="petCount">
										<code></code>
										<br>
										<code></code>
									</p>
									<div class="admPetChart">
										<canvas id="admPetChart" style="height: 250px"></canvas>
									</div>
									<div class="card-footer">
										<ul class="unordered-list ">
											<li id="a"></li>
											<li id="ip"></li>
										</ul>
									</div>
								</div>

							</div>
						</div>
						<div class="col-lg-12 col-md-12 blog_details">
							<br> <br>
							<div class="card">
								<div class="card-header que admPartChartA"
									onclick="admPartChartABtn()">
									<i class="fa fa-users" aria-hidden="true"></i>&nbsp;<i
										class="fa fa-line-chart" aria-hidden="true"></i>&nbsp;&nbsp;회원
									기간 별 가입자 수 <input type="hidden" value="one"
										id="admPartChartAInput">
								</div>
								<div class="card-body card_notice anw admPartChartADiv"
									style="padding: 15px;">
									<form id="adminPartChartForm" onsubmit="return false"
										autocomplete="off" style="padding-left: 25%; padding-top: 5%;">
										<input type="text" id="datepickerE" name="fromDateC"
											value="2021-01-01">&nbsp;<i class="fa fa-calendar-o"
											aria-hidden="true"></i>&nbsp;&nbsp; ~ <input type="text"
											id="datepickerF" name="toDateC" value="2022-04-30">&nbsp;<i
											class="fa fa-calendar-o" aria-hidden="true"></i> &nbsp;&nbsp;
										<button type="submit" onclick="partChart();"
											class="btn btn-default">
											<i class="fa fa-search"></i>
										</button>
									</form>
									<br>
									<br>
									<div class="admPartChart">
										<canvas id="admPartChart" style="height: 250px;"></canvas>
									</div>
									<div id="notice_footer" class="unorder"	style="padding-top: 5%;padding-bottom: 3%;"></div>
									
								</div>

							</div>
						</div>
						<div class="col-lg-12 col-md-12 blog_details">
							<br> <br>
							<div class="card">
								<div class="card-header que" onclick="admMemberListBtn()">
									<i class="fa fa-users" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;일반
									회원 목록 <input type="hidden" value="one" id="admMemberListInput">
								</div>
								<div class="card-body anw admMemberListDiv">
									<div class="row">
										<div class="table-wrap" style="width: 950px;">
											<form id="admDateForm" onsubmit="return false"
												autocomplete="off" onkeypress="eventkey();" style="">
												<input type="hidden" name="codem">
												<code>가입일 검색</code>
												&nbsp;&nbsp;&nbsp;&nbsp; <input type="hidden" name="pageNum"
													value="1">
												<input style="margin-left:50px;" type="text" id="datepickerA" name="fromDate">&nbsp;<i
													class="fa fa-calendar-o" aria-hidden="true"></i>&nbsp;&nbsp;
												~ <input type="text" id="datepickerB" name="toDate">&nbsp;<i
													class="fa fa-calendar-o" aria-hidden="true"></i> <br>
												<br>
												<code>이름,아이디로 검색</code>
												&nbsp;&nbsp;&nbsp;&nbsp; <select id="key" name="key">
													<option value="" selected>전 체</option>
													<option value="name">이름</option>
													<option value="m_id">아이디</option>
												</select> <input type="text" id="data" name="data" size="20">&nbsp;
												<button type="submit" onclick="pagingList();"
													class="btn btn-default">
													<i class="fa fa-search"></i>
												</button>

												<button type="reset" class="btn btn-default">
													<i class="fa fa-search-minus" aria-hidden="true"></i>
												</button>
												<br> <br>
											</form>
											<code>조건 별 검색</code>
											&nbsp;&nbsp;&nbsp;&nbsp;
											<button type="button"
												class="btn btn-link btn-rounded btn-fw codep" id="key"
												data-code="">전체</button>
											<button type="button"
												class="btn btn-link btn-rounded btn-fw codep" id="petY"
												data-code="100">펫 보유</button>
											<button type="button"
												class="btn btn-link btn-rounded btn-fw codep" id="petN"
												data-code="101">펫 미보유</button>
											<button type="button"
												class="btn btn-link btn-rounded btn-fw codep" id="petN"
												data-code="102">탈퇴한 회원</button>
											<br>
											<table class="table table-striped" style="margin-top:5%;">
												<thead>
													<tr style="text-align: center;">
														<th>이름</th>
														<th>아이디</th>
														<th>가입일</th>
														<th>펫 보유</th>
													</tr>
												</thead>
												<tbody id="myTable" align="center">

												</tbody>
											</table>
											<div id="pagination"></div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-12 col-md-12 blog_details">
							<br> <br>
							<div class="card">
								<div class="card-header que" onclick="admPmemberListBtn()">
									<i class="fa fa-users" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;파트너
									회원 목록 <input type="hidden" value="one" id="admPmemberListInput">
								</div>
								<div class="card-body anw admPmemberListDiv">
									<div class="row">
										<div class="table-wrap" style="width: 950px;">
											<form id="admDateFormP" onsubmit="return false"
												autocomplete="off" onkeypress="eventkeyP();">
												<input type="hidden" name="code">
												<code>가입일 검색</code>
												&nbsp;&nbsp;&nbsp;&nbsp; <input type="hidden" name="pageNum"
													value="1">
												<input style="margin-left:50px;" type="text" id="datepickerC" name="fromDate">&nbsp;&nbsp;<i
													class="fa fa-calendar-o" aria-hidden="true"></i>&nbsp;&nbsp;
												<input type="text" id="datepickerD" name="toDate"><i
													class="fa fa-calendar-o" aria-hidden="true"></i> <br>
												<br>
												<code>이름,아이디로 검색</code>
												&nbsp;&nbsp;&nbsp;&nbsp; <select id="key" name="key">
													<option value="" selected>전 체</option>
													<option value="name">이름</option>
													<option value="p_id">아이디</option>
												</select> <input type="text" id="data" name="data" size="20">&nbsp;
												<button type="submit" onclick="pagingListP();"
													class="btn btn-default">
													<i class="fa fa-search"></i>
												</button>
												<button type="reset" class="btn btn-default">
													<i class="fa fa-search-minus" aria-hidden="true"></i>
												</button>
												<br> <br>
											</form>
											
											<code>조건 별 검색 </code>
											&nbsp;&nbsp;&nbsp;&nbsp;
											<button type="button"
												class="btn btn-link btn-rounded btn-fw codepP" id="key"
												data-code="">전체</button>
											<button type="button"
												class="btn btn-link btn-rounded btn-fw codepP" id="doctor"
												data-code="100">수의사</button>
											<button type="button"
												class="btn btn-link btn-rounded btn-fw codepP" id="trainer"
												data-code="101">훈련사</button>
											<button type="button"
												class="btn btn-link btn-rounded btn-fw codepP" id="groomer"
												data-code="103">미용사</button>
											<button type="button"
												class="btn btn-link btn-rounded btn-fw codepP"
												id="petsitter" data-code="102">펫시터</button>
											<div style="margin-left:120px;">
											<button type="button"
												class="btn btn-link btn-rounded btn-fw codepP" id="petN"
												data-code="104">탈퇴한 회원</button>
												</div>
												<br>
											<table class="table table-striped" style="margin-top:5%;">
												<thead>
													<tr style="text-align: center;">
														<th>이름</th>
														<th>아이디</th>
														<th>가입일</th>
														<th>파트너 쉽</th>
														<th>조회</th>
													</tr>
												</thead>
												<tbody id="myTableP" align="center">

												</tbody>
											</table>
											<div id="paginationP"></div>

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
	
		
		
	
	
		//adminChartPage.jsp 합친 거
		//div admPetChartA 클래스 클릭시 함수
		$(document).on("click",".admPetChartA" ,function(){
		    $(".admPetChart").append("<canvas id='admPetChart'></canvas>");
		     $("#admPetChart").remove();
		     petChart();
		 function petChart() {// 품 종별 Bar 차트 그리기

		    tt = [];
		    oo = [];

		    
		    
		    
		    var total;
		    ip = [];
		    $.ajax({
		        url : 'amdPetChart',
		        method : 'get',
		        success : function(res) {
		            $.each(res, function(i) {
		                tt.push(res[i].tt);
		                oo.push(res[i].oo);
		                console.log(res[i].oo);
		                ip += ` <b>"\${res[i].oo}"</b>는 <i><b>"\${res[i].tt}"</b></i> 마리`;
		                
		            });
		            console.log(ip);
		            $("#ip").html(ip);
		            console.log(res[0].ch);
		            $("#a").html("총 마리수 : " + res[0].ch);


		            const txc = document.getElementById('admPetChart').getContext('2d');
		            const admPetChart = new Chart(txc, {
		                type : 'bar',
		                data : {
		                    labels : oo,
		                    datasets : [ {
		                        label : '# of Votes',
		                        data : tt,
		                        backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
		                                'rgba(255, 159, 64, 0.2)',
		                                'rgba(255, 159, 64, 0.2)' ],
		                        borderColor : [ 'rgba(255, 99, 132, 1)',
		                                'rgba(255, 159, 64, 1)',
		                                'rgba(255, 159, 64, 1)' ],
		                        borderWidth : 1
		                    } ]
		                },
		                options : {
		                    scales : {
		                        y : {
		                            beginAtZero : true
		                        }
		                    }
		                }
		            });
		        }
		    })

		} 

		});
		
		//회원 기간 별 가입 자 수 차트  아코디언 클릭
		function admPartChartABtn() {
			var input;
			input = $("#admPartChartAInput").val();
	
			if (input === 'one') { // 버튼 첫 번쨰 클릭
				$("#admPartChartAInput").val('two'); //버튼 클릭 체크	
				
				
			
	
				partChart();
	
			} else {// 버튼 두 번쨰 클릭
				   $("#admPartChartAInput").val('one'); // 버튼 클릭 체크
				   $("#admPartChart").remove();
				   $(".admPartChart").append("<canvas id='admPartChart'></canvas>");
				   $("input[name=fromDateC]").val('');
				   $("input[name=toDateC]").val('');
				   $("input[name=fromDateC]").val("2021-01-01");
				   $("input[name=toDateC]").val("2022-04-30");
				   $("#Member").empty();
				   $("#Pmember").empty();
				   $(".unorder").empty();
	
			};//end if
	
		};
		//end 회원 기간 별 가입 자 수 차트  아코디언 클릭
										

		
		 function partChart() { //일반 회원 기간 별 차트 그리기
			 $(".admPartChart").append("<canvas id='admPartChart'></canvas>");
			   $("#admPartChart").remove();
			   $("#Member").empty();
			   $("#Pmember").empty();
			   $(".unorder").empty();
			   
			    var fromDate = $("input[name=fromDateC]").val();
		   		var toDate = $("input[name=toDateC]").val();
		   		
			   console.log(fromDate);
			   console.log(toDate);
		       tt = [];
		       oo = [];
		       aa = [];
		       bb = [];
		       pp = [];
		       
		       $.ajax({
		           url : 'admMemChart',
		           method : 'get',
		           data : {"fromDate" : fromDate, "toDate" : toDate},
		           success : function(res) {
		               console.log(res);
		               console.log(res.memChart[0].tt);
		               console.log(res.memChart[0].oo); 
		               console.log(res.pmemChart[0].aa);
		               console.log(res.pmemChart[0].bb);
		               var pmem = res.pmemChart;
		               var mem = res.memChart;
		               
		                $.each(pmem,function(i){
		                   aa.push(pmem[i].aa);
		                   bb.push(pmem[i].bb);
		               });
		                $.each(mem,function(i){
		                       tt.push(mem[i].tt);
		                       oo.push(mem[i].oo);
		               }); 
		                
		                /* console.log(bb);
		                const sumP = bb.reduce((acc,curr)=> acc + curr);
		                console.log(sumP);
		                const sumM = oo.reduce((acc,curr)=> acc + curr);
		                console.log(sumM);
		                 */
		                 
		                 var sumP = 0;
		                 var sumM = 0;
		               
		                for(let p in bb){
		                	console.log(parseInt(bb[p]));
		                	sumP += parseInt(bb[p]);
		                };
		                for(let m in oo){
		                	console.log(oo[m]);
		                	sumM += parseInt(oo[m]);
		                } 
		                console.log(sumP, sumM);

		               const ccc = document.getElementById('admPartChart').getContext('2d');
		               const admPartChart = new Chart(ccc, {
		                   type : 'line',
		                   data : {
		                       labels : tt,aa,
		                       datasets : [ {
		                           label : '일반 회원',
		                           data : oo,
		                           backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
		                                   'rgba(255, 159, 64, 0.2)', ],
		                           borderColor : [ 'rgba(255, 99, 132, 1)',
		                                   'rgba(255, 159, 64, 1)' ],
		                           borderWidth : 1
		                       } ,
		                        {
		                           label : '파트너 회원',
		                           data : bb,
		                           backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
		                                   'rgba(255, 159, 64, 0.2)', ],
		                           borderColor : [ 'rgba(255, 99, 132, 1)',
		                                   'rgba(255, 159, 64, 1)' ],
		                           borderWidth : 1
		                       } ]
		                   },
		                   options : {
		                       scales : {
		                           y : {
		                               beginAtZero : true
		                           }
		                       }
		                   }
		               });
		               //차트가 그려진 다음에 텍스트 출력
		                Memberhtml = `\${fromDate} ~ \${toDate}의 <b>"일반회원 가입자 수"</b>는 : <i><b>"\${sumP}"</b></i> 명 `;
		                Pemberhtml = `\${fromDate} ~ \${toDate}의 <b>"파트너회원 가입자 수"</b>는 : <i><b>"\${sumM}"</b></i> 명 `;
		                
		                let htmlUnorder = `<ul class="unordered-list"><li id="Member"></li><li id="Pmember"></li></ul>`;
	
						$(".unorder").append(htmlUnorder);
		                
		                $("#Member").append(Memberhtml);
						$("#Pmember").append(Pemberhtml);
		           } //success

		       }) // ajax

		   } //
		
		
		
		
		//adminChartPage.jsp 합친 거 end
	
	
	
		//Count 호출 ajax
		adminCount();

		function adminCount() {
			$.ajax({
				url : 'adminCount',
				method : 'get',
				success : function(res) {
					console.log(res.petCount);
					console.log(res.pmemCount);
					console.log(res.memCount);
					$("#admMemberC").append(res.memCount + "명");
					$("#admPmemberC").append(res.pmemCount + "명");
					$("#admPetC").append(res.petCount + "마리");

				},
				error : function(error) {
					alert('Count를 불러오는 데 오류가 있습니다')
					return false;

				}

			});

		}
		//end Count 호출 ajax

		// 아코디언 함수 : 1개씩 펼치기

		$(document).on("click", ".que", function() {
			$(this).next(".anw").stop().slideToggle(300);
			$(this).toggleClass('on').siblings().removeClass('on');
			$(this).next(".anw").siblings(".anw").slideUp(300);
		});

		//end 아코디언 함수

		//tooltip 함수

		/* $(function() {

			//Tooltip
			var title_;
			$("tr").hover(function(e) {
				$('tr').attr('title', '상세정보를 보시려면 이름을 클릭하세요..');
				title_ = $(this).attr("title");
				$("bod").append("<div id='ti'></div>");
				$("#ti").css("width", "100px");
				$("#ti").text(title_);
			}, function() { // <a> hover 시 : mouseLeave

				$(this).attr("title", title_); // title 속성 반환
				$("#ti").remove(); // div#tip 삭제

			});

		}); */
		//end tooltip 함수

		//datepicker 달력

		$("#datepickerA").datepicker({
			language : 'ko'
		});
		$("#datepickerB").datepicker({
			language : 'ko'
		});
		$("#datepickerC").datepicker({
			language : 'ko'
		});
		$("#datepickerD").datepicker({
			language : 'ko'
		});
		$("#datepickerE").datepicker({
			
			language : 'ko'
		});
		$("#datepickerF").datepicker({
			
			language : 'ko'
		});
		
	/* 	$("#datepickerE").datepicker('setDate','today');
		$("#datepickerF").datepicker('setDate','+1M'); */

		//end datepicker

		// 아코디언 ON & OFF

		//==================회원 아코디언 ON & OFF===================
		function admMemberListBtn() {
			var input;
			input = $("#admMemberListInput").val();

			if (input === 'one') { // 버튼 첫 번쨰 클릭
				$("#admMemberListInput").val('two'); //버튼 클릭 체크			

				pagingList(); //회원 목록 ajax 함수 호출

			} else {// 버튼 두 번쨰 클릭
				$("#admMemberListInput").val('one'); // 버튼 클릭 체크

			}
			;//end if

		};
		//==================회원 아코디언 ON & OFF=================== END

		//==================파트너회원 아코디언 ON & OFF=================== 
		function admPmemberListBtn() {
			var input;
			input = $("#admPmemberListInput").val();

			if (input === 'one') {

				$("#admPmemberListInput").val('two'); //버튼 클릭 체크

				//$(".admPmemberListDiv").append(htmladmPmemberList);

				pagingListP(); //파트너회원 목록 ajax 함수 호출

			} else {

				$("#admPmemberListInput").val('one'); // 버튼 클릭 체크

			}//end if

		};
		//==================파트너회원 아코디언 ON & OFF=================== END	

		//end 아코디언 ON & OFF

		//회원 검색 조건 (form, ajax)

		//===============일반 회원 조건 검색==========================
		$(document).on('click', '.codep', function() {
			var codem = $(this).data('code');
			console.log(codem);
			$('#admDateForm')[0].codem.value = codem
			$('#admDateForm')[0].pageNum.value = 1;
			pagingList();

		});
		//===============일반 회원 조건 검색========================== END

		//===============파트너 회원 조건 검색==========================
		$(document).on('click', '.codepP', function() {
			var code = $(this).data('code');
			$('#admDateFormP')[0].code.value = code
			$('#admDateFormP')[0].pageNum.value = 1;
			pagingListP();

		});
		//===============파트너 회원 조건 검색========================== END

		//end 회원 검색 조건 (form, ajax)

		//Enter 키

		//==================일반회원 Enter 키=================== END	
		function eventkey() {
			if (event.keyCode == 13) {
				pagingList();
			} else {
				return false;
			}
		};
		//==================일반회원 Enter 키=================== END	

		//==================파트너회원 Enter 키=================== END	
		function eventkeyP() {
			if (event.keyCode == 13) {
				pagingListP();
			} else {
				return false;
			}
		};
		//==================파트너회원 Enter 키=================== END

		//end Enter 키

		//리스트 ajax 호출
		//==================회원 리스트 ajax 호출===================
		function pagingList() {
			var str = $('#admDateForm').serialize();
			console.log(str);

			$
					.ajax({
						url : 'admMlistCode',
						method : 'post',
						data : str,
						//contentType : 'application/json',
						success : function(result) {

							if (result.list == '') {
								$("#myTable").empty();
								$("#pagination").empty();
								$("#myTable")
										.append(
												"<tr><td colspan='4' align='center'>데이터가 없습니다.</td></tr>");
							} else {
								viewMemberList(result.list);
								viewPage(result.page);
							}
							;
						},
						error : function() {
							alert('DB에서 데이터를 가져오는 데 실패했습니다. 개발자 호출 해주세요!');

						}
					});
		};
		//==================회원 리스트 ajax 호출=================== END

		//==================파트너 회원 리스트 ajax 호출===================
		function pagingListP() {
			var str = $('#admDateFormP').serialize();
			console.log(str);
			$
					.ajax({
						url : 'admPlistCode',
						method : 'post',
						data : str,
						success : function(result) {
							if (result.list == '') {
								$("#myTableP").empty();
								$("#paginationP").empty();
								$("#myTableP")
										.append(
												"<tr><td colspan='5' align='center'>데이터가 없습니다.</td></tr>");

							} else {

								console.log("리절트리스트는 :" + result.list);
								console.log("리절트페이지는 : " + result.page);
								viewPmemberListP(result.list);
								viewPageP(result.page);
							}

						},
						error : function(error) {
							alert('DB에서 데이터를 가져오는 데 실패했습니다. 개발자 호출 해주세요!');
						}

					});
		};
		//==================파트너 회원 리스트 ajax 호출=================== END

		//end 리스트 ajax 호출
		
		//페이징 처리 
		//==================파트너 회원 목록 페이징 처리===================
		function viewPageP(page) {
			console.log("page는 :"+page);
			var nav =  `<nav class="blog-pagination justify-content-center d-flex">
			<ul class="pagination">`
			if(page.prev) {
				nav += `<li class="page-item">
				<a href="javascript:goPageP(\${page.startPage-1})" class="page-link"
					aria-label="Previous">
					<span aria-hidden="true">
						<span class="fa fa-angle-left"></span>
					</span></a>
				</li>`
			}
				for ( var i=page.startPage ; i <=  page.endPage; i++){
					nav += `<li class="page-item \${page.pageNum == i ? 'active' : '' }"><a
								href="javascript:goPageP(\${i})" class="page-link">\${i}</a>
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
			$('#paginationP').html(nav);
			
		}//==================파트너 회원 목록 페이징 처리=================== END

	
		//==================일반회원 페이징 처리===================
		function viewPage(page) {
			console.log("page는 :"+page);
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
			$('#pagination').html(nav);
			
		}//==================일반회원 페이징 처리=================== END
		
		//end 페이징 처리

		//다음 페이지 함수

		//==================회원 리스트 ajax 페이징 다음 페이지 함수===================
		function goPage(pa) {
			console.log("pa 는 :" + pa);
			$('#admDateForm')[0].pageNum.value = pa;
			pagingList();
		}
		//==================회원 리스트 ajax 페이징 다음 페이지 함수=================== END

		//==================파트너 회원 리스트 ajax 페이징 다음 페이지 함수===================
		function goPageP(pa) {
			console.log("pa 는 :" + pa);
			$('#admDateFormP')[0].pageNum.value = pa;
			pagingListP();
		};
		//==================파트너 회원 리스트 ajax 페이징 다음 페이지 함수=================== END

		//end 다음 페이지 함수

		//리스트 만드는 함수

		//==================일반회원 리스트 만드는 함수===================
		let viewMemberList = function(result) {
			$("#myTable").empty();

			
			//일반회원의 펫 보유수 체크 해서 같은 회원의 정보가 여러버 나오는 걸 막아야 함 : 미해결
			/* var petno;
			var mid;
			if( result[i].m_id != mid ){
			petno += i;
				} else {
					
				}; */

			$.each(result, function(i) {
				
				if (result[i].startDate != null) {

					$("#myTable").append(
							"<tr><td>" + result[i].name
									+ "</td><td>" + result[i].m_id
									+ "</td><td>" + result[i].startDate
									+ "</td><td>"
									+ (result[i].pet_no == null ? '미보유' : '보유')
									+ "</td><td>"
									+ "</td><td><button type='button' class='btn btn-primary' style='background-color: cornflowerblue; border: none;' onclick='show()'>조회</button></td></tr>");

				} else if (result[i].startDate == null) {
					console.log(result[i].endDate);
					$("#myTable").append(
							"<tr><td align='center' colspan='4'>"
									+ result[i].endDate
									+ "일 탈퇴한 회원입니다</td></tr>");

				}
			}) // end each.

		};
		//==================일반회원 리스트 만드는 함수=================== END

		//==================파트너회원 리스트 만드는 함수===================
		let viewPmemberListP = function(result) {
			$("#myTableP").empty();
			console.log("result는: " + result);
			$.each(result, function(i) {
				if (result[i].startdate != null) {

					/* + "<div class='progress'>"
					+ "<div class='progress-bar bg-success' role='progressbar' style='width:"
					+ result[i].c_report
					+ "%' aria-valuenow='70' aria-valuemin='0' aria-valuemax='100'>"
					+ "</div></div>"
					+ "</td><td>" */
					$("#myTableP").append(
							"<tr><td>" + result[i].name
									+ "</td><td>" + result[i].p_id
									+ "</td><td>" + result[i].startdate
									+ "</td><td>" + result[i].f_content
									+ "</td><td><button type='button' class='btn btn-primary' style='background-color: cornflowerblue; border: none;' onclick='showP()'>조회</button></td></tr>");
					
				} else if (result[i].startdate == null) {
					console.log(result[i].enddate);
					$("#myTable").append(
							"<tr><td align='center' colspan='4'>"
									+ result[i].enddate
									+ "일 탈퇴한 회원입니다</td></tr>");

				}
			}) // end each.

		};
		//==================파트너회원 리스트 만드는 함수=================== END

		//end 리스트 만드는 함수
		
		
		//회원 한 명 단건조회 (Modal, ajax)
	
	
		//==================회원 리스트 단 건 조회 ajax 호출 및 Modal===================
		function show() {
				
				var m_id = $(event.target).closest("tr").children().next().html();
				console.log(m_id);
	
				//Modal에 띄어줄 단건조회 ajax : 파트너 회원 : 모든 정보 : 사진 까지 
				$.ajax({
							url : 'admMemberOne',
							method : 'post',
							data : {
								'm_id' : m_id
							},
							success : function(res) {
								console.log(res.list);
								$('.mem-body').append(
										"<ul><li><img src='resources/upload/"+ res.list.pfile +"'></img>"
												+ "</li><li>"
												+ res.list.startdate
												+ "</li><li>" + res.list.name
												+ "</li><li>" + res.list.w_address
												+ "</li><li>" + res.list.w_tel
												+ "</li><li>" + res.list.p_info
												+ "</li></ul>");
								$(".modal-footer")
										.append(
												"<button type='button' id='goDetail' data-value="+ res.list.m_id+ " onclick='goDetail(this)' >상세페이지로..</button>");
								//$(".modal-footer").append("<a href='pmemberDetail?id="+res.list.p_id+"'>회원의 상세페이지로 이동</a>");
	
								//=========================Modal의 Chart 그리기
	
							}
						}); //end Modal에 띄어줄 단건조회 ajax
	
				$("#myModal").modal('show'); //Modal Open
	
		};
		//==================회원 리스트 단 건 조회 ajax 호출 및 Modal=================== END
		
		
		//==================파트너회원 리스트 단 건 조회 ajax 호출 및 Modal===================
		function showP() {
				var p_id;
				//p_id = $(event.target).parent().next().text();
				p_id = $(event.target).closest("tr").children().next().html();
				console.log(p_id);
				
				//Modal에 띄어줄 단건조회 ajax : 파트너 회원 : 모든 정보 : 사진 까지 
				 $.ajax({
						url : 'admPmemberOne',
						method : 'post',
						data : {'p_id' : p_id },
						success : function (res) {					
						console.log(res.list);
						
						$('.mem-body').append("<ul><li><img src='resources/upload/"+ res.list.pfile +"'></img>"
												+ "</li><li>" 
												+res.list.startdate 
												+"</li><li>"
												+ res.list.name
												+ "</li><li>"
												+ res.list.w_address
												+ "</li><li>"
												+ res.list.w_tel
												+ "</li><li>"
												+ res.list.p_info
								    			+"</li></ul>");
						$(".modal-footer").append("<button type='button' id='goDetail' data-value="+res.list.p_id+" onclick='goDetailP(this)' >상세페이지로..</button>");
						
						//=========================Modal의 Chart 그리기
						
						
						const ctx = document.getElementById('myChart').getContext('2d');
						const myChart = new Chart(ctx, {
							type : 'bar',
							data : {
								labels : [ '신고 당한 수', '추천 수','서비스 제공 수','총매출','팔로워 수' ],
								datasets : [ {
									label : '# of Votes',
									data : [ res.list.c_report, '8', '1' ],
									backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
											'rgba(255, 159, 64, 0.2)',
											'rgba(255, 159, 64, 0.2)' ],
									borderColor : [ 'rgba(255, 99, 132, 1)',
											'rgba(255, 159, 64, 1)', 'rgba(255, 159, 64, 1)' ],
									borderWidth : 1
								} ]
							},
							options : {
								scales : {
									y : {
										beginAtZero : true
									}
								}
							}
						});
						//========================end Modal의 Chart 그리기
						
					}
				}); //end Modal에 띄어줄 단건조회 ajax
				
				//modalInput();
				
				
				$("#myModal").modal('show'); //Modal Open
				
		};
		//==================파트너회원 리스트 단 건 조회 ajax 호출 및 Modal===================
			
			
		//모달에서 상세보기 클릭 시 회원의 마이페이지로 이동

		//==================회원의 마이페이지로 이동===================
		function goDetail(e) {
			var m_id = $(e).data('value');
			console.log("m_id : " + m_id);
			var url = `memberDetail?id=\${m_id}`;
			console.log("url :" + url);
			window.open(url);

		};
		//==================회원의 마이페이지로 이동=================== END

		//==================파트너회원의 마이페이지로 이동===================
		function goDetailP(e) {
			var p_id = $(e).data('value');
			console.log("p_id : " + p_id);
			var url = `pmemberDetail?id=\${p_id}`;
			console.log("url :" + url);
			window.open(url);

		};
		//==================파트너회원의 마이페이지로 이동=================== END

		//end 모달에서 상세보기 클릭 시 회원의 마이페이지로 이동


		//end 회원 한 명 단건조회 (Modal, ajax)
		
			
		//모달 내용 초기화 : 일반회원 / 파트너 회원 단건조회가 같은 모달을 씀 체크해봐 
		
				$('#myModal').on('hidden.bs.modal', function(e) {
					$(this).find('ul').empty();
					$(this).find('#goDetail').remove();
					$('#myChart').remove();
					$('.Modalchart').append('<canvas id="myChart"></canvas>');
					
				})
		
				/* $('#myModal').on('hidden.bs.modal', function(e) {
					$(this).find('ul').empty();
					$(this).find('#goDetail').remove();
				}) */
		//END 모달 내용 초기화		
		
		
		
		
		
		
	</script>
</body>

</html>


		   







	






























	
	

</script>



</html>