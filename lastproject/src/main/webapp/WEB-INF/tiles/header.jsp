<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<!-- Required Meta Tags -->
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">

	<!-- Page Title -->
	<title>BanBanBan</title>
</head>
<script src="https://kit.fontawesome.com/397860a4e3.js" crossorigin="anonymous"></script>
<style>
	#drop{
		font-family: 'Binggrae';
		font-size : 0.9rem !important;
	}

	.nav-menu a {
		text-decoration: none;
		font-family: 'Binggrae-Bold';
		font-size : 1.5rem;
	}

	.notification {
		font-family: 'Binggrae';
		text-align: center;
		font-weight: bolder;
		padding: 10px;
		font-size: 15px !important;
		color: black;
	}

	#notice_content {
		text-decoration: none;
		font-family: 'Binggrae';
		font-weight: 300;
		font-size: 15px;
	}
	
	#noticeCheck{
		font-size:20px;
	}
	
	#seeall{
		font-family: 'Binggrae';
		font-size:15px;
		border: none;
		background: none;
		color: gray;
		margin-left: 25px;
	}
	
	#notice_btn{
		font-family: 'Binggrae';
		margin-left: 120px;
		font-size:10px;
		border: none;
		background: none;
		color: gray;
	}
</style>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<script>
	var socket = null;
	$(document).ready(function () {
		$.ajax({
			url: "getId",
			type: "post",
			success: function (result) {
				console.log(result);
				/* 수정하기 */
				if (result != "") {
					sock = new SockJS("<c:url value="/echo"/>");
					socket = sock;
					// 데이터를 전달 받았을 때
					sock.onmessage = onMessage; // toast생성
				}
				notice();
			}
		});

		function notice() {
			$.ajax({
				url: "noticeList",
				type: "post",
				success: function (result) {
					console.log(result);
					for (var i = 0; i < result.length; i++) {
						var alarm = `<a class="dropdown-item preview-item">
								<div class="preview-thumbnail">
									<div class="preview-icon bg-success">
										<i class="mdi mdi-calendar"></i>										
									</div>
								</div>
								<div id="notice_content" class="preview-item-content d-flex align-items-start flex-column justify-content-center">
								
									<span>\${result[i].name}<button id="notice_btn"
									onclick="javascript:noticeCheck(\${result[i].notice_no}); deleteAlerm(event);">X</button></span>
									<p class="text-gray ellipsis mb-0">\${result[i].content}</p>
								</div>
							</a>
						<div id="notice_divider" class="dropdown-divider"></div>`;
						$('#noticeli').append(alarm);
					}
				}
			});
		}
	});
			/* <h6 class="preview-subject font-weight-normal mb-1">\${result[i].n_from}</h6> */
	// toast생성 및 추가
	function onMessage(evt) {
		var data = evt.data;
		toastr.options = {
			"closeButton": true,
			"debug": false,
			"newestOnTop": false,
			"progressBar": false,
			"positionClass": "toast-top-right",
			"preventDuplicates": true,
			"onclick": null,
			"showDuration": "100",
			"hideDuration": "1000",
			"timeOut": "3500",
			"extendedTimeOut": "3500",
			"showEasing": "swing",
			"hideEasing": "linear",
			"showMethod": "fadeIn",
			"hideMethod": "fadeOut"
		}
		toastr.info(data);
	}
			
	function noticeCheck(notice_no) {
		console.log("체크");
		console.log(notice_no);
		$.ajax({
			url: "noticeCheck",
			type: "post",
			data:{
				notice_no : notice_no
			},
			success: function (result) {
				//console.log(result);
				
			},
			error: function(error){
				console.log(error);
			}
		});
		
	}
	
	function deleteAlerm(event) {
		var e = event.target.parentElement.parentElement.parentElement;
		var divider = $('#notice_divider');
		//console.log(divider);
		//console.log(e);
		e.remove();
		divider.remove();
	}
</script>

<body>
	<header class="header-area">
		<!-- <div class="header-top">
		<div class="container">
			<div class="row">
				<div class="col-lg-9 d-md-flex">
					<h6 class="mr-3">
						<span class="mr-2"><i class="fa fa-mobile"></i>
						</span> call us now! +1 305 708 2563
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
	</div> -->
		<div id="header" id="home">
			<div class="container">
				<div class="row align-items-center justify-content-between d-flex">
					<div id="logo">
						<a href="home"><img src="resources/upload/logo2.png" alt="" title=""
								style="width:70px; height:70px;" /></a>
					</div>
					<nav id="nav-menu-container">
						<ul class="nav-menu">
							<li><a href="admBoard">공지사항</a></li>							
							<li><a href="qnaMain">Open Q&A</a></li>
							<li class="menu-has-children"><a href="pmemberBest">파트너회원</a>
								<ul>
									<li><a href="pmemberList?code=100" id="drop">수의사</a></li>
									<li><a href="pmemberList?code=101" id="drop">훈련사</a></li>
									<li><a href="pmemberList?code=102" id="drop">펫시터</a></li>
									<li><a href="pmemberList?code=103" id="drop">미 용</a></li>
								</ul>
							</li>
							<!-- 권한이 없는 익명 사용자이면 보여준다. -->
							<sec:authorize access="isAnonymous()">
							<%-- <c:if test="${mId eq null and pId eq null}"> --%>
								<li class="menu-has-children"><a href="loginForm">로그인</a> <!--   -->
								</li>
								<li><a href="join">회원가입</a></li>
							</sec:authorize>
							<%-- </c:if> --%>
							<!-- 파트너회원 로그인 -->
							<!-- 권한이 PARTNER인 사람만 -->
							<sec:authorize access="hasRole('PARTNER')">
							<%-- <c:if test="${mId eq null and pId ne null}"> --%>
								<li class="menu-has-children"><a href="pmemberMyPage">마이페이지</a>
									<ul>
										<li><a href="pmemberMyPage" id="drop">내 프로필</a></li>
										<li><a href="reservationSetting" id="drop">예약일정 설정</a></li>
										<li><a href="preservationSelect" id="drop">예약 내역</a></li>
										<li><a href="pMemDiaList" id="drop">내 진료 내역</a></li>
										<li><a href="pMembenefit" id="drop">결제 내역</a></li>
										<li><a href="pmemcounsel" id="drop">상담 내역</a></li>
										<li><a href="pmemreport" id="drop">신고 내역</a></li>
										<li><a href="pmdeleteForm" id="drop">회원탈퇴</a></li>
										<li><a href="logout" id="drop">로그아웃</a></li>
									</ul>
								</li>
							</sec:authorize>
							<%-- </c:if> --%>
							<!-- 일반회원 로그인  -->
							<%-- <c:if test="${mId ne null and pId eq null}"> --%>
							<!-- 권한이 MEMBER인 사람만 -->
							<sec:authorize access="hasRole('MEMBER')">
								<li class="menu-has-children"><a href="mainMypage">마이페이지</a>
									<ul>
										<li><a href="memberMypage" id="drop">내 프로필</a></li>
										<!-- <li><a href="petmemberForm">반려동물 프로필</a></li> -->
										<li><a href="protocol" id="drop">반려동물 진료기록</a></li>
										<li><a href="reservationSelect" id="drop">예약 내역</a></li>
										<li><a href="myPay" id="drop">결제 내역</a></li>
										<li><a href="mycounsel" id="drop">상담 내역</a></li>
										<li><a href="myreport" id="drop">신고 내역</a></li>
										<li><a href="myfallow" id="drop">팔로우</a></li>
										<li><a href="logout" id="drop">로그아웃</a></li>
										<li><a href="mdeleteForm" id="drop">회원탈퇴</a></li>
									</ul>
								</li>
								<li class="nav-item dropdown">
									<a class="nav-link count-indicator dropdown-toggle" id="notificationDropdown"
										href="#" data-toggle="dropdown">
										<i class="fa-solid fa-bell"></i> <span class="count-symbol bg-danger"></span>
										<!-- <i class="fa-solid fa-bell"></i><span class="count-symbol bg-danger"></span> -->
									</a>
									<div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list"
										aria-labelledby="notificationDropdown">
										<h6 class="notification">알림</h6>
										<div class="dropdown-divider"></div>
										<div id="noticeli"></div>
										<!-- <a class="dropdown-item preview-item">
										<div class="preview-thumbnail">
											<div class="preview-icon bg-success">
												<i class="mdi mdi-calendar"></i>
											</div>
										</div>
										<div class="preview-item-content d-flex align-items-start flex-column justify-content-center">
											<h6 class="preview-subject font-weight-normal mb-1"></h6>
											<p class="text-gray ellipsis mb-0"></p>
										</div>
									</a> -->
									<div>
										<a href="mainMypage" id="seeall">See all notifications</a>
									</div>
									</div>
								</li>
							<%-- </c:if> --%>
							</sec:authorize>
							<!-- li><a href="testPage">Contact</a></li> -->
							<sec:authorize access="hasRole('ADMIN')">
							<li><a href="adminPage">관리자</a></li>
							<li><a href="logout">로그아웃</a></li>
							</sec:authorize>
						</ul>
					</nav>
				</div>
			</div> <!-- #nav-menu-container -->
		</div>
	</header>
	<!-- Header Area End -->
</body>

</html>