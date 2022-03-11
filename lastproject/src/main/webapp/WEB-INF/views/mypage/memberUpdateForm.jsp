<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
#my_section {
	padding: 50px;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<body>
	<section class="banner-area other-page">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<h1>MyPage</h1>
					<a href="index.html">Home</a> <span>|</span> <a
						href="blog-details.html">MyPage</a>
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
							<img class="author_img rounded-circle" src="resources/upload/${member.picture}" style="width:210px" alt="">
							<div class="br"></div>
							<h4>${member.name }</h4>

							<div class="br"></div>
						</aside>

						<aside class="single_sidebar_widget post_category_widget">
							<h4 class="widget_title">My menu</h4>
							<ul class="list cat-list">
															<li><a href="memberMypage"
									class="d-flex justify-content-between">
										<p>내 프로필</p>
								</a></li>
								<li><a href="petmemberForm"
									class="d-flex justify-content-between">
										<p>반려동물 프로필</p>
								</a></li>
								<li><a href="protocol" class="d-flex justify-content-between">
										<p>반려동물 진료기록</p>
								</a></li>
								<li><a href="reservationSelect" class="d-flex justify-content-between">
										<p>예약 내역</p>
								</a></li>
								<li><a href="myPay" class="d-flex justify-content-between">
										<p>결제 내역</p>
								</a></li>
								<li><a href="mycounsel" class="d-flex justify-content-between">
										<p>상담 내역</p>
								</a></li>
								<li><a href="myreport" class="d-flex justify-content-between">
										<p>신고 내역</p>
								</a></li>
								<li><a href="myfallow" class="d-flex justify-content-between">
										<p>팔로우</p>
								</a></li>
								<li><a href="logout" class="d-flex justify-content-between">
										<p>로그아웃</p>
								</a></li>
								<li><a href="mdeleteForm" class="d-flex justify-content-between">
										<p>회원탈퇴</p>
								</a></li>
							</ul>

						</aside>
					</div>
				</div>

				<div class="col-lg-9 posts-list">
					<div class="single-post row">
						<div class="col-lg-12">
							<div class="feature-img">
								<img class="img-fluid"
									src="resources/assets/images/blog-details/feature-img1.jpg"
									alt="">
							</div>
						</div>
						<form action="memberUpdate" enctype="multipart/form-data" method="post">
							<div class="col-lg-12 col-md-12 blog_details">
								<div class="form-group">
									<h5>
										<strong>이름</strong>
									</h5>
									<input type="text"  id="name" name="name"
										value="${member.name}">
								</div>

								<div class="form-group">
									<h5>
										<strong>아이디</strong>
									</h5>
									<input type="email" style="border: none" id="m_id" name="m_id"
										value="${member.m_id}" readonly>
								</div>
								<div class="form-group">
									<h5>
										<strong>비밀번호</strong>
									</h5>
									<input type="password" id="password"
										name="password">
								</div>
								<div class="form-group">
									<h5>
										<strong>비밀번호 재확인</strong>
									</h5>
									<input type="password"  id="password1"
										name="password1">
								</div>
								<div class="form-group">
									<h5>
										<strong>전화번호</strong>
									</h5>
									<input type="text"  id="tel" name="tel"
										value="${member.tel}" >
								</div>
								<div class="form-group">
									<label>프로필 사진</label>
									<div class="input-group col-xs-12">
										<input class="file-upload-browse btn btn-primary" type="file"
											id="file" name="file">
									</div>
								</div>
								<button type="submit" onclick="location.href='memberUpdateForm'"
									class="genric-btn info radius">수정 완료</button>

							</div>
						</form>

						<div class="col-lg-12">
							<div class="quotes">MCSE boot camps have its supporters and
								its detractors. Some people do not understand why you should
								have to spend money on boot camp when you can get the MCSE study
								materials yourself at a fraction of the camp price. However, who
								has the willpower to actually sit through a self-imposed MCSE
								training.</div>
							<div class="row">
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</section>
	<script>
		function addFile() {
			var input = $('<input>').attr({
				'name' : 'multiFileList',
				'type' : 'file'
			});

			$('#ffile').append(input);
		}
	</script>
</body>
</html>