<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.tagList {
	list-style: none;
}

.tagli {
	margin-right: 5px;
}

.blog_meta list {
	float: right;
}

.social {
	margin-left: 570px;
}

.ans-body {
	text-align: left;
}

.right-align {
	float: right;
}

#qSection {
	border: 1px solid rgb(220, 220, 220);
	padding: 20px;
}

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
	top: -1100px;
}

#bestQna {
	margin-top: 30px;
}

#ansBtn {
	/* float: right; */
	margin-left : 470px;
}

.updateAns {
	margin-left: 550px;
}

#pMemPage {
	margin-left: 380px;
}

.qnaBody {
	font-size: 20px;
	color: black;
	text-align: left;
	margin-left: 10px;
	margin-top: 30px;
	margin-bottom: 40px;
}

.profile {
	width: 80px;
	height: 80px;
	object-fit: cover;
	border-radius: 70%;
	overflow: hidden;
	border: 2px solid rgb(46, 46, 46);
	margin-right: 5px;
}

.petInfo {
	width: 670px;
	height: 120px;
	margin-left: 20px;
	background: rgb(241, 241, 241);
	padding: 20px;
	margin-bottom: 30px;
}

.tags {
	margin-top: 10px;
	margin-bottom: 10px;
}

#reportModal {
	margin-right: 500px;
}

#postInfo {
	text-align: right;
	color: #353535;
	margin-top: 20px;
}

#pro {
	font-size: 20px;
	color: dodgerblue;
	margin-bottom: 10px;
	margin-left: 20px;
}

.pMemberInfo {
	width: 650px;
	background: rgb(227, 241, 255);
	padding: 20px;
	color: black;
	margin-left: 20px;
	margin-bottom: 20px;
}

.qRepo {
	float: left;
}

#qUpdateBtn {
	float : right;
	margin-left : 550px;
}

#qDelBtn {
	float : right;
	margin-left : 10px;
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
				<c:if test="${pId eq null}">
					<div class="qnaForm">
						<a href="qnaForm?m_id=${mId }"><button type="button"
								class="btn btn-primary btn-lg">질문글 작성하기</button></a>
					</div>
				</c:if>
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
							<table>
								<tr>
									<td rowspan="2"><i class="fa-solid fa-q fa-5x"
										style="color: dodgerblue; margin-right: 20px;"></i>
									<td style="width: 470px; font-size: 28px; color: black;">${qnaDetail.title }</td>
									<!-- 글 정보 -->
									<td rowspan="2">
										<ul id="postInfo" class="blog_meta list">
											<li>${qnaDetail.w_date }&nbsp;&nbsp;<i
												class="fa fa-calendar-o"></i></li>
											<li>${qnaDetail.hit }&nbsp;&nbsp;<i class="fa fa-eye"></i></li>
											<li>${cnt }Comments&nbsp;&nbsp;<i
												class="fa fa-comment-o"></i></li>
										</ul>
									</td>
								</tr>
								<tr>
									<td style="font-size: 16px; color: rgb(46, 46, 46)"><c:out
											value="${qnaDetail.writer }"></c:out></td>
								</tr>
							</table>
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


						<!-- 본문 공간 -->
						<div class="col-lg-12 col-md-12">

							<!-- 본문 공간 -->
							<div>
								<p class="qnaBody">${qnaDetail.content }</p>

								<!-- 태그 공간 -->
								<div class="tags">
									<c:forEach items="${qnaDetail.tagList }" var="hash">
										<ul class="tagList">
											<li class="tagli"><a
												href="tagSearch?t_name=${hash.t_name }"><button class="genric-btn success circle">${hash.t_name}</button></a></li>
										</ul>
									</c:forEach>
								</div>
							</div>

							<c:if test="${qnaDetail.petvo.pet_no != null }">
								<!-- 펫 정보 공간 -->
								<div class="petInfo">
									<table style="color: black">
										<tr>
											<td rowspan="3"><img class="profile"
												src="resources/upload/${qnaDetail.petvo.picture }"
												onError="this.src='resources/qna/대체이미지2.png'"></td>
											<td style="font-weight: bold;"><c:if
													test="${qnaDetail.petvo.code ==501 }">
													<c:out value="강아지" />
												</c:if> <c:if test="${qnaDetail.petvo.code ==502 }">
													<c:out value="고양이" />
												</c:if> <c:if test="${qnaDetail.petvo.code ==503 }">
													<c:out value="조류" />
												</c:if> <c:if test="${qnaDetail.petvo.code ==504 }">
													<c:out value="파충류" />
												</c:if> <c:if test="${qnaDetail.petvo.code ==505 }">
													<c:out value="어류" />
												</c:if> <c:if test="${qnaDetail.petvo.code ==506 }">
													<c:out value="토끼" />
												</c:if> <c:if test="${qnaDetail.petvo.code ==507 }">
													<c:out value="돼지" />
												</c:if> <c:if test="${qnaDetail.petvo.code ==508 }">
													<c:out value="햄스터" />
												</c:if> <c:if test="${qnaDetail.petvo.code ==509 }">
													<c:out value="미어캣" />
												</c:if> <c:if test="${qnaDetail.petvo.code ==510 }">
													<c:out value="여우" />
												</c:if> <c:if test="${qnaDetail.petvo.code ==511 }">
													<c:out value="거미" />
												</c:if></td>
										</tr>
										<tr>
											<td>이름 : ${qnaDetail.petvo.name }</td>
										</tr>
										<tr>
											<td>몸무게 : ${qnaDetail.petvo.weight } kg</td>
										</tr>
									</table>
								</div>
							</c:if>
						</div>
						
						<!-- 세션 아이디와 글쓴이 일치할 때 수정, 삭제 가능 -->
						<c:if test="${qnaDetail.title ne '[작성자에 의해 삭제된 게시물입니다.]'}">
							<c:if test="${mId eq qnaDetail.writer }">
								<a href="qModiForm?q_no=${qnaDetail.q_no }&m_id=${mId}"><button
										type="button" id="qUpdateBtn" class="btn btn-primary">수정</button></a>
								<button type="button" id="qDelBtn" class="btn btn-secondary"
									onclick="qDelete(${qnaDetail.q_no });">삭제</button>
							</c:if>
						</c:if>

						<!-- 질문글 신고 trigger -->
						<c:if test="${mId ne null}">
							<c:if test="${mId ne qnaDetail.writer }">
								<button type="button" class="btn btn-secondary"
									data-toggle="modal" data-target="#exampleModal">
									<i class="fa-solid fa-triangle-exclamation"></i>&nbsp;게시글 신고
								</button>
							</c:if>
						</c:if>

						<!-- 질문글 신고 모달-->

						<!-- 신고 Modal -->
						<div class="modal fade" id="exampleModal" tabindex="-1"
							role="dialog" aria-labelledby="exampleModalLabel"
							aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h3 class="modal-title" id="exampleModalLabel">
											<i class="fa-solid fa-triangle-exclamation"></i>&nbsp;게시물 신고
										</h3>
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
										<textarea id="content" name="content" rows="4" cols="50"
											required></textarea>

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

						<div>
							<!--로그인 세션 있을 경우 답변 모달창-->
							<!--modal trigger button-->
							<c:if test="${ mId ne null || pId ne null}">
								<c:if test="${mId ne qnaDetail.writer  }">
									<button type="button" id="ansBtn"
										class="btn btn-primary btn-lg" data-toggle="modal"
										data-target=".bd-example-modal-lg">이 질문에 답변하기</button>
								</c:if>
							</c:if>

							<!-- 답변 모달창 -->
							<div class="modal fade bd-example-modal-lg newAns" tabindex="-1"
								role="dialog" aria-labelledby="myLargeModalLabel"
								aria-hidden="true">
								<div class="modal-dialog modal-lg">
									<div class="modal-content" id="updForm">
										<label for="title">제목</label> <input type="text"
											class="form-control" id="title" name="title"
											value="RE : ${qnaDetail.title }" required="required"
											pattern=".{4,100}"> <label for="content">내용</label>
										<textarea class="form-control" rows="15" id="content"
											name="content"></textarea>

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
								<div id="pro">
									<span><i class="fa-solid fa-paw"></i></span> <span>전문가
										답변</span>
								</div>
							</c:if>

							<!-- 답변 제목 공간 -->
							<div class="col-lg-12">
								<table>
									<tr>
										<td rowspan="2"><i class="fa-solid fa-a fa-5x"
											style="margin-right: 20px;"></i>
										<td>
										<td
											style="width: 460px; font-size: 28px; color: black; text-align: left">${ans.title }</td>
										<td>${ans.w_date }&nbsp;&nbsp;<i class="fa fa-calendar-o"></i>
										</td>
									</tr>
									<tr>
										<td colspan="3"
											style="font-size: 16px; color: rgb(46, 46, 46)"><c:out
												value="${ans.writer }"></c:out></td>
									</tr>
								</table>
							</div>

							<!-- 본문 공간 -->
							<div class="ans-body">
								<p class="qnaBody">${ans.content }</p>
							</div>

							<c:if test="${ans.p_id ne null }">
								<!-- 파트너 회원 정보 공간 -->
								<div class="pMemberInfo">
									<table>
										<tr>
											<td rowspan="4"><img class="profile"
												src="resources/upload/${ans.picture }"
												onError="this.src='resources/qna/대체이미지2.png'"></td>
											<td style="font-weight: bold;"><c:if
													test="${ans.code == 100}">
													<c:out value="수의사" />
												</c:if> <c:if test="${ans.code == 101}">
													<c:out value="훈련사" />
												</c:if> <c:if test="${ans.code == 102}">
													<c:out value="펫시터" />
												</c:if> <c:if test="${ans.code == 103}">
													<c:out value="미용사" />
												</c:if></td>
										</tr>
										<tr>
											<td>이름 : ${ans.name }</td>
										</tr>
										<tr>
											<td>근무지 : ${ans.w_address }&nbsp; ${ans.w_name }</td>
										</tr>
										<tr>
											<td>${ans.n_content }</td>
										</tr>
									</table>


									<!-- 이 전문가와 상담 -->
									<a href="goToPdetail?p_id=${ans.writer}"><button id="pMemPage" type="button"
										class="btn btn-primary btn-lg">이 전문가와 상담하기</button></a>
								</div>
							</c:if>


							<!-- 답변자와 세션 아이디가 같을 때 수정, 삭제 버튼 -->
							<div class="updateAns" data-no="${ans.q_no }">
								<c:if test="${mId eq ans.writer || pId eq ans.writer}">
									<!-- 글 수정 모달 -->
									<button type="button" id="updateBtn" class="btn btn-primary"
										data-toggle="modal" onclick="prevContent(${ans.q_no });">수정</button>
									<button type="button" id="deleteBtn" class="btn btn-secondary">삭제</button>
								</c:if>

								<div class="modal fade bd-example-modal-lg2" tabindex="-1"
									role="dialog" aria-labelledby="myLargeModalLabel"
									aria-hidden="true" id="${ans.q_no }">
									<div class="modal-dialog modal-lg ansUpdate">
										<div class="modal-content">
											<label for="title">제목</label> <input type="text"
												class="form-control" id="title" name="title"
												value="${ans.title }" required="required" pattern=".{4,100}">


											<label for="content">내용</label>
											<textarea class="form-control" rows="15" id="content"
												name="content">${ans.content }</textarea>

											<input type="hidden" id="writer" name="writer"
												value="${ans.writer }"> <input type="hidden"
												id="q_no" name="q_no" value="${ans.q_no }">

											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-dismiss="modal">취소</button>
												<button type="button" id="updateAns" name="updateAns"
													class="btn btn-primary" onclick="updAns(${ans.q_no })">답변
													수정</button>
											</div>
										</div>
									</div>
								</div>
							</div>

							<!-- Button trigger modal -->
							<!-- 답변글 신고 모달-->
							<!-- button trigger modal -->
							<div class="reportAns" data-no="${ans.q_no }">

								<div>
									<c:if test="${mId ne null}">
										<c:if test="${mId ne ans.writer}">
											<c:if test="${pId ne ans.writer}">
												<button id="reportModal2" type="button"
													class="btn btn-secondary btn-sm" data-toggle="modal"
													data-target="#exampleModal2"
													onclick="transferQno('${ans.q_no }','${ans.writer }');">
													<i class="fa-solid fa-triangle-exclamation"></i>&nbsp;게시글
													신고
												</button>
											</c:if>
										</c:if>
									</c:if>
								</div>


								<!-- Modal -->
								<div class="modal fade" id="exampleModal2" tabindex="-1"
									role="dialog" aria-labelledby="exampleModalLabel"
									aria-hidden="true">
									<div class="modal-dialog" role="document">
										<div class="modal-content ArepModal">
											<div class="modal-header">
												<h3 class="modal-title" id="exampleModalLabel">
													<i class="fa-solid fa-triangle-exclamation"></i>&nbsp;게시물
													신고
												</h3>
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
												<input type="hidden" id="qNo"> <input type="hidden"
													id="Awriter">
											</div>
											<div class="modal-body">

												<h4>신고 유형</h4>

												<input type="hidden" id="reporter" name="reporter"
													value="${mId }"> <select class="reportModal"
													name="code" id="code">
													<option value="601">불법 홍보/광고</option>
													<option value="602">음란물/선정성 콘텐츠</option>
													<option value="603">욕설/명예훼손</option>
													<option value="604">사생활 침해</option>
													<option value="605">게시물 도배</option>
												</select> <br> <br>

												<h4>신고 내용</h4>
												<textarea id="content" name="content" rows="4" cols="50"
													required></textarea>

											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-dismiss="modal">취소</button>
												<button id="sendReport2" name="sendReport" type="button"
													class="btn btn-primary">신고 접수</button>
											</div>
										</div>
									</div>
								</div>
								<!-- 신고 모달 끝 -->
							</div>
						</div>
					</c:forEach>
				</div>
			</div>

			<!-- aside 섹션 -->
			<div id="banner" class="col-lg-4" align="right">
				<div class="blog_right_sidebar">

					<!-- 배너 광고 -->
					<aside class="single_sidebar_widget ads_widget">
						<img class="img-fluid" src="resources/qna/배너1.png" alt=""> <img
							class="img-fluid" src="resources/qna/배너4.png" alt=""> <img
							class="img-fluid" src="resources/qna/배너3.png" alt=""> <img
							class="img-fluid" src="resources/qna/배너5.png" alt="">
					</aside>

					<!-- 베스트 qna -->
					<aside class="single_sidebar_widget post_category_widget">
						<h4 id="bestQna" class="widget_title">베스트 Q&A</h4>
						<c:forEach items="${best }" var="best">
							<ul style="text-align: left;" class="list cat-list">
								<li style="display: inline-block;"><a
									href="qnaDetail?q_no=${best.q_no }"
									class="d-flex justify-content-between"> <i
										class="fa-solid fa-q"></i>&nbsp;&nbsp;${best.title}
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
	<!-- 스크립트 영역 -->
	<script>
		/*질문글 신고 모달*/
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
				error : function() {
					alert('오류가 발생했습니다. 재시도하거나 관리자에게 문의하세요.');
				}
			})
		})
		
		/*질문 삭제 ajax*/
		function qDelete(no){
			
			console.log(no);
			
			//댓글 갯수
			var count = "${cnt}";
			
			if(confirm('정말 삭제하시겠습니까?')){
				
			if(count > 0){
			$.ajax({
				method : "POST",
				url : "qDeleteOne",
				data : {
					q_no : no
				},
				success : function(){
					alert('삭제되었습니다.');
					location.reload();
				},
				error : function(){
					alert('오류가 발생했습니다. 재시도하거나 관리자에게 문의하세요.')
				}
			})
			}
			else {
				$.ajax({
					method : "POST",
					url : "qDeleteTwo",
					data : {
						q_no : no
					},
					success : function(){
						alert('삭제되었습니다.');
						history.back();
						location.reload();
					},
					error : function(){
						alert('오류가 발생했습니다. 재시도하거나 관리자에게 문의하세요.')
					}
				})
			}
		}	
	 }
		
		/*답변글 신고 시 글 번호, 글쓴이 넘김*/
		function transferQno(no, writer){
			$('#qNo').val(no);
			$('#Awriter').val(writer);
		}

		
		/*답변글 신고 모달*/
			$('#sendReport2').click(function() {
				$.ajax({
					method : "POST",
					url : "newQnaReport",
					data : {
						"reporter" : $('#reporter').val(),
						"content" : $('.ArepModal #content').val(),
						"q_no" : $('#qNo').val(),
						"reported" : $('#Awriter').val(),
						"code" : $('.ArepModal #code option:selected').val()
					},
					success : function() {
						alert('신고 접수가 완료되었습니다.');
						location.reload();
					},
					error : function() {
						alert('오류가 발생했습니다. 재시도하거나 관리자에게 문의하세요.');
					}
				})
			})
			
			
		/*답변글 작성 모달*/
		$('#sendAns').click(function() {
			$.ajax({
				method : "POST",
				url : "newAns",
				data : {
					"writer" : $('.newAns #writer').val(),
					"title" : $('.newAns #title').val(),
					"content" : $('.newAns #content').val(),
					"p_no" : $('.newAns #p_no').val()
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

		/*수정 버튼 클릭 시 기존 내용을 모달로 넘겨줌.*/
		function prevContent(info) {
			$('#'+info).modal('show');
		}

		/*답변글 수정 모달*/
		function updAns(info){
			
			var title = $('#'+ info).find('#title').val();
			var content = $('#'+ info).find('#content').val();
			console.log(title);
			console.log(content);
	
			$.ajax({
				method : "POST",
				url : "ansUpdate",
				data : {
					q_no : info,
					"title" : title,
					"content" : content
				},
				success : function() {
					alert('답변이 수정되었습니다.');
					location.reload();
				},
				error : function() {
					alert('오류가 발생했습니다. 재시도하거나 관리자에게 문의하세요');
				}
			})
		}

		/*답변 삭제*/
		$(function() {
			$('#deleteBtn').click(function() {
				if (confirm("정말 삭제하시겠습니까?")) {
					//여러 개의 답변을 배열 형태로 나타내기 때문에 해당 버튼의(this) 가장 가까운 부모(closest)의 data-no("no") 가져옴.
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