<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<style>
	.swal2-content {
		display: none;
	}

	#password {
		height: 70px;
		width: 250px;
		padding: 0px;
		font-size: 24px;
		margin-left: -3px;
	}

	#confirm{
		width: 130px;
		height: 60px;
		font-size: 30px;
		margin-top: 10px;
	}

	#logreg-forms {
		width: 500px;
		height: 350px;
		background: #fff;
		box-shadow: 0 3px 6px 0px rgba(0, 0, 0, 0.16), 0 3px 6px 0px rgba(0, 0, 0, 0.23);
	}

	.head {
		color: #fff;
		font-size: 34px;
		font-weight: bold;
		height: 100px;
		padding: 30px 0;
		text-align: center;
		text-transform: uppercase;
		background: #0062ff;
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
							<h4 id="Mainname">${member.name }님</h4>
							<div class="br"></div>
							<div id="myinfo">
								<i class="fa-solid fa-pen"></i>&nbsp;<a class="no_deco"
									href="mconfirmPass">내 정보 수정하기</a>
							</div>
						</aside>
					</div>
					<br>
					<div class="blog_right_sidebar">
						<aside class="single_sidebar_widget post_category_widget">
							<h4 class="widget_title">My menu</h4>
							<ul class="list cat-list">
								<p id="menu_bold">내 활동 내역</p>
								<li><a href="protocol"
									class="d-flex justify-content-between no_deco">
										<p>반려동물 진료기록</p>
								</a></li>
								<li><a href="reservationSelect"
									class="d-flex justify-content-between no_deco">
										<p>예약 내역</p>
								</a></li>
								<li><a href="myPay"
									class="d-flex justify-content-between no_deco">
										<p>결제 내역</p>
								</a></li>
								<li><a href="mycounsel"
									class="d-flex justify-content-between no_deco">
										<p>상담 내역</p>
								</a></li>
								<li><a href="myreport"
									class="d-flex justify-content-between no_deco">
										<p>신고 내역</p>
								</a></li>
								<li><a href="myfallow"
									class="d-flex justify-content-between no_deco">
										<p>팔로우</p>
								</a></li>
								<br>
								<br>
								<p id="menu_bold">회원 정보 관리</p>
								<li><a href="mconfirmPass"
									class="d-flex justify-content-between no_deco">
										<p>회원 정보 수정</p>
								</a></li>
								<li><a href="logout"
									class="d-flex justify-content-between no_deco">
										<p>로그아웃</p>
								</a></li>
								<li><a href="mdeleteForm"
									class="d-flex justify-content-between no_deco">
										<p>회원탈퇴</p>
								</a></li>
							</ul>
						</aside>
					</div>
				</div>
				<div class="col-lg-9 posts-list" style="margin-top: 15em;">
					<div class="col-lg-12 col-md-12 blog_details" style="margin-left: 10em;">
						<div id="logreg-forms">
							<div class="form-group">
								<div class="head">비밀번호 확인</div>
								<div class="input-group-prepend" style="margin:55px 0 0 6em;">
									<span class="input-group-text bg-white px-4 border-md border-right-0" style="height: 70px;">
										<i class="fa fa-lock text-muted"></i>
									</span>
									<input type="hidden" id="m_id" name="m_id" value="${member.m_id }">
									<input type="password" id="password" name="password" value=""
										class="form-control bg-white border-left-0 border-md">
								</div>
								<button type="button" id="confirm" class="btn btn-primary"
									onclick="confirmPass()" style="margin-left: 4em;">탈퇴하기</button>
								<button type="button" id="confirm" class="btn btn-primary"
									onclick="location.href='memberMypage'">아니요</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<script type="text/javascript">
		function confirmPass() {
			var m_id = document.getElementById('m_id').value;
			var password = document.getElementById('password').value;
			$.ajax({
				method: 'POST',
				url: 'mconfirmPasscheck',
				data: {
					'm_id': m_id,
					'password': password
				},
				success: function (data) {
					if (data == 1) {
						location.href = 'mdelete'
					} else {
						Swal.fire('비밀번호를<br>다시 확인해주세요.');
					}
				},
				error: function () {}

			});
		}
	</script>
	<script>
		$(function () {
			$('input, select').on('focus', function () {
				$(this).parent().find('.input-group-text').css('border-color', '#80bdff');
			});
			$('input, select').on('blur', function () {
				$(this).parent().find('.input-group-text').css('border-color', '#ced4da');
			});
		});
	</script>
</body>

</html>