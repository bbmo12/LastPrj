<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#qSection {
	border: 1px solid #a9a9a9;
	padding: 20px;
}

.comments-area {
	margin-left : 500px;
	margin-right : 850px;

}

.btns {
	margin-left : 550px;
}
</style>

</head>
<body>

	<!-- 상단 배너 -->
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

	<!-- 질문글 노출 -->

	<section class="blog_area section-padding">
		<div class="container">
			<h2>답변글 작성하기</h2>
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
					</div>
				</div>
			</div>
		</div>

		<!-- 답변글 작성 -->
		<div class="comments-area">
			<form class="answer" action="newAns" method="post">
				<div class="form-group">
					<label for="title">제목</label>
					<input type="text" class="form-control" id="title" name="title" value="RE : ${qnaDetail.title }" required="required" pattern=".{4,100}">
				</div>
				<div class="form-group">
					<label for="content">내용</label>
					<textarea class="form-control" rows="15" id="content" name="content"></textarea>
				</div>
				
				<div class="btns">
				<button type="submit" class="btn btn-primary">등록</button>
				<button class="btn btn-secondary" onclick="history.back()">취소</button>
				</div>
				
				<input type="hidden" id="writer" name="writer" value="${m_id }">
				<input type="hidden" id="writer" name="writer" value="${p_id }">
				<input type="hidden" id="p_no" name="p_no" value="${qnaDetail.q_no }">
				<input type="hidden" id="r_check" name="r_check" value=0>
			</form>
		</div>
		
		<!-- 배너 위치 -->
		<!-- <div id="banner" class="col-lg-4" align="right">
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
			</div> -->
	</section>
	

</body>
</html>