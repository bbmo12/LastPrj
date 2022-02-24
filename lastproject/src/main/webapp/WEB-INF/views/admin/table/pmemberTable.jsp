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
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>

<body>
	<div class="col-lg-12 grid-margin stretch-card container mt-3">
		<div class="card">
			<div class="card-body">
				<h4 class="card-title">파트너회원</h4>
				<p class="card-description">
					Add class
					<code>.table-striped</code>
				</p>
				<input class="form-control" id="myInput" type="text"
					placeholder="Search.."> <br>
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
						<!-- <tr>
							<td class="py-1"><a href="#"><img
									src="resources/assets123/images/faces-clipart/pic-1.png"
									alt="image" /></a></td>
							<td>Herman Beck</td>
							<td><meter value="30" min="0" max="100" low="20" high="65"
									optimum="15" style="width: 100%"></meter></td>
							<td>$ 77.99</td>
							<td>May 15, 2015</td>
							<td><button onclick="permit()">승인</button>
								<button onclick="cancel()">거절</button></td>
						</tr>
 -->
						<c:forEach items="${pList }" var="pmember">
							<tr>
								<%-- <td class="py-1"><a href="#"><img src="resources/upload/${pmember.picture }" alt="image" /></a></td> --%>
								<td>${pmember.name }</td>
								<td><a href="pmemberDetail?id=${pmember.p_id}">${pmember.p_id}</td>
								<td><meter value="${pmember.c_report}" min="0" max="100"
										low="20" high="65" optimum="15" style="width: 100%"></meter></td>
								<td>${pmember.startdate}</td>
								<td><a href="admPlistCode?content=${pmember.f_content}">${pmember.f_content}</a></td>
								<!-- modal로 보여주기 -->
							</tr>
						</c:forEach>

					</tbody>
				</table>
			</div>
		</div>
	</div>

	<script>
		$(document)
				.ready(
						function() {
							$("#myInput")
									.on(
											"keyup",
											function() {
												var value = $(this).val()
														.toLowerCase();
												$("#myTable tr")
														.filter(
																function() {
																	$(this)
																			.toggle(
																					$(
																							this)
																							.text()
																							.toLowerCase()
																							.indexOf(
																									value) > -1)
																});
											});
						});

		function permit() {

		}

		function cancel() {

		}
	</script>
</body>

</html>