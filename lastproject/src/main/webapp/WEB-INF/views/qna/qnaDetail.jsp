<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css"
	integrity="sha512-1PKOgIY59xJ8Co8+NE6FZ+LOAZKjy+KY8iq0G4B3CyeY6wYHN3yt9PW0XpSriVlkMXe40PTKnXrLnZ9+fkDaog=="
	crossorigin="anonymous" />

<style>
.tagList {
	list-style: none;
}

.tagli {
	float: left;
	margin-right: 5px;
}

.blog_meta list {
	float: right;
}

.social {
	margin-left: 600px;
}

.ans-body {
	text-align: left;
}

.right-align {
	float: right;
}

#qSection {
	border: 1px solid #a9a9a9;
	padding: 20px;
}

#a-btn {
	margin-left: 500px;
}

/*.btn btn-primary {
	float: left;
}*/
.qnaForm, .img-fluid {
	margin-top: 30px;
}

#noAns {
	margin-top: 30px;
	margin-left: 100px;
	border: 1px solid #d3d3d3;
}

#banner {
	margin-left: 780px;
	top: -900px;
}

#bestQna {
	margin-top: 30px;
}

#ansBtn {
	margin-left: 500px;
}

.updateAns {
	margin-left: 550px;
}

#pMemPage {
	margin-left: 450px;
}
</style>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/397860a4e3.js"
	crossorigin="anonymous"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

</head>

<body>

	<!-- Banner Area Starts -->
	<section class="banner-area other-page">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<h1>Open Q&A</h1>
					<h3>반려동물 전문가와 베테랑 집사들이 반려동물에 관한 모든 궁금증을 해결해드립니다!</h3>
				</div>
				<div class="qnaForm">
					<a href="qnaForm"><button type="button"
							class="btn btn-primary btn-lg">질문글 작성하기</button></a>
				</div>
			</div>
		</div>
	</section>
	<!-- Banner Area End -->

	<!--================Blog Area =================-->
	<section class="blog_area section-padding">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 posts-list">
					<div id="qSection" class="single-post row">
						<!-- 제목 위치 -->
						<div class="col-lg-12">
							<h2>${qnaDetail.title }</h2>
						</div>

						<!-- 본문 공간 -->
						<div class="col-lg-9 col-md-9">
							<!-- 작성자 정보 -->
							<div>
								<h3>
									<c:out value="${qnaDetail.writer }"></c:out>
								</h3>
							</div>

							<!-- 본문 공간 -->
							<div>
								<h3>${qnaDetail.content }</h3>
							</div>

							<!-- 펫 정보 공간 -->
							<div>
								<table>
									<tr>
										<td rowspan="5"><img src="resources/upload/${petInfo.picture }">
										</td>
										<td>${petInfo.name }</td>
									</tr>
									<tr>
										<td>${petInfo.gender }</td>
									</tr>
									<tr>
										<td>${petInfo.weight }</td>
									</tr>
								</table>
							</div>

							<!-- 태그 공간 -->
							<div class="tags">
								<c:forEach items="${qnaDetail.tagList }" var="hash">
									<ul class="tagList">
										<li class="tagli"><a
											href="tagSearch?t_name=${hash.t_name }">${hash.t_name}</a></li>
									</ul>
								</c:forEach>
							</div>
						</div>

						<!-- 글 정보 -->
						<div class="col-lg-3  col-md-3">
							<div class="blog_info text-right">
								<ul class="blog_meta list">
									<li>${qnaDetail.w_date }&nbsp;&nbsp;<i
										class="fa fa-calendar-o"></i></li>
									<li>${qnaDetail.hit }&nbsp;&nbsp;<i class="fa fa-eye"></i></li>
									<li>06 Comments&nbsp;&nbsp;<i class="fa fa-comment-o"></i></li>
								</ul>
							</div>
						</div>


						<!-- 소셜 공유 -->
						<div class="social">
							<table>
								<tr>
									<td><a id="btnTwitter" class="link-icon twitter"
										href="javascript:shareTwitter();"><img
											src="resources/qna/icon-twitter.png"></a></td>
									<td><a id="btnFacebook" class="link-icon facebook"
										href="javascript:shareFacebook();"><img
											src="resources/qna/icon-facebook.png"></a></td>
									<td><a id="btnKakao" class="link-icon kakao"
										href="javascript:shareKakao();"><img
											src="resources/qna/icon-kakao.png"></a></td>
								</tr>
							</table>
						</div>

						<!-- 질문글 신고 모달-->
						<!-- button trigger modal -->
						<c:if test="${mId ne null || pId ne null}">
							<div>
								<button id="reportModal" type="button" class="btn btn-secondary"
									data-toggle="modal" data-target="#exampleModal">신고</button>
							</div>
						</c:if>
						<!-- Modal -->
						<div class="modal fade" id="exampleModal" tabindex="-1"
							role="dialog" aria-labelledby="exampleModalLabel"
							aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h3 class="modal-title" id="exampleModalLabel">게시물 신고</h3>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">

										<h4>신고 유형</h4>
										<c:if test="${mId ne null}">
											<input type="hidden" id="reporter" name="reporter"
												value="${mId }">
										</c:if>
										<c:if test="${pId ne null }">
											<input type="hidden" id="reporter" name="reporter"
												value="${pId }">
										</c:if>
										<input type="hidden" id="q_no" name="q_no"
											value="${qnaDetail.q_no }"> <input type="hidden"
											id="reported" name="reported" value="${qnaDetail.writer }">
										<select class="reportModal" name="code" id="code">
											<option value="601">불법 홍보/광고</option>
											<option value="602">음란물/선정성 콘텐츠</option>
											<option value="603">욕설/명예훼손</option>
											<option value="604">사생활 침해</option>
											<option value="605">게시물 도배</option>
										</select> <br> <br>

										<h4>신고 내용</h4>
										<textarea id="content" name="content" rows="4" cols="50"></textarea>

									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">취소</button>
										<button id="sendReport" name="sendReport" type="button"
											class="btn btn-primary">신고 접수</button>
									</div>
								</div>
							</div>
						</div>
						<!-- 신고 모달 끝 -->

						<!-- 이 질문에 답변하기 -->
						<div>


							<!--로그인 세션 있을 경우 답변 모달창-->
							<!--modal trigger button-->
							<c:if test="${mId ne null || pId ne null}">
								<button type="button" id="ansBtn" class="btn btn-primary btn-lg"
									data-toggle="modal" data-target=".bd-example-modal-lg">이
									질문에 답변하기</button>
							</c:if>

							<!-- 답변 모달창 -->
							<div class="modal fade bd-example-modal-lg" tabindex="-1"
								role="dialog" aria-labelledby="myLargeModalLabel"
								aria-hidden="true">
								<div class="modal-dialog modal-lg">
									<div class="modal-content">
										<div class="form-group">
											<label for="title">제목</label> <input type="text"
												class="form-control" id="title" name="title"
												value="RE : ${qnaDetail.title }" required="required"
												pattern=".{4,100}">
										</div>
										<div class="form-group">
											<label for="content">내용</label>
											<textarea class="form-control" rows="15" id="content"
												name="content"></textarea>
										</div>
										<c:if test="${mId ne null}">
											<input type="hidden" id="writer" name="writer"
												value="${mId }">
										</c:if>
										<c:if test="${pId ne null}">
											<input type="hidden" id="writer" name="writer"
												value="${pId }">
										</c:if>
										<input type="hidden" id="p_no" name="p_no"
											value="${qnaDetail.q_no }">

										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-dismiss="modal">취소</button>
											<button type="button" id="sendAns" name="sendAns"
												class="btn btn-primary">답변 등록</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- 답변이 없을 경우 -->
					<c:if test="${empty ansDetail}">
						<img id="noAns" src="resources/qna/답변유도.png" alt="">
					</c:if>

					<!-- 답변 파트 시작  -->
					<c:forEach items="${ansDetail }" var="ans">



						<!-- 여러 개의 답변 중 하나의 답변번호를 받아오기 위해 data-no 사용 -->
						<div class="comments-area" data-no="${ans.q_no }">

							<!-- 전문가 답변 표시 -->
							<c:if test="${ans.p_id ne null }">
								<h3>전문가 답변</h3>
							</c:if>

							<!-- 답변 제목 공간 -->
							<div class="col-lg-12">
								<h2>${ans.title }</h2>
							</div>

							<!-- 작성자 정보 -->
							<div>${ans.writer }
								<span class="right-align">${ans.w_date }&nbsp;&nbsp;<i
									class="fa fa-calendar-o"></i></span>
							</div>

							<!-- 본문 공간 -->
							<div class="ans-body">
								<h4>${ans.content }</h4>
							</div>

							<c:if test="${ans.p_id ne null }">
								<!-- 파트너 회원 정보 공간 -->
								<div class="pMemberInfo">

									<h3>${ans.name }</h3>
									<h3>${ans.w_name }</h3>
									<h3>${ans.w_address }</h3>
									<h3>${ans.n_content }</h3>
									<img src="resources/upload/${ans.picture }">
									<h3>${ans.speciality }</h3>
									<h3>${ans.career }</h3>

									<!-- 이 전문가와 상담 -->
									<button id="pMemPage" type="button" class="btn btn-primary">이
										전문가와 상담하기</button>

								</div>
							</c:if>


							<!-- 답변자와 세션 아이디가 같을 때 수정, 삭제 버튼 -->
							<div class="updateAns">
								<c:if test="${mId eq ans.writer || pId eq ans.writer}">
									<!-- 글 수정 모달 -->
									<button type="button" id="updateBtn" class="btn btn-primary"
										data-toggle="modal" data-target=".bd-example-modal-lg2">수정</button>
									<button type="button" id="deleteBtn" class="btn btn-secondary">삭제</button>
								</c:if>

								<div class="modal fade bd-example-modal-lg2" tabindex="-1"
									role="dialog" aria-labelledby="myLargeModalLabel"
									aria-hidden="true">
									<div class="modal-dialog modal-lg">
										<div class="modal-content">
											<div class="form-group">
												<label for="title">제목</label> <input type="text"
													class="form-control" id="title" name="title"
													value="RE : ${qnaDetail.title }" required="required"
													pattern=".{4,100}">
											</div>
											<div class="form-group">
												<label for="content">내용</label>
												<textarea class="form-control" rows="15" id="content"
													name="content"></textarea>
											</div>
											<c:if test="${mId ne null}">
												<input type="hidden" id="writer" name="writer"
													value="${mId }">
											</c:if>
											<c:if test="${pId ne null}">
												<input type="hidden" id="writer" name="writer"
													value="${pId }">
											</c:if>
											<input type="hidden" id="p_no" name="p_no"
												value="${qnaDetail.q_no }">

											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-dismiss="modal">취소</button>
												<button type="button" id="sendAns" name="sendAns"
													class="btn btn-primary">답변 등록</button>
											</div>
										</div>
									</div>
								</div>
							</div>

							<!-- Button trigger modal -->
							<!-- 질문글 신고 모달-->
							<!-- button trigger modal -->
							<c:if
								test="${mId ne null || mId ne ans.writer || pId ne ans.writer}">
								<div>
									<button id="reportModal" type="button"
										class="btn btn-secondary" data-toggle="modal"
										data-target="#exampleModal">신고</button>
								</div>
							</c:if>
							<!-- Modal -->
							<div class="modal fade" id="exampleModal" tabindex="-1"
								role="dialog" aria-labelledby="exampleModalLabel"
								aria-hidden="true">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h3 class="modal-title" id="exampleModalLabel">게시물 신고</h3>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body">

											<h4>신고 유형</h4>

											<input type="hidden" id="reporter" name="reporter"
												value="${mId }"> <input type="hidden" id="q_no"
												name="q_no" value="${ans.q_no }"> <input
												type="hidden" id="reported" name="reported"
												value="${ans.writer }"> <select class="reportModal"
												name="code" id="code">
												<option value="601">불법 홍보/광고</option>
												<option value="602">음란물/선정성 콘텐츠</option>
												<option value="603">욕설/명예훼손</option>
												<option value="604">사생활 침해</option>
												<option value="605">게시물 도배</option>
											</select> <br> <br>

											<h4>신고 내용</h4>
											<textarea id="content" name="content" rows="4" cols="50"></textarea>

										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-dismiss="modal">취소</button>
											<button id="sendReport" name="sendReport" type="button"
												class="btn btn-primary">신고 접수</button>
										</div>
									</div>
								</div>
							</div>
							<!-- 신고 모달 끝 -->
						</div>
					</c:forEach>
				</div>
			</div>
			<div id="banner" class="col-lg-4" align="right">
				<div class="blog_right_sidebar">

					<aside class="single_sidebar_widget ads_widget">
						<img class="img-fluid" src="resources/qna/배너1.png" alt=""> <img
							class="img-fluid" src="resources/qna/배너4.png" alt=""> <img
							class="img-fluid" src="resources/qna/배너3.png" alt=""> <img
							class="img-fluid" src="resources/qna/배너5.png" alt="">
					</aside>

					<aside class="single_sidebar_widget post_category_widget">
						<h4 id="bestQna" class="widget_title">베스트 Q&A</h4>
						<c:forEach items="${best }" var="best">
							<ul class="list cat-list">
								<li><a href="qnaDetail?q_no=${best.q_no }"
									class="d-flex justify-content-between">
										<p>${best.title}</p>
								</a></li>
							</ul>
						</c:forEach>
						<div class="br"></div>
					</aside>

				</div>
			</div>

		</div>
	</section>
	<!--================Blog Area =================-->
	<script>
		/*신고 모달*/
		$('#sendReport').click(
				function() {
					$.ajax({
						method : "POST",
						url : "newQnaReport",
						data : {
							"reporter" : $('#reporter').val(),
							"content" : $('#content').val(),
							"q_no" : $('#q_no').val(),
							"reported" : $('#reported').val(),
							"code" : $('#code option:selected').val()
						},
						success : function() {
							alert('신고 접수가 완료되었습니다.');
							location.reload();
						},
						error : function(request, status, error) {
							alert("code:" + request.status + "\n" + "message:"
									+ request.responseText + "\n" + "error:"
									+ error);
						}
					})
				})

		/*답변글 작성 모달*/
		$('#sendAns').click(function() {
			$.ajax({
				method : "POST",
				url : "newAns",
				data : {
					"writer" : $('#writer').val(),
					"title" : $('#title').val(),
					"content" : $('#content').val(),
					"p_no" : $('#p_no').val()
				},
				success : function() {
					alert('답변이 성공적으로 등록되었습니다.');
					location.reload();
				},
				error : function() {
					alert('오류가 발생했습니다. 재시도하거나 관리자에게 문의하세요.');
				}
			})
		})

		/*답변글 수정 모달*/

		/*답변 삭제*/
		$(function() {
			$('#deleteBtn').click(function() {
				if (confirm("정말 삭제하시겠습니까?")) {
					var no = $(this).closest(".comments-area").data("no");
					console.log(no)
					$.ajax({
						method : "GET",
						url : "ansDelete",
						data : {
							q_no : no
						},
						success : function() {
							alert('성공적으로 삭제되었습니다.');
							location.reload();
						},
						error : function() {
							alert('오류가 발생했습니다. 재시도하거나 관리자에게 문의하세요.');
						}
					})
				}
			});
		});

		/*sns 공유*/
		function shareTwitter() {
			var sendText = "Q&A 공유";
			var thisUrl = document.URL;
			window.open("https://twitter.com/intent/tweet?text=" + sendText
					+ "&url=" + thisUrl);
		}

		function shareFacebook() {
			var thisUrl = document.URL;
			window.open("http://www.facebook.com/sharer/sharer.php?u="
					+ document.URL);
		}

		function shareKakao() {
			var thisUrl = document.URL;

			// 사용할 앱의 JavaScript 키 설정
			Kakao.init('8dd6df94d3383f78b704733cebd55ea2');

			// 카카오링크 버튼 생성
			Kakao.Link.createDefaultButton({
				container : '#btnKakao', // 카카오공유버튼ID
				objectType : 'feed',
				content : {
					title : "Q&A 공유", // 보여질 제목
					description : "Q&A 공유", // 보여질 설명
					imageUrl : thisUrl, // 콘텐츠 URL
					link : {
						mobileWebUrl : thisUrl,
						webUrl : thisUrl
					}
				}
			});

		}
	</script>

</body>