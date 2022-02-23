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
	float: right;
	margin-left: 630px;
}

.ans-body {
	text-align: left;
}

.right-align {
	float: right;
}

.q-btn {
	margin-left: 600px;
}

.btn btn-primary {
	float: left;
}

#banner {
	margin-left: 780px;
	/*top : -1000px;*/
}
</style>
<script src="https://kit.fontawesome.com/397860a4e3.js"
	crossorigin="anonymous"></script>
</head>
<body>
	<!-- Banner Area Starts -->
	<section class="banner-area other-page">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<h1>Open Q&A</h1>
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
					<div class="single-post row">
						<!-- 제목 위치 -->
						<div class="col-lg-12">
							<h2>${qnaDetail.title }</h2>
						</div>

						<!-- 본문 공간 -->
						<div class="col-lg-9 col-md-9">
							<!-- 작성자 정보 -->
							<div>${qnaDetail.writer }</div>

							<h4>${qnaDetail.content }</h4>

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
							<a id="btnTwitter" class="link-icon twitter"
								href="javascript:shareTwitter();"><img
								src="resources/qna/icon-twitter.png"></a> <span><a
								id="btnFacebook" class="link-icon facebook"
								href="javascript:shareFacebook();"><img
									src="resources/qna/icon-facebook.png"></a></span> <span><a
								id="btnKakao" class="link-icon kakao"
								href="javascript:shareKakao();"><img
									src="resources/qna/icon-kakao.png"></a></span>

						</div>

						<div>
							<button type="button" class="btn btn-primary" data-toggle="modal"
								data-target="#exampleModal">신고</button>
						</div>
						<div>
							<a href="ansForm"><button type="button" class="q-btn">이
									질문에 답변하기</button></a>
						</div>
					</div>

					<c:if test="${empty ansDetail}">
						<img src="resources/qna/답변유도.png" alt="">
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
							<button type="button" class="btn btn-primary" data-toggle="modal"
								data-target="#exampleModal">신고</button>
							<i class="fas fa-bell"></i> <i
								class="fa-light fa-hexagon-exclamation"></i>
						</div>
					</c:forEach>
				</div>
			</div>
			<div id="banner" class="col-lg-4" align="right">
				<div class="blog_right_sidebar">
					<aside class="single_sidebar_widget ads_widget">
						<img class="img-fluid" src="resources/qna/배너1.png" alt=""> <img
							class="img-fluid" src="resources/qna/배너4.png" alt=""> <img
							class="img-fluid" src="resources/qna/배너2.png" alt=""> <img
							class="img-fluid" src="resources/qna/배너3.png" alt=""> <img
							class="img-fluid" src="resources/qna/배너5.png" alt="">
					</aside>

				</div>
			</div>

		</div>
	</section>
	<!--================Blog Area =================-->

</body>
</html>