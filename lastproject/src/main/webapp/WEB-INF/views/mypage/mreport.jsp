<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags/"  prefix="my"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<style>

	.card-text {
		display: inline-block;
		width: 200px;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
	}

	.padding {
		padding: 5rem
	}

	.table th {
		text-align: center;
		font-size: 1.0rem;
		/* font-family: 'NanumBarunGothic'; */
		font-style: normal;
		font-weight: 500 !important;
		color: black;
		/* background-color: ghostwhite; */
	}

	.table {
		width: 100%;
		max-width: 100%;
		margin-bottom: 1rem;
		background-color: transparent;
	}

	.table-striped tbody tr:nth-of-type(odd) {
		background-color: #f9f9fd;
	}

	.table td {
		font-size: 16px;
		padding: .875rem 0.9375rem;
		text-align: center;
	}
	.badge {
		font-size: 12px;
		line-height: 1;
		padding: .375rem .5625rem;
		font-weight: normal;
	}

	.badge-info {
		background-color: cornflowerblue;
		border: none;
	}
	
	
	.no_deco {
		text-decoration: none !important;
		font-size : 0.8rem !important;
		color: black;
	}
	
	#my_section {
		margin-top: -70px;
    	padding-bottom: 25px;
	}
	
	.blog_right_sidebar{
		box-shadow: 0 .15rem 1.75rem 0 rgba(58,59,69,.1)!important;
		border: 1px solid #e3e6f0;
	   	border-radius: 0.35rem;
	   	float: none !important; margin: 0 auto !important;
	   	background-color: white;
	   	width: 250px;
	}
	.card{
		box-shadow: 0 .15rem 1.75rem 0 rgba(58,59,69,.1)!important;
		border: 1px solid #e3e6f0;
	   	border-radius: 0.35rem
	}
	
	.card-header{
		background: white;
		font-size: 1.0rem;
		font-style: normal;
		font-weight: 400;
		color: black;
	}
	
	.card-body{
		font-size: 1.0rem;
		font-style: normal;
		font-weight: 300;
		color: black;
		
	}
	
	.widget_title{
		background: #0062ff !important;
	}
	
	#myinfo{
		font-size: 0.8rem;
		font-style: normal;
	 	font-weight: 300;
	}
	
	.partner_img{
		object-fit: cover;
		object-position:top;
		border-radius:50%;
		width: 180px !important;
		height: 180px !important;
		float: none;
		margin: 0 auto;
	}
	
	#Mainname{
		font-size: 1.5rem !important;
		font-style: normal !important;
	 	font-weight: 700 !important;
	 	color:gray;
	}
	
	#menu_bold{
		font-size: 1.0rem;
		font-style: normal;
 		font-weight: 700;
 		color: black;
	}
</style>

<body>
	<section class="department-area" style="padding: 30px 0 30px;">
		<div class="container">
			<div class="col-lg-6 offset-lg-3">
				<div class="section-top text-center">
					<br>
					<br>
					<br>
					<h2></h2>
				</div>
			</div>
		</div>
	</section>
	<section id="my_section">
		<div class="container" style="max-width: 1350px;">
			<div class="row">
				<div class="col-lg-3">
					<h2 align="center">MyPage</h2>
					<br>
					<div class="blog_right_sidebar">
						<aside class="single_sidebar_widget author_widget">
							<img class="partner_img" src="/upload/${member.pfile}"
								onerror="this.src='resources/upload/cat.jpg'" alt=""> <br>
							<br>
							<h4 id="Mainname">${member.name }???</h4>
							<div class="br"></div>
							<div id="myinfo">
								<i class="fa-solid fa-pen"></i>&nbsp;<a class="no_deco"
									href="mconfirmPass">??? ?????? ????????????</a>
							</div>
						</aside>
					</div>
					<br>
					<div class="blog_right_sidebar">
						<aside class="single_sidebar_widget post_category_widget">
							<h4 class="widget_title">My menu</h4>
							<ul class="list cat-list">
								<p id="menu_bold">??? ?????? ??????</p>
								<li><a href="protocol"
									class="d-flex justify-content-between no_deco">
										<p>???????????? ????????????</p>
								</a></li>
								<li><a href="reservationSelect"
									class="d-flex justify-content-between no_deco">
										<p>?????? ??????</p>
								</a></li>
								<li><a href="myPay"
									class="d-flex justify-content-between no_deco">
										<p>?????? ??????</p>
								</a></li>
								<li><a href="mycounsel"
									class="d-flex justify-content-between no_deco">
										<p>?????? ??????</p>
								</a></li>
								<li><a href="myreport"
									class="d-flex justify-content-between no_deco">
										<p>?????? ??????</p>
								</a></li>
								<li><a href="myfallow"
									class="d-flex justify-content-between no_deco">
										<p>?????????</p>
								</a></li>
								<br>
								<br>
								<p id="menu_bold">?????? ?????? ??????</p>
								<li><a href="mconfirmPass"
									class="d-flex justify-content-between no_deco">
										<p>?????? ?????? ??????</p>
								</a></li>
								<li><a href="logout"
									class="d-flex justify-content-between no_deco">
										<p>????????????</p>
								</a></li>
								<li><a href="mdeleteForm"
									class="d-flex justify-content-between no_deco">
										<p>????????????</p>
								</a></li>
							</ul>
						</aside>
					</div>
				</div>
				<div class="col-lg-9 posts-list">
				<div class="single-post row">
					<div class="col-lg-12 col-md-12 blog_details">
					<br><br>
					<div class="card">
					<div class="card-header">
						<div align="left">
							<i class="fa-solid fa-flag"></i>&nbsp;&nbsp;&nbsp;??????????????????
						</div>
					</div>
					<div class="card-body">
						<div class="row">
							<div>
								<div class="table-wrap" style="width: 900px;">
									<table class="table table-striped">
										<thead>
											<tr style="text-align: center;">
												<th>????????????</th>
												<th>????????????</th>
												<th>????????????</th>
												<th>????????????</th>
												<th>????????????</th>
												<th>????????????</th>
											</tr>
										</thead>
										<tbody style="text-align: center">
											<c:if test="${ fn:length(report) == 0  }">
												<tr>
													<td colspan="6" align="center">????????? ????????? ????????????.</td>
												</tr>
											</c:if> 
											<c:forEach items="${report }" var="report">
												<tr>
													<td>${report.p_name }</td>
													<td class="card-text">${report.content}</td>
													<td>${report.w_date } </td>
													<td> 
                                                        <c:if test="${report.code eq 601}">
                                                                ?????? ?????? ??? ??????
                                                        </c:if>
                                                        <c:if test="${report.code eq 602}">
                                                                ?????????/????????? ?????????
                                                        </c:if>
                                                        <c:if test="${report.code eq 603}">
                                                                ??????/?????????/??????
                                                        </c:if>
                                                        <c:if test="${report.code eq 604}">
                                                                ???????????????
                                                        </c:if>
                                                        <c:if test="${report.code eq 605}">
                                                                ????????? ??????
                                                        </c:if>
                                                    </td>
                                                    <td>
                                                            <c:if test="${report.repor eq 701}">
                                                                <label class="badge badge-info">????????????</label>
                                                            </c:if>
                                                            <c:if test="${report.repor eq 702}">
                                                                <label class="badge badge-danger">????????????</label>
                                                            </c:if>
                                                            <c:if test="${report.repor eq 703}">
                                                                <label class="badge badge-success">????????????</label>
                                                            </c:if>
                                                     </td>
													<td>
													<c:if test="${report.repor eq 702}">
															<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter${report.rep_no }"
																style="border: none;">????????????</button>
															<!-- Modal -->
															<div class="modal fade" id="exampleModalCenter${report.rep_no }" tabindex="-1" role="dialog"
																aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
																<div class="modal-dialog modal-dialog-centered" role="document">
																	<div class="modal-content">
																		<div class="modal-header">
																			<h3 class="modal-title" id="exampleModalLongTitle">??????????????????</h3>
																			<button type="button" class="close"
																				data-dismiss="modal" aria-label="Close">
																				<span aria-hidden="true">&times;</span>
																			</button>
																	</div>
																		<div class="modal-body">${report.state }</div>
																			<div class="modal-footer">
																			<button type="button" class="btn btn-primary"
																				data-dismiss="modal">??? ???</button>
																		</div>
																	</div>
																</div>
															</div>
														</c:if>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<my:nav jsFunc="go_page" page="${page}" />
								</div>
							</div>
						</div>
						</div>
						</div>
					</div>
				</div>
				</div>
			</div>
		</div>
	</section>
	<script type="text/javascript">
	$("#exampleModalCenter").on('hidden.bs.modal',function(e){
		$(this).find('.modal-body').text('');
	}); 
	
	
	</script>
</body>

</html>