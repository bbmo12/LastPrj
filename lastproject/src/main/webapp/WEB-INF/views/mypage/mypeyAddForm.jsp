<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
		integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="resources/login/my-login.css">
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
	<script>
		//생일 정규식
		var birthJ = /^\d{8}$/;
		//모든 공백 체크 정규식
		var empJ = /\s/g;
		// 이름 정규식
		var nameJ = /* /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/; */ RegExp(/^[가-힣]{2,4}$/);
		// 몸무게
		var weightJ =^[0-9]{1,3}$/;
		
		
		$(document).ready(function () {
			/* 아이디 중복체크 */
			$('form').on('submit', function () {
				var inval_Arr = new Array(4).fill(false);

				// 생일 정규식
				if (birthJ.test($('#birth').val())) {
					inval_Arr[0] = true;
				} else {
					inval_Arr[0] = false;
					alert('생년월일 8자리 입력하세요.');
					return false;
				}
				
				// 이름 정규식
				if (nameJ.test($('#name').val())) {
					inval_Arr[1] = true;
				} else {
					inval_Arr[1] = false;
					alert('이름을 확인하세요.');
					return false;
				}
				// 몸무게 정규식
				if (weightJ.test($('#weight').val())) {
					inval_Arr[2] = true;
				} else {
					inval_Arr[2] = false;
					alert('몸무게를 확인하세요.');
					return false;
				}
			});
				
				$("#name").blur(function () {
					if (nameJ.test($(this).val())) {
						
						$("#name_check").text('');
					} else {
						$('#name_check').text('한글3자리 이내로 입력하세요.');
						$('#name_check').css('color', 'red');
					}
				});
				
				
				$("#birth").blur(function () {
					if (birthJ.test($(this).val())) {
					
						$("#birth_check").text('');
					} else {
						$('#birth_check').text('생년월일8자리 입력하세요.');
						$('#birth_check').css('color', 'red');
					}
				});
				

			$("#weight").blur(function () {
				if (nameJ.test($(this).val())) {
					console.log(nameJ.test($(this).val()));
					$("#weight_check").text('');
				} else {
					$('#weight_check').text('3자리 이하 숫자만 입력하세요.');
					$('#weight_check').css('color', 'red');
				}
			});
			
			
		});
	</script>
	
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
								src="resources/upload/${member.picture}" onerror ="this.src='resources/upload/cat.jpg'"  style="width: 210px"
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
									src="resources/assets/images/blog-details/feature-img1.jpg" onerror ="this.src='resources/upload/cat.jpg'" 
									alt="">
							</div>
						</div>
						<form action="mypatadd" method="post" enctype="multipart/form-data">
						<div class="col-lg-12 col-md-12 blog_details">
							<div class="form-group">
									<h3 style="font-weight: bolder;">이름&nbsp;:&nbsp;</h3>
								<input type="text" id="name" name="name">
						<div id="name_check"></div>
							</div>
							<div class="form-group">
									<h3 style="font-weight: bolder;">생년월일&nbsp;:&nbsp;</h3>
								<input type="text" id="birth" name="birth">
								<div id="birth_check"></div>
							</div>
							<div class="form-group">
									<h3 style="font-weight: bolder;">성별&nbsp;:&nbsp;</h3>
								<!-- 1이면 여자, 2이면 남자  -->
								<label>여자<input type="radio" id="gender" name="gender"
									value="1"><span class="checkmark"></span></label>&emsp; <label>남자<input
									type="radio" id="gender" name="gender" value="2"><span
									class="checkmark"></span></label>&emsp;
							</div>
							<div class="form-group">
									<h3 style="font-weight: bolder;">몸무게&nbsp;:&nbsp;</h3>
								<input type="text" id="weight" name="weight">
								<div id="weight_check"></div>
							</div>
							<div class="form-group">
									<h3 style="font-weight: bolder;">품종&nbsp;:&nbsp;</h3>
								<label>개<input type="radio" id="code" name="code" value="501"><span class="checkmark"></span></label>&emsp;
								<label>고양이<input type="radio" id="code" name="code" value="502"><span class="checkmark"></span></label>&emsp;
								<label>조류<input type="radio" id="code" name="code" value="503"><span class="checkmark"></span></label>&emsp;
								<label>파충류<input type="radio" id="code" name="code" value="504"><span class="checkmark"></span></label>&emsp;
								<label>어류<input type="radio" id="code" name="code" value="505"><span class="checkmark"></span></label>&emsp;
								<label>토끼<input type="radio" id="code" name="code" value="506"><span class="checkmark"></span></label>&emsp;
								<label>돼지<input type="radio" id="code" name="code" value="507"><span class="checkmark"></span></label>&emsp;
								<label>햄스터<input type="radio" id="code" name="code" value="508"><span class="checkmark"></span></label>&emsp;
								<label>미어켓<input type="radio" id="code" name="code" value="509"><span class="checkmark"></span></label>&emsp;
								<label>여우<input type="radio" id="code" name="code" value="510"><span class="checkmark"></span></label>&emsp;
								<label>거미<input	 type="radio" id="code" name="code" value="511"><span class="checkmark"></span></label>&emsp;
							</div>
							<div class="form-group">
									<h3 style="font-weight: bolder;">반려동물 사진&nbsp;:&nbsp;</h3>
								<input type="file" id="file" name="file">
							</div>
							<div class="form-group">
									<h3 style="font-weight: bolder;">반려동물 설명&nbsp;:&nbsp;</h3>
								<textarea class="form-control" id="n_content" name="n_content"
									rows="4" cols="130"></textarea>
							</div>
							<input type="hidden" name="m_id" id="m_id" value="${member.m_id }">
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