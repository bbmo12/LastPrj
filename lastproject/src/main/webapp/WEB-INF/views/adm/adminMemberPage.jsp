<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
 
 <!-- <link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
 --><!--
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"
	integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css"
	integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer" /> -->
<script src="resources/assets/js/vendor/jquery.datetimepicker.full.min.js"></script>
 <link href="resources/dist/css/datepicker.min.css" rel="stylesheet" type="text/css" media="all">
 <script src="resources/dist/js/datepicker.js"></script>
<!-- Air datepicker js -->
<script src="resources/dist/js/i18n/datepicker.ko.js"></script>
<!-- 달력 한글 추가를 위해 커스텀 -->

<script src="resources/adminJs/adminMemberPageJS.js"></script>

<style>
.single_sidebar_widget .post_category_widget {
	text-decoration: none !important;
	font-size: 2rem !important;
}

.col-lg-3 {
	padding: 50px;
}

.posts-list {
	margin-top: 1.9%;
}

#my_section {
	padding: 50px;
	background: #f9f9fd;
}

.blog_right_sidebar {
	box-shadow: 0 .15rem 1.75rem 0 rgba(58, 59, 69, .1) !important;
	border: 1px solid #e3e6f0;
	border-radius: 0.35rem
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

.card-footer {
	background: white;
	font-size: 1.0rem;
	font-family: 'NanumBarunGothic';
	font-style: normal;
	font-weight: 400;
}

#notice_footer {
	text-align: center;
	font-size: 1.0rem;
	font-family: 'NanumBarunGothic';
	font-style: normal;
	font-weight: 400;
}

.card_notice {
	font-size: 0.8rem;
	font-family: 'NanumBarunGothic';
	font-style: normal;
	font-weight: 400;
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

.pet_img {
	object-fit: cover;
	object-position: top;
	border-radius: 50%;
	width: 100px !important;
	height: 100px !important;
	float: none;
	margin-bottom: 5px;
}

.widget_title {
	background: #0062ff !important;
}

#cardTitle {
	font-size: 1.25rem;
	font-family: 'NanumBarunGothic';
	font-style: normal;
	font-weight: 700;
}

#myinfo {
	font-size: 0.8rem;
	font-family: 'NanumBarunGothic';
	font-style: normal;
	font-weight: 300;
}

#pet_img2 {
	display: inline-block;
	text-align: center;
	margin-right: 15px;
	font-size: 0.8rem;
	font-family: 'NanumBarunGothic';
	font-style: normal;
	font-weight: 400;
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

<body>
	<br>
	<br>
	<br>
	<br>
	<br>
	<!-- Banner Area Starts -->
	<section class="banner-area">
		<div class="container">
			<div class="row">

				<div class="col-lg-10" style="margin-left: 50px;">
					<br> <br> <br> <br> <br>
					<h1>관리자 페이지</h1>
					<h1>관리자님 반갑습니다.</h1>
				</div>
			</div>
		</div>
	</section>
	<section id="my_section">
		<div class="container" style="max-width: 1350px;">
			<div class="row">
				<div class="col-lg-3">
					<h5>
						<a href="adminPage">메인 페이지</a>
					</h5>
					<br>
					<div class="blog_right_sidebar" style="width: 250px;">
						<aside class="single_sidebar_widget author_widget">
							<img class="partner_img" src="resources/upload/${member.pfile}"
								onerror="this.src='resources/upload/cat.jpg'" alt=""> <br>
							<br>
							<h4>관리자님</h4>
							<div class="br"></div>
							<div id="myinfo">
								<i class="fa-solid fa-pen"></i>&nbsp;해야할 일
							</div>
						</aside>
					</div>
					<br>
					<div class="blog_right_sidebar" style="width: 250px;">
						<aside class="single_sidebar_widget post_category_widget">
							<h4 class="widget_title">My menu</h4>
							<ul class="list cat-list nanumbarungothic">
								<li><a href="adminChartPage"
									class="d-flex justify-content-between">
										<p>차트</p>
								</a></li>
								<li><a href="adminMemberPage"
									class="d-flex justify-content-between">
										<p>목록</p>
								</a></li>
								<li><a href="adminReportPage"
									class="d-flex justify-content-between">
										<p>신고 관리</p>
								</a></li>
								<li><a href="adminBoardPage"
									class="d-flex justify-content-between">
										<p>공지사항</p>
								</a></li>
								<li><a href="logout" class="d-flex justify-content-between">
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
												</span><span id="cardTitle">일반회원 가입자 수</span>
											</div>
											<h3 id="admMemberC"></h3>
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
												</span><span id="cardTitle">펫 마릿수</span>
											</div>
											<h3 id="admPetC"></h3>
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
												</span><span id="cardTitle">파트너 가입자 수</span>
											</div>
											<h3 id="admPmemberC"></h3>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-12 col-md-12 blog_details ">
							<div class="card">
								<div class="card-header que" onclick="admMemberListBtn()">
									<i class="fa fa-users" aria-hidden="true"></i>&nbsp;&nbsp;일반 회원
									목록 <input type="hidden" value="one" id="admMemberListInput">
								</div>
								<div class="card-body anw admMemberListDiv"
									style="padding: 15px"></div>
								<div class="card-footer">
									<span style="color: #0062ff"><i class="fa-solid fa-plus"></i>&nbsp;&nbsp;</span><span>회원에게
										메시지 보내기</span>
								</div>
							</div>
						</div>

						<div class="col-lg-12 col-md-12 blog_details ">
							<div class="card">
								<div class="card-header que" onclick="admPmemberListBtn()">
									<i class="fa fa-users" aria-hidden="true"></i>&nbsp;&nbsp;파트너
									회원 목록 <input type="hidden" value="one" id="admPmemberListInput">
								</div>
								<div class="card-body anw admPmemberListDiv"></div>
								<div class="card-footer">
									<span style="color: #0062ff"><i class="fa-solid fa-plus"></i>&nbsp;&nbsp;</span><span>회원에게
										메시지 보내기</span>
								</div>
							</div>
						</div>


						<div class="col-lg-12 col-md-12 blog_details ">
							<div class="card">
								<div class="card-header">
									<i class="fa fa-users"></i>&nbsp;&nbsp;테스트

								</div>
								<div class="card-body">
									<div>
										단일 달력<br /> <input type="text" id="datepicker">
									</div>
									<br />
									<br />
									<br />
								</div>
								<div class="card-footer">
									<span style="color: #0062ff"><i class="fa-solid fa-plus"></i>&nbsp;&nbsp;</span><span>회원에게
										메시지 보내기</span>
								</div>
							</div>
						</div>


						<div class="col-lg-12 col-md-12 blog_details">
							<div class="card">
								<div class="card-header">
									<i class="fa-solid fa-paw"></i>반려동물
								</div>

								<div class="card-footer">
									<span style="color: #0062ff"><i class="fa-solid fa-plus"></i>&nbsp;&nbsp;</span><span>반려동물
										추가</span>
								</div>
							</div>
						</div>


						<!-- 파트너 회원 단건 조회 Modal -->
						<div class="modal fade" id="myModal">
							<div class="modal-dialog modal-xl">
								<div class="modal-content">

									<!-- Modal Header -->
									<div class="modal-header">
										<h4 class="modal-title">해당 파트너 회원</h4>
										<button type="button" class="close" data-dismiss="modal">&times;</button>
									</div>

									<!-- Modal body -->
									<div class="modal-body">

										<div class='mem-body'></div>

										<!-- chart.js -->
										<div class="card">
											<div class="card-body">
												<h4 class="card-title">추로스 chart</h4>
												<canvas id="myChart" style="height: 50px"></canvas>
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


					</div>
				</div>
			</div>
		</div>
	</section>
	<script>
		//JavaScript 영역의 대부분은 adminMemberPageJS.js 파일에 있습니다 

		 $("#datepicker").datepicker({
    			language: 'ko'
   		 }); 
		
		
		// tooltip 함수
		$(function() {
			// title='상세정보를 보시려면 이름을 클릭하세요..'

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

			});//end Tooltip
		}); //end // tooltip 함수

		//===============================================테이블==========================================================

		// =================회원 단건 조회 Modal===================

		function show() {
			var m_id = $(event.target).parent().next().text();
			console.log(p_id);

			//Modal에 띄어줄 단건조회 ajax : 파트너 회원 : 모든 정보 : 사진 까지 
			$
					.ajax({
						url : 'admMemberOne',
						method : 'post',
						data : {
							'p_id' : p_id
						},
						success : function(res) {
							console.log(res.list);
							$('.mem-body').append(
									"<ul><img src='resources/upload/"+ res.list.picture +"'></img>"
											+ "<li>" + res.list.startdate
											+ "</li><li>" + res.list.name
											+ "</li><li>" + res.list.w_address
											+ "</li><li>" + res.list.w_tel
											+ "</li><li>" + res.list.p_info
											+ "</li></ul>");
							$(".modal-footer")
									.append(
											"<button type='button' id='goDetail' data-value="
													+ res.list.p_id
													+ " onclick='goDetail(this)' >상세페이지로..</button>");
							//$(".modal-footer").append("<a href='pmemberDetail?id="+res.list.p_id+"'>회원의 상세페이지로 이동</a>");

							//=========================Modal의 Chart 그리기

						}
					}); //end Modal에 띄어줄 단건조회 ajax

			$("#myModal").modal('show'); //Modal Open

		}// =================end 회원 단건 조회 Modal=================

		//=============상세보기 페이지 새 창 열어서  :  권한 없어서 못가는 거 같은데
		function goDetail(e) {
			var p_id = $(e).data('value');
			console.log("p_id : " + p_id);
			var url = `pmemberDetail?id=\${p_id}`;
			console.log("url :" + url);
			window.open(url);

		}//=============end window.open()

		//모달 내용 초기화
		$('#myModal').on('hidden.bs.modal', function(e) {
			$(this).find('ul').empty();
			$(this).find('#goDetail').remove();
		})//END 모달 내용 초기화

		//===============================================테이블========================================================== 끝!

		////=======================파트너 회원 js 영역 시작=====================
	</script>

</body>

</html>