<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
</head>

<!-- ckeditor -->
<script src="resources/ckeditor/ckeditor.js"></script>

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
	padding: 4px 8px;
	background-color: #000;
	color: dodgeblue;
}

.tag-item:hover {
	background-color: dodgeblue;
	color: #000;
}

.del-btn {
	font-size: 12px;
	font-weight: bold;
	cursor: pointer;
	margin-left: 8px;
}
}
</style>
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

	<!-- question form starts -->
	<article>
		<div class="container" role="main">
			<h2>새로운 질문 작성하기</h2>
			<form name="qForm" id="qForm" action="qForm" method="post" onsubmit="tagInput();">

				<input type="hidden" id="writer" name="writer" value="writer"
					value="${mId }">

				<div class="mb-3">
					<label for="title">제목</label> <input type="text"
						class="form-control" name="title" id="title"
						placeholder="제목을 입력해 주세요">
				</div>

				<div class="form-check">
					<h4>반려동물 선택하기</h4>
					<div class="radioImg">
						<img class="petSelection" src="resources/qna/가위표.png">
					</div>
					<input type="radio" id="pet_no" name="pet_no" value="">&nbsp;
					<label>없음/비공개</label>


					<c:forEach items="${petList }" var="pet">
						<div class="radioImg">
							<img class="petSelection" src="resources/qna/${pet.picture }" onError="this.src='resources/qna/대체이미지2.png'">
						</div>
						<input type="radio" id="pet_no" name="pet_no"
							value="${pet.pet_no}">&nbsp;${pet.name }
					</c:forEach>
				</div>

				<div class="mb-3">
					<textarea class="ckeditor4" id="content" name="content"></textarea>
					<script>
						CKEDITOR.replace('content', {
							height : '500px',
							filebrowserUploadUrl : '/imageUpload'
						});
					</script>
				</div>

				<div style="margin-top: 40px; width: 1000px;" class="content">
					<div style="display: flex;">
						<h4>태그</h4>
						<input type="text" id="tag"
							style="margin-left: 20px; width: 1100px;"
							placeholder="스페이스 키로 태그를 등록하세요" />
					</div>

					<ul id="tag-list">

					</ul>
				</div>

				<button type="submit" class="btn btn-primary" id="qSubmit">작성</button>
				<button type="button" class="btn btn-secondary" id="qCancel"
					onclick="history.back()">취소</button>

			</form>


		</div>
	</article>

	<script>
		/*form 전송
		$(document).on('click', '#qSubmit', function(e) {
			$("#qForm").submit();
		});*/

		/*태그 처리*/
		$(document)
				.ready(
						function() {

							var tag = {};
							var counter = 0;

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

							$("#tag")
									.on(
											"keyup",
											function(e) {
												var self = $(this);
												console.log("keypress");

												// input 에 focus -> 엔터 및 스페이스바 입력시 구동
												if (e.key === "Enter"
														|| e.keyCode == 32) {

													var tagValue = self.val(); // 값 가져오기

													// 값이 없으면 동작 안 함.
													if (tagValue !== "") {

														// 같은 태그가 있는지 검사한다. 있다면 해당값이 array 로 return 된다.
														var result = Object
																.values(tag)
																.filter(
																		function(
																				word) {
																			return word === tagValue;
																		})

														// 태그 중복 검사
														if (result.length == 0) {
															$("#tag-list")
																	.append(
																			"<li class='tag-item'>"
																					+ "<span>" + tagValue + "</span>"
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
				var tValue = document.querySelectorAll("li.tag-item span:first-child");
				
				for(var i = 0; i<tValue.length; i++){
					var tags = 	`<input type="hidden" name="nTags[\${i}].t_name" value="\${tValue[i].innerHTML}">`;
					$('#qForm').append(tags);
				}
		}
	</script>
</body>
</html>