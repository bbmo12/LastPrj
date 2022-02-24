<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
						<h4 class="card-title">Basic form elements</h4>
						<p class="card-description">Basic form elements</p>
						<form class="forms-sample" action="mjoin" method="post" enctype="multipart/form-data">
							<div class="form-group">
								<h5> <strong>이름*</strong></h5> <input type="text"
									class="form-control" id="name" name="name" placeholder="이름을 입력하세요">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail3">아이디*</label> <input
									type="email" class="form-control" id="m_id" name="m_id"
									placeholder="Email">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword4">비밀번호*</label> <input
									type="password" class="form-control" id="password" name="password"
									placeholder="Password">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword4">비밀번호확인*</label> <input
									type="password" class="form-control" id="password1" name="password1"
									placeholder="Password">
							</div>
							<div class="form-group">
								<label for="exampleSelectGender">전화번호*</label>
								<input
									type="password" class="form-control" id="tel" name="tel"
									placeholder="tel">
							</div>
							 <div class="form-group">
								<label>프로필 사진</label> <input type="file" name="img[]"
									class="file-upload-default">
								<div class="input-group col-xs-12">
									
										<input  class="file-upload-browse btn btn-primary"
											type="file" id="pfile" name ="pfile">
								
								</div>
							</div>
							<button type="submit" class="btn btn-primary mr-2">회원가입</button>
							<button class="btn btn-light">취소</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>