<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
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
			<h4 class="card-title">파트너회원</h4>
			<p class="card-description">
				관리
				<code>조건 별 검색</code>
			</p>
			<div class="template-demo">
				<button type="button" class="btn btn-link btn-rounded btn-fw" id="doctor">수의사</button>
				<button type="button" class="btn btn-link btn-rounded btn-fw" id="trainer">훈련사</button>
				<button type="button" class="btn btn-link btn-rounded btn-fw" id="groomer">미용사</button>
				<button type="button" class="btn btn-link btn-rounded btn-fw" id="petSitter">펫시터</button>
				<button type="button" class="btn btn-link btn-rounded btn-fw" id="startDate">220201 ~ 220330</button>
			</div>
			<div>
				<input class="form-control" id="myInput" type="text"
					placeholder="Search.."> <br>
			</div>
			<table class="table table-striped">
				<thead>
					<tr>
						<!-- <th>사진</th> -->
						<th>이름</th>
						<th>아이디</th>
						<th>신고건수</th>
						<th>가입날짜</th>
						<th>파트너쉽</th>
					</tr>
				</thead>
				<tbody id="myTable">
					<c:forEach items="${pList }" var="pmember">
						<tr>
							<td>${pmember.name }</td>
							<td>${pmember.p_id}</td><!--<a href="pmemberDetail?id=${pmember.p_id}">  -->
							<%-- <td><meter value="${pmember.c_report}" min="0" max="100"
									low="20" high="65" optimum="15" style="width: 100%" ></meter></td> --%>
							 <td>
	                            <div class="progress">
	                              <div class="progress-bar bg-success" role="progressbar" style="width: ${pmember.c_report}%" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100"></div>
	                            </div>
                          	</td>
							<td>${pmember.startdate}</td>
							<td><a href="admPlistCode?content=${pmember.f_content}">${pmember.f_content}</a></td>
						</tr>
					</c:forEach> 
				</tbody>
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
					   
					$("#myTable").append( "<tr><td>" + result[i].name + "</td><td>" + result[i].p_id
								+ "</td><td>" + result[i].c_report + "</td><td>"
								+ result[i].startdate + "</td><td>" + result[i].f_content 
								+ "</td></tr>");	
				})
		}
		//수의사 리스트 출력
		$("#doctor").on('click', function() {
			var code = 100;
			$.ajax({
				url : 'admPlistCode',
				method : 'post',
				data : {
					'code' : code
				},
				//contentType : 'application/json',
				success : function(result) {
					viewPmemberList(result);
				}
			});	
		});
		//훈련사 리스트 출력
		$("#trainer").on('click', function() {
			var code = '101';
			$.ajax({
				url : 'admPlistCode',
				method : 'post',
				data : {
					'code' : code
				},
				success : function(result) {
					viewPmemberList(result);
				}
			});	
			
		});
		
		
		
		//미용사 리스트 출력
		$("#groomer").on('click', function() {
			var code = '103';
			$.ajax({
				url : 'admPlistCode',
				method : 'post',
				data : {
					'code' : code
				},
				success : function(result) {
					viewPmemberList(result);
				}
			});	
		});
		
		
		
		//펫시터 리스트 출력
		/* $("#petsitter").on('click', function() {
			var code = '102';
			$.ajax({
				url : 'admPlistCode',
				method : 'post',
				data : {
					'code' : code
				},
				success : function(result) {
					if(result == '') alert('데이터가 없습니다').history();
					else viewPmemberList(result);
				}
			});	
		});
		 */
		$("#startDate").on('click', function() {
			$.ajax({
				url : 'admStartDateList',
				method : 'post',
				success : function(result) {
					viewPmemberList(result);
				}
			});	
		});

	</script>
</body>

</html>