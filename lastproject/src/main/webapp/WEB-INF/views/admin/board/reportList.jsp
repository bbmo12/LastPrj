<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<!-- <script	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script> --> 
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<style>
.container-fluid {
	width: 100%;
	padding-right: 0px;
	padding-left: 0px;
	margin-right: auto;
	margin-left: auto;
}
</style>
</head>
<body>

	<div class="card">
		<div class="card-body">
			<h4 class="card-title">신고리스트</h4>
			<p class="card-description">
				관리
				<code>조건 별 검색</code>
			</p>
			<div class="template-demo">
				<button type="button" class="btn btn-link btn-rounded btn-fw" id="admQna">QnA 신고</button>
				<button type="button" class="btn btn-link btn-rounded btn-fw" id="admReview">Review 신고</button>
			</div>
			<div>
				<input class="form-control" id="myInput" type="text"
					placeholder="Search.."> <br>
			</div>
			<table class="table table-striped">
				<thead>
					<tr>
						<!-- <th>사진</th> -->
						<th>신고자</th>
						<th>신고 당한 사람</th>
						<th>신고일</th>
						<th>신고 내역</th>
						<th>신고 유형</th>
					</tr>
				</thead>
				<tbody id="myTable"></tbody>
			</table>
		</div>
	</div>
<script>
		$(function() {
			$("#myInput").on("keyup",function() {
				var value = $(this).val().toLowerCase();
				
			$("#myTable tr").filter(function() {
				$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
				});
			});
		});
		//리스트 만드는 함수 : viewPmemberList
		 let viewPmemberList = function(result) {
			 $("#myTable").empty();
				 console.log(result); 
				
				$.each(result, function(i) {
					   
					$("#myTable").append( "<tr><td>" + result[i].reporter + "</td><td>" + result[i].reported
								+ "</td><td>" + result[i].w_date + "</td><td>"
								+ result[i].content + "</td><td>" + result[i].f_content 
								+ "</td></tr>");	
				})
		}
		//Qna 리스트 출력
		$("#admQnaList").on('click', function() {
			$.ajax({
				url : 'admQnaList',
				method : 'post',				
				success : function(result) {
					viewPmemberList(result);
				}
			});	
		});
		//훈련사 리스트 출력
		$("#admReview").on('click', function() {
			$.ajax({
				url : 'admReviewList',
				method : 'post',
				success : function(result) {
					viewPmemberList(result);
				}
			});	
			
		});
		

	</script>
</body>
</html>