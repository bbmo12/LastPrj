<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<!-- <script
	src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script> -->
<style>
.tab-content {
	border: 0px solid rgba(151, 151, 151, 0.3);
}

#myChart {
	style: height: 261px;
	display: block;
	box-sizing: border-box;
	width: 313px;
}
#doughnutChart{

	height : 250px;
}

</style>
<body>
	<div class="content-wrapper">
		<div class="row" id="proBanner">
			<div class="col-12">
				<span class="d-flex align-items-center purchase-popup"> 관리자님
					반갑습니다 <a href="home" target="_blank"
					class="btn ml-auto download-button">메인 홈으로..</a> <a href="main"
					target="_blank" class="btn purchase-button">관리자 홈으로..</a> <i
					class="mdi mdi-close" id="bannerClose"></i>
				</span>
			</div>
		</div>
		<div class="d-xl-flex justify-content-between align-items-start">
			<h2 class="text-dark font-weight-bold mb-2">관리자</h2>
			<div
				class="d-sm-flex justify-content-xl-between align-items-center mb-2">
				<div class="btn-group bg-white p-3" role="group"
					aria-label="Basic example">
					<button type="button"
						class="btn btn-link text-light py-0 border-right">7 Days</button>
					<button type="button"
						class="btn btn-link text-dark py-0 border-right">1 Month</button>
					<button type="button" class="btn btn-link text-light py-0">3
						Month</button>
				</div>
				<div class="dropdown ml-0 ml-md-4 mt-2 mt-lg-0">
					<button
						class="btn bg-white dropdown-toggle p-3 d-flex align-items-center"
						type="button" id="dropdownMenuButton1" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">
						<i class="mdi mdi-calendar mr-1"></i>24 Mar 2019 - 24 Mar 2019
					</button>
					<div class="dropdown-menu dropdown-menu-right"
						aria-labelledby="dropdownMenuButton1">
						<h6 class="dropdown-header">Settings</h6>
						<a class="dropdown-item" href="#">Action</a> <a
							class="dropdown-item" href="#">Another action</a> <a
							class="dropdown-item" href="#">Something else here</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Separated link</a>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<ul class="nav nav-tabs tab-transparent">
					<li class="nav-item"><a class="nav-link active"
						data-toggle="tab" href="#qwe">파트너</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#asd">일반</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#zxc" id="chart">차트</a></li>
				</ul>

				<div class="tab-content">
					<div class="tab-pane fade show active" id="qwe">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title"></h4>
								<p class="card-description">
									Add class
									<code>.table-striped</code>
								</p>
								<table class="table table-hover">
									<thead>
										<tr>
											<th>User</th>
											<th>First name</th>
											<th>Progress</th>
											<th>Amount</th>
											<th>Deadline</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td class="py-1"><img
												src="resources/assets123/images/faces-clipart/pic-1.png"
												alt="image" /></td>
											<td>Herman Beck</td>
											<td>
												<div class="progress">
													<div class="progress-bar bg-success" role="progressbar"
														style="width: 25%" aria-valuenow="10" aria-valuemin="0"
														aria-valuemax="100"></div>
												</div>
											</td>
											<td>$ 77.99</td>
											<td>May 15, 2015</td>
										</tr>
										<tr>
											<td class="py-1"><img
												src="resources/assets123/images/faces-clipart/pic-2.png"
												alt="image" /></td>
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
					<div class="tab-pane fade" id="asd">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">Hoverable Table</h4>
								<p class="card-description">
									Add class
									<code>.table-hover</code>
								</p>
								<table class="table table-hover">
									<thead>
										<tr>
											<th>User</th>
											<th>Product</th>
											<th>Sale</th>
											<th>Status</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>Jacob</td>
											<td>Photoshop</td>
											<td class="text-danger">28.76% <i
												class="mdi mdi-arrow-down"></i></td>
											<td><label class="badge badge-danger">Pending</label></td>
										</tr>
										<tr>
											<td>Messsy</td>
											<td>Flash</td>
											<td class="text-danger">21.06% <i
												class="mdi mdi-arrow-down"></i></td>
											<td><label class="badge badge-warning">In
													progress</label></td>
										</tr>
										<tr>
											<td>John</td>
											<td>Premier</td>
											<td class="text-danger">35.00% <i
												class="mdi mdi-arrow-down"></i></td>
											<td><label class="badge badge-info">Fixed</label></td>
										</tr>
										<tr>
											<td>Peter</td>
											<td>After effects</td>
											<td class="text-success">82.00% <i
												class="mdi mdi-arrow-up"></i></td>
											<td><label class="badge badge-success">Completed</label></td>
										</tr>
										<tr>
											<td>Dave</td>
											<td>53275535</td>
											<td class="text-success">98.05% <i
												class="mdi mdi-arrow-up"></i></td>
											<td><label class="badge badge-warning">In
													progress</label></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="tab-pane fade" id="zxc">
						<div class="row">
							<div class="col-lg-6 grid-margin stretch-card">
								<div class="card">
									<div class="card-body">
										<h4 class="card-title">던킨 chart</h4>
										<canvas id="dunkinChart" style="height: 250px"></canvas>
									</div>
								</div>
							</div>
							<div class="col-lg-6 grid-margin stretch-card">
								<div class="card">
									<div class="card-body">
										<h4 class="card-title">추로스 chart</h4>
										<canvas id="myChart" style="height: 250px"></canvas>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
		/* 	$("#chart").on("click", function() {
				
				$.ajax({
					url : "admChart",
					type : 
				}) 
				
			})*/

		const ctx = document.getElementById('myChart').getContext('2d');
		const myChart = new Chart(ctx, {
			type : 'bar',
			data : {
				labels : [ '파트너회원 수', '일반회원 수', '펫 마릿수' ],
				datasets : [ {
					label : '# of Votes',
					data : [ '${pmemCount}', '${memCount}', '${petCount}' ],
					backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
							'rgba(255, 159, 64, 0.2)',
							'rgba(255, 159, 64, 0.2)' ],
					borderColor : [ 'rgba(255, 99, 132, 1)',
							'rgba(255, 159, 64, 1)', 'rgba(255, 159, 64, 1)' ],
					borderWidth : 1
				} ]
			},
			options : {
				scales : {
					y : {
						beginAtZero : true
					}
				}
			}
		});

		const txc = document.getElementById('dunkinChart').getContext('2d');
		const dunkinChart = new Chart(txc, {
			type : 'doughnut',
			data : {
				labels : [ '파트너회원 수', '일반회원 수', '펫 마릿수' ],
				datasets : [ {
					label : '# of Votes',
					data : [ '${pmemCount}', '${memCount}', '${petCount}' ],
					backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
							'rgba(255, 159, 64, 0.2)',
							'rgba(255, 159, 64, 0.2)' ],
					borderColor : [ 'rgba(255, 99, 132, 1)',
							'rgba(255, 159, 64, 1)', 'rgba(255, 159, 64, 1)' ],
					borderWidth : 1
				} ]
			},
			options : {
				scales : {
					y : {
						beginAtZero : true
					}
				}
			}
		});
	</script>
</body>
</html>