<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://cdn.jsdelivr.net/gh/ethereum/web3.js@1.0.0-beta.37/dist/web3.min.js"></script>
	<script src="template/js/diaLog.js"></script>
</head>
<style>
	#my_section {
		padding: 50px;
	}

	.card-text {
		width: 300px;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
	}
	.padding {
		padding: 5rem
	}

	.pl-3,
	.px-3 {
		padding-left: 1rem !important;
	}

	#sidebar {
		width: 500px;
		float: none;
		margin-left: 12em;
		background-color: #fff;
		border: none;

	}
	.codep {
		color: #0062ff; 
    	background: #FFF;
    	border: 1px solid transparent;
    	font-size: 16px;	
	}
	.codep:hover {
		color: #0062ff;
    	border: 1px solid #0062ff;
    	background: #fff;	
	}

	#my_section {
		padding: 50px;
	}

	.card-text {
		width: 200px;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
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
	}
	
	
	.no_deco {
		text-decoration: none !important;
		font-size : 0.8rem !important;
		color: black;
	}
	
	#my_section {
		padding: 50px;
		background: #f9f9fd;
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
		
	}
	
	.card-footer{
		background: white;
		font-size: 1.0rem;
		font-family: 'NanumBarunGothic';
		font-style: normal;
		font-weight: 400;
	}
	
	.widget_title{
		background: #0062ff !important;
	}
	
	#cardTitle{
		font-size: 1.25rem;
		font-family: 'NanumBarunGothic';
		font-style: normal;
	 	font-weight: 700;
	}
	
	#myinfo{
		font-size: 0.8rem;
		font-family: 'NanumBarunGothic';
		font-style: normal;
	 	font-weight: 300;
	}
	
	#pet_img2{
		display: inline-block;
		text-align: center;
		margin-right: 20px;
		font-size: 0.8rem;
		font-family: 'NanumBarunGothic';
		font-style: normal;
	 	font-weight: 400;
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
#my_section {
		padding: 50px;
	}

	#main-form h3,
	input {
		display: inline-block;
	}

	#addDiv,
	#addService {
		margin-left: 36em;
		margin-top: -5px;
		color: #fff; 
    	background: #0062ff;
    	border: 1px solid transparent;	
	}
	#addDiv:hover,
	#addService:hover{
		color: #0062ff;
		border: 1px solid #0062ff;
		background: #fff;
	}
	#price-insert,
	#time-insert{
		color: #fff; 
    	background: #0062ff;
    	border: 1px solid transparent;	
	}
	
	#price-insert:hover,
	#time-insert:hover{
		color: #0062ff;
		border: 1px solid #0062ff;
		background: #fff;
	}

	#select-one {
		margin-top: -20px;
	}

	.form-control {
		padding: 5px;
		width: 250px;
		display: inline-block;
		border-radius: 20px;
	}

	.service-info {
		display: inline-grid;
	}

	.service-info input {
		width: 100px;
	}

	#p-info {
		margin-left: 9em;
		margin-top: -20px;
	}

	.delete-button {
		float: right;
		margin-top: 25px;
		margin-right: 100px;
		width: 62px;
	}

	#p_info {
		border: 1px solid rgba(151, 151, 151, 0.3);
	}
	#cancel{
		width: 113px;
    	height: 42px;
    	padding: 0 30px;
    	font-size: .8em;
    	text-align: center;
    	font-weight: 500;
	}
	#member_post{
		width: 100px;
    	margin-left: 51em;
    	margin-top: -70px;  	
    	color: #fff; 
    	background: #0062ff;
    	border: 1px solid transparent;	
	}
	#member_post:hover {
		color: #0062ff;
		border: 1px solid #0062ff;
		background: #fff;
	}
	#successUpdate{
		color: #fff; 
    	background: #0062ff;
    	border: 1px solid transparent;	
	}
	#successUpdate:hover {
		color: #0062ff;
		border: 1px solid #0062ff;
		background: #fff;
	}
	
	input:focus,
	textarea:focus{ 
		border: 3px solid;
	}
	
	#content{
		height: 45px;
    	padding: 12px;
   		width: 275px;
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
							<i class="fa-solid fa-flag"></i>&nbsp;&nbsp;&nbsp;반려동물 진료내역
						</div>
					</div>
						<div class="card-body">
						<div class="row">
							<div class="col-md-12" style="margin: 20px 0 0 -45px;">
								<div class="table-wrap">
									<button type="button" class="codep" style="margin: 0 30px 0 15em;" data-code="">전체</button>
									<button type="button" class="codep" style="margin-right: 30px;" data-code="100">진료</button>
									<button type="button" class="codep" style="margin-right: 30px;" data-code="101">훈련</button>
									<button type="button" class="codep" style="margin-right: 30px;" data-code="102">미용</button>
									<button type="button" class="codep" style="margin-right: 30px;" data-code="103">돌봄서비스</button>
									<button type="button" class="codep" style="margin-right: 30px;" id="block_chain">블록체인진료기록</button>
									<div id='blockChain'></div>
									</div>
									</div>
									<div class="table-wrap" style="width: 900px;">
									<table class="table table-striped">
										<thead>
											<tr style="text-align: center;">
												<th>반려동물 이름</th>
												<th>파트너회원이름</th>
												<th>진단명</th>
												<th>날짜</th>
											</tr>
										</thead>
										<tbody id="myTable" style="text-align: center">
										</tbody>
									</table>
									<div class="blog_right_sidebar" id="sidebar">
										<form id="admDateForm" onsubmit="return false" onkeypress="eventkey();"
											onclick="pagingList();">
											<input type="hidden" name="code">
											<input type="hidden" name="pageNum" value="1">
											<aside class="single_sidebar_widget search_widget" style="display: flex;">
												<select id="key" name="key">
													<option value="all" selected="selected">전 체</option>
												</select>
												<div class="input-group">
													<input type="text" class="form-control" id="data" name="data">
													<span class="input-group-btn">
														<button class="btn btn-default" type="submit">
															<i class="fa fa-search"></i>
														</button>
													</span>
												</div>
											</aside>
										</form>
									</div>
									<div id="pagination"></div>
									<div>
										<form id="frm" action="" method="post"></form>
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
	<script type="text/javascript">
		//======================enter 키===================
		function eventkey() {
			if (event.keyCode == 13) {
				pagingList();
			} else {
				return false;
			}
		} //====================end enter 키================

		// ===================viewPmemberList : 받아온 데이터로 List만드는 함수==========================
		let viewPmemberList = function (result) {
			$(".table").empty();

			$("#myTable").empty();
			$(".table").append(`<thead>
							<tr>
								<th>반려동물 이름</th>
								<th>파트너회원이름</th>
								<th>진단명</th>
								<th>날짜</th>
							</tr>
						</thead>
						<tbody id="myTable">
						</tbody>`)
			$.each(result, function (i) {
				console.log(result[i])
				$("#myTable").append("<tr><td>" +
					result[i].p_name +
					"</td><td>" +
					result[i].pm_name +
					"</td><td class='card-text'>" +
					result[i].content +
					"</td><td>" +
					result[i].startdate +
					"</td></tr>"
				);
			}) // end each.

		} //=========================end viewPmemberList : 받아온 데이터로 List만드는 함수===============


		// ===========================조건 별 검색 + 페이징 처리==============================
		$(".codep").on('click', function () {
			var code = $(this).data('code');
			$('#admDateForm')[0].code.value = code
			$('#admDateForm')[0].pageNum.value = 1;
			pagingList();

		});

		function pagingList() {

			$("#blockChain").empty();
			var str = $('#admDateForm').serialize();
			console.log(str);
			$.ajax({
				url: 'PetServiceList',
				method: 'post',
				data: str,
				//contentType : 'application/json',
				success: function (result) {
					console.log("리절트리스트는 :" + result.list);
					console.log(result.list);
					console.log("리절트페이지는 : " + result.page);
					if (result.list == '') {
						$(".table").empty();
						$(".table").append(`<thead>
								<tr>
									<th>반려동물 이름</th>
									<th>파트너회원이름</th>
									<th>진단명</th>
									<th>날짜</th>
								</tr>
							</thead>
							<tbody id="myTable">
							</tbody>`)
						$("#myTable").empty();
						$("#myTable").append("<tr><td colspan='4' align='center'>데이터가 없습니다.</td></tr>");
						// $(".table").empty();

					} else {
						viewPmemberList(result.list);
						viewPage(result.page);
					}

				},
				beforeSend: function () {
					var width = 0;
					var height = 0;
					var left = 0;
					var top = 0;

					width = 50;
					height = 50;


					top = ($(window).height() - height) / 2 + $(window).scrollTop();
					left = ($(window).width() - width) / 2 + $(window).scrollLeft();

					if ($("#div_ajax_load_image").length != 0) {
						$("#div_ajax_load_image").css({
							"top": top + "px",
							"left": left + "px"
						});
						$("#div_ajax_load_image").show();
					} else {
						$('body').append(
							'<div id="div_ajax_load_image" style="position:absolute; top:' + top +
							'px; left:' + left + 'px; width:' + width + 'px; height:' + height +
							'px; z-index:9999; background:#f0f0f0; filter:alpha(opacity=50); opacity:alpha*0.5; margin:auto; padding:0; "><img src="resources/assets/images/Loading.gif" style="width:250px; height:250px;"></div>'
							);
					}
				},
				complete: function () {
					$("#div_ajax_load_image").hide();
				}
			});
		} // end paginList()

		function viewPage(page) {
			console.log("page는 :" + JSON.stringify(page));

			var nav = `<nav class="blog-pagination justify-content-center d-flex">
			<ul class="pagination">`
			if (page.prev) {
				nav += `<li class="page-item">
				<a href="javascript:goPage(\${page.startPage-1})" class="page-link"
					aria-label="Previous">
					<span aria-hidden="true">
						<span class="fa fa-angle-left"></span>
					</span></a>
				</li>`
			}
			for (var i = page.startPage; i <= page.endPage; i++) {
				nav += `<li class="page-item ${page.pageNum eq num ? 'active' : '' }"><a
								href="javascript:goPage(\${i})" class="page-link">\${i }</a>
								</li>`
			}

			if (page.next) {
				nav += `<li class="page-item"><a href="javascript:goPage(\${page.endPage+1})"
					class="page-link" aria-label="Next">
				<span aria-hidden="true">
					<span class="fa fa-angle-right"></span>
				</span></a>
		</li>`

			}

			nav += `</ul></nav>`
			$('#pagination').html(nav);

		} // end viewPage(page)

		function goPage(pa) {
			console.log("pa 는 :" + pa);
			$('#admDateForm')[0].pageNum.value = pa;
			pagingList();
		}
		pagingList();
		// ===========================end 조건 별 검색 + 페이징 처리==============================


		// ==============================블록체인 ===============================================
		$("#block_chain").on('click', function (event) {
			$(".table").empty();
			$("#blockChain").empty();
			$("#blockChain").append(`예약번호 입력 :  <select class="reservNo" onchange="reservNo(event)" size="1">
													<option value="" disabled selected>예약번호</option>
													 	<c:forEach items="${reservation }" var="res">
													 		<option value="${res.r_no}">${res.r_no}</option>
													 	</c:forEach>`);
			/* <input type ="text" id ="r_no">  <button type='button' onclick="myFunction()">조회</button>`); */
		});

		function myFunction() {
			var r_no = $("#r_no").val();
			console.log(r_no);
			diaLog.methods.diaLogSearch(r_no)
				.call()
				.then(function (result) {
					console.log(result);
				})
		}

		function reservNo(event) {
			var r_no = $(".reservNo option:selected").val();
			diaLog.methods.diaLogSearch(r_no)
				.call()
				.then(function (result) {
					console.log(result);

					if (result.d_name == '') {
						$(".table").empty();
						$(".table").append(`
		        	  				<thead>
										<tr>
											<th>진단</th>
											<th>처방</th>
											<th>증상</th>
											<th>진료작성일</th>
											<th>회원아이디</th>
										</tr>
									</thead>
									<tbody id="myTable">
										<tr>
											<td colspan ="5" align="center">해당 블록체인이 없습니다</td>
										</tr>
									</tbody>`);
					} else {
						$(".table").empty();
						$(".table").append(`
		        	  				<thead>
										<tr>
											<th>진단</th>
											<th>처방</th>
											<th>증상</th>
											<th>진료작성일</th>
											<th>회원아이디</th>
										</tr>
									</thead>
									<tbody id="myTable">
										<tr>
											<td>` + result.d_name + `</td>
											<td>` + result.result + `</td>
											<td>` + result.symptom + `</td>
											<td>` + result.w_date + `</td>
											<td>` + result.m_id + `</td>
										</tr>
									</tbody>`);
					}
				})
		}
	</script>
</body>

</html>