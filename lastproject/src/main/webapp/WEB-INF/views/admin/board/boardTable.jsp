<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="http://code.jquery.com/jquery-3.5.1.js"></script>
<!DOCTYPE html>
<html dir="ltr" lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>Table</title>
<link rel="stylesheet" type="text/css"
	href="resources/table/css/multicheck.css">
<link href="resources/table/css/dataTables.bootstrap4.css"
	rel="stylesheet">
<link href="resources/table/css/style.min.css" rel="stylesheet">
</head>
<body>
	<div class="preloader">
		<div class="lds-ripple">
			<div class="lds-pos"></div>
			<div class="lds-pos"></div>
		</div>
	</div>
	<div id="main-wrapper">
		<div class="container-fluidT">
			<div class="row">
				<div class="col-12">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">공지사항 관리</h5>
							<div class="table-responsive">
								<table id="zero_config"
									class="table table-striped table-bordered">
									<thead>
										<tr>
											<th>수정한날짜로 변경</th>
											<th>제목</th>
											<th>내용</th>
											<th>작성자</th>
											<th>날짜</th>
											<th>처리</th>

										</tr>
									</thead>
									<tbody>
										<c:if test="${boardList[0].b_no eq null}">
											<tr>
												<td colspan="6" align="center">데이터가 존재하지 않습니다.</td>
											</tr>
										</c:if>
										<c:if test="${boardList ne null }">
											<c:forEach items="${boardList }" var="boards">
												<tr>
													<td align="center">${boards.b_no }</td><!-- 수정한날짜로 변경 -->
													<td align="center"><a
														href="boardUpdateForm?b_no=${boards.b_no }">${boards.title }</a></td>
													<td align="center">${boards.content }</td>
													<td align="center">${boards.writer }</td>
													<td align="center">${boards.w_date }</td>
													<td><button name="modify">수정</button>
														<button name="btnDelete" id="btnDelete" ><a href="boardDelete?b_no=${boards.b_no }">삭제</a></button></td>
												</tr>
											</c:forEach>
										</c:if>
									</tbody>
								</table>
								<a href="boardInsertForm" style="color: white;"><role
										="button" class="btn btn-outline-info">
									<h2>글쓰기</h2></a>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>



	<script src="resources/table/js/jquery.min.js"></script>
	<!-- Bootstrap tether Core JavaScript -->
	<script src="resources/table/js/popper.min.js"></script>
	<script src="resources/table/js/bootstrap.min.js"></script>
	<!-- slimscrollbar scrollbar JavaScript -->
	<script src="resources/table/js/perfect-scrollbar.jquery.min.js"></script>
	<script src="resources/table/js/sparkline.js"></script>
	<!--Wave Effects -->
	<script src="resources/table/js/waves.js"></script>
	<!--Menu sidebar -->
	<script src="resources/table/js/sidebarmenu.js"></script>
	<!--Custom JavaScript -->
	<script src="resources/table/js/custom.min.js"></script>
	<!-- this page js -->
	<script src="resources/table/js/datatable-checkbox-init.js"></script>
	<script src="resources/table/js/jquery.multicheck.js"></script>
	<script src="resources/table/js/datatables.min.js"></script>
	<script>
		$('#zero_config').DataTable();

		/* function delFNC(b_no) {
			var an = confirm("삭제하시겠습니까?")
			if (an) {
				var date = {
					"b_no" : b_no
				}
				$.ajax({
					url : "${contextpath}/ bno"

				})
			}

		} */

	/* 	$(document).on('click', '#btnDelete', function(){
			b_no = $(this).parent().parent().child[];
			console.log(b_no)
		    var url = "${pageContext.request.contextPath}/deleteBoard";
		    url = url + "?b_no=" + b_no;
				location.href = url;

			});		 */
		
		/* $("button[name='btnDelete']").click(function() {
			var an = confirm("삭제하시겠습니까?")
			if (an) {
				b_no = this.value;
				
				$.ajax({
					url : '/deleteBoard' + b_no,
					type : 'DELETE',
				});
				location.reload();
			}
		})  */
	</script>

</body>

</html>