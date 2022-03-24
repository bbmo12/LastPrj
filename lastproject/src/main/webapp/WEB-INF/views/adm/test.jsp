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
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"
	integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css"
	integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
 -->
<script
	src="resources/assets/js/vendor/jquery.datetimepicker.full.min.js"></script>
<link href="resources/dist/css/datepicker.min.css" rel="stylesheet"
	type="text/css" media="all">
<script src="resources/dist/js/datepicker.js"></script>
<!-- Air datepicker js -->
<script src="resources/dist/js/i18n/datepicker.ko.js"></script>
<!-- 달력 한글 추가를 위해 커스텀 -->
<!-- <script src="resources/adminJs/adminReportPageJS.js"></script> -->
<style>
.single_sidebar_widget .post_category_widget {
	text-decoration: none !important;
	font-size: 2rem !important;
}

#admDateFormQ {
	margin-top: 30px;
	margin-bottom: 30px;
}

#admDateFormR {
	margin-top: 30px;
	margin-bottom: 30px;
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
								<li><a href="adminPage"
									class="d-flex justify-content-between no_deco" id="menu_bold">관리자
										메인</a></li>
								<!-- <li><a href="adminChartPage"
									class="d-flex justify-content-between">
										<p>차트</p>
								</a></li> -->
								<li><a href="adminMemberPage"
									class="d-flex justify-content-between">
										<p>차트.목록</p>
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

						<!-- 신고 제재 처리 중인 회원 -->
						<div class="col-lg-12 col-md-12 blog_details">
							<div class="card">
								<div class="card-header que">
									<i class="fa-solid fa-bell"></i>&nbsp;&nbsp;신고 제재 중인 회원
								</div>
								<div class="card-body anw" style="padding: 15px"></div>
								<div id="notice_footer">
									<p>수신일로부터 7일이 지난 알림은 자동 삭제됩니다.</p>
								</div>
							</div>
						</div>
						<!-- 신고 제재 처리 중인 회원 끝~~!~!~! -->


						<!-- 신고 제재 대상  회원 adminReporList-->
						<div class="col-lg-12 col-md-12 blog_details">
							<div class="card">
								<div class="card-header que " onclick="admReporListBtn()">
									<i class="fa-solid fa-paw"></i> 신고 제재 대상 회원 <input
										type="hidden" value="one" id="admRepoorListInput">
								</div>
								<div class="card-body card_notice anw admRepoorListDiv"
									style="padding: 15px"></div>

								<div class="card-footer">
									<span style="color: #0062ff"><i class="fa-solid fa-plus"></i>&nbsp;&nbsp;</span><span>반려동물
										추가</span>
								</div>
							</div>
						</div>

						<div class="col-lg-12 col-md-12 blog_details">
							<div class="card" id="qnaBtn">
								<div class="card-header que" onclick="admQnAListBtn()">
									<i class="fa-solid fa-paw"></i> QnA에 대한 신고 목록 <input
										type="hidden" value="one" id="admQnAListInput">
								</div>
								<div class="card-body anw admQnAListDiv" style="padding: 15px">
									<form id="admDateFormQ" onsubmit="return false"
										autocomplete="off" onkeypress="eventkeyQ();">
										<input type="hidden" name="code">
										<code>가입일 검색 :</code>
										<input type="hidden" name="repor">
										&nbsp;&nbsp;&nbsp;&nbsp;<input type="hidden" name="pageNum"
											value="1">
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;from
										: <input type="text" id="datepickerA" name="fromDate">&nbsp;&nbsp;
										TO : <input type="text" id="datepickerB" name="toDate">
										&nbsp;&nbsp; <br>
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
										<input type="reset">
									</form>
									<code>조건 별 검색 :</code>
									&nbsp;&nbsp;&nbsp;&nbsp;
									<button type="button"
										class="btn btn-link btn-rounded btn-fw codepQ" data-code=""
										data-repor="">전체</button>
									<button type="button"
										class="btn btn-link btn-rounded btn-fw codepQ" data-code="601"
										data-repor="">불법 광고 및 홍보</button>
									<button type="button"
										class="btn btn-link btn-rounded btn-fw codepQ" data-code="602"
										data-repor="">음란물/선정성 콘텐츠</button>
									<button type="button"
										class="btn btn-link btn-rounded btn-fw codepQ" data-code="603"
										data-repor="">욕설,비속어,모욕</button>
									<button type="button"
										class="btn btn-link btn-rounded btn-fw codepQ" data-code="604"
										data-repor="">사생활 침해</button>
									<button type="button"
										class="btn btn-link btn-rounded btn-fw codepQ" data-code="605"
										data-repor="">게시물 도배</button>
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
											<tr>
												<th>신고자</th>
												<th>신고일</th>
												<th>신고 유형</th>
												<th>처리 밑 조회</th>
											</tr>
										</thead>
										<tbody id="myTableQ">

										</tbody>
									</table>
									<div id="paginationQ"></div>
								</div>
								<div class="card-footer">
									<span style="color: #0062ff"><i class="fa-solid fa-plus"></i>&nbsp;&nbsp;</span><span>반려동물
										추가</span>
								</div>
							</div>
						</div>

						<div class="col-lg-12 col-md-12 blog_details">
							<div class="card">
								<div class="card-header que" onclick="admReviewListBtn()">
									<i class="fa-solid fa-paw"></i> Review에 대한 신고 목록 <input
										type="hidden" value="one" id="admReviewListInput">
								</div>
								<div class="card-body anw admReviewListDiv"
									style="padding: 15px">
									<form id="admDateFormR" onsubmit="return false"
										autocomplete="off" onkeypress="eventkeyR();">
										<input type="hidden" name="code">
										<code>가입일 검색 :</code>
										&nbsp;&nbsp;&nbsp;&nbsp; <input type="hidden" name="repor">
										<input type="hidden" name="pageNum" value="1">
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;from
										: <input type="text" id="datepickerC" name="fromDateR">&nbsp;&nbsp;
										to : <input type="text" id="datepickerD" name="toDate">
										<br>
										<br>
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
										class="btn btn-link btn-rounded btn-fw codepR" data-code="601"
										data-repor="">불법 광고 및 홍보</button>
									<button type="button"
										class="btn btn-link btn-rounded btn-fw codepR" data-code="602"
										data-repor="">음란물/선정성 콘텐츠</button>
									<button type="button"
										class="btn btn-link btn-rounded btn-fw codepR" data-code="603"
										data-repor="">욕설,비속어,모욕</button>
									<button type="button"
										class="btn btn-link btn-rounded btn-fw codepR" data-code="604"
										data-repor="">사생활 침해</button>
									<button type="button"
										class="btn btn-link btn-rounded btn-fw codepR" data-code="605"
										data-repor="">게시물 도배</button>
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
									<span style="color: #0062ff"><i class="fa-solid fa-plus"></i>&nbsp;&nbsp;</span><span>반려동물
										추가</span>
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
			<div class="modal-dialog">
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

								<!-- <div class="nice-select repor" tabindex=""
								
							</div> -->
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
	
	
		 
	
	
	
	
	
		
		
		
		
		
			
		// ajax 호출 함수===============
			
			
			
	
		
		
		
		/* // =================회원 단건 조회 Modal===================
		
		function show() {
			var m_id = $(event.target).parent().next().text();
			console.log(p_id);  
		
		//Modal에 띄어줄 단건조회 ajax : 파트너 회원 : 모든 정보 : 사진 까지 
		 $.ajax({
			url : 'admMemberOne',
			method : 'post',
			data : {'p_id' : p_id },
			success : function (res) {					
				console.log(res.list);
				$('.mem-body').append("<ul><img src='resources/upload/"+ res.list.picture +"'></img>"
										+ "<li>" +res.list.startdate 
										+"</li><li>"
										+ res.list.name
										+ "</li><li>"
										+ res.list.w_address
										+ "</li><li>"
										+ res.list.w_tel
										+ "</li><li>"
										+ res.list.p_info
						    			+"</li></ul>");
				$(".modal-footer").append("<button type='button' id='goDetail' data-value="+res.list.p_id+" onclick='goDetail(this)' >상세페이지로..</button>");
				//$(".modal-footer").append("<a href='pmemberDetail?id="+res.list.p_id+"'>회원의 상세페이지로 이동</a>");
				
				//=========================Modal의 Chart 그리기
				
			}
		}); //end Modal에 띄어줄 단건조회 ajax */
		
	 
	
	
	
	
	
	
		

		
        	
        	
       	

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
			
			
		
		
		
			
		
		
		

		

		
			
			
		
		
		
		
			
		
		
		
		
		
		
		
		// ajax 호출 함수===============
			
		
		
		
	
        
	</script>

</body>

</html>