<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body {
		background-size: cover;
		background-repeat: no-repeat;
		background-color: #fff;
	}
	.options {
		transform: translateY(-35px);
	}
	.options {
		width: 100%;
		display: flex;
		flex-wrap: wrap;
		align-items: center;
		justify-content: space-evenly;
	}
</style>
</head>
<body class="my-login-page">
	<section>
		<div class="container h-100">
			<div class="row justify-content-md-center h-100" style="margin-top: 8em;">
				<div class="card-wrapper">
					<div class="brand" align="center">
						<img src="resources/login/logo.jpg" alt="logo">
					</div>
					<div class="options">
						<button onclick="mlogin()" class="btn btn-primary btn-block" id="regular"
							style="width: 200px; margin-top: 5px;">일반회원</button>
						<button onclick="plogin()" class="btn btn-primary btn-block" id="partner" 
							style="width: 200px;">파트너회원</button>
					</div>
					<div class="card fat" style="margin-top: -35px;">
						<div class="card-body" >
							<h2 class="card-title" align="center">일반회원 회원가입</h4><br><br>
							<div id="test">
									<div class="form-group" align="center">
										<h3>반반반에 오신 것을 환영합니다.</h3>
										<h4>지금 회원 가입 하신 후 반반반의 다양한 서비스를 만나보세요.</h4>
										</div>
										<div align="center">
										<button onclick="location.href='joinForm'" class="btn btn-primary mr-2" style="width: 300px;">회원가입   </button>
										</div>
									<div>
									<h4>회원가입 유의사항</h4>
									<h5>회원가입은 간단한 정보입력만으로 가입이 가능합니다. 서비스 이용시 실명인증등 필요로 하지 않습니다 </h5>
									
									</div>	
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
</html>