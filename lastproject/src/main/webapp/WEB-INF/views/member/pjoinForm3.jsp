<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="float: none; margin: 0 auto 0 auto;"
		class="col-8 grid-margin stretch-card">
		<div class="main-panel">
			<div class="content-wrapper">
				<div class="card">
					<div class="card-body">
						<h4 class="card-title">회사 정보</h4>
						<form class="forms-sample" action="pjoin_2" method="post">
							<div class="form-group">
								<label for="exampleInputPassword4">파트너회원id</label> <input
									type="text" class="form-control" id="p_id" name="p_id"
									value="${p_id.p_id}" placeholder="">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword4">월요일</label>
								 <input
									type="text" class="form-control" id="p_id" name="p_id"
									value="${p_id.p_id}" placeholder="">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword4">화요일</label>
								 <input
									type="text" class="form-control" id="" name=""
									value="${p_id.p_id}" placeholder="">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword4">수요일</label> <input
									type="text" class="form-control" id="" name=""
									value="${p_id.p_id}" placeholder="">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword4">목요일</label> <input
									type="text" class="form-control" id="" name=""
									value="${p_id.p_id}" placeholder="">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword4">금요일</label> <input
									type="text" class="form-control" id="" name=""
									value="${p_id.p_id}" placeholder="">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword4">토요일</label> <input
									type="text" class="form-control" id="" name=""
									value="${p_id.p_id}" placeholder="">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword4">일요일</label> <input
									type="text" class="form-control" id="" name=""
									value="${p_id.p_id}" placeholder="">
							</div>
						</form>

						<h4 class="card-title">이미지를 등록하세요</h4>
						<form class="forms-sample" action="pjoin_3" method="post"
							enctype="multipart/form-data">
							<div class="form-group">
								<label for="exampleInputPassword4">자격증 사진</label> <input
									type="file" name="multiFileList1" multiple class="form-control">
								<button type="button" onclick="addFile1()">+</button>
								<br>
								<div id="ffile1"></div>
							</div>

							<div class="form-group">
								<label for="exampleInputPassword4">활동 사진</label> <input
									type="file" name="multiFileList2" multiple class="form-control">
								<button type="button" onclick="addFile2()">+</button>
								<br>
								<div id="ffile2"></div>
							</div>

							<button type="submit" class="btn btn-primary mr-2">완료</button>
							<button class="btn btn-light" onclick="location.href='home'">취소</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>