<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	#my_section {
		padding: 50px;
	}

	#main-form h3,
	input {
		display: inline-block;
	}

	#addDiv,
	#addService {
		margin-left: 36em;
		margin-top: -5px;
	}

	#select-one {
		margin-top: -20px;
	}

	.form-control {
		padding: 5px;
		width: 250px;
		display: inline-block;
	}

	.service-info {
		display: inline-grid;
	}

	.service-info input {
		width: 100px;
	}

	#p-info {
		margin-left: 6em;
		margin-top: -20px;
	}

	.delete-button {
		float: right;
		margin-top: 25px;
		margin-right: 100px;
		width: 62px;
	}

	#p_info {
		border: 1px solid rgba(151, 151, 151, 0.3);
	}
</style>

<body>
	<section class="banner-area other-page">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<h1>MyPage</h1>
					<a href="home">Home</a> <span>|</span> <a href="pmemberMyPage">MyPage</a>
				</div>
			</div>
		</div>
	</section>
	<section id="my_section">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="blog_right_sidebar">
						<aside class="single_sidebar_widget author_widget">
							<img class="author_img rounded-circle"
								src="resources/upload/${pmember.picture}" style="width: 210px"
								alt="">
							<div class="br"></div>
							<h4>${pmember.name }</h4>
							<div class="br"></div>
						</aside>
						<aside class="single_sidebar_widget post_category_widget">
							<h4 class="widget_title">My menu</h4>
							<ul class="list cat-list">
								<li><a href="pmemberMyPage" class="d-flex justify-content-between">
										<p>내 프로필</p>
									</a></li>
								<li><a href="reservationSetting" class="d-flex justify-content-between">
										<p>예약일정 설정</p>
									</a></li>
								<li><a href="preservationSelect" class="d-flex justify-content-between">
										<p>예약 내역</p>
									</a></li>
								<li><a href="pMemDiaList" class="d-flex justify-content-between">
										<p>진료 내역</p>
									</a></li>
								<li><a href="pMembenefit" class="d-flex justify-content-between">
										<p>결제 내역</p>
									</a></li>
								<li><a href="pmemcounsel" class="d-flex justify-content-between">
										<p>상담 내역</p>
									</a></li>
								<li><a href="pmemreport" class="d-flex justify-content-between">
										<p>신고 내역</p>
									</a></li>
								<li><a href="logout" class="d-flex justify-content-between">
										<p>로그아웃</p>
									</a></li>
								<li><a href="pmdeleteForm" class="d-flex justify-content-between">
										<p>회원탈퇴</p>
									</a></li>
							</ul>
						</aside>
					</div>
				</div>
				<div class="col-lg-9 posts-list">
					<div class="single-post row">
						<form action="pmemberUpdate" enctype="multipart/form-data" id="f" name="updatePage" method="post" onsubmit="return checkForm()">
							<div class="col-lg-9 col-md-9 blog_details" id="main-form">
								<div class="form-group">
									<h3 style="font-weight: bolder;">이름</h3>
									<input type="text" id="name" name="name" class="form-control"value="${pmember.name}" required>
								</div>
								<div class="form-group">
									<h3 style="font-weight: bolder;">아이디</h3>
									<input type="email" style="border: none" id="p_id" name="p_id"
										class="form-control" value="${pmember.p_id}" readonly>
								</div>
								<div class="form-group">
									<h3 style="font-weight: bolder;">비밀번호</h3>
									<input type="password" id="password" name="password" class="form-control" value=""
										style="width: 350px;" placeholder="영문자+숫자+특수문자 조합으로 8이상입력">
								</div>
								<div class="form-group">
									<h3 style="font-weight: bolder;">비밀번호 재확인</h3>
									<input type="password" id="password1" name="password1"class="form-control" value=""
										style="width: 350px;" required>
								</div>
								<div class="form-group">
									<h3 style="font-weight: bolder;">전화번호</h3>
									<input type="tel" id="tel" name="tel" class="form-control" value="${pmember.tel}" placeholder="숫자만 입력하세요." maxlength="13">
								</div>
								<div class="form-group">
									<h3 style="font-weight: bolder;">사업장 이름</h3>
									<input type="text" id="w_name" name="w_name"class="form-control" value="${pmember.w_name}">
								</div>
								<div class="form-group">
									<h3 style="font-weight: bolder;">사업장 주소</h3>
									<input type="text" id="w_address" name="w_address"class="form-control" value="${pmember.w_address}"> 
									<input type="text" id="w_d_address" name="w_d_address" class="form-control"value="${pmember.w_d_address }">
								</div>
								<div class="form-group">
									<h3 style="font-weight: bolder;">사업장 전화번호</h3>
									<input type="tel" id="w_tel" name="w_tel" class="form-control" value="${pmember.w_tel}" maxlength="13"
										placeholder="숫자만 입력하세요.">
								</div>
								<div class="form-group">
									<h3 style="font-weight: bolder;">자기소개</h3>
									<textarea id="p_info" name="p_info" cols="100" rows="3">${pmember.p_info}</textarea>
								</div>
								<div class="form-group">
									<h3 style="font-weight: bolder;">경력</h3>
									<input type="text" id="career" name="career" class="form-control" value="${pmember.career}">
								</div>
								<div class="form-group">
									<h3 style="font-weight: bolder;">전문분야</h3>
									<input type="text" id="speciality" name="speciality"class="form-control" value="${pmember.speciality}">
								</div>
								<div class="form-group">
									<h3 style="font-weight: bolder;">운영시간</h3>
								</div>
								<div id="select-one">
									<div class="form-group" id="form-time">
										<c:forEach items="${time }" var="timeList" varStatus="status">
											<div>
												<input type="hidden" name="timeVOList[${status.index}].o_no"value="${timeList.o_no}" id=${ status.index}> 
												<select id="selectday" name="timeVOList[${status.index}].w_day">
													<option value='월'<c:if test="${timeList.w_day == '월' }">selected</c:if>>월</option>
													<option value='화'<c:if test="${timeList.w_day == '화' }">selected</c:if>>화</option>
													<option value='수'<c:if test="${timeList.w_day == '수' }">selected</c:if>>수</option>
													<option value='목'<c:if test="${timeList.w_day == '목' }">selected</c:if>>목</option>
													<option value='금'<c:if test="${timeList.w_day == '금' }">selected</c:if>>금</option>
													<option value='토'<c:if test="${timeList.w_day == '토' }">selected</c:if>>토</option>
													<option value='일'<c:if test="${timeList.w_day == '일' }">selected</c:if>>일</option>
												</select> 
												<select id="selectStart"name="timeVOList[${status.index}].starttime">
													<option value='9:00'<c:if test="${timeList.starttime == '9:00' }">selected</c:if>>9:00</option>
													<option value='9:30'<c:if test="${timeList.starttime == '9:30' }">selected</c:if>>9:30</option>
													<option value='10:00'<c:if test="${timeList.starttime == '10:00' }">selected</c:if>>10:00</option>
													<option value='10:30'<c:if test="${timeList.starttime == '10:30' }">selected</c:if>>10:30</option>
													<option value='11:00'<c:if test="${timeList.starttime == '11:00' }">selected</c:if>>11:00</option>
													<option value='11:30'<c:if test="${timeList.starttime == '11:30' }">selected</c:if>>11:30</option>
													<option value='12:00'<c:if test="${timeList.starttime == '12:00' }">selected</c:if>>12:00</option>
													<option value='12:30'<c:if test="${timeList.starttime == '12:30' }">selected</c:if>>12:30</option>
												</select> 
												<select id="selectEnd"name="timeVOList[${status.index}].endtime">
													<option value='13:00'<c:if test="${timeList.endtime == '13:00' }">selected</c:if>>13:00</option>
													<option value='13:30'<c:if test="${timeList.endtime == '13:30' }">selected</c:if>>13:30</option>
													<option value='14:00'<c:if test="${timeList.endtime == '14:00' }">selected</c:if>>14:00</option>
													<option value='14:30'<c:if test="${timeList.endtime == '14:30' }">selected</c:if>>14:30</option>
													<option value='15:00'<c:if test="${timeList.endtime == '15:00' }">selected</c:if>>15:00</option>
													<option value='15:30'<c:if test="${timeList.endtime == '15:30' }">selected</c:if>>15:30</option>
													<option value='16:00'<c:if test="${timeList.endtime == '16:00' }">selected</c:if>>16:00</option>
													<option value='16:30'<c:if test="${timeList.endtime == '16:30' }">selected</c:if>>16:30</option>
													<option value='17:00'<c:if test="${timeList.endtime == '17:00' }">selected</c:if>>17:00</option>
													<option value='17:30'<c:if test="${timeList.endtime == '17:30' }">selected</c:if>>17:30</option>
													<option value='18:00'<c:if test="${timeList.endtime == '18:00' }">selected</c:if>>18:00</option>
													<option value='18:30'<c:if test="${timeList.endtime == '18:30' }">selected</c:if>>18:30</option>
													<option value='19:00'<c:if test="${timeList.endtime == '19:00' }">selected</c:if>>19:00</option>
													<option value='19:30'<c:if test="${timeList.endtime == '19:30' }">selected</c:if>>19:30</option>
													<option value='20:00'<c:if test="${timeList.endtime == '20:00' }">selected</c:if>>20:00</option>
													<option value='20:30'<c:if test="${timeList.endtime == '20:30' }">selected</c:if>>20:30</option>
													<option value='21:00'<c:if test="${timeList.endtime == '21:00' }">selected</c:if>>21:00</option>
												</select> 
												<input type="text" id="n_content" name="timeVOList[${status.index}].n_content" class="form-control" value="${timeList.n_content}">
												<div style="display: inline-block; width:62px;">
													<button class="genric-btn info-border circle" type="button"onclick="deleteTime('${timeList.o_no}')">X</button>
												</div><br> 
												<input type="hidden"name="timeVOList[${status.index}].p_id" value="${pmember.p_id}">
											</div>
										</c:forEach>
									</div>
								</div>
								<button type="button" class="genric-btn info radius" id="addDiv" onclick="plusTime()">시간추가</button><br>
								<h3 style="font-weight: bolder;" id="add-service">서비스정보</h3><br>
								<div id="plus-div">  
									<div id="add-div">
										<c:forEach items="${price }" var="price" varStatus="status">
											<div class="form-group" id="service-main" style="margin-bottom: 10px;">
												<input type="hidden"name="priceVOList[${status.index }].price_no"value="${price.price_no}" id="service${ status.index}">
												<div class="service-info">
													<label for="name">서비스명</label> 
													<input id="title" name="priceVOList[${status.index }].title" type="text" class="form-control" value="${price.title}">
												</div>
												<div class="service-info">
													<label>금 액</label> 
													<input type="text" class="form-control"id="price" name="priceVOList[${status.index }].price" value="${price.price}">
												</div>
												<div style="display: inline-grid;">
													<label>서비스안내</label>
													<textarea class="form-control" id="content" name="priceVOList[${status.index }].content" rows="2"cols="50" style="height: 45px;">${price.content }</textarea>
												</div>
												<div class="delete-button">
													<button class="genric-btn info-border circle" type="button" onclick="deleteService('${price.price_no}')">X</button>
												</div><br> 
												<input type="hidden"name="priceVOList[${status.index }].p_id" value="${pmember.p_id}">
											</div>
										</c:forEach>
									</div>
								</div>
								<button type="button" class="genric-btn info radius"id="addService" onclick="plusService()">서비스추가</button>
								<p id="p-info">서비스를 더 추가 하시러면 서비스 추가 버튼을 눌러주세요.</p>
								<div class="form-group">
									<h3 style="font-weight: bolder;">프로필 사진</h3>
									<div class="input-group col-xs-12">
										<input class="file-upload-browse btn btn-primary" type="file"id="file" name="file">
									</div>
								</div>
									<h3 style="font-weight: bolder;">자격증</h3>
								<div class="form-group">
									<input class="file-upload-browse btn btn-primary" type="file" name="multiFileList1" multiple="multiple">
									<button type="button" class="btn btn-primary btn-sm" onclick="addFile1()">+</button>
									<div id="ffile1"></div>
								</div>
									<h3 style="font-weight: bolder;">활동사진</h3>
								<div class="form-group">
									<input class="file-upload-browse btn btn-primary" type="file" name="multiFileList2" multiple="multiple">
									<button type="button" class="btn btn-primary btn-sm"onclick="addFile2()">+</button>
									<div id="ffile2"></div>
								</div>
								<button type="submit" class="genric-btn info radius">수정완료</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>

	<script>	

		function addFile1() {
			var input = $('<input>').attr({
				'class': 'file-upload-browse btn btn-primary',
				'name': 'multiFileList1',
				'type': 'file'
			}).css({
				'margin-top': '3px',
				'display': 'block'
			});
			$('#ffile1').append(input);
		}

		function addFile2() {
			var input = $('<input>').attr({
				'class': 'file-upload-browse btn btn-primary',
				'name': 'multiFileList2',
				'type': 'file'
			}).css({
				'margin-top': '3px',
				'display': 'block'
			});
			$('#ffile2').append(input);
		}

		/* 시간삭제 */
		function deleteTime(o_no) {
			var o_no = o_no;
			var target = event.target.parentElement.parentElement;
			$.ajax({
				type: 'POST',
				url: 'deleteTime',
				data: {
					"o_no": o_no,
				},
				success: function (result) {
					console.log(result);
					target.remove();
				}
			});
		}
		/* 서비스삭제  */
		function deleteService(price_no) {
			var price_no = price_no;
			var target = event.target.parentElement.parentElement;
			$.ajax({
				type: 'POST',
				url: 'deleteService',
				data: {
					"price_no": price_no,
				},
				success: function (result) {
					target.remove();
				}
			});
		}
		var countService=0;
		function plusService() {
			countService++;
			var select = document.getElementById('plus-div');
			var div = document.getElementById('add-div');
			var eleCount = ${fn:length(price)};
			var formValue = Number(document.getElementById("service" + (eleCount-1)).value);
			var tagData =$(`<div class="form-group" style="margin-bottom: 10px;">
					<input type="hidden" name="priceVOList[\${eleCount+countService}].price_no" value="\${formValue+countService}" id="service\${eleCount+countService}">
					<div class="service-info">
						<label for="name">서비스명</label>
						<input id="title" name="priceVOList[\${eleCount+countService}].title" value="" type="text" class="form-control">
					</div>
					<div class="service-info">
						<label>금 액</label>
						<input type="text" class="form-control" id="price" name="priceVOList[\${eleCount+countService}].price" value="">
					</div>
					<div style="display: inline-grid;">
						<label>서비스안내</label>
						<textarea class="form-control" id="content" name="priceVOList[\${eleCount+countService}].content" rows="2" cols="50"
							style="height: 45px;"></textarea>
					</div><br>
					<input type="hidden"name="priceVOList[\${eleCount+countService}].p_id" value="${pmember.p_id}">
				</div>`);
			$('#add-div').append(tagData);
			select.append(div);
		}
		
		var count=0;
		function plusTime() {
			count++;
			var select = document.getElementById('select-one');
			var form = document.getElementById('form-time');
			var eleCount = ${fn:length(time)};//form.childElementCount; // /* div갯수 구하기 */
			var formValue = Number(document.getElementById(eleCount - 1).value);
			var tagData = 	
				$(`		<div>
						<input type="hidden" name="timeVOList[\${eleCount+count}].o_no" value="\${formValue+count}" id="\${eleCount+count}"> 
						<select class="selectday\${eleCount}" name="timeVOList[\${eleCount+count}].w_day">
						<option value='' selected>요일선택</option>
						<option value='월'>월</option>
						<option value='화'>화</option>
						<option value='수'>수</option>
						<option value='목'>목</option>
						<option value='금'>금</option>
						<option value='토'>토</option>
						<option value='일'>일</option>
					</select>																	
					<select class="selectday\${eleCount+count}" name="timeVOList[\${eleCount+count}].starttime">
						<option value='' selected>오픈시간</option>
						<option value='9:00'>9:00</option>
						<option value='9:30'>9:30</option>
						<option value='10:30'>10:30</option>
						<option value='11:00'>11:00</option>
						<option value='12:00'>12:00</option>
						<option value='12:30'>12:30</option>				
					</select>																					
					<select class="selectday\${eleCount+count}" name="timeVOList[\${eleCount+count}].endtime">
						<option value='' selected>마감시간</option>
						<option value='13:00'>13:00</option>
						<option value='13:30'>13:30</option>
						<option value='14:00'>14:00</option>
						<option value='14:30'>14:30</option>
						<option value='15:00'>15:00</option>
						<option value='15:30'>15:30</option>
						<option value='16:00'>16:00</option>
						<option value='16:30'>16:30</option>
						<option value='17:00'>17:00</option>
						<option value='17:30'>17:30</option>
						<option value='18:00'>18:00</option>
						<option value='18:30'>18:30</option>
						<option value='19:00'>19:00</option>
						<option value='19:30'>19:30</option>
						<option value='20:00'>20:00</option>
						<option value='20:30'>20:30</option>
						<option value='21:00'>21:00</option>				
					</select>
					<input type="text" id="n_content" name="timeVOList[\${eleCount+count}].n_content" class="form-control" value=""><br>
					<input type="hidden" name="timeVOList[\${eleCount+count}].p_id" value="${pmember.p_id}">
					</div>`);
			$('#form-time').append(tagData);
			select.append(form);
			$('select').niceSelect();
		}

		function checkForm() {
			if (updatePage.name.value == "") {
				alert("이름을 입력하세요.");
				updatePage.name.focus();
				return false;
			} else if (updatePage.password.value == "") {
				alert("비밀번호 입력하세요.");
				updatePage.password.focus();
				return false;
			}
			/* 	
			var pwdCheck = /^[A-Za-z0-9]{4,12}$/;
				         
			if(!pwdCheck.test(updatePage.password.value)){
				alert("비밀번호는 영문자+숫자+특수문자 조합으로 8이상 사용해야 합니다.");
				updatePage.password.focus(); 
				return false; 
			}
			if( updatePage.password.value !== updatePage.password1.value ){
				alert("비밀번호가 일치하지 않습니다."); 
				updatePage.password1.focus(); 
				return false; 
			}  */
			else if (updatePage.tel.value == "" && updatePage.w_tel.value == "") {
				alert("전화번호를 입력해주세요.");
				updatePage.tel.focus();
				return false;
			} else if (updatePage.w_name.value == "") {
				alert("사업장 이름을 입력주세요.");
				updatePage.w_name.focus();
				return false;
			} else if (updatePage.w_address.value == "" && updatePage.w_d_address.value == "") {
				alert("사업장 주소를 입력주세요.");
				updatePage.w_address.focus();
				return false;
			} else {
				return true;
			}

		}

		function test() {
			var formData = new FormData(document.getElementById('f'));
			for (var pair of formData.entries()) {
				console.log(pair[0] + ', ' + pair[1]);
			}
		}
	</script>
</body>

</html>