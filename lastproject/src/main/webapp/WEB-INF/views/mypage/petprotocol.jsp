<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
.card-text {
	display: inline-block;
	width: 200px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}
</style>

<body>
	<section class="banner-area other-page">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<h1>MyPage</h1>
					<a href="index.html">Home</a> <span>|</span> <a
						href="blog-details.html">MyPage</a>
				</div>
			</div>
		</div>
	</section>

	<section id="my_section">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="blog_right_sidebar">
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
								<li><a href="protocol" class="d-flex justify-content-between">
										<p>반려동물 진료기록</p>
								</a></li>
								<li><a href="reservationSelect" class="d-flex justify-content-between">
										<p>예약 내역</p>
								</a></li>
								<li><a href="myPay" class="d-flex justify-content-between">
										<p>결제 내역</p>
								</a></li>
								<li><a href="mycounsel" class="d-flex justify-content-between">
										<p>상담 내역</p>
								</a></li>
								<li><a href="myreport" class="d-flex justify-content-between">
										<p>신고 내역</p>
								</a></li>
								<li><a href="myfallow" class="d-flex justify-content-between">
										<p>팔로우</p>
								</a></li>
								<li><a href="logout" class="d-flex justify-content-between">
										<p>로그아웃</p>
								</a></li>
								<li><a href="mdeleteForm" class="d-flex justify-content-between">
										<p>회원탈퇴</p>
								</a></li>
							</ul>

						</aside>
					</div>
				</div>
				<div class="col-lg-9 posts-list">
					<div class="col-lg-12 col-md-12 blog_details">
						<div class="template-demo">
							<form id="admDateForm" onsubmit="return false" onkeypress="eventkey();" onclick="pagingList();">
								<input type="hidden" name="code"> 
								<input type="hidden" name="pageNum" value="1"> 
								<select id="key" name="key">
									<option value="all" selected="selected">전 체</option>
								</select> 
								<input type="text" id="data" name="data" size="20">&nbsp;
								<button type="submit">검 색</button>
							</form>
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
								class="btn btn-link btn-rounded btn-fw codep" id="block_chain" >블록체인진료기록</button>

						</div>
						
						<div id='blockChain'></div>
						<table class="table table-striped">

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
						<div id="pagination"></div>
						<div>
							<form id="frm" action="" method="post"></form>
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
	}//====================end enter 키================
	
	// ===================viewPmemberList : 받아온 데이터로 List만드는 함수==========================
	 let viewPmemberList = function (result) {
		$("#myTable").empty();
		$.each(result,function(i) {
			console.log(result[i])
				$("#myTable").append("<tr><td>"
										+ result[i].p_name
										+ "</td><td>"
										+ result[i].pm_name
										+ "</td><td class='card-text'>"
										+ result[i].content
										+ "</td><td>"
										+ result[i].startdate
										+ "</td></tr>"
										);
		}) // end each.
	
	}//=========================end viewPmemberList : 받아온 데이터로 List만드는 함수===============
	
	
	// ===========================조건 별 검색 + 페이징 처리==============================
	$(".codep").on('click', function() {
		var code = $(this).data('code');
		$('#admDateForm')[0].code.value = code
		$('#admDateForm')[0].pageNum.value = 1;
		pagingList();
		
	});
	
		function pagingList() {
			var str = $('#admDateForm').serialize();
			console.log(str);
			$.ajax({
				url : 'PetServiceList',
				method : 'post',
				data :str,
				//contentType : 'application/json',
				success : function(result) {
					console.log("리절트리스트는 :"+result.list);
					console.log("리절트페이지는 : " + result.page);
					if(result.list == ''){
						$("#myTable").empty();
						$("#myTable").append("<tr><td colspan='4' align='center'>데이터가 없습니다.</td></tr>");
						
						/* $(".table").empty();
						$(".table").append(`<h4>데이터가 없습니다</h4>`); */
						
					}else {
						viewPmemberList(result.list);
						viewPage(result.page);
						
						
					}
					
				}
			});
		}// end paginList()
	
		function viewPage(page) {
			console.log("page는 :"+JSON.stringify(page));
			
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
					nav += `<li class="page-item ${page.pageNum eq num ? 'active' : '' }"><a
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
			
		}// end viewPage(page)
	
		function goPage(pa) {
			console.log("pa 는 :" + pa);
			$('#admDateForm')[0].pageNum.value = pa;
			pagingList();
		}
		pagingList();
		// ===========================end 조건 별 검색 + 페이징 처리==============================
		
			
		// ==============================블록체인 ===============================================
		$("#block_chain").on('click',function(event){
			$(".table").empty();
			$("#blockChain").append(`전자지갑 주소 : <input type ="text" id = "address"> <br><br>
									 예약번호 입력 : <input type ="text"> id ="r_no" <button type="button">조회</button>
									 `);
			
			
		});	
			
	</script>
</body>
</html>