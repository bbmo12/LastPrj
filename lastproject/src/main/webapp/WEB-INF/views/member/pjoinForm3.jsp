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
						<h4 class="card-title">이미지를 등록하세요</h4>
					
						<form class="forms-sample" action="pjoin_3" method="post"
							enctype="multipart/form-data">
							<div class="form-group">
								<label for="exampleInputPassword4">파트너회원id</label> <input
									type="text" class="form-control" id="p_id" name="p_id" value="${p_id.p_id}"
									placeholder="">
							</div>
							
							파일 : <input type="file" name="multiFileList1" multiple>
										<button type="button" onclick="addFile1()">+</button>
										<br>
										<div id="ffile1"></div>
										
							파일 : <input type="file" name="multiFileList2" multiple>
										<button type="button" onclick="addFile2()">+</button>
										<br>
										<div id="ffile2"></div>
							
							<button type="submit" class="btn btn-primary mr-2">완료</button>
							<button class="btn btn-light" onclick="location.href='home'">취소</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script>
		function addFile1() {
			var input = $('<input>').attr({
				'name' : 'multiFileList1',
				'type' : 'file'
			});

			$('#ffile1').append(input);
		}
		
		function addFile2() {
			var input = $('<input>').attr({
				'name' : 'multiFileList2',
				'type' : 'file'
			});

			$('#ffile2').append(input);
		}
	</script>
</body>
</html>