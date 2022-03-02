<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/org/js/jquery-3.3.1.min.js"></script>
</head>
<body>
	<div class="container-scroller">
		<div class="container-fluid page-body-wrapper full-page-wrapper">
			<div class="content-wrapper d-flex align-items-center auth">
				<div class="row flex-grow">
					<div class="col-lg-4 mx-auto">
						<div class="auth-form-light text-left p-5">
							<!-- <div class="brand-logo">
                  <img src="resources/assets123/images/logo-dark.svg">
                </div> -->
							<div align="center">
								<button onclick="mlogin()" class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn">일반회원
								</button>
								<button onclick="plogin()" class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn">파트너회원
								</button>
							</div>
							<div id="test">
								<form class="pt-3" action="login" method="post">
									<div class="form-group">
										<input type="email" class="form-control form-control-lg"
											id="m_id" name="m_id" placeholder="abc@naver.com">
									</div>
									<div class="form-group">
										<input type="password" class="form-control form-control-lg"
											id="password" name="password" placeholder="Password">
									</div>
									<div class="mt-3">
										<button type="submit"
											class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn">로그인</button>
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
										계정이 없으신가요? <a href="joinForm" class="text-primary">회원가입</a>
									</div>
								</form> 


							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- content-wrapper ends -->
		</div>
		<!-- page-body-wrapper ends -->
	</div>

	<script type="text/javascript">
    function mlogin(){
    	
    	$("#test").empty();
    	
    	var loginForm =`
    		<form class="pt-3" action="login" method="post">
			<div class="form-group">
				<input type="email" class="form-control form-control-lg"
					id="m_id" name="m_id" placeholder="abc@naver.com">
			</div>
			<div class="form-group">
				<input type="password" class="form-control form-control-lg"
					id="password" name="password" placeholder="Password">
			</div>
			<div class="mt-3">
				<button type="submit"
					class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn">로그인</button>
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
				계정이 없으신가요? <a href="joinForm" class="text-primary">회원가입</a>
			</div>
		</form>`
      
      $("#test").append(loginForm);
    	
    }
    
    
    
function plogin(){
    	
	$("#test").empty();
	
	var loginForm =`
		<form class="pt-3" action="plogin" method="post">
		<div class="form-group">
			<input type="email" class="form-control form-control-lg"
				id="p_id" name="p_id" placeholder="abc@naver.com">
		</div>
		<div class="form-group">
			<input type="password" class="form-control form-control-lg"
				id="password" name="password" placeholder="Password">
		</div>
		<div class="mt-3">
			<button type="submit"
				class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn">로그인</button>
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
			계정이 없으신가요? <a href="pjoinForm" class="text-primary">회원가입</a>
		</div>
	</form>`
  
  $("#test").append(loginForm);
	
}
    	
    
    
    
    </script>
</body>
</html>