<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	background-image:
		url("${pageContext.request.contextPath}/resources/upload/back2.png");
	background-size: cover;
	background-repeat: no-repeat;
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
	<section class="h-100">
		<div class="container h-100">
			<div class="row justify-content-md-center h-100"
				style="margin-top: 8em;">
				<div class="card-wrapper">
				<div id="test">
					<div class="brand" align="center">
						<img src="resources/login/logo.jpg" alt="logo">
						
							<h2 align="center">일반회원 회원가입</h2>
							<br> <br> <br>
						</div>
						<div class="options">

							<button onclick="mlogin()" class="btn btn-primary btn-block"
								id="regular" style="width: 200px; margin-top: 4px;">일반회원</button>
							<button onclick="plogin()" class="btn btn-primary btn-block"
								id="partner" style="width: 200px;">파트너회원</button>

						</div>
						<br>
						<div class="card-body">
							<div class="card fat"
								style="margin-top: -35px; box-shadow: 0 .15rem 1.75rem 0 rgba(58, 59, 69, .1) !important; border: 1px solid #e3e6f0;">
								<div class="card-body">
									<br> <br>

									<div class="form-group" align="center">
										<h3>반반반에 오신 것을 환영합니다.</h3>
										<h4>지금 회원 가입 하신 후 반반반의 다양한 서비스를 만나보세요.</h4>
									</div>
									<div align="center">
										<button onclick="location.href='joinForm'"
											class="btn btn-primary mr-2" style="width: 250px;">가입하기</button>
									</div>
									<br> <br> <br>
									<div>
										<h4>회원가입 유의사항</h4>
										<h5>회원가입은 간단한 정보입력만으로 가입이 가능합니다. 서비스 이용시 실명인증등 필요로 하지
											않습니다</h5>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<script type="text/javascript">
	function mlogin(){
		$("#test").empty();
		var loginForm =`
			<div class="brand" align="center">
			<img src="resources/login/logo.jpg" alt="logo">
			<h2 align="center">일반회원 회원가입</h2>
			<br> <br> <br>
		</div>
		<div class="options">

			<button onclick="mlogin()" class="btn btn-primary btn-block"
				id="regular" style="width: 200px; margin-top: 4px;">일반회원</button>
			<button onclick="plogin()" class="btn btn-primary btn-block"
				id="partner" style="width: 200px;">파트너회원</button>

		</div>
		<br>
		<div class="card-body">
			<div class="card fat"
				style="margin-top: -35px; box-shadow: 0 .15rem 1.75rem 0 rgba(58, 59, 69, .1) !important; border: 1px solid #e3e6f0;">
				<div class="card-body">
					<br> <br>

					<div class="form-group" align="center">
						<h3>반반반에 오신 것을 환영합니다.</h3>
						<h4>지금 회원 가입 하신 후 반반반의 다양한 서비스를 만나보세요.</h4>
					</div>
					<div align="center">
						<button onclick="location.href='joinForm'"
							class="btn btn-primary mr-2" style="width: 250px;">가입하기</button>
					</div>
					<br> <br> <br>
					<div>
						<h4>회원가입 유의사항</h4>
						<h5>회원가입은 간단한 정보입력만으로 가입이 가능합니다. 서비스 이용시 실명인증등 필요로 하지
							않습니다</h5>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
</div>
</section>
		`
	
		
		
		
		$("#test").append(loginForm);
	}
	
	
	
	
	function plogin(){
		$("#test").empty();
		var loginForm =`
			<div class="brand" align="center">
			<img src="resources/login/logo.jpg" alt="logo">
			
				<h2 align="center">파트너회원 회원가입</h2>
				<br> <br> <br>
			</div>
			<div class="options">

				<button onclick="mlogin()" class="btn btn-primary btn-block"
					id="regular" style="width: 200px; margin-top: 4px;">일반회원</button>
				<button onclick="plogin()" class="btn btn-primary btn-block"
					id="partner" style="width: 200px;">파트너회원</button>

			</div>
			<br>
			<div class="card-body">
				<div class="card fat"
					style="margin-top: -35px; box-shadow: 0 .15rem 1.75rem 0 rgba(58, 59, 69, .1) !important; border: 1px solid #e3e6f0;">
					<div class="card-body">
						<br> <br>

						<div class="form-group" align="center">
							<h3>반반반에 오신 것을 환영합니다.</h3>
							<h4>지금 회원 가입 하신 후 반반반의 다양한 서비스를 만나보세요.</h4>
						</div>
						<div align="center">
							<button onclick="location.href='pjoinForm'"
								class="btn btn-primary mr-2" style="width: 250px;">가입하기</button>
						</div>
						<br> <br> <br>
						<div>
							<h4>회원가입 유의사항</h4>
							<h5>회원가입은 간단한 정보입력만으로 가입이 가능합니다. 서비스 이용시 실명인증등 필요로 하지
								않습니다</h5>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
</section>
		`
		$("#test").append(loginForm);
	}
	</script>
</body>
</html>