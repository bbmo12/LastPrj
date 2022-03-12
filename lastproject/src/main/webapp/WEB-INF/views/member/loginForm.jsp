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
	body {
         background-image: url("${pageContext.request.contextPath}/resources/upload/jjan.gif");
         background-size: cover;
         background-repeat: no-repeat;
         background-color: #fff;
      } 
</style>

<body class="my-login-page">
	<section class="h-100">
		<div class="container h-100">
			<div class="row justify-content-md-center h-100" style="margin-top: 8em;">
				<div class="card-wrapper">
					<div class="brand">
						<img src="resources/login/logo.jpg" alt="logo">
					</div>
						<button onclick="mlogin()" class="btn btn-primary btn-block" id="regular" 
						style="width: 200px;position: relative; left: 199px; bottom: -58px;">일반회원</button>
						<button onclick="plogin()" class="btn btn-primary btn-block" id="partner" style="width: 200px;">파트너회원</button>
					<div class="card fat">
						<div class="card-body">
							<h4 class="card-title">Login</h4>
							<div id="test">
								<form class="my-login-validation" action="login" method="post">
									<div class="form-group">
										<label for="email">E-Mail Address
											<a href="memberIdSearchForm" class="float-right">
												아이디찾기
											</a>
										</label>
										<input type="email" id="id" name="id" class="form-control" value="" required
											autofocus>
										<div class="invalid-feedback">
											Email is invalid
										</div>
									</div>
									<div class="form-group">
										<label for="password">Password
											<a href="forgot.html" class="float-right">
												비밀번호찾기
											</a>
										</label>
										<input id="password" name="password" type="password" class="form-control"
											name="password" required data-eye>
										<div class="invalid-feedback">
											Password is required
										</div>
									</div>
									<div class="form-group m-0">
										<button type="submit" class="btn btn-primary btn-block">
											Login
										</button>
									</div>
									<div class="form-group m-0">
										<a href="javascript:void(0)">
											<img alt="" src="resources/upload/kakaologin.png" onclick="kakaoLogin();"
												style="width: 298px; height: 50px; margin-top: 10px;">
										</a>
									</div>
									<div class="mt-4 text-center">
										계정이 없으신가요?<a href="joinForm" class="text-primary">회원가입</a>
									</div>
								</form>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</section>
	<script src="resources/login/my-login.js"></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script type="text/javascript">
		function mlogin() {
			$('#partner').attr("disabled", true);
			$("#test").empty();
			var loginForm = `
				<form class="my-login-validation" action="login" method="post">
				<div class="form-group">
					<label for="email">E-Mail Address
						<a href="memberIdSearchForm" class="float-right">
							아이디찾기
						</a>
					</label>
					<input type="email" id="id" name="id" class="form-control" value="" required autofocus>
					<div class="invalid-feedback">
						Email is invalid
					</div>
				</div>
				<div class="form-group">
					<label for="password">Password
						<a href="forgot.html" class="float-right">
							비밀번호찾기
						</a>
					</label>
					<input id="password" name="password" type="password" class="form-control"
						name="password" required data-eye>
					<div class="invalid-feedback">
						Password is required
					</div>
				</div>
				<div class="form-group m-0">
					<button type="submit" class="btn btn-primary btn-block">
						Login
					</button>
				</div>
				<div class="form-group m-0">
				<a href="javascript:void(0)">
					<img alt="" src="resources/upload/kakaologin.png"onclick="kakaoLogin();" style="width: 298px; height: 50px; margin-top: 10px;">
				</a>
				</div>
				<div class="mt-4 text-center">
					계정이 없으신가요?<a href="joinForm" class="text-primary">회원가입</a>
				</div>
			</form>`
			$("#test").append(loginForm);
		}

		function plogin() {
			$('#regular').attr("disabled", true);
			$("#test").empty();
			var loginForm = `
				<form class="my-login-validation" action="plogin" method="post">
				<div class="form-group">
					<label for="email">E-Mail Address
						<a href="memberIdSearchForm" class="float-right">
							아이디찾기
						</a>
					</label>
					<input type="email" id="id" name="id" class="form-control" value="" required autofocus>
					<div class="invalid-feedback">
						Email is invalid
					</div>
				</div>
				<div class="form-group">
					<label for="password">Password
						<a href="forgot.html" class="float-right">
							비밀번호찾기
						</a>
					</label>
					<input id="password" name="password" type="password" class="form-control"
						name="password" required data-eye>
					<div class="invalid-feedback">
						Password is required
					</div>
				</div>
				<div class="form-group m-0">
					<button type="submit" class="btn btn-primary btn-block">
						Login
					</button>
				</div>
				<div class="form-group m-0">
				<a href="javascript:void(0)">
					<img alt="" src="resources/upload/kakaologin.png"onclick="kakaoLogin();" style="width: 298px; height: 50px; margin-top: 10px;">
				</a>
				</div>
				<div class="mt-4 text-center">
					계정이 없으신가요?<a href="joinForm" class="text-primary">회원가입</a>
				</div>
			</form>`
			$("#test").append(loginForm);
		}

		function login() {
			$.ajax({
				url: 'geturi.do',
				type: 'get',
				async: false,
				dataType: 'text',
				success: function (res) {
					location.href = res;
				}
			});
		}
	</script>
	<script>
		//카카오로그인
		function kakaoLogin() {
			$.ajax({
				url: 'geturi.do',
				type: 'get',
				async: false,
				dataType: 'text',
				success: function (res) {
					location.href = res;
				}
			});
		}
		function kakaoLogout() {
			if (Kakao.Auth.getAccessToken()) {
				Kakao.API.request({
					url: '/v1/user/unlink',
					success: function (response) {
						console.log(response)
					},
					fail: function (error) {
						console.log(error)
					},
				})
				Kakao.Auth.setAccessToken(undefined)
			}
		}
		$(document).ready(
			function () {
				var kakaoInfo = '${kakaoInfo}';
				if (kakaoInfo != "") {
					var data = JSON.parse(kakaoInfo);
					alert("카카오로그인 성공 \n accessToken : " +
						data['accessToken']);
					alert("user : \n" + "email : " + data['email'] +
						"\n nickname : " + data['nickname']);
				}
			});
	</script>
</body>

</html>