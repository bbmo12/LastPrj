<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="resources/login/my-login.css">
</head>
<style>
	#my_section {
		padding: 50px;
	}

	#main-form h3,
	input {
		display: inline-block;
	}

	#addDiv,
	#addService {
		margin: -5px 0 0 35em;
		color: #fff; 
    	background: #0062ff;
    	border: 1px solid transparent;	
    	width: 115px;
	}
	#addDiv:hover,
	#addService:hover{
		color: #0062ff;
		border: 1px solid #0062ff;
		background: #fff;
	}
	#price-insert,
	#time-insert{
		color: #fff; 
    	background: #0062ff;
    	border: 1px solid transparent;	
	}
	
	#price-insert:hover,
	#time-insert:hover{
		color: #0062ff;
		border: 1px solid #0062ff;
		background: #fff;
	}

	#select-one {
		margin-top: -20px;
	}

	.form-control {
		padding: 5px;
		width: 250px;
		display: inline-block;
		border-radius: 20px;
	}


.form-control1 {
		padding: 5px;
		display: inline-block;
		border-radius: 20px;
	}

	.service-info {
		display: inline-grid;
	}

	.service-info input {
		width: 100px;
	}

	#p-info {
		margin-left: 5em;
		margin-top: -20px;
	}

	.delete-button {
		float: right;
		margin: 27px 200px 0 0;
		width: 62px;
	}

	#p_info {
		border: 1px solid rgba(151, 151, 151, 0.3);
		width: 700px;
	}
	#cancel{
		width: 113px;
    	height: 42px;
    	padding: 0 30px;
    	font-size: .8em;
    	text-align: center;
    	font-weight: 500;
	}
	#member_post{
		width: 100px;
    	margin-left: 53em;
    	margin-top: -70px;  	
    	color: #fff; 
    	background: #0062ff;
    	border: 1px solid transparent;	
	}
	#member_post:hover {
		color: #0062ff;
		border: 1px solid #0062ff;
		background: #fff;
	}
	#successUpdate{
		color: #fff; 
    	background: #0062ff;
    	border: 1px solid transparent;	
	}
	#successUpdate:hover {
		color: #0062ff;
		border: 1px solid #0062ff;
		background: #fff;
	}
	
	input:focus,
	textarea:focus{ 
		border: 3px solid;
	}
	
	#content{
		height: 45px;
    	padding: 12px;
   		width: 285px;
	}
	
	.no_deco {
		text-decoration: none !important;
		font-size: 0.8rem !important;
		color: black;
	}

	.blog_right_sidebar {
		box-shadow: 0 .15rem 1.75rem 0 rgba(58, 59, 69, .1) !important;
		border: 1px solid #e3e6f0;
		border-radius: 0.35rem;
		float: none !important;
		margin: 0 auto !important;
		background-color: white;
		width: 250px;
	}

	.partner_img {
		object-fit: cover;
		object-position: top;
		border-radius: 50%;
		width: 180px !important;
		height: 180px !important;
		float: none;
		margin: 0 auto;
	}

	#Mainname {
		font-size: 1.5rem !important;
		font-family: 'NanumBarunGothic' !important;
		font-style: normal !important;
		font-weight: 700 !important;
		color: gray;
	}

	#myinfo {
		font-size: 0.8rem;
		font-family: 'NanumBarunGothic';
		font-style: normal;
		font-weight: 300;
	}

	#menu_bold {
		font-size: 1.0rem;
		font-family: 'NanumBarunGothic';
		font-style: normal;
		font-weight: 700;
		color: black;
	}
	.card {
		box-shadow: 0 .15rem 1.75rem 0 rgba(58, 59, 69, .1) !important;
		border: 1px solid #e3e6f0;
		border-radius: 0.35rem;
		padding: 20px;
	}
	i{
		color: black;
	}
	
	
</style>

	
<body>
	<script>
		//생일 정규식
		var birthJ = /^\d{8}$/;
		//모든 공백 체크 정규식
		var empJ = /\s/g;
		// 이름 정규식
		var nameJ = /* /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/; */ RegExp(/^[가-힣]{2,4}$/);
		// 몸무게
		var weightJ = /^[0-9]{1,3}$/;
		
		
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
	
	<section class="department-area" style="padding: 30px 0 30px;">
		<div class="container">
			<div class="col-lg-6 offset-lg-3">
				<div class="section-top text-center">
					<br><br><br>
					<h2></h2>
				</div>
			</div>
		</div>
	</section>
	<section id="my_section">
		<div class="container" style="max-width: 1350px;">
			<div class="row">
				<div class="col-lg-3">
				<h2 align="center">반려동물 등록</h2>
						<br>
					<div class="blog_right_sidebar">
						<aside class="single_sidebar_widget author_widget">
							<img class="author_img rounded-circle"
								src="resources/upload/${member.picture}" onerror ="this.src='resources/upload/cat.jpg'"  style="width: 210px"; height="167px" 
								alt="">
								<br><br>
							<div class="br"></div>
							<h4 id="Mainname" >${member.name }님</h4>
							<div class="br"></div>
							<div id="myinfo">
								<i class="fa-solid fa-pen"></i>&nbsp;<a class="no_deco" href="confirmPass">반려동물 등록</a>
							</div>
						</aside>
						</div><br>
					<div class="blog_right_sidebar">
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
				<div id="main-form"  style="width: 800px;">
					<div class="card">
						<form action="mypatadd" method="post" enctype="multipart/form-data">
							<div class="form-group">
							<i class="fas fa-user"></i>
								<h3 style="font-weight: bolder;">이름</h3>
								<input type="text" id="name" name="name"  class="form-control" required autofocus>
						<div id="name_check"></div>
							</div>
							<div class="form-group">
							<i class="fa fa-birthday-cake"></i>
									<h3 style="font-weight: bolder;">생년월일</h3>
								<input type="text" id="birth" name="birth" class="form-control" required autofocus>
								<div id="birth_check"></div>
							</div>
							<div class="form-group">
							<i class="fa fa-transgender"></i>
									<h3 style="font-weight: bolder;">성별</h3>
								<!-- 1이면 여자, 2이면 남자  -->
								<label>여자
									<input type="radio" id="gender" name="gender" value="1">
									<span class="checkmark"></span>
								</label>&emsp;
								<label>남자
									<input type="radio" id="gender" name="gender" value="2">
									<span class="checkmark"></span></label>&emsp;
							</div>
							<div class="form-group">
							<i class="fa fa-balance-scale"></i>
								<h3 style="font-weight: bolder;">몸무게</h3>
								<input type="text" id="weight" name="weight" class="form-control" required autofocus>
								<div id="weight_check"></div>
							</div>
							<div class="form-group">
							<i class="fa fa-wikipedia-w"></i>
								<h3 style="font-weight: bolder;">품종</h3>
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
							<i class="fa fa-camera"></i>
							<h3 style="font-weight: bolder;">반려동물 사진</h3>
								<div class="input-group col-xs-12">
								<input class="file-upload-browse btn btn-primary"  type="file" id="file" name="file">
								</div>
							</div>
							<i class="fa fa-text-width"></i>
							<h3 style="font-weight: bolder;">반려동물 설명</h3><br>
								<textarea class="form-control1" id="n_content" name="n_content"
									rows="10" cols="90"></textarea>
							<div align="right">
							<input type="hidden" name="m_id" id="m_id" value="${member.m_id }">
							<button type="submit" class="btn btn-primary">반려동물 등록</button>
							</div>
						</form>
					</div>
				</div>

			</div>
		</div>
	</section>

</body>
</html>