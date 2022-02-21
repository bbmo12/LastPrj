<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="col-lg-12 grid-margin stretch-card">
		<div class="card">
			<div class="card-body">
				<h4 class="card-title">파트너회원</h4>
				<p class="card-description">
					Add class
					<code>.table-striped</code>
				</p>
				<table class="table table-striped">
					<thead>
						<tr>
							<th>PartnerShip</th>
							<th>이름</th>
							<th>신고제재</th>
							<th>매출</th>
							<th>가입날짜</th>
							<th>승인여부</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="py-1"><a href="#"><img
									src="resources/assets123/images/faces-clipart/pic-1.png"
									alt="image" /></a></td>
							<td>Herman Beck</td>
							<td><meter value="75" min="0" max="100" low="20" high="65"
									optimum="15" style="width: 100%"></meter></td>
							<td>$ 77.99</td>
							<td>May 15, 2015</td>
							<td><button onclick="permit()">승인</button>
								<button onclick="cancel()">거절</button></td>
						</tr>
						<tr>
							<td class="py-1"><a href="#"> <img
									src="resources/assets123/images/faces-clipart/pic-2.png"
									alt="image" /></a></td>

							<td>Messsy Adam</td>
							<td>
								<div class="progress">
									<div class="progress-bar bg-danger" role="progressbar"
										style="width: 75%" aria-valuenow="75" aria-valuemin="0"
										aria-valuemax="100"></div>
								</div>
							</td>
							<td>$245.30</td>
							<td>July 1, 2015</td>
						</tr>
						<tr>
							<td class="py-1"><img
								src="resources/assets123/images/faces-clipart/pic-3.png"
								alt="image" /></td>
							<td>John Richards</td>
							<td>
								<div class="progress">
									<div class="progress-bar bg-warning" role="progressbar"
										style="width: 90%" aria-valuenow="90" aria-valuemin="0"
										aria-valuemax="100"></div>
								</div>
							</td>
							<td>$138.00</td>
							<td>Apr 12, 2015</td>
						</tr>
						<tr>
							<td class="py-1"><img
								src="resources/assets123/images/faces-clipart/pic-4.png"
								alt="image" /></td>
							<td>Peter Meggik</td>
							<td>
								<div class="progress">
									<div class="progress-bar bg-primary" role="progressbar"
										style="width: 50%" aria-valuenow="50" aria-valuemin="0"
										aria-valuemax="100"></div>
								</div>
							</td>
							<td>$ 77.99</td>
							<td>May 15, 2015</td>
						</tr>
						<tr>
							<td class="py-1"><img
								src="resources/assets123/images/faces-clipart/pic-1.png"
								alt="image" /></td>
							<td>Edward</td>
							<td>
								<div class="progress">
									<div class="progress-bar bg-danger" role="progressbar"
										style="width: 35%" aria-valuenow="35" aria-valuemin="0"
										aria-valuemax="100"></div>
								</div>
							</td>
							<td>$ 160.25</td>
							<td>May 03, 2015</td>
						</tr>
						<tr>
							<td class="py-1"><img
								src="resources/assets123/images/faces-clipart/pic-2.png"
								alt="image" /></td>
							<td>John Doe</td>
							<td>
								<div class="progress">
									<div class="progress-bar bg-info" role="progressbar"
										style="width: 65%" aria-valuenow="65" aria-valuemin="0"
										aria-valuemax="100"></div>
								</div>
							</td>
							<td>$ 123.21</td>
							<td>April 05, 2015</td>
						</tr>
						<tr>
							<td class="py-1"><img
								src="resources/assets123/images/faces-clipart/pic-3.png"
								alt="image" /></td>
							<td>Henry Tom</td>
							<td>
								<div class="progress">
									<div class="progress-bar bg-warning" role="progressbar"
										style="width: 20%" aria-valuenow="20" aria-valuemin="0"
										aria-valuemax="100"></div>
								</div>
							</td>
							<td>$ 150.00</td>
							<td>June 16, 2015</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<script>
		function permit() {

		}

		function cancel() {

		}
	</script>
</body>
</html>