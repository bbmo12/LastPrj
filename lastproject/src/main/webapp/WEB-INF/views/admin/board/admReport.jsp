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
				<button type="button" class="btn btn-link btn-rounded btn-fw"
					id="admQna">QnA 신고</button>
				<button type="button" class="btn btn-link btn-rounded btn-fw"
					id="admReview">Review 신고</button>
				<!-- 	<button type="button" class="btn btn-link btn-rounded btn-fw"
					id="admReportPart">유형별 신고</button> -->
				<select class="admReportPart" id="code" name="code"
					onchange="codeSelect()">
					<option value="" selected disabled>유형별</option>
					<option value="601">불법 광고 및 홍보</option>
					<option value="602">음란물/선정성 콘텐츠</option>
					<option value="603">욕설,비속어,모욕</option>
					<option value="604">사생활 침해</option>
					<option value="605">게시물 도배</option>
				</select>
				<!-- <button type="button" class="btn btn-link btn-rounded btn-fw"
					id="admRepor">처리 별 신고</button> -->
				<select id="repor" name=" repor" class="admReportRepor"
					onchange="reporSelect()">
					<option value="" selected disabled>처리 별 신고</option>
					<option value="701">미처리</option>
					<option value="702">기각 처리</option>
					<option value="703">승인 처리</option>
				</select>
				<button type="button" class="btn btn-link btn-rounded btn-fw"
					id="admReportTime">기간 별 신고</button>
			</div>

			<!-- 모달 -->
			<!-- <div class="modal fade" id="myModal" role="dialog">
				<div class="modal-dialog">
					Modal content
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title" id="title"></h4>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body">
						
							<p id="content"></p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div> -->

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

							<ul id="repo">
								<!-- 신고 내역 -->
							</ul>

							<!-- 신고 처리 Form 태그 -->
							<form id="form">
								<div class="form-group">
									<label for="amdReportOption">처리유형</label> <select class="repor"
										id="repor" name="repor">
										<option value="701" selected>미처리</option>
										<option value="702">기각</option>
										<option value="703">승인</option>
									</select>
								</div>
								<div class="form-group">
									<label for="message-text" class="col-form-label">처리사유</label>
									<textarea class="state" id="state" name="state"></textarea>
								</div>
							</form>
						</div>
						<div class="modal-footer">
							<button type="button" id="admReportUpdate" name="admReportUpdate"
								class="btn btn-primary">확 인</button>
						</div>
					</div>
				</div>
			</div>


			<!-- 검색.. DB 연동 시키는 걸로 -->
			<div>
				<input class="form-control" id="myInput" type="text"
					placeholder="Search.."> <br>
			</div>


			<!-- 리스트 출력 테이블 -->
			<table class="table table-striped">
				<thead>
					<tr>
						<!-- <th>사진</th> -->
						<th>신고자</th>
						<th>신고 당한 사람</th>
						<th>신고일</th>
						<th>신고 내역</th>
						<th>신고 유형</th>
						<th>처리 상태</th>
					</tr>
				</thead>
				<tbody id="myTable"></tbody>
			</table>
		</div>
	</div>



	<!-- 모달 총 3개  -->

	<!-- 1. 모달 미처리 신고 건 보기 : 신고처리 ajax -> 승인 or 기각으로 바꿔줘야 함  -->
	<!--Modal 신고 내용 상세보기 and 신고 처리 -->
	<!-- Modal -->


	<!-- 2. 모달 신고 기각 된 건 보기 : 신고자 / 신고당한 자 / 신고 게시글 내용 / 신고 사유 / 신고 유형 / 신고 일 / 그리고 관리자의 신고기각 이유  -->

	<!-- 3. 모달 신고승인 된 건 보기 : 신고자 / 신고당한 자 / 신고 게시글 내용 / 신고 사유 / 신고 유형 / 신고 일 -->




	<script>
		$(function() {
			$("#myInput").on(
					"keyup",
					function() {
						var value = $(this).val().toLowerCase();

						$("#myTable tr").filter(
								function() {
									$(this).toggle(
											$(this).text().toLowerCase()
													.indexOf(value) > -1)
								});
					});
		});
		
		//Qna 리스트 출력
		$("#admQna").on('click', function() {
			$.ajax({
				url : 'admQnaList',
				method : 'post',
				success : function(result) {
					viewPmemberList(result);
				}
			});
		});//end Qna 리스트 출력

		//Review 리스트 출력
		$("#admReview").on('click', function() {
			$.ajax({
				url : 'admReviewList',
				method : 'post',
				success : function(result) {
					viewPmemberList(result);
				}
			});

		});//end Review 리스트 출력
		
		

		//유형별 신고 리스트 : admReportPart
		function codeSelect() {
			var select = document.getElementById("code");
			var code = select.options[select.selectedIndex].value;
			console.log(code);
			$.ajax({
				url : 'admReportPart',
				method : 'post',
				data : {
					"code" : code
				},
				success : function(result) {
					console.log(result);

				}
			})

		};//end //유형별 신고 리스트

		//처리 별 신고 리스트 : admReportRepor
		function reporSelect() {
			var select = document.getElementById("repor");
			var repor = select.options[select.selectedIndex].value;
			console.log(repor);
			$.ajax({
				url : 'admReportRepor',
				method : 'post',
				data : {
					"repor" : repor
				},
				success : function(result) {
					console.log(result);
					if (result == '')
						alert('해당 데이터가 없습니다');
				}
			})
		};//end 처리 별 신고 리스트 : admRepor

		//리스트 만드는 함수 : viewPmemberList
		let viewPmemberList = function(result) {
			$("#myTable").empty();
			console.log(result);

			$.each(
							result,
							function(i) {
								if (result[i].repor === 701) {
									$("#myTable")
											.append(
													"<tr><td>"
															+ result[i].reporter
															+ "</td><td>"
															+ result[i].reported
															+ "</td><td>"
															+ result[i].w_date
															+ "</td><td>"
															+ result[i].content
															+ "</td><td id='content'>"
															+ result[i].f_content
															+ "</td><td>"
															+ "<button id='reportModal' type='button' class='btn btn-secondary' onclick='show("
															+ result[i].rep_no
															+ ")' value="
															+ result[i].rep_no
															+ " data-toggle='modal'  data-target='#exampleModal"
															+ result[i].rep_no
															+ "'>"
															+ "미처리</td></button></tr>");
								} else if (result[i].repor === 702) {

									$("#myTable")
											.append(
													"<tr><td>"
															+ result[i].reporter
															+ "</td><td>"
															+ result[i].reported
															+ "</td><td>"
															+ result[i].w_date
															+ "</td><td>"
															+ result[i].content
															+ "</td><td id='content'>"
															+ result[i].f_content
															+ "</td>"
															+ "<td><button id='cancelModal' type='button' onclick='showC("
															+ result[i].rep_no
															+ ")' class='btn btn-secondary' data-toggle='modal' data-target='#cancelModal'> "
															+ "기각처리</td></button></tr>");
								} else {

									$("#myTable")
											.append(
													"<tr><td>"
															+ result[i].reporter
															+ "</td><td>"
															+ result[i].reported
															+ "</td><td>"
															+ result[i].w_date
															+ "</td><td>"
															+ result[i].content
															+ "</td><td id='content'>"
															+ result[i].f_content
															+ "</td>"
															+ "<td><button id='permitModal' type='button' class='btn btn-secondary' onclick='showP("
															+ result[i].rep_no
															+ ")'  data-toggle='modal' data-target='#permitModal'>"
															+ "승인처리</td></button></tr>");
								}
								;
							});
		}//end 리스트 만드는 함수 : viewPmemberList

		//===================================================================================================================

		// Modal 미처리 신고 : QnA
		function show(str) {
			console.log(str);
			$
					.ajax({
						url : 'admReportOneQna',
						method : 'post',
						data : {
							"rep_no" : str
						},
						success : function(res) {
							console.log(res);
							if (res == '')
								alert('해당 데이터가 없습니다');

							console.log(res[0].rep_no);

							$("form")
									.append(
											"<input type='hidden' id='rep_no' value ="+res[0].rep_no+">");

							$("#repo").append(
									"<ul><li>신고유형 : " + res[0].f_content
											+ "</li><li>신고날짜 : "
											+ res[0].w_date + "</li><li>신고자 : "
											+ res[0].reporter
											+ "</li><li>신고당한 : "
											+ res[0].reported
											+ "</li><li>신고사유 : "
											+ res[0].content
											+ "</li><li>게시글 내용 : "
											+ res[0].q_content + "</li></ul>");
						},
						error : function(er) {
							alert('오류가 났음. 개발자 호츌');
						}
					})

			$("#myModal").modal('show');
		}//end Modal 신고 단건

		// Modal 미처리 신고 : Review
		function show(st) {
			console.log(st);
			$
					.ajax({
						url : 'admReportOneReview',
						method : 'post',
						data : {
							"rep_no" : st
						},
						success : function(res) {
							console.log(res);
							if (res == '')
								alert('해당 데이터가 없습니다');

							console.log(res[0].rep_no);

							$("form")
									.append(
											"<input type='hidden' id='rep_no' value ="+res[0].rep_no+">");

							$("#repo").append(
									"<ul><li>신고유형 : " + res[0].f_content
											+ "</li><li>신고날짜 : "
											+ res[0].w_date + "</li><li>신고자 : "
											+ res[0].reporter
											+ "</li><li>신고당한 : "
											+ res[0].reported
											+ "</li><li>신고사유 : "
											+ res[0].content
											+ "</li><li>게시글 내용 : "
											+ res[0].rev_content + "</li></ul>");
						},
						error : function(er) {
							alert('오류가 났음. 개발자 호츌');
						}
					})

			$("#myModal").modal('show');
		}//end Modal 신고 단건
		
		

		//모달 내용 초기화
		$('#myModal').on('hidden.bs.modal', function(e) {
			$(this).find('ul').empty();
			$(this).find('form')[0].reset();

		})

		//신고처리 : admReportUpdate
		$("#admReportUpdate").on("click", function(e) {
			var str = $('#form').serialize();
			console.log(str);
			var rep_no = $("#rep_no").val();
			console.log(rep_no);
			var state = $("#state").val();
			var repor = $("#repor").val();

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
						alert("신고 처리가 성공적으로 실패했습니다. 관리자 호출!");

					}
				}) //end Ajax
			}//end If
		})//end 신고 처리
	</script>
</body>
</html>