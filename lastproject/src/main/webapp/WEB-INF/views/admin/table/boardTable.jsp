<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
							<h5 class="card-title">회원 리스트</h5>
							<div class="table-responsive">
								<table id="zero_config"
									class="table table-striped table-bordered">
									<thead>
										<tr>
											<th>순번</th>
											<th>제목</th>
											<th>내용</th>
											<th>작성자</th>
											<th>날짜</th>
									
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${boardList }" var="boards">
											<tr>
												<td align="center">${boards.b_no }</td>
												<td align="center">${boards.title }</td>
												<td align="center">${boards.content }</td>
												<td align="center">${boards.writer }</td>
												<td align="center">${boards.w_date }</td>
											</tr>
										</c:forEach> 
										<!-- <tr>
											<td>asdf</td>
											<td>asdf</td>
											<td>123</td>
											<td>asdf</td>
											<td>asdf</td>
											<td>123</td>
										</tr>
										<tr>
											<td>asdf</td>
											<td>asdf</td>
											<td>123</td>
											<td>asdf</td>
											<td>asdf</td>
											<td>123</td>
										</tr>
										<tr>
											<td>asdf</td>
											<td>asdf</td>
											<td>123</td>
											<td>asdf</td>
											<td>asdf</td>
											<td>123</td>
										</tr>
										<tr>
											<td>asdf</td>
											<td>asdf</td>
											<td>123</td>
											<td>asdf</td>
											<td>asdf</td>
											<td>123</td>
										</tr>
										<tr>
											<td>asdf</td>
											<td>asdf</td>
											<td>123</td>
											<td>asdf</td>
											<td>asdf</td>
											<td>123</td>
										</tr>
										<tr>
											<td>asdf</td>
											<td>asdf</td>
											<td>123</td>
											<td>asdf</td>
											<td>asdf</td>
											<td>123</td>
										</tr>
										<tr>
											<td>asdf</td>
											<td>asdf</td>
											<td>123</td>
											<td>asdf</td>
											<td>asdf</td>
											<td>123</td>
										</tr>
										<tr>
											<td>asdf</td>
											<td>asdf</td>
											<td>123</td>
											<td>asdf</td>
											<td>asdf</td>
											<td>123</td>
										</tr> -->
										<tr>
											<td>asdf</td>
											<td>asdf</td>
											<td>123</td>
											<td>asdf</td>
											<td>asdf</td>
											<td>123</td>
										</tr>
									</tbody>
								</table>
							</div>

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
		/****************************************
		 *       Basic Table                   *
		 ****************************************/
		$('#zero_config').DataTable();
	</script>

</body>

</html>