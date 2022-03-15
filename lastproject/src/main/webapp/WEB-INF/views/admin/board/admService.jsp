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
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"
	integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css"
	integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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

#doughnutChart {
	height: 250px;
}
</style>
<body>
	<div class="content-wrapper">
		<div class="row" id="proBanner">
			<div class="col-12">
				<span class="d-flex align-items-center purchase-popup"> 회원 관리
					페이지입니다. <a href="home" target="_blank"
					class="btn ml-auto download-button">메인 홈으로..</a> <a href="main"
					target="_blank" class="btn purchase-button">관리자 홈으로..</a>
				</span>
			</div>
		</div>
		<div class="d-xl-flex justify-content-between align-items-start">
			<h2 class="text-dark font-weight-bold mb-2">파트너 회원 페이지</h2>
			<div
				class="d-sm-flex justify-content-xl-between align-items-center mb-2">
				<div class="btn-group bg-white p-3" role="group"
					aria-label="Basic example">
					<button type="button"
						class="btn btn-link text-light py-0 border-right">7 Days</button>
					<button type="button"
						class="btn btn-link text-light py-0 border-right">1 Month</button>
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
						data-toggle="tab" href="#asd">회원목록</a></li>
					<li class="nav-item"><a class="nav-link " data-toggle="tab"
						href="#zxc">차트</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#qwe">파트너쉽 신청처리</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#aaa">할일</a></li>
				</ul>

				<div class="tab-content">
					<div class="tab-pane fade " id="qwe">
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
														style="width: 75%" aria-valuenow="50" aria-valuemin="0"
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
					<div class="tab-pane fade show active" id="asd">
						<div class="card">
							<div class="card-body">
								<div class="template-demo">
									<p>
										<button type="button"
											class="btn btn-link btn-rounded btn-fw codep" id="doctor"
											data-code="">전체</button>
										<button type="button"
											class="btn btn-link btn-rounded btn-fw codep" id="doctor"
											data-code="100">수의사</button>
										<button type="button"
											class="btn btn-link btn-rounded btn-fw codep" id="trainer"
											data-code="101">훈련사</button>
										<button type="button"
											class="btn btn-link btn-rounded btn-fw codep" id="groomer"
											data-code="103">미용사</button>
										<button type="button"
											class="btn btn-link btn-rounded btn-fw codep" id="petsitter"
											data-code="102">펫시터</button>
									<form id="admDateForm">
										<input type="hidden" name="code"> <input type="hidden"
											name="pageNum" value="1"> FROM : <input type="text"
											id="fromDate" name="fromDate">&nbsp;&nbsp; TO : <input
											type="text" id="toDate" name="toDate">
									</form>
									</p>
								</div>
								<table class="table table-hover">
									<thead>
										<tr>
											<th>이름</th>
											<th>아이디</th>
											<th>가입일</th>
											<th>파트너쉽</th>
											<th>가입일</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>Jacob</td>
											<td>Photoshop</td>
											<td></td>
											<td><label class="badge badge-danger">Pending</label></td>
											<td>20220303</td>
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
										<h4 class="card-title">유형 별 신고 상황 chart</h4>
										<canvas id="dunkinChart" style="height: 250px"></canvas>
									</div>
								</div>
							</div>
							<div class="col-lg-6 grid-margin stretch-card">
								<div class="card">
									<div class="card-body">
										<h4 class="card-title">기간 별 chart</h4>
										<canvas id="myChart" style="height: 250px"></canvas>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="tab-pane fade" id="aaa">
						<div class="row">
							<div class="col-lg-6 grid-margin stretch-card">
								<div class="card">
									<div class="card-body">
										<h4 class="card-title">기간별 파트너 회원 chart</h4>
										<canvas id="priceChart" style="height: 250px"></canvas>
									</div>
								</div>
							</div>
							<div class="col-lg-6 grid-margin stretch-card">
								<div class="card">
									<div class="card-body">
										<h4 class="card-title">기간 별 가입자 수 chart</h4>
										<canvas id="registerChart" style="height: 250px"></canvas>
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
		function name() {

			tt = [];
			oo = [];
			$.ajax({
				url : 'goChart',
				method : 'get',
				success : function(res) {
					console.log(res[0].tt);
					$.each(res, function (i) {
						tt.push(res[i].tt);
						oo.push(res[i].oo);
						
						
					})
					console.log(tt);
					const aaa = document.getElementById('priceChart').getContext('2d');
					const priceChart = new Chart(aaa, {
						type : 'line',
						data : {
							labels : tt,
							datasets : [ {
								label : '파트너 회원',
								data : oo,
								backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
										'rgba(255, 159, 64, 0.2)',
										],
								borderColor : [ 'rgba(255, 99, 132, 1)',
										'rgba(255, 159, 64, 1)' ],
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
					} //success

				}) // ajax
			}
		name();

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

		

		const bbb = document.getElementById('registerChart').getContext('2d');
		const registerChart = new Chart(bbb, {
			type : 'line',
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