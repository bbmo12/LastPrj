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
								<label for="exampleInputPassword4">회사명</label> <input
									type="text" class="form-control" id="w_name" name="w_name"
									placeholder="회사명">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword4">사업자번호</label> <input
									type="text" class="form-control" id="businessnumber"
									name="businessnumber" placeholder="사업자번호">
							</div>
							<div class="form-group">
								<button type="button" readonly onclick="findAddr()"
									id="member_post" name="member_post">버튼</button>
								<label for="exampleInputPassword4">주소</label> <input type="text"
									class="form-control" id="w_address" name="w_address"
									placeholder="회사주소">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword4">상세 주소</label> <input
									type="text" class="form-control" id="w_d_address"
									name="w_d_address" placeholder="상세주소">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword4">전화번호</label> <input
									type="text" class="form-control" id="w_tel" name="w_tel"
									placeholder="회사전화번호">
							</div>
							<h4 class="card-title">소개글</h4>
							<div class="form-group">
								<label for="exampleInputPassword4">이용 안내</label>
								<textarea class="form-control" id="p_info" name="p_info"
									placeholder="이용안내" rows="10" cols="130">
                        		</textarea>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword4">대표경력</label>
								<textarea class="form-control" id="career" name="career"
									placeholder="대표경력" rows="4" cols="130">
                        		</textarea>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword4">전문분야</label>
								<textarea class="form-control" id="speciality" name="speciality"
									placeholder="전문분야" rows="4" cols="130">
                        </textarea>
							</div>

							<button type="submit" class="btn btn-primary mr-2">다음</button>
							<button class="btn btn-light" onclick="location.href='home'">취소</button>
						</form>

						<h4 class="card-title">이미지를 등록하세요</h4>
						<form class="forms-sample" action="pjoin_3" method="post" enctype="multipart/form-data">
							<div class="form-group">
								<label for="exampleInputPassword4">자격증 사진</label> 
								<input type="file" name="multiFileList1" multiple class="form-control">
								<button type="button" onclick="addFile1()">+</button>
								<br>
								<div id="ffile1"></div>
							</div>

							<div class="form-group">
								<label for="exampleInputPassword4">활동 사진</label> 
								<input type="file" name="multiFileList2" multiple class="form-control">
								<button type="button" onclick="addFile2()">+</button>
								<br>
								<div id="ffile2"></div>
							</div>


							<!-- 파일 : <input type="file" name="multiFileList1" multiple>
							<button type="button" onclick="addFile1()">+</button>
							<br>
							<div id="ffile1"></div> -->

							<!-- 파일 : <input type="file" name="multiFileList2" multiple>
							<button type="button" onclick="addFile2()">+</button>
							<br>
							<div id="ffile2"></div> -->

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