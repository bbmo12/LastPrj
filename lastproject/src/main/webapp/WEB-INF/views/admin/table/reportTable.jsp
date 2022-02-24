<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
		<div class="container-fluid">
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
											
											<th>신고한 사람</th><!-- 코드 f_content -->
											<th>신고당한 사람</th>
											<th>신고한 내용</th>
											<th>신고한 날짜</th>
											<th>신고 유형</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${reportList[0].rep_no eq null}">
											<tr>
												<td colspan="6" align="center">데이터가 존재하지 않습니다.</td>
											</tr>
										</c:if>
										<c:if test="${reportList ne null }">
											<c:forEach items="${reportList }" var="reports">
												<tr>
													<td style="display:none" value="${reports.rep_no }" />
													<td align="center">${reports.reporter }</td>
													<td align="center">${reports.reported }</td>
													<td align="center">${reports.content }</td>
													<td align="center">${reports.w_date }</td>
													<td align="center">${reports.f_content }</td>
												</tr>
											</c:forEach>
										</c:if>
									</tbody>
								</table>
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
	</script>

</body>

</html>