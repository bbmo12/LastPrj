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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
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
<style>
.single_sidebar_widget .post_category_widget {
	text-decoration: none !important;
	font-size: 2rem !important;
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
					<h2>MyPage</h2>
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
										<p>일반회원 목록</p>
								</a></li>
								<li><a href="adminPmemberPage"
									class="d-flex justify-content-between">
										<p>파트너회원 목록</p>
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
					<div class="single-post row" style="margin-left: 40px;">
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
												</span><span id="cardTitle">해야할 일 수</span>
											</div>
											<h3>3</h3>
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
												</span><span id="cardTitle"></span>
											</div>
											<h3>3</h3>
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
												</span><span id="cardTitle">새로운 파트너 신청</span>
											</div>
											<h3>3</h3>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-12 col-md-12 blog_details ">
							<div class="card">
								<div class="card-header que">
									<i class="fa-solid fa-bell"></i>&nbsp;&nbsp;일반 회원 목록
								</div>
								<div class="card-body anw">
									<h4 class="card-title"></h4>
									<p>
									<form id="admDateForm" onsubmit="return false"
										onkeypress="eventkey();">
										<input type="hidden" name="code">
										<code>가입일 검색</code>
										&nbsp;&nbsp;&nbsp;&nbsp; <input type="hidden" name="pageNum"
											value="1"> from : <input type="text" id="fromDate"
											name="fromDate">&nbsp;&nbsp; to : <input type="text"
											id="toDate" name="toDate"> <br>
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
										<input type="reset">
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
									</p>
									<table class="table table-hover">
										<thead>
											<tr>
												<th>이름</th>
												<th>아이디</th>
												<th>가입일</th>
												<th>펫 보유</th>
											</tr>
										</thead>
										<tbody id="myTable">

										</tbody>
									</table>
									<div id="pagination"></div>
								</div>
								<div id="notice_footer">
									<p>회원에게 메시지 보내기..</p>
								</div>
							</div>
						</div>




						<div class="col-lg-12 col-md-12 blog_details">
							<div class="card">
								<div class="card-header">
									<i class="fa-solid fa-paw"></i> 반려동물
								</div>

								<div class="card-footer">
									<span style="color: #0062ff"><i class="fa-solid fa-plus"></i>&nbsp;&nbsp;</span><span>반려동물
										추가</span>
								</div>
							</div>
						</div>



						<div class="col-lg-12 col-md-12 blog_details ">
							<div class="card">
								<div class="card-header que">
									<i class="fa-solid fa-bell"></i>&nbsp;&nbsp;파트너 회원 목록
								</div>
								<div class="card-bod anw">
									<h4 class="card-title"></h4>
									<p>
									<form id="admDateFormP" onsubmit="return false"
										onkeypress="eventkeyP();">
										<input type="hidden" name="code">
										<code>가입일 검색</code>
										&nbsp;&nbsp;&nbsp;&nbsp; <input type="hidden" name="pageNum"
											value="1"> from : <input type="text" id="fromDateP"
											name="fromDate">&nbsp;&nbsp; to : <input type="text"
											id="toDateP" name="toDate"> <br>
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
										<input type="reset">
									</form>
									<code>조건 별 검색</code>
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
										class="btn btn-link btn-rounded btn-fw codepP" id="petsitter"
										data-code="102">펫시터</button>
									<button type="button"
										class="btn btn-link btn-rounded btn-fw codepP" id="petN"
										data-code="104">탈퇴한 회원</button>
									</p>
									<table class="table table-hover">
										<thead>
											<tr>
												<th>이름</th>
												<th>아이디</th>
												<th>가입일</th>
												<th>펫 보유</th>
											</tr>
										</thead>
										<tbody id="myTableP">

										</tbody>
									</table>
									<div id="paginationP"></div>
								</div>
								<div id="notice_footer">
									<p>회원에게 메시지 보내기..</p>
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
	
	// 아코디언 함수
	$(document).on("click", ".que", function() {
		$(this).next(".anw").stop().slideToggle(300);
		$(this).toggleClass('on').siblings().removeClass('on');
		$(this).next(".anw").siblings(".anw").slideUp(300); // 1개씩 펼치기
	})//end 아코디언 함수
	
	//======================enter 키===================
	function eventkey() {
		if (event.keyCode == 13) {
			pagingList();
		} else {
			return false;
		}
	}//====================end enter 키================
	
		
		$(function() {
				// title='상세정보를 보시려면 이름을 클릭하세요..'
				
				//Tooltip
				var title_;
				$("tr").hover(function(e){
					$('tr').attr( 'title', '상세정보를 보시려면 이름을 클릭하세요..' );
					title_ = $(this).attr("title");
					$("bod").append("<div id='ti'></div>");
					$("#ti").css("width","100px");
					$("#ti").text(title_);
				}, function() {													// <a> hover 시 : mouseLeave
	
					$(this).attr("title", title_);				// title 속성 반환
					$("#ti").remove();							// div#tip 삭제
	
				});//end Tooltip
			});
		
		 //===============================================테이블==========================================================
		//===================리스트 호출 버튼==================
		$(".codep").on('click', function() {
			var code = $(this).data('code');
			console.log(code);
			$('#admDateForm')[0].code.value = code
			$('#admDateForm')[0].pageNum.value = 1;
			pagingList();
			
		});//===================end 리스트 호출 버튼================== 
		
		
		//===========리스트 ajax 호출==========
		function pagingList() {
			var str = $('#admDateForm').serialize();
			console.log(str);
			
			$.ajax({
				url : 'admMlistCode',
				method : 'post',
				data :str,
				//contentType : 'application/json',
				success : function(result) {

					if(result.list == ''){
						alert('데이터가 없습니다!!');
						$("#myTable").empty();
						$("#pagination").empty();
						$("#myTable").append("<tr><td colspan='4' align='center'>데이터가 없습니다.</td></tr>");
					}else {
						viewPmemberList(result.list);
						viewPage(result.page);
						
					};
				},error : function () {
					alert('아 노답..');
					
				}
			});
		}//===========end  리스트 ajax 호출==========
			
		//==================페이징 처리===================
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
			
		}// end viewPage
			
		function goPage(pa) {
			console.log("pa 는 :" + pa);
			$('#admDateForm')[0].pageNum.value = pa;
			pagingList();
		}
		
		//======================end 페이징 처리=================
			 
		// ===================== 리스트 만드는 함수 ====================
		let viewPmemberList = function(result) {
			$("#myTable").empty();		

			$.each(result,function(i) {
				console.log(result[i].pet_no)
				
				
				if(result[i].startDate != null){
					
				
						$("#myTable").append(
														"<tr><td><a onclick='show()'>"														
														+ result[i].name
														+ "</a></td><td>"
														+ result[i].m_id
														+ "</td><td>"
														+ result[i].startDate 
														+ "</td><td>"
														+ (result[i].pet_no == null ? '미보유' : '보유' )
														+ "</td></tr>" );
						
					} else if (result[i].startDate == null ) {
						console.log(result[i].endDate);
						$("#myTable").append("<tr><td align='center' colspan='4'>"+result[i].endDate+"일 탈퇴한 회원입니다</td></tr>");
					
								}
							}) // end each.
							
			
		}
		//=====================  end리스트 만드는 함수 ====================

			
		// =================회원 단건 조회 Modal===================
		
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
			}); //end Modal에 띄어줄 단건조회 ajax
			
			
			
			$("#myModal").modal('show'); //Modal Open
			
		}// =================end 회원 단건 조회 Modal=================
		
			
			
		//=============상세보기 페이지 새 창 열어서  :  권한 없어서 못가는 거 같은데
		function goDetail(e) {
			var p_id = $(e).data('value');
			console.log("p_id : " +p_id);
			var url = `pmemberDetail?id=\${p_id}`;
			console.log("url :"+url);
			window.open(url);
			
		}//=============end window.open()
			
			
		//모달 내용 초기화
		$('#myModal').on('hidden.bs.modal', function(e) {
			$(this).find('ul').empty();
			$(this).find('#goDetail').remove();
		})//END 모달 내용 초기화

		
		// ==================================날짜 검색 ==============================
        $("#datepicker").datepicker({
            dateFormat: 'yy-mm-dd',
            prevText: '이전 달',
            nextText: '다음 달',
            monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
            monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
            dayNames: ['일', '월', '화', '수', '목', '금', '토'],
            dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
            dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
            showMonthAfterYear: true,
            yearSuffix: '년',
            showOtherMonths: true,
            changeYear: true,
            changeMonth: true,
            showOn: "both",
            buttonImage: "",
            buttonImageOnly: true,
            buttonText: "선택"

        });
        $('#datepicker').datepicker('setDate', 'today');

        $(function () {
            $.datepicker.setDefaults({
                dateFormat: 'yy-mm-dd',
                prevText: '이전 달',
                nextText: '다음 달',
                monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
                monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월',
                    '12월'
                ],
                dayNames: ['일', '월', '화', '수', '목', '금', '토'],
                dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
                dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
                showMonthAfterYear: true,
                yearSuffix: '년',
                showOtherMonths: true,
                changeYear: true,
                changeMonth: true,
                showOn: "both",
                buttonImage: "",
                buttonImageOnly: false,
                buttonText: "선택"
            });
            $("#fromDate").datepicker();
            $("#toDate").datepicker();

            /* $('#fromDate').datepicker('setDate', 'today');
            $('#toDate').datepicker('setDate', '+1D'); // -1D:하루전  -1M : 한달전 */
            
            
	    	pagingList();
        });
     // ==================================날짜 검색 ============================== 끝!!
     
     //===============================================테이블========================================================== 끝!
     
     
     
     
     ////=======================파트너 회원 js 영역 시작=====================
    	 
    	 //======================enter 키===================
	function eventkeyP() {
		if (event.keyCode == 13) {
			pagingListP();
		} else {
			return false;
		}
	}//====================end enter 키================
     // ===================== 리스트 만드는 함수 ====================
		let viewPmemberListP = function(result) {
			$("#myTableP").empty();
			console.log("result는: " + result);
			$.each(result,function(i) {
				if(result[i].startdate != null){
						$("#myTableP").append(
														"<tr><td><a onclick='showP()'>"														
														+ result[i].name
														+ "</a></td><td>"
														+ result[i].p_id
														+ "</td><td>"
														+ "<div class='progress'>"
														+ "<div class='progress-bar bg-success' role='progressbar' style='width:"
														+ result[i].c_report
														+ "%' aria-valuenow='70' aria-valuemin='0' aria-valuemax='100'>"
														+ "</div></div>"
														+ "</td><td>"
														+ result[i].startdate
														+ "</td><td>"
														+ result[i].f_content
														+ "</td></tr>" );
			} else if (result[i].startdate == null ) {
				console.log(result[i].enddate);
				$("#myTable").append("<tr><td align='center' colspan='4'>"+result[i].enddate+"일 탈퇴한 회원입니다</td></tr>");
			
						}
							}) // end each.
							
			

		}//=====================  end리스트 만드는 함수 ====================
     
		
		// =================회원 단건 조회 Modal===================
		
			function showP() {
				/* var p_id = $(event.target).parent().next().text();
			console.log(p_id); */
			var p_id = 'kim1@a.com';
			//Modal에 띄어줄 단건조회 ajax : 파트너 회원 : 모든 정보 : 사진 까지 
			 $.ajax({
				url : 'admPmemberOne',
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
					$(".modal-footer").append("<button type='button' data-value="+res.list.p_id+" onclick='goDetail(this)' >상세페이지로..</button>");
					//$(".modal-footer").append("<a href='pmemberDetail?id="+res.list.p_id+"'>회원의 상세페이지로 이동</a>");
					
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
			
			
			
			$("#myModal").modal('show'); //Modal Open
			
		}// =================end 회원 단건 조회 Modal=================
			
		//=============상세보기 페이지 새 창 열어서  :  권한 없어서 못가는 거 같은데
		function goDetailP(e) {
			var p_id = $(e).data('value');
			console.log("p_id : " +p_id);
			var url = `pmemberDetail?id=\${p_id}`;
			console.log("url :"+url);
			window.open(url);
			
		}//=============end window.open()
			
			
		//모달 내용 초기화
		$('#myModal').on('hidden.bs.modal', function(e) {
			$(this).find('ul').empty();
			$(this).find('a').remove();
		})//END 모달 내용 초기화
		
			
		//===================리스트 호출 버튼==================
		$(".codepP").on('click', function() {
			var code = $(this).data('code');
			$('#admDateFormP')[0].code.value = code
			$('#admDateFormP')[0].pageNum.value = 1;
			pagingListP();
			
		});//===================end 리스트 호출 버튼================== 
		
		
		//===========리스트 ajax 호출==========
		function pagingListP() {
			var str = $('#admDateFormP').serialize();
			$.ajax({
				url : 'admPlistCode',
				method : 'post',
				data :str,
				//contentType : 'application/json',
				success : function(result) {
					console.log("리절트리스트는 :"+result.list);
					console.log("리절트페이지는 : " + result.page);
					viewPmemberListP(result.list);
					viewPageP(result.page);
				}
			});
		}//===========end  리스트 ajax 호출==========
			
		//==================페이징 처리===================
		function viewPageP(page) {
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
			$('#paginationP').html(nav);
			
		}// end viewPage
			
		function goPageP(pa) {
			console.log("pa 는 :" + pa);
			$('#admDateFormP')[0].pageNum.value = pa;
			pagingListP();
		}
		
		//======================end 페이징 처리=================
			
			// =============날짜 검색 ==============
        $("#datepicker").datepicker({
            dateFormat: 'yy-mm-dd',
            prevText: '이전 달',
            nextText: '다음 달',
            monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
            monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
            dayNames: ['일', '월', '화', '수', '목', '금', '토'],
            dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
            dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
            showMonthAfterYear: true,
            yearSuffix: '년',
            showOtherMonths: true,
            changeYear: true,
            changeMonth: true,
            showOn: "both",
            buttonImage: "",
            buttonImageOnly: true,
            buttonText: "선택"

        });
        $('#datepicker').datepicker('setDate', 'today');

        $(function () {
            $.datepicker.setDefaults({
                dateFormat: 'yy-mm-dd',
                prevText: '이전 달',
                nextText: '다음 달',
                monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
                monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월',
                    '12월'
                ],
                dayNames: ['일', '월', '화', '수', '목', '금', '토'],
                dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
                dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
                showMonthAfterYear: true,
                yearSuffix: '년',
                showOtherMonths: true,
                changeYear: true,
                changeMonth: true,
                showOn: "both",
                buttonImage: "",
                buttonImageOnly: false,
                buttonText: "선택"
            });
            $("#fromDateP").datepicker();
            $("#toDateP").datepicker();

            /* $('#fromDate').datepicker('setDate', 'today');
            $('#toDate').datepicker('setDate', '+1D'); // -1D:하루전  -1M : 한달전 */
            
            
	    	pagingListP();
        });// =============end 날짜 검색 ==============
     
	</script>

</body>

</html>