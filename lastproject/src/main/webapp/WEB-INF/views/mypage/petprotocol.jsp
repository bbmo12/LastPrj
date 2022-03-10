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
								<li><a href="#" class="d-flex justify-content-between">
										<p>예약 내역</p>
								</a></li>
								<li><a href="#" class="d-flex justify-content-between">
										<p>결제 내역</p>
								</a></li>
								<li><a href="#" class="d-flex justify-content-between">
										<p>상담 내역</p>
								</a></li>
								<li><a href="#" class="d-flex justify-content-between">
										<p>신고 내역</p>
								</a></li>
								<li><a href="#" class="d-flex justify-content-between">
										<p>로그아웃</p>
								</a></li>
								<li><a href="#" class="d-flex justify-content-between">
										<p>회원탈퇴</p>
								</a></li>
							</ul>

						</aside>
					</div>
				</div>
				<div class="col-lg-9 posts-list">
					<div class="col-lg-12 col-md-12 blog_details">
						<div class="template-demo">
							<form id="admDateForm">
								<input type="hidden" name="code"> 
								<input type="hidden" name="pageNum" value="1">
							</form>
							<button type="button"
								class="btn btn-link btn-rounded btn-fw codep" 
								data-code="">전체</button>
							<button type="button"
								class="btn btn-link btn-rounded btn-fw codep" 
								data-code="100">진료</button>
							<button type="button"
								class="btn btn-link btn-rounded btn-fw codep" 
								data-code="101">훈련</button>
							<button type="button"
								class="btn btn-link btn-rounded btn-fw codep" 
								data-code="102">미용</button>
							<button type="button"
								class="btn btn-link btn-rounded btn-fw codep"
								data-code="103">돌봄서비스</button>

						</div>

						<table class="table table-striped">

							<thead>
								<tr>
									<th>반려동물 이름</th>
									<th>파트너회원이름</th>
									<th>진료명?????</th>
									<th>날짜</th>
								</tr>
							</thead>
							<tbody id="myTable">
							</tbody>
						</table>
						<div id="pagination"></div>
						<div>
						<form id="frm" action="" method="post">
						<input type="hidden" name="m_id" id="m_id" value="${ member.m_id}">
							<select id="search" name="search">
								<option value="all" selected="selected">전 체</option>					
							</select> <input type="text" id="data" name="data" size="20"
								onkeypress="eventkey()">&nbsp;
							<button type="button" onclick="searchData()">검 색</button>
						</form>
			</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<script type="text/javascript">
	
	
	//검색 데이터 호출
	function searchData() {
		var m_id = $("input[name=m_id]").val();
		$.ajax({
			url : "petProtoColSearch",
			type : "post",
			data : {
				"key" : $("#search option:selected").val(),
				"data" : $("#data").val(),
				"m_id" : m_id
			},
			dataType : "json",
			success : function(result) {
				if (result.length > 0) {
					htmlView(data);
				} else {
					alert("조건에 맞는 결과 없음")
				}
			}
		});
	}// end 검색 데이터 호출
	
	// htmlView 함수 
	function htmlView(data) {

		$('#myTable').empty();
		console.log(data);
		
		$.each(data, function(i) {
	
			$('#myTable').append("<tr><td>" + data[i].p_name + "</td></td>"
								+data[i].pm_name+"</td><td>"
								+data[i].content+"</td><td>"
								+data[i].startdate+"</td></tr>");
			
		})
	} // end htmlView 함수
	
	
	 let viewPmemberList = function (result) {
		$("#myTable").empty();
		console.log("result는: " + result);

		$.each(result,function(i) {
			console.log(result[i])
				$("#myTable").append("<tr><td>"
										+ result[i].p_name
										+ "</td><td>"
										+ result[i].pm_name
										+ "</td><td>"
										+ result[i].content
										+ "</td><td>"
										+ result[i].startdate
										+ "</td></tr>"
										);
		}) // end each.
	
	}
	
	
	$(".codep").on('click', function() {
		var code = $(this).data('code');
		$('#admDateForm')[0].code.value = code
		$('#admDateForm')[0].pageNum.value = 1;
		pagingList();
		
	});
	
		function pagingList() {
			var str = $('#admDateForm').serialize();
			$.ajax({
				url : 'PetServiceList',
				method : 'post',
				data :str,
				//contentType : 'application/json',
				success : function(result) {
					console.log("리절트리스트는 :"+result.list);
					console.log("리절트페이지는 : " + result.page);
					viewPmemberList(result.list);
					viewPage(result.page);
				}
			});
		}
	
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
			
		}//===========end 페이징 처리==========
	
			
		function goPage(pa) {
			console.log("pa 는 :" + pa);
			$('#admDateForm')[0].pageNum.value = pa;
			pagingList();
		}
		pagingList();
	

	</script>
</body>
</html>