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
						<form class="forms-sample" action="pjoin_2" method="post" enctype="multipart/form-data">
						<div class="form-group">
							<label for="exampleInputPassword4">회사명</label> <input type="text"
								class="form-control" id="w_name" name="w_name" placeholder="회사명">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword4">사업자번호</label> <input
								type="text" class="form-control" id="businessnumber"
								name="businessnumber" placeholder="사업자번호">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword4">주소</label> <input type="text"
								class="form-control" id="w_address" name="w_address"
								placeholder="회사주소">
							<button type="button" onclick="goPopup()">버튼</button>
						</div>
						<div class="form-group">
							<label for="exampleInputPassword4">상세 주소</label> <input
								type="text" class="form-control" id="w_d_address"
								name="w_d_address" placeholder="상세주소">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword4">전화번호</label> <input
								type="text" class="form-control" id="w_tel" name="w_tel"
								placeholder="회사전화번호" value="#{addrDetail }">
						</div>
						<h4 class="card-title">소개 글</h4>
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
							<button class="btn btn-light" onclick="location.href='home'" >취소</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	function goPopup(){

	// 주소검색을 수행할 팝업 페이지를 호출합니다.

	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.

	var pop = window.open("/prj/jusoPopup","pop","width=590,height=420, scrollbars=yes, resizable=yes"); 
	// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.

    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 

}



function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){

	    // 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.

		document.form.roadAddrPart1.value = roadAddrPart1; // 도로명주소

		document.form.addrDetail.value = addrDetail; // 상세주소

		document.form.zipNo.value = zipNo; // 우편번호

		self.close();

}
</script>
</body>
</html>