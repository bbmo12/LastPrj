<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container-scroller">
		<div class="container-fluid page-body-wrapper full-page-wrapper">
			<div class="content-wrapper d-flex align-items-center auth">
				<div class="row flex-grow">
					<div class="col-lg-4 mx-auto">
						<div class="auth-form-light text-left p-5">
							<div  align="center" class="auth-link text-black">일반회원 아이디 찾기</div>
								<form class="pt-3" action="login" method="post">
									<div class="form-group">
										<input type="text" class="form-control form-control-lg"
											id="name" name="m_id" placeholder="이름을 입력하세요">
									</div>
									<div class="form-group">
										<input type="password" class="form-control form-control-lg"
											id="password" name="password" placeholder="전화번호를 입력하세요">
									</div>
									<div class="mt-3">
										<button type="submit"
											class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn">아이디찾기</button>
									</div>
									<div
										class="my-2 d-flex justify-content-between align-items-center">
										<div class="form-check">
											<label class="form-check-label text-muted"> <!-- <input type="checkbox" class="form-check-input"> Keep me signed in </label> -->
										</div>

									</div>
									<div class="mb-2">
										<button type="button"
											class="btn btn-block btn-facebook auth-form-btn">
											<i class="mdi mdi-facebook mr-2"></i>Connect using facebook
										</button>
									</div>
									<div align="center">
										<a href="memberIdSearchForm" class="auth-link text-black">아이디 찾기</a> / <a
											href="#" class="auth-link text-black">비밀번호 찾기</a>
									</div>
									<div class="text-center mt-4 font-weight-light">
										계정이 없으신가요? <a href="singup" class="text-primary">회원가입</a>
									</div>
								</form> 


						
						</div>
					</div>
				</div>
			</div>
			<!-- content-wrapper ends -->
		</div>
		<!-- page-body-wrapper ends -->
	</div>
</body>
</html>