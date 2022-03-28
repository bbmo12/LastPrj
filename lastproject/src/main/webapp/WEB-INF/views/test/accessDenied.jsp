<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>

.to_home{
	font-family: 'Binggrae';
	font-size: 1.0rem;
}

</style>
<body>
<div class="container-scroller">
      <div class="container-fluid page-body-wrapper full-page-wrapper">
        <div class="content-wrapper d-flex align-items-center text-center error-page">
          <div class="row flex-grow">
            <div class="col-lg-7 mx-auto text-white">
              <div class="row align-items-center d-flex flex-row">
                <div class="col-lg-6 text-lg-right pr-lg-4">
                  <!-- <h1 class="display-1 mb-0">404</h1> -->
                  <img src="resources/upload/playing_fetch.png" style="width:700px; height:500px;">
                </div>
                <div class="col-lg-6 error-page-divider text-lg-left pl-lg-4">
                  <h1>SORRY!</h1>
                  <h3 class="font-weight-light">이 페이지에 접근할 수 있는 권한이 없습니다.</h3>
                </div>
              </div>
              <div class="row mt-5">
                <div class="col-12 text-center mt-xl-2">
                  <a class="to_home" href="home">홈으로 돌아가기</a>
                </div>
              </div>
              <div class="row mt-5">
                <div class="col-12 mt-xl-2">
                 <!--  <p class="text-white font-weight-medium text-center">Copyright &copy; 2020 All rights reserved.</p> -->
                </div>
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