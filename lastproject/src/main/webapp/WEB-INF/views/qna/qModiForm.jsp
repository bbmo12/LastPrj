<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery -->
<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
 -->
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">

<!-- ckeditor -->
<script src="resources/ckeditor/ckeditor.js"></script>

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>


<style>
.radioImg {
	width: 80px;
	height: 80px;
	border-radius: 70%;
	overflow: hidden;
}

.petSelection {
	width: 100%;
	height: 100%;
	object-fit: cover; ul { padding : 16px 0;
	list-style: none;
}

}
ul li {
	display: inline-block;
	margin: 0 5px;
	font-size: 14px;
	letter-spacing: -.5px;
}

form {
	padding-top: 16px;
}

ul li.tag-item {
	padding: 4px 8px 5px;
	background-color: #4CD3E3;
	color: white;
	border-radius : 30px;
}

ul li.tag-item:hover {
	background-color: white;
	color: #4CD3E3;
	border : 1px solid #4CD3E3;
}

.del-btn {
	font-size: 12px;
	font-weight: bold;
	cursor: pointer;
	margin-left: 8px;
}

ul.petSct li {
	list-style-type: none;
	float: left;
	margin-left: 20px;
}
</style>
<script>
	var ckeditor_config = {
		resize_enaleb : false,
		enterMode : CKEDITOR.ENTER_BR,
		shiftEnterMode : CKEDITOR.ENTER_P,
		height : '500px',
		filebrowserUploadUrl : "imageUpload"
	};
</script>
</head>

<body>
	<!-- header area -->
	<section class="banner-area other-page">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<h1>Open Q&A</h1>
					<h3>반려동물 전문가와 베테랑 집사들이 반려동물에 관한 모든 궁금증을 해결해드립니다!</h3>
				</div>
			</div>
		</div>
	</section>

	<!-- modify form starts -->
	<article>
		<div class="container" role="main"
			style="margin-bottom: 50px; margin-top: 50px; border: 1px solid #f3f3f3; padding: 50px; border-radius: 5px;">
			<h2 style="margin-top: 50px;">질문글 수정하기</h2>
			<form name="qmForm" id="qmForm" action="qModify" method="post"
				onsubmit="return tagInput();">

				<input type="hidden" name="q_no" id="q_no"
					value="${qnaDetail.q_no }">

				<div class="mb-3">
					<h3>제목</h3> <input type="text"
						class="form-control" name="title" id="title"
						placeholder="제목을 입력해 주세요" value="${qnaDetail.title }" required>
				</div>

				<div class="form-check">
					<h3>반려동물 선택</h3>
					<h4 style="color: gray;">*도움이 필요한 반려동물을 선택해주세요.</h4>
					<ul class="petSct">
						<li><div class="radioImg">
								<img class="petSelection" src="resources/qna/가위표.png">
							</div> <input type="radio" id="pet_no" name="pet_no" value="">&nbsp;
							<label>없음/비공개</label></li>

						<c:forEach items="${petList }" var="pet">
							<li><div class="radioImg">
									<img class="petSelection" src="resources/qna/${pet.picture }"
										onError="this.src='resources/qna/대체이미지2.png'">
								</div> <input type="radio" id="pet_no" name="pet_no"
								value="${pet.pet_no}">&nbsp;${pet.name }</li>
						</c:forEach>
					</ul>
				</div>

				<br> <br> <br> <br> <br> <br>

				<div class="mb-3">
					<textarea class="ckeditor4" id="content" name="content">${qnaDetail.content }</textarea>
					<script>
						CKEDITOR.replace('content', ckeditor_config);
					</script>
				</div>

				<div style="margin-top: 40px;" class="content">
					<div>
						<h3>태그</h3>
						<input style="margin-bottom : 20px;" type="text" id="tag" class="form-control"
							placeholder="스페이스 키로 태그를 등록하세요" />
					</div>

					<!-- 기존 태그 -->
					<ul id="tag-list">
						<c:forEach items="${qnaDetail.tagList }" var="hash">
							<%-- <li><span>${hash.t_name }</span><span class='del-btn' idx=''>&nbsp;x</span></li> --%>

						</c:forEach>
					</ul>
				</div>
				<div style="margin-top: 70px; margin-left: 450px;">
					<button type="submit" class="btn btn-primary" id="qSubmit">작성</button>
					<button type="button" class="btn btn-secondary" id="qCancel"
						onclick="history.back()">취소</button>
				</div>
			</form>


		</div>
	</article>

	<script>
	
	/*태그 처리*/
	$(document).ready(function() {

						var tag = {};
						var counter = 0;

						//json 값으로 변환된 기존 태그를 가져온다
						var list = ${prevTag};
						if(list[0].t_name != null){
							
						
						//태그 등록
						for (i = 0; i < list.length; i++) {
							console.log(list[i].t_name);

							var tagValue = list[i].t_name;
							counter = i;

							$("#tag-list").append("<li class='tag-item'>"
													+ "<span>"
													+ tagValue
													+ "</span>"
													+ "<span class='del-btn' idx='" + counter + "'>&nbsp;x</span></li>");
							addTag(tagValue);
						}
						}
						// 태그를 추가한다.
						function addTag(value) {
							tag[counter] = value; // 태그를 Object 안에 추가
							counter++; // counter 증가 삭제를 위한 del-btn 의 고유 id 가 된다.
						}

						// 최종적으로 서버에 넘길때 tag 안에 있는 값을 array type 으로 만들어서 넘긴다.
						function marginTag() {
							return Object.values(tag).filter(
									function(word) {
										return word !== "";
									});
						}

						$("#tag").on("keyup", function(e) {
											var self = $(this);
											console.log("keypress");

											// input 에 focus -> 엔터 및 스페이스바 입력시 구동
											if (e.keyCode == 32) {

												var tagValue = self.val(); // 값 가져오기

												// 값이 없으면 동작 안 함.
												if (tagValue !== "") {

													// 같은 태그가 있는지 검사한다. 있다면 해당값이 array 로 return 된다.
													var result = Object
															.values(tag)
															.filter(
																	function(word) {
																		return word === tagValue;
																	})

													// 태그 중복 검사
													if (result.length == 0) {
														$("#tag-list")
																.append(
																		"<li class='tag-item'>"
																				+ "<span>"
																				+ tagValue
																				+ "</span>"
																				+ "<span class='del-btn' idx='" + counter + "'>&nbsp;x</span></li>");
														addTag(tagValue);
														self.val("");
													} else {
														alert("이미 등록한 태그입니다.");
													}
												}
												e.preventDefault(); // SpaceBar 시 빈공간이 생기지 않도록 방지
											}
										});

						// 삭제 버튼
						// 삭제 버튼은 비동기적 생성이므로 document 최초 생성시가 아닌 검색을 통해 이벤트를 구현시킨다.
						$(document).on("click", ".del-btn", function(e) {
							var index = $(this).attr("idx");
							tag[index] = "";
							$(this).parent().remove();
						});
					})

	/*li 태그를 input 태그로 바꿔 넘기기 용이하게...*/
	function tagInput() {
		
		var content = CKEDITOR.instances.content.getData()
		if(content == "" || content.length == 0){
			alert('내용을 입력하세요');
			CKEDITOR.instances.content.focus();
			return false;
		}
		
		var tValue = document.querySelectorAll("li.tag-item span:first-child");

		for (var i = 0; i < tValue.length; i++) {
			var tags = `<input type="hidden" name="nTags[\${i}].t_name" value="\${tValue[i].innerHTML}">`;
			$('#qmForm').append(tags);
		}
	}
	
	var pet = "${qnaDetail.pet_no}";
	console.log(pet);

	/* $('input:radio[name=pet_no]:input[value=' + pet + ']').attr("checked", true); */
	
	if(pet == "" || pet== null){
		$('input[value=""]').attr("checked", true);
	} else {
		$('input:radio[name=pet_no]:input[value=' + pet + ']').attr("checked", true);
	}

	</script>
</body>
</html>