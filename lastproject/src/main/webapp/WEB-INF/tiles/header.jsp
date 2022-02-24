<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<!-- Required Meta Tags -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<!-- Page Title -->
<title>Medino</title>

</head>

<header class="header-area">
	<div class="header-top">
		<div class="container">
			<div class="row">
				<div class="col-lg-9 d-md-flex">
					<h6 class="mr-3">
						<span class="mr-2"><i class="fa fa-mobile"></i></span> call us
						now! +1 305 708 2563
					</h6>
					<h6 class="mr-3">
						<span class="mr-2"><i class="fa fa-envelope-o"></i></span>
						medical@example.com
					</h6>
					<h6>
						<span class="mr-2"><i class="fa fa-map-marker"></i></span> Find
						our Location
					</h6>
				</div>
				<div class="col-lg-3">
					<div class="social-links">
						<ul>
							<li><a href="#"><i class="fa fa-facebook"></i></a></li>
							<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
							<li><a href="#"><i class="fa fa-twitter"></i></a></li>
							<li><a href="#"><i class="fa fa-instagram"></i></a></li>
							<li><a href="#"><i class="fa fa-vimeo"></i></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="header" id="home">
		<div class="container">
			<div class="row align-items-center justify-content-between d-flex">
				<div id="logo">
					<a href="home"><img
						src="resources/assets/images/logo/logo.png" alt="" title="" /></a>
				</div>
				<nav id="nav-menu-container">
					<ul class="nav-menu">
						<li class="menu-active"><a href="index.html">Home</a></li>
						<li><a href="departments.html">departments</a></li>
						<li><a href="doctors.html">doctors</a></li>
						<li class="menu-has-children"><a href="mypage">Pages</a>
               <li><a href="bTables.do">공지사항</a></li>
							<ul>
								<li><a href="about.html">about us</a></li>
								<li><a href="elements.html">elements</a></li>
							</ul></li>
            <li><a href="qnaMain">Open Q&A</a></li>
						<li class="menu-has-children"><a href="">파트너회원</a>

							<ul>
								<li><a href="pmemberList?code=100">수의사</a></li>
								<li><a href="pmemberList?code=101">훈련사</a></li>
								<li><a href="pmemberList?code=102">펫시터</a></li>
								<li><a href="pmemberList?code=103">미 용</a></li>
							</ul></li>
					

					<c:if test="${mId eq null and pId eq null}">

						<li class="menu-has-children"><a href="loginForm">로그인</a> <!--   -->

						</li>


						<li><a href="join">회원가입</a></li>
					</c:if>

					<c:if test="${mId ne null or pId ne null}">
						<li class="menu-has-children"><a href="#">마이페이지</a>
							<ul>
								<li><a href="#">내 프로필</a></li>
								<li><a href="#">반려동물 프로필</a></li>
								<li><a href="#">예약 내역</a></li>
								<li><a href="#">결제 내역</a></li>
								<li><a href="#">상담 내역</a></li>
								<li><a href="#">신고 내역</a></li>
								<li><a href="logout">로그아웃</a></li>

							</ul></li>

						<li><a href="#">Contact</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link count-indicator dropdown-toggle"
							id="notificationDropdown" href="#" data-toggle="dropdown"> <i
								class="mdi mdi-bell-outline"></i> <span
								class="count-symbol bg-danger"></span></a>
							<div
								class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list"
								aria-labelledby="notificationDropdown">
								<h6 class="p-3 mb-0 bg-primary text-white py-4">Notifications</h6>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item preview-item">
									<div class="preview-thumbnail">
										<div class="preview-icon bg-success">
											<i class="mdi mdi-calendar"></i>
										</div>
									</div>
									<div
										class="preview-item-content d-flex align-items-start flex-column justify-content-center">
										<h6 class="preview-subject font-weight-normal mb-1">Event
											today</h6>
										<p class="text-gray ellipsis mb-0">Just a reminder that
											you have an event today</p>
									</div>
								</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item preview-item">
									<div class="preview-thumbnail">
										<div class="preview-icon bg-warning">
											<i class="mdi mdi-settings"></i>
										</div>
									</div>
									<div
										class="preview-item-content d-flex align-items-start flex-column justify-content-center">
										<h6 class="preview-subject font-weight-normal mb-1">Settings</h6>
										<p class="text-gray ellipsis mb-0">Update dashboard</p>
									</div>
								</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item preview-item">
									<div class="preview-thumbnail">
										<div class="preview-icon bg-info">
											<i class="mdi mdi-link-variant"></i>
										</div>
									</div>
									<div
										class="preview-item-content d-flex align-items-start flex-column justify-content-center">
										<h6 class="preview-subject font-weight-normal mb-1">Launch
											Admin</h6>
										<p class="text-gray ellipsis mb-0">New admin wow!</p>
									</div>
								</a>
								<div class="dropdown-divider"></div>
								<h6 class="p-3 mb-0 text-center">See all notifications</h6>
							</div></li>
					</c:if>
				</nav>
				<!-- #nav-menu-container -->
			</div>
		</div>
	</div>
</header>
<!-- Header Area End -->


</body>

</html>