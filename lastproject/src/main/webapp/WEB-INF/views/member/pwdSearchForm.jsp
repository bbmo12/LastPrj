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

<body class="my-login-page">
   <section class="h-100" id="main">
      <div class="container h-100">
         <div class="row justify-content-md-center align-items-center h-100">
            <div class="card-wrapper">
               <div class="brand">
                  <img src="resources/login/logo.jpg" alt="logo">
               </div>
               
               <div class="card fat" style="margin-top: -35px;">
                  <div class="card-body">
                     <h4 class="card-title">비밀번호 찾기</h4>
                     <div id="test">
                        <form method="POST" action="searchPassword" class="my-login-validation">
                           <div class="form-group">
                              <label>아이디</label>
                              <input id="id" name="id" type="text" class="form-control" placeholder="아이디를 입력하세요"
                                 required="required" autofocus>
                           </div>
                           <div class="form-group m-0">
                              <button type="submit" class="btn btn-primary btn-block">
                                 비밀번호찾기
                              </button>
                           </div>
                           <div class="mt-4 text-center">
                              아이디를 잊으셨나요?<a href="memberIdSearchForm" class="text-primary">아이디찾기</a>
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

<script>
var result = '${resultMsg2}';
if(result === 'result2'){
	alert("아이디를 확인해주세요.");
}
</script>
</body>

</html>