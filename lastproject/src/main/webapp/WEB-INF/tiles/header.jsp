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
	<title>BanBanBan</title>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
</head>
<style>
.nav-menu a {
	text-decoration: none;
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 400;
}

.p-3.mb-0.text-white.py-4{
	background-color: #38a4ff;
}

#notice_content{
	text-decoration: none;
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 300;
	font-size: 10px;
}
</style>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<script>
var socket = null;
$(document).ready(function(){
	
	$.ajax({
		url : "getId",
		type : "post",
		success : function(result){
			console.log(result);
			
			if(result != ""){
				sock = new SockJS("<c:url value="/echo"/>");
				socket = sock;
				
				// 데이터를 전달 받았을 때
				sock.onmessage = onMessage; // toast생성
			}
			
			notice();
		}
	});
	
	function notice(){
		$.ajax({
			url : "noticeList",
			type : "post",
			success : function(result){
				console.log(result);
				
				for(var i = 0; i < result.length; i++){
				
				var alarm = `<a class="dropdown-item preview-item">
								<div class="preview-thumbnail">
									<div class="preview-icon bg-success">
										<i class="mdi mdi-calendar"></i>
										
									</div>
								</div>
								<div id="notice_content" class="preview-item-content d-flex align-items-start flex-column justify-content-center">
									<h6 class="preview-subject font-weight-normal mb-1"></h6>\${result[i].n_from}
									<p class="text-gray ellipsis mb-0">\${result[i].content}</p>
								</div>
							</a>
						<div class="dropdown-divider"></div>`;
						
				$('#noticeli').append(alarm);
				}
			}
		});
	}
});

// toast생성 및 추가
function onMessage(evt){
    var data = evt.data;
    
    toastr.options = {
    		"closeButton":true,
    		"debug":false,
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
					<a href="home"><img src="resources/upload/logo2.png" alt="" title=""style="width:70px; height:70px;"/></a>
				</div>
				<nav id="nav-menu-container">
					<ul class="nav-menu">
						<li><a href="admBoard">공지사항</a></li>
						<li><a href="qnaMain">Open Q&A</a></li>
						<li class="menu-has-children"><a href="pmemberBest">파트너회원</a>
							<ul>
								<li><a href="pmemberList?code=100">수의사</a></li>
								<li><a href="pmemberList?code=101">훈련사</a></li>
								<li><a href="pmemberList?code=102">펫시터</a></li>
								<li><a href="pmemberList?code=103">미 용</a></li>
							</ul>
						</li>
						<c:if test="${mId eq null and pId eq null}">
							<li class="menu-has-children"><a href="loginForm">로그인</a> <!--   -->
							</li>
							<li><a href="join">회원가입</a></li>
						</c:if>
						<!-- 파트너회원 로그인 -->
						<c:if test="${mId eq null and pId ne null}">
							<li class="menu-has-children"><a href="#">마이페이지</a>
								<ul>
									<li><a href="pmemberMyPage">내 프로필</a></li>
									<li><a href="preservationSelect">예약 내역</a></li>
									<li><a href="#">결제 내역</a></li>
									<li><a href="pmemcounsel">상담 내역</a></li>
									<li><a href="#">신고 내역</a></li>
									<li><a href="#">회원탈퇴</a></li>
									<li><a href="logout">로그아웃</a></li>
								</ul>
							</li>
							
						</c:if>
						<!-- 일반회원 로그인  -->
						<c:if test="${mId ne null and pId eq null}">
							<li class="menu-has-children"><a href="#">마이페이지</a>
								<ul>
									<li><a href="memberMypage">내 프로필</a></li>
									<li><a href="petmemberForm">반려동물 프로필</a></li>
									<li><a href="protocol">반려동물 진료기록</a></li>
									<li><a href="reservationSelect">예약 내역</a></li>
									<li><a href="myPay">결제 내역</a></li>
									<li><a href="mycounsel">상담 내역</a></li>
									<li><a href="myreport">신고 내역</a></li>
									<li><a href="myfallow">팔로우</a></li>
									<li><a href="logout">로그아웃</a></li>
									<li><a href="mdeleteForm">회원탈퇴</a></li>
								</ul>
							</li>
							<li class="nav-item dropdown">
								<a class="nav-link count-indicator dropdown-toggle" id="notificationDropdown" href="#" data-toggle="dropdown">
									<i class="mdi mdi-bell-outline"></i><span class="count-symbol bg-danger"></span>
								</a>
								<div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list" aria-labelledby="notificationDropdown">
									<h6 class="p-3 mb-0 text-white py-4">Notifications</h6>
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
								<div class="dropdown-divider"></div>
								
								<h6 class="p-3 mb-0 text-center">See all notifications</h6>
							</div>
						</li>

						</c:if>
						
						<li><a href="testPage">Contact</a></li>
						
					</ul>
				</nav>
			</div>
		</div> <!-- #nav-menu-container -->
	</div>
</header>
<!-- Header Area End -->


</body>

</html>