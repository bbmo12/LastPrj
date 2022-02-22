<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <style>
      .modal {
        position: absolute;
        top: 0;
        left: 0;

        width: 100%;
        height: 100%;

        display: none;

        background-color: rgba(0, 0, 0, 0.4);
      }

      .modal.show {
        display: block;
      }

      .modal_body {
        position: absolute;
        top: 50%;
        left: 50%;

        width: 500px;
        height: 600px;

        padding: 40px;

        text-align: center;

        background-color: rgb(255, 255, 255);
        border-radius: 10px;
        box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);

        transform: translateX(-50%) translateY(-50%);
      }
    </style>
</head>
<body>
	<div class="container-scroller">
		<div class="container-fluid page-body-wrapper full-page-wrapper">
			<div class="content-wrapper d-flex align-items-center auth">
				<div class="row flex-grow">
					<div class="col-lg-4 mx-auto">
						<div class="auth-form-light text-left p-5">
							<div align="center">
								<button onclick="mIdSearch()"
									class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn">일반회원
								</button>
								<button onclick="pIdSearch()"
									class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn">파트너회원
								</button>
							</div>
							<br>
							<div id="test">
								<div align="center" class="auth-link text-black">일반회원 아이디 찾기</div> 
								<div>이름, 전화번호로 아이디를 찾습니다.</div>
								<form class="pt-3" action="#" method="post">
									<div class="form-group">
										<div class="auth-link text-black">이름</div>
										<input type="text" class="form-control form-control-lg"
											id="name" name="name" placeholder="이름을 입력하세요">
									</div>
									<div cl 
									ass="form-group">
										<div class="auth-link text-black">전화번호</div>
										<input type="password" class="form-control form-control-lg"
											id="tel" name="tel" placeholder="ex)01011112222">
									</div>
									<div class="mt-3">
										<button type="button"
											class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" id="memIdsearch_btn">아이디찾기</button>
									</div>
									<div
										class="my-2 d-flex justify-content-between align-items-center">
										<div class="form-check">
											<label class="form-check-label text-muted"> <!-- <input type="checkbox" class="form-check-input"> Keep me signed in </label> -->
										</div>

									</div>
									<div class="mb-2"></div>
									<div align="center">
										<a href="#" class="auth-link text-black">비밀번호 찾기</a>
									</div>
									<div class="text-center mt-4 font-weight-light">
										계정이 없으신가요? <a href="singup" class="text-primary">회원가입</a>
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
	 <div class="modal">
	 <!-- 모달 띄운후 내용입력부분 바디.  -->
	 <div class="modal_body"> 함수호출하고
	 
	 
	 </div>
	 
	 </div>

	
    
<script>
      const body = document.querySelector('body');
      const modal = document.querySelector('.modal');
      const btnOpenPopup = document.querySelector('#memIdsearch_btn');

      btnOpenPopup.addEventListener('click', () => {
        modal.classList.toggle('show');

        if (modal.classList.contains('show')) {
          body.style.overflow = 'hidden';
        }
      });

      modal.addEventListener('click', (event) => {
        if (event.target === modal) {
          modal.classList.toggle('show');

          if (!modal.classList.contains('show')) {
            body.style.overflow = 'auto';
          }
        }
      });
    </script>



	<script type="text/javascript">
    function mIdSearch(){
    	
    	$("#test").empty();
    	
    	var mIdSearchForm =`
    		<div align="center" class="auth-link text-black">일반회원 아이디
			찾기</div>
		<div>이름, 전화번호로 아이디를 찾습니다.</div>
		<form class="pt-3" action="login" method="post">
			<div class="form-group">
				<div class="auth-link text-black">이름</div>
				<input type="text" class="form-control form-control-lg"
					id="name" name="m_id" placeholder="이름을 입력하세요">
			</div>
			<div class="form-group">
				<div class="auth-link text-black">전화번호</div>
				<input type="password" class="form-control form-control-lg"
					id="password" name="password" placeholder="ex)01011112222">
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
			<div class="mb-2"></div>
			<div align="center">
				<a href="#" class="auth-link text-black">비밀번호 찾기</a>
			</div>
			<div class="text-center mt-4 font-weight-light">
				계정이 없으신가요? <a href="singup" class="text-primary">회원가입</a>
			</div>
		</form>`
      
      $("#test").append(mIdSearchForm);
    	
    }
    
    
    
function plogin(){
    	
	$("#test").empty();
	
	var pIdSearch =`
		<div align="center" class="auth-link text-black">일반회원 아이디
		찾기</div>
	<div>이름, 전화번호로 아이디를 찾습니다.</div>
	<form class="pt-3" action="login" method="post">
		<div class="form-group">
			<div class="auth-link text-black">이름</div>
			<input type="text" class="form-control form-control-lg"
				id="name" name="m_id" placeholder="이름을 입력하세요">
		</div>
		<div class="form-group">
			<div class="auth-link text-black">전화번호</div>
			<input type="password" class="form-control form-control-lg"
				id="password" name="password" placeholder="ex)01011112222">
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
		<div class="mb-2"></div>
		<div align="center">
			<a href="#" class="auth-link text-black">비밀번호 찾기</a>
		</div>
		<div class="text-center mt-4 font-weight-light">
			계정이 없으신가요? <a href="singup" class="text-primary">회원가입</a>
		</div>
	</form>`
  
  $("#test").append(pIdSearch);
}
</body>
</html>