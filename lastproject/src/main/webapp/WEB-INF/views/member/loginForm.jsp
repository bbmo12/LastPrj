<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
	body{
	
		background-image: url("${pageContext.request.contextPath}/resources/upload/back2.png");
		background-size: cover;
		background-repeat: no-repeat;
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
					<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
					 	<script>alert("아이디, 비밀번호를 확인하세요.");</script>
						<c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session"/>
					</c:if>
					<div class="card fat" style="margin-top: -35px;
					box-shadow: 0 .15rem 1.75rem 0 rgba(58,59,69,.1)!important;
					border: 1px solid #e3e6f0;">
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
											<a href="pwdSearchForm" class="float-right">
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
											<img alt="" src="resources/upload/kakaoo.png" onclick="kakaoLogin();"
												style="width: 298px; height: 50px; margin-top: 10px;">
										</a>
									</div>
									<div class="mt-4 text-center">
										계정이 없으신가요?<a href="join" class="text-primary">회원가입</a>
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

	
	var result = '${resultMsg1}';
	if(result === 'result1'){
		alert("임시 비밀번호가 발급되었습니다. 메일을 확인해주세요.");
	}
		/* function login() {
			$.ajax({
				url: 'geturi.do',
				type: 'get',
				async: false,
				dataType: 'text',
				success: function (res) {
					location.href = res;
				}
			});
		} */
	</script>
	<script>
			//Kakao.init('47ef13464842c3a22235787a9d64e6fc');
		//카카오로그인
		function kakaoLogin() {
			/* console.log(Kakao.isInitialized());
			Kakao.Auth.login({
				success : function(result){
					Kakao.API.request({
						url : '/v2/user/me',
						success : function(result){
							console.log(result.kakao_account.email)
						},
						fail : function(error){
							console.log(error)
						},
					})
				},
				fail : function(error){
					console.log(error);
				}
			}) */
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