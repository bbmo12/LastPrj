<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>

	<!-- ckeditor -->
	<script src="resources/ckeditor/ckeditor.js"></script>

	<style>
		h3 {
			font-weight: bold;
		}

		.radioImg {
			width: 80px;
			height: 80px;
			border-radius: 70%;
			overflow: hidden;
		}

		ul.petSct li {
			list-style-type: none;
			float: left;
			margin-left: 20px;
		}

		.petSelection {
			width: 100%;
			height: 100%;
			object-fit: cover;
		}

		 /* ul li {
			display: inline-block;
			margin: 0 5px;
			font-size: 14px;
			letter-spacing: -.5px;
		}  */

 		ul#tag-list li.tag-item {
			padding: 4px 8px 5px;
			background-color: #4CD3E3;
			color: white;
			border-radius: 30px;
			
			margin: 10px 5px 0 0;
			
			
			display: inline-block;
			font-size: 14px;
			letter-spacing: -.5px;
			
		}

		ul#tag-list li.tag-item:hover {
			background-color: white;
			color: #4CD3E3;
			border: 1px solid #4CD3E3;
		}

		form {
			padding-top: 16px;
		}

		.petSelect {
			displsy: flex;
			flex-direction: row;
		}

		.del-btn {
			font-size: 12px;
			font-weight: bold;
			cursor: pointer;
			margin-left: 8px;
		}

		#newq {
			width: 65%;
			margin: 20px auto;
			border: 1px solid #f3f3f3;
			padding: 30px;
			border-radius: 5px;
		}
	</style>
	<script>
		var ckeditor_config = {
			resize_enaleb: false,
			enterMode: CKEDITOR.ENTER_BR,
			shiftEnterMode: CKEDITOR.ENTER_P,
			height: '500px',
			filebrowserUploadUrl: "imageUpload"
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

	<!-- question form starts -->
	<article>
		<div class="container" id="newq" role="main">
			<h2>새로운 질문 작성하기</h2>
			<form name="qForm" id="qForm" action="qForm" method="post" onsubmit="return tagInput();">
				<div class="mb-3">
					<h3>제목</h3>
					<input type="text" class="form-control" name="title" id="title" placeholder="제목을 입력해 주세요" required>
				</div>
				<div class="petSelect" style="margin-bottom: 50px; margin-top: 30px;">
					<h3>반려동물 선택</h3>
					<h4 style="color: gray;">*도움이 필요한 반려동물을 선택해주세요.</h4>
					<ul class="petSct">
						<li>
							<div class="radioImg">
								<img class="petSelection" src="resources/qna/가위표.png">
							</div> <input type="radio" id="pet_no" name="pet_no" value="" checked="checked">&nbsp;
							<label>없음/비공개</label>
						</li>
						<c:forEach items="${petList }" var="pet">
							<li>
								<div class="radioImg">
									<img class="petSelection" src="resources/qna/${pet.picture }"
										onError="this.src='resources/qna/대체이미지2.png'">
								</div> <input type="radio" id="pet_no" name="pet_no"
									value="${pet.pet_no}">&nbsp;${pet.name }
							</li>
						</c:forEach>
					</ul>
				</div>
				<br>
				<br>
				<br>
				<br>
				<div class="mb-3">
					<textarea class="ckeditor4" id="content" name="content" required="required"></textarea>
					<script>
						CKEDITOR.replace('content', ckeditor_config);
					</script>
				</div>
				<div style="margin-top: 30px;" class="mb-3">
					<h3>태그</h3>
					<input type="text" id="tag" class="form-control" placeholder="스페이스 키로 태그를 등록하세요" />
					<ul id="tag-list">
					</ul>
				</div>
				<div style="margin: 30px 0 0 310px;">
					<button type="submit" class="btn btn-primary btn-lg" id="qSubmit">작성</button>
					<button type="button" class="btn btn-secondary btn-lg" id="qCancel" style="margin-left: 20px;"
						onclick="history.back()">취소</button>
				</div>
			</form>
		</div>
	</article>

	<script>
		/*form 전송
		$(document).on('click', '#qSubmit', function(e) {
			$("#qForm").submit();
		});*/

		/*
		function focusOn() {
			document.getElementById("tag").focus();
		}*/

		/*태그 처리*/
		$(document)
			.ready(
				function () {

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
							function (word) {
								return word !== "";
							});
					}

					$("#tag")
						.on(
							"keyup",
							function (e) {
								var self = $(this);
								console.log("keypress");

								// input 에 focus -> 엔터 및 스페이스바 입력시 구동
								if (e.key === "Enter" ||
									e.keyCode == 32) {

									var tagValue = self.val(); // 값 가져오기

									// 값이 없으면 동작 안 함.
									if (tagValue !== "") {

										// 같은 태그가 있는지 검사한다. 있다면 해당값이 array 로 return 된다.
										var result = Object
											.values(tag)
											.filter(
												function (
													word) {
													return word === tagValue;
												})

										// 태그 중복 검사
										if (result.length == 0) {
											$("#tag-list")
												.append(
													"<li class='tag-item'>" +
													"<span>" +
													tagValue +
													"</span>" +
													"<span class='del-btn' idx='" + counter + "'>&nbsp;x</span></li>");
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
					$(document).on("click", ".del-btn", function (e) {
						var index = $(this).attr("idx");
						tag[index] = "";
						$(this).parent().remove();
					});
				})

		/*li 태그를 input 태그로 바꿔 넘기기 용이하게...*/
		function tagInput() {

			var content = CKEDITOR.instances.content.getData()
			if (content == "" || content.length == 0) {
				alert('내용을 입력하세요');
				CKEDITOR.instances.content.focus();
				return false;
			}

			var tValue = document
				.querySelectorAll("li.tag-item span:first-child");

			for (var i = 0; i < tValue.length; i++) {
				var tags = `<input type="hidden" name="nTags[\${i}].t_name" value="\${tValue[i].innerHTML}">`;
				$('#qForm').append(tags);
			}
		}
	</script>
</body>

</html>