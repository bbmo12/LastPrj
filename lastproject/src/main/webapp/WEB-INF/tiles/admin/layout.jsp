<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<link rel="stylesheet"	href="resources/assets123/vendors/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet"	href="resources/assets123/vendors/flag-icon-css/css/flag-icon.min.css">
<link rel="stylesheet"	href="resources/assets123/vendors/font-awesome/css/font-awesome.min.css" />
<link rel="stylesheet"	href="resources/assets123/vendors/bootstrap-datepicker/bootstrap-datepicker.min.css">
<link rel="stylesheet"  href="resources/assets123/css/style.css">
<link rel="shortcut icon" href="resources/assets123/images/favicon.png" />

	<script src="https://cdn.jsdelivr.net/npm/chart.js@3.4.1"></script>
	<!--  <script src="resources/assets123/js/chart.js"></script> -->
	<!--<script src="resources/assets123/vendors/chart.js/Chart.min.js"></script> -->
	<script src="resources/assets123/vendors/js/vendor.bundle.base.js"></script>
	<script	src="resources/assets123/vendors/jquery-circle-progress/js/circle-progress.min.js"></script>
	<script src="resources/assets123/js/off-canvas.js"></script>
	<script src="resources/assets123/js/hoverable-collapse.js"></script>
	<script src="resources/assets123/js/misc.js"></script>
	<script src="resources/assets123/js/dashboard.js"></script>
	
	
	<title><tiles:insertAttribute name="title" /></title>
</head>
<body>
	<div class="container-scroller">
		<!-- partial:partials/_navbar.html -->
		<nav
			class="navbar default-layout-navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
			<div
				class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
				<a class="navbar-brand brand-logo" href="main"><img
					src="resources/assets123/images/logo.svg" alt="logo" /></a> <a
					class="navbar-brand brand-logo-mini" href="index.html"><img
					src="resources/assets123/images/logo-mini.svg" alt="logo" /></a>
			</div>
			<div class="navbar-menu-wrapper d-flex align-items-stretch">
				<button class="navbar-toggler navbar-toggler align-self-center"
					type="button" data-toggle="minimize">
					<span class="mdi mdi-menu"></span>
				</button>
				<div class="search-field d-none d-xl-block">
					<form class="d-flex align-items-center h-100" action="#">
						<div class="input-group">
							<div class="input-group-prepend bg-transparent">
								<i class="input-group-text border-0 mdi mdi-magnify"></i>
							</div>
							<input type="text" class="form-control bg-transparent border-0"
								placeholder="Search products">
						</div>
					</form>
				</div>
				<ul class="navbar-nav navbar-nav-right">
					<li class="nav-item  dropdown d-none d-md-block"><a
						class="nav-link dropdown-toggle" id="reportDropdown" href="#"
						data-toggle="dropdown" aria-expanded="false"> ???????????? </a>
						<div class="dropdown-menu navbar-dropdown"
							aria-labelledby="reportDropdown">
							<a class="dropdown-item" href="#"> <i
								class="mdi mdi-file-pdf mr-2"></i>PDF
							</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="#"> <i
								class="mdi mdi-file-excel mr-2"></i>Excel
							</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="#"> <i
								class="mdi mdi-file-word mr-2"></i>doc
							</a>
						</div></li>
					<li class="nav-item  dropdown d-none d-md-block"><a
						class="nav-link dropdown-toggle" id="projectDropdown" href="#"
						data-toggle="dropdown" aria-expanded="false"> Projects </a>
						<div class="dropdown-menu navbar-dropdown"
							aria-labelledby="projectDropdown">
							<a class="dropdown-item" href="#"> <i
								class="mdi mdi-eye-outline mr-2"></i>View Project
							</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="#"> <i
								class="mdi mdi-pencil-outline mr-2"></i>Edit Project
							</a>
						</div></li>
					<li class="nav-item nav-profile dropdown"><a
						class="nav-link dropdown-toggle" id="profileDropdown" href="#"
						data-toggle="dropdown" aria-expanded="false">
							<div class="nav-profile-img">
								<img src="resources/upload/c.png"
									alt="image">
							</div>
							<div class="nav-profile-text">
								<p class="mb-1 text-black">?????????</p>
							</div>
					</a>
						<div
							class="dropdown-menu navbar-dropdown dropdown-menu-right p-0 border-0 font-size-sm"
							aria-labelledby="profileDropdown" data-x-placement="bottom-end">
							<div class="p-3 text-center bg-primary">
								<img class="img-avatar img-avatar48 img-avatar-thumb"
									src="resources/upload/a.png" alt="">
							</div>
							<div class="p-2">
								<h5 class="dropdown-header text-uppercase pl-2 text-dark">????????? ??????</h5>
								<a
									class="dropdown-item py-1 d-flex align-items-center justify-content-between" href="#"> 
									<span>?????????</span> 
									<span class="p-0"> 
									<span class="badge badge-primary">3</span> <i class="mdi mdi-email-open-outline ml-1"></i>
									</span>
								</a> 
								<a
									class="dropdown-item py-1 d-flex align-items-center justify-content-between" href="#"> 
									<span>?????????</span> <span class="p-0"> <span
										class="badge badge-success">1</span> <i
										class="mdi mdi-account-outline ml-1"></i></span>
								</a> 
								<a
									class="dropdown-item py-1 d-flex align-items-center justify-content-between"
									href="javascript:void(0)"> <span>??????</span> <i
									class="mdi mdi-settings"></i>
								</a>
								<div role="separator" class="dropdown-divider"></div>
								<h5 class="dropdown-header text-uppercase  pl-2 text-dark mt-2">??????</h5>
								<a
									class="dropdown-item py-1 d-flex align-items-center justify-content-between"
									href="#"> <span>????????????</span> <i
									class="mdi mdi-lock ml-1"></i>
								</a> <a
									class="dropdown-item py-1 d-flex align-items-center justify-content-between"
									href="AmdlogOut"> <span>????????????</span> <i
									class="mdi mdi-logout ml-1"></i>
								</a>
							</div>
						</div></li>
						
						
						<!-- ????????? ?????? ?????? ????????? ????????????  -->
						
						
					<li class="nav-item dropdown"><a
						class="nav-link count-indicator dropdown-toggle"
						id="messageDropdown" href="#" data-toggle="dropdown"
						aria-expanded="false"> <i class="mdi mdi-email-outline"></i> <span
							class="count-symbol bg-success"></span>
					</a>
						<div
							class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list"
							aria-labelledby="messageDropdown">
							<h6 class="p-3 mb-0 bg-primary text-white py-4">Message</h6>
							
							<!-- ?????? ???????????? ??????????????? ???????????? -->
							<div class="dropdown-divider"></div>
							<a class="dropdown-item preview-item">
								
								
								<div class="preview-thumbnail"><img src="resources/upload/c.png"alt="image" class="profile-pic"></div>
								
								<div class="preview-item-content d-flex align-items-start flex-column justify-content-center" onclick="location.href='boardUpdateForm?b_no=4';">
									<h6 class="preview-subject ellipsis mb-1 font-weight-normal">
									????????? send you a message</h6>
									<p class="text-gray mb-0">?????????/??????</p>
								</div>
							</a>
							<!-- ?????? ?????? ?????? -->
							
							<div class="dropdown-divider"></div>
							<a class="dropdown-item preview-item">
								<div class="preview-thumbnail">
									<img src="resources/upload/gu.png"
										alt="image" class="profile-pic">
								</div>
								<div
									class="preview-item-content d-flex align-items-start flex-column justify-content-center">
									<h6 class="preview-subject ellipsis mb-1 font-weight-normal">Cregh
										send you a message</h6>
									<p class="text-gray mb-0">15 Minutes ago</p>
								</div>
							</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item preview-item">
								<div class="preview-thumbnail">
									<img src="resources/assets123/images/faces/face3.jpg"
										alt="image" class="profile-pic">
								</div>
								<div
									class="preview-item-content d-flex align-items-start flex-column justify-content-center">
									<h6 class="preview-subject ellipsis mb-1 font-weight-normal">Profile
										picture updated</h6>
									<p class="text-gray mb-0">18 Minutes ago</p>
								</div>
							</a>
							<div class="dropdown-divider"></div>
							<h6 class="p-3 mb-0 text-center" onclick="location.href='boardTables';">?????? ????????? ??????</h6><!-- ????????? ?????? ?????? ?????? ??? -->
							
						</div></li>
						<!-- end ????????? -->
						
						
						
					<li class="nav-item dropdown"><a
						class="nav-link count-indicator dropdown-toggle"
						id="notificationDropdown" href="#" data-toggle="dropdown"> <i
							class="mdi mdi-bell-outline"></i> <span
							class="count-symbol bg-danger"></span>
					</a>
						<div
							class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list"
							aria-labelledby="notificationDropdown">
							<h6 class="p-3 mb-0 bg-primary text-white py-4">??????</h6>
							
							<div class="dropdown-divider"></div>
							<a class="dropdown-item preview-item">
								
								<div class="preview-thumbnail">
									<div class="preview-icon bg-success">
										<i class="mdi mdi-calendar"></i>
									</div>
								</div>
								<div
									class="preview-item-content d-flex align-items-start flex-column justify-content-center">
									<h6 class="preview-subject font-weight-normal mb-1">To Do List!</h6>
									<p class="text-gray ellipsis mb-0">???????????? ?????? ????????? ????????????!!</p>
								</div>
							</a>
							
							<div class="dropdown-divider"></div>
							<a class="dropdown-item preview-item">
								<div class="preview-thumbnail">
									<div class="preview-icon bg-info">
										<i class="mdi mdi-link-variant"></i>
									</div>
								</div>
								<div class="preview-item-content d-flex align-items-start flex-column justify-content-center">
									<h6 class="preview-subject font-weight-normal mb-1">??????!!</h6>
									<p class="text-gray ellipsis mb-0">????????? ??????!!</p>
								</div>
							</a>
							<div class="dropdown-divider"></div>
							<h6 class="p-3 mb-0 text-center">?????? ??? ?????? ?????? ??????</h6>
						</div></li>
				</ul>
				<button
					class="navbar-toggler navbar-toggler-right d-lg-none align-self-center"
					type="button" data-toggle="offcanvas">
					<span class="mdi mdi-menu"></span>
				</button>
			</div>
		</nav>
		<!-- partial -->
		<div class="container-fluid page-body-wrapper">
			<!-- partial:partials/_sidebar.html -->

			<nav class="sidebar sidebar-offcanvas" id="sidebar">
				<tiles:insertAttribute name="side" />
			</nav>
			<!-- partial -->
			<div class="main-panel">
				<tiles:insertAttribute name="body" />
				<!-- content-wrapper ends -->

				<!-- partial:partials/_footer.html -->
				<tiles:insertAttribute name="footer" />
				<!-- partial -->
			</div>
			<!-- main-panel ends -->
		</div>
		<!-- page-body-wrapper ends -->
	</div>
</body>
</html>