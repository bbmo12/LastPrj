<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/gh/ethereum/web3.js@1.0.0-beta.37/dist/web3.min.js"></script>
<script src="template/js/diaLog.js"></script>
</head>
<style>
#my_section {
	padding: 50px;
}

.card-text {
	display: inline-block;
	width: 200px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.flex {
	-webkit-box-flex: 1;
	-ms-flex: 1 1 auto;
	flex: 1 1 auto
}

.padding {
	padding: 5rem
}

.pl-3, .px-3 {
	padding-left: 1rem !important;
}

.table th {
	font-size: 20px;
	font-weight: 500;
	text-align: center;
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
#sidebar{
    width: 500px;
    float: none;
    margin-left: 12em;
    background-color: #fff;
    border: none;

}
.codep{
    padding: 0px;
    width: 150px;
    height: 50px;
    font-size: 18px;
}
</style>

<body>
	<section class="banner-area other-page">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<h1>MyPage</h1>
					<a href="home">Home</a> <span>|</span> <a href="memberMypage">MyPage</a>
				</div>
			</div>
		</div>
	</section>
	<section id="my_section">
		<div class="container" style="max-width: 1350px;">
			<div class="row">
				<div class="col-lg-3">
					<div class="blog_right_sidebar"
						style="margin-left: 40px; width: 300px;">
						<aside class="single_sidebar_widget author_widget">
							<img class="author_img rounded-circle"
								src="resources/upload/${member.picture}" style="width: 210px"
								alt="">
							<div class="br"></div>
							<h4>${member.name }</h4>
							<div class="br"></div>
						</aside>
						<aside class="single_sidebar_widget post_category_widget">
							<h4 class="widget_title">My menu</h4>
							<ul class="list cat-list">
								<li><a href="memberMypage"
									class="d-flex justify-content-between">
										<p>내 프로필</p>
								</a></li>
								<li><a href="petmemberForm"
									class="d-flex justify-content-between">
										<p>반려동물 프로필</p>
								</a></li>
								<li><a href="protocol"
									class="d-flex justify-content-between">
										<p>반려동물 진료기록</p>
								</a></li>
								<li><a href="reservationSelect"
									class="d-flex justify-content-between">
										<p>예약 내역</p>
								</a></li>
								<li><a href="myPay" class="d-flex justify-content-between">
										<p>결제 내역</p>
								</a></li>
								<li><a href="mycounsel"
									class="d-flex justify-content-between">
										<p>상담 내역</p>
								</a></li>
								<li><a href="myreport"
									class="d-flex justify-content-between">
										<p>신고 내역</p>
								</a></li>
								<li><a href="myfallow"
									class="d-flex justify-content-between">
										<p>팔로우</p>
								</a></li>
								<li><a href="logout" class="d-flex justify-content-between">
										<p>로그아웃</p>
								</a></li>
								<li><a href="mdeleteForm"
									class="d-flex justify-content-between">
										<p>회원탈퇴</p>
								</a></li>
							</ul>
						</aside>
					</div>
				</div>
				<div class="col-lg-9 posts-list"
					style="position: relative; top: -20px;">
					<div class="col-lg-12 col-md-12 blog_details">
						<div align="center">
							<h1>My pet Info</h1>
						</div>
						<div class="row">
							<div class="col-md-12" style="margin: 20px 0 0 -6px;">
								<div class="table-wrap">
									<button type="button"
										class="btn btn-link btn-rounded btn-fw codep" data-code="">전체</button>
									<button type="button"
										class="btn btn-link btn-rounded btn-fw codep" data-code="100">진료</button>
									<button type="button"
										class="btn btn-link btn-rounded btn-fw codep" data-code="101">훈련</button>
									<button type="button"
										class="btn btn-link btn-rounded btn-fw codep" data-code="102">미용</button>
									<button type="button"
										class="btn btn-link btn-rounded btn-fw codep" data-code="103">돌봄서비스</button>
									<button type="button"
										class="btn btn-link btn-rounded btn-fw codep" id="block_chain">블록체인진료기록</button>
									<div id='blockChain'></div>
									<table class="table table-striped" style="margin-top: 25px;">
										<thead>
											<tr>
												<th>반려동물 이름</th>
												<th>파트너회원이름</th>
												<th>진단명</th>
												<th>날짜</th>
											</tr>
										</thead>
										<tbody id="myTable">
										</tbody>
									</table>
									<div class="blog_right_sidebar" id="sidebar">
										<form id="admDateForm" onsubmit="return false" onkeypress="eventkey();" onclick="pagingList();">
											<input type="hidden" name="code"> 
											<input type="hidden" name="pageNum" value="1"> 											
											<aside class="single_sidebar_widget search_widget" style="display: flex;">
											<select id="key" name="key">
													<option value="all" selected="selected">전 체</option>
											</select>
												<div class="input-group">												
													<input type="text" class="form-control" id="data"name="data"> 
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