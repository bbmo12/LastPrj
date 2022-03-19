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

	#confirm {
		width: 110px;
		height: 60px;
		margin: 15px 0 0 200px;
		font-size: 30px;
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
	<section class="banner-area other-page">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<h1>MyPage</h1>
					<a href="home">Home</a> <span>|</span> <a href="pmemberMyPage">MyPage</a>
				</div>
			</div>
		</div>
	</section>
	<section id="my_section">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="blog_right_sidebar">
						<aside class="single_sidebar_widget author_widget">
							<img class="author_img rounded-circle" src="resources/upload/${pmember.picture}"
								style="width: 210px" alt="">
							<div class="br"></div>
							<h4>${pmember.name }</h4>
							<div class="br"></div>
						</aside>
						<aside class="single_sidebar_widget post_category_widget">
							<h4 class="widget_title">My menu</h4>
							<ul class="list cat-list">
								<li><a href="pmemberMyPage" class="d-flex justify-content-between">
										<p>내 프로필</p>
									</a></li>
								<li><a href="reservationSetting" class="d-flex justify-content-between">
										<p>예약일정 설정</p>
									</a></li>
								<li><a href="preservationSelect" class="d-flex justify-content-between">
										<p>예약 내역</p>
									</a></li>
								<li><a href="pMemDiaList" class="d-flex justify-content-between">
										<p>진료 내역</p>
									</a></li>
								<li><a href="pMembenefit" class="d-flex justify-content-between">
										<p>결제 내역</p>
									</a></li>
								<li><a href="pmemcounsel" class="d-flex justify-content-between">
										<p>상담 내역</p>
									</a></li>
								<li><a href="pmemreport" class="d-flex justify-content-between">
										<p>신고 내역</p>
									</a></li>
								<li><a href="logout" class="d-flex justify-content-between">
										<p>로그아웃</p>
									</a></li>
								<li><a href="pmdeleteForm" class="d-flex justify-content-between">
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
								<div class="head">비밀번호를 입력하세요.</div>
								<div class="input-group-prepend" style="margin:55px 0 0 6em;">
									<span class="input-group-text bg-white px-4 border-md border-right-0"
										style="height: 70px;">
										<i class="fa fa-lock text-muted"></i>
									</span>
									<input type="hidden" id="p_id" name="p_id" value="${pmember.p_id }">
									<input type="password" id="password" name="password" value=""
										class="form-control bg-white border-left-0 border-md">
								</div>
								<button type="button" id="confirm" class="btn btn-primary" onclick="confirmPass()">
									확&nbsp;&nbsp;인</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<script type="text/javascript">
		function confirmPass() {
			var p_id = document.getElementById('p_id').value;
			var password = document.getElementById('password').value;
			console.log(password);
			$.ajax({
				method: 'POST',
				url: 'confirmPasscheck',
				data: {
					'p_id': p_id,
					'password': password
				},
				success: function (data) {
					console.log("1213123" + data);
					if (data == 1) {
						location.href = 'pmemberUpdateForm'
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