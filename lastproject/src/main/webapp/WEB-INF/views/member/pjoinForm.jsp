<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="float : none; margin : 0 auto 0 auto;" class="col-8 grid-margin stretch-card">
		<div class="main-panel">
			<div class="content-wrapper">
				<div class="card">
					<div class="card-body">
						<h4 class="card-title">내 정보</h4>
						<form class="forms-sample" action="pjoin_1" method="post" enctype="multipart/form-data">
						<div class="form-group">
								<h5> <strong>자격증번호*</strong></h5>
								<input type="text" class="form-control" id="no" name="no" placeholder="자격증번호를 입력하세요">
							</div>
							<div class="form-group">
								<label>수의사&emsp;<input type="radio" id="code" name="code" value="100"><span class="checkmark"></span></label>
								<label>미용사&emsp;<input type="radio" id="code" name="code" value="103"><span class="checkmark"></span></label>
								<label>펫시터&emsp;<input type="radio" id="code" name="code" value="102"><span class="checkmark"></span></label>
								<label>훈련사&emsp;<input type="radio" id="code" name="code" value="101"><span class="checkmark"></span></label>
							</div>
							<div class="form-group">
								<h5> <strong>이름*</strong></h5>
								<input type="text" class="form-control" id="name" name="name" placeholder="이름을 입력하세요">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail3">아이디*</label>
								<input type="email" class="form-control" id="p_id" name="p_id" placeholder="Email">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword4">비밀번호*</label> <input type="password" class="form-control" id="password" name="password"
									placeholder="Password">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword4">비밀번호확인*</label>
								<input type="password" class="form-control" id="password1" name="password1"	placeholder="Password">
							</div>
							<div class="form-group">
								<label for="exampleSelectGender">전화번호*</label>
								<input type="text" class="form-control" id="tel" name="tel"	placeholder="tel">
							</div>
							 <div class="form-group">
								<label>프로필 사진</label>
								<div class="input-group col-xs-12">
								<input  class="file-upload-browse btn btn-primary" type="file" id="file" name ="file">
								</div>
							</div>
							
							<button type="submit" class="btn btn-primary mr-2">다음</button>
							<button class="btn btn-light" onclick="location.href='home'" >취소</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>