<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
</style>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

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
								<table>
									<tr>
										<td><h3>
												<c:out value="${writerInfo.m_id }"></c:out>
											</h3></td>
										<td rowspan="2"><c:out value="${writerInfo.picture }"></c:out></td>
									</tr>
									<tr>
										<h4>
											<c:out value="${writerInfo.name }"></c:out>
										</h4>
									</tr>
								</table>
							</div>

							<!-- 본문 공간 -->
							<div>
								<h3>${qnaDetail.content }</h3>
							</div>

							<!-- 펫 정보 공간 -->
							<div>
								<table>
									<tr>
										<td rowspan="5"><c:out value="${petInfo.picture }"></c:out></td>
										<td><c:out value="${petInfo.name }"></c:out></td>
									</tr>
									<tr>
										<td><c:out value="${petInfo.gender }"></c:out></td>
									</tr>
									<tr>
										<td><c:out value="${petInfo.weight }"></c:out></td>
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
						<c:if test="${m_id ne null }">
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

										<input type="hidden" id="reporter" name="reporter"
											value="${m_id }"> <input type="hidden" id="q_no"
											name="q_no" value="${qnaDetail.q_no }"> <input
											type="hidden" id="reported" name="reported"
											value="${qnaDetail.writer }"> <select
											class="reportModal" name="code" id="code">
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


							<a href="ansForm?q_no=${qnaDetail.q_no }&writer=${qnaDetail.writer}&pet_no=${qnaDetail.pet_no}"><button
									type="button" id="a-btn" class="btn btn-primary btn-lg">이
									질문에 답변하기</button></a>
						</div>
					</div>

					<!-- 답변이 없을 경우 -->
					<c:if test="${empty ansDetail}">
						<img id="noAns" src="resources/qna/답변유도.png" alt="">
					</c:if>

					<!-- 답변  -->
					<c:forEach items="${ansDetail }" var="ans">


						<div class="comments-area">
							<div class="col-lg-12">

								<h2>${ans.title }</h2>


							</div>

							<!-- 작성자 정보 -->
							<div>${ans.writer }
								<span class="right-align">${qnaDetail.w_date }&nbsp;&nbsp;<i
									class="fa fa-calendar-o"></i></span>
							</div>

							<!-- 본문 공간 -->
							<div class="ans-body">
								<h4>${ans.content }</h4>
							</div>


							<!-- Button trigger modal -->
							<!-- 질문글 신고 모달-->
							<!-- button trigger modal -->
							<c:if test="${m_id ne null }">
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
												value="${m_id }"> <input type="hidden" id="q_no"
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
		$('#sendReport').click(function() {
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
					alert('오류가 발생했습니다. 재시도하거나 관리자에게 문의하세요.');
				}
			})
		})

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
</html>