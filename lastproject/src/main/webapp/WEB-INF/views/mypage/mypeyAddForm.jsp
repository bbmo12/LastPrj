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
							<img class="author_img rounded-circle"
								src="resources/upload/${member.picture}" style="width: 210px"
								alt="">
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
								<li><a href="#" class="d-flex justify-content-between">
										<p>예약 내역</p>
								</a></li>
								<li><a href="#" class="d-flex justify-content-between">
										<p>결제 내역</p>
								</a></li>
								<li><a href="#" class="d-flex justify-content-between">
										<p>상담 내역</p>
								</a></li>
								<li><a href="#" class="d-flex justify-content-between">
										<p>신고 내역</p>
								</a></li>
								<li><a href="#" class="d-flex justify-content-between">
										<p>로그아웃</p>
								</a></li>
								<li><a href="#" class="d-flex justify-content-between">
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
						<form action="mypatadd" method="post" enctype="multipart/form-data">
						<div class="col-lg-12 col-md-12 blog_details">
							<div class="form-group">
								<h5>
									<strong>이름</strong>
								</h5>
								<input type="text" id="name" name="name">
							</div>
							<div class="form-group">
								<h5>
									<strong>생년월일</strong>
								</h5>
								<input type="text" id="birth" name="birth">
							</div>
							<div class="form-group">
								<h5>
									<strong>성별</strong>
								</h5>
								<!-- 1이면 여자, 2이면 남자  -->
								<label>여자<input type="radio" id="gender" name="gender"
									value="1"><span class="checkmark"></span></label>&emsp; <label>남자<input
									type="radio" id="gender" name="gender" value="2"><span
									class="checkmark"></span></label>&emsp;
							</div>
							<div class="form-group">
								<h5>
									<strong>몸무게</strong>
								</h5>
								<input type="text" id="weight" name="weight">
							</div>
							<div class="form-group">
								<h5>
									<strong>품종</strong>
								</h5>
								<label>개<input type="radio" id="code" name="code"
									value="501"><span class="checkmark"></span></label>&emsp; <label>고양이<input
									type="radio" id="code" name="code" value="502"><span
									class="checkmark"></span></label>&emsp; <label>조류<input
									type="radio" id="code" name="code" value="503"><span
									class="checkmark"></span></label>&emsp; <label>파충류<input
									type="radio" id="code" name="code" value="504"><span
									class="checkmark"></span></label>&emsp; <label>어류<input
									type="radio" id="code" name="code" value="505"><span
									class="checkmark"></span></label>&emsp; <label>토끼<input
									type="radio" id="code" name="code" value="506"><span
									class="checkmark"></span></label>&emsp; <label>돼지<input
									type="radio" id="code" name="code" value="507"><span
									class="checkmark"></span></label>&emsp; <label>햄스터<input
									type="radio" id="code" name="code" value="508"><span
									class="checkmark"></span></label>&emsp; <label>미어켓<input
									type="radio" id="code" name="code" value="509"><span
									class="checkmark"></span></label>&emsp; <label>여우<input
									type="radio" id="code" name="code" value="510"><span
									class="checkmark"></span></label>&emsp; <label>거미<input
									type="radio" id="code" name="code" value="511"><span
									class="checkmark"></span></label>&emsp;
							</div>
							<div class="form-group">
								<h5>
									<strong>반려동물사진</strong>
								</h5>
								<input type="file" id="file" name="file">
							</div>
							<div class="form-group">
								<h5>
									<strong>반려동물 설명</strong>
								</h5>
								<textarea class="form-control" id="n_content" name="n_content"
									rows="4" cols="130">
                        		</textarea>
							</div>
							<input type="hidden" name="m_id" id="m_id" value="${mId }">
							<button type="submit" class="genric-btn info radius">반려동물
								등록</button>
						</div>
						</form>
					</div>
				</div>

			</div>
		</div>
	</section>

</body>
</html>