<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
a:link {
	color: black;
	text-decoration: none;
}

a:visited {
	color: black;
	text-decoration: none;
}

a:hover {
	color: black;
	text-decoration: none;
}

.tagList {
	list-style: none;
}

.tagli {
	float: left;
	margin-right: 5px;
}

.pTag {
	border: 1px solid gray;
	font-size: 20px;
}

.template-btn {
	float: right;
}

.q-btn {
	align: center;
	border: none;
	background-color: white-gray;
}

.blog_area {
	padding-top: 100px;
}

.qnaForm, .img-fluid {
	padding-top: 30px;
}

#searchBox {
	margin-left: 10px;
	width: 210px;
	height: 50px;
	auto-focus: none;
	background-color: #38a4ff;
	border: none;
	border-radius: 30px;
	color: white;
}

.ads_widget {
	margin-top: 30px;
}

#tlist {
	display: inline-block;
	color: black;
}

ul li.tag-item {
	padding: 4px 8px;
	background-color: #777;
	color: #000;
}

.tag-item:hover {
	background-color: #262626;
	color: #fff;
}

hr {
	width: 700px;
	background-color: lightgray;
	margin-right: 30px;
}

#blogBody {
	margin-right: 70px;
}

#bInfo {
	text-align: right;
	color: #353535;
}

.qnaBody {
	font-size: 20px;
	color: black;
	margin-left: 70px;
	margin-top: 30px;
	margin-bottom: 40px;
	text-align: justify
}

.searchSelect {
	color: black;
}

.widget {
	background-color: #38a4ff;
	height : 50px;
	text-align : center;
	font-size : 20px;
	color : white;
	margin-top : 10px;
	margin-bottom : 10px;
	padding : 15px;
}

.genric-btn success{
	font-size : 13px;
}
</style>
<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/397860a4e3.js"
	crossorigin="anonymous"></script>
</head>

<body>
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
								class="genric-btn info circle arrow btn-lg">질문글 작성하기</button></a>
					</div>
				</c:if>
			</div>
		</div>
	</section>

	<!--================Blog Categorie Area =================-->

	<!--================Blog Categorie Area =================-->

	<!--================Blog Area =================-->


	<section class="blog_area">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<div class="blog_left_sidebar">
						<c:forEach items="${qnaList }" var="list">
							<article class="row blog_item" id="blogBody">

								<div class="col-lg-12">
									<div class="blog_post">
										<div class="blog_details">
											<table class="more_list">
												<tr>
													<td><i class="fa-solid fa-q fa-4x"
														style="color: dodgerblue; margin-right: 20px;"></i></td>
													<td style="width: 450px; font-size: 28px; color: black;">${list.title }
													</td>
													<td>
														<ul id="bInfo" class="blog_meta list">
															<li>${list.writer }&nbsp;&nbsp;<i
																class="fa fa-user-o"></i></li>
															<li>${list.w_date }&nbsp;&nbsp;<i
																class="fa fa-calendar-o"></i></li>
															<li>${list.hit }Views&nbsp;&nbsp;<i
																class="fa fa-eye"></i></li>
															<li>${list.recnt }Comments&nbsp;&nbsp;<i
																class="fa fa-comment-o"></i></li>
														</ul>
													</td>
												</tr>
											</table>


											<div class="qnaBody">${list.content }</div>

											<!-- 태그 목록 -->
											<div class="tags">
												<c:forEach items="${list.tagList }" var="hash">
													<ul class="tagList">
														<c:if test="${hash.t_name ne null}">
														<li class="tagli"><a
															href="tagSearch?t_name=${hash.t_name }"><button class="genric-btn success circle btn-sm">${hash.t_name}</button></a></li>
														</c:if>
													</ul>
												</c:forEach>
											</div>


											<!-- 상세조회 페이지 이동 -->
											<a style="float: right; margin-left: 400px;'"
												class="genric-btn info-border radius"
												href="qnaDetail?q_no=${list.q_no }">View More</a>
										</div>
									</div>
								</div>
							</article>
							<hr size="2" />

						</c:forEach>

						<!-- Pagination-->
						<form action="qnaMain" name="pageForm" method="post">
							<div style="display: block; text-align: center;">
								<nav class="blog-pagination justify-content-center d-flex">
									<div class="paginationDiv">
										<ul class="pagination">
											<c:if test="${page.prev }">
												<li><a
													href="qnaMain?pageNum=${page.startPage -1 }&amount=${page.amount}">prev</a></li>
											</c:if>

											<c:forEach var="num" begin="${page.startPage }"
												end="${page.endPage }">
												<li class="${page.pageNum eq num ? 'active' : '' }"><a
													href="qnaMain?pageNum=${num }&amount=${page.amount}">${num }</a>
												</li>
											</c:forEach>

											<c:if test="${page.next }">
												<li class="page-item"><a
													href="qnaMain?pageNum=${page.endPage + 1 }&amount=${page.amount}">next</a></li>
											</c:if>
										</ul>
									</div>
								</nav>
							</div>
							<input type="hidden" name="pageNum" value="${page.cri.pageNum }">
							<input type="hidden" name="amount" value="${page.cri.amount }">
							<input type="hidden" name="searchType"
								value="${page.cri.searchType }"> <input type="hidden"
								name="searchValue" value="${page.cri.searchValue }">
						</form>
					</div>
				</div>

				<!-- side 부분 -->
				<div class="col-lg-4" id="side">
					<div class="blog_right_sidebar">
						<!-- 검색 -->
						<aside class="single_sidebar_widget search_widget">

							<form action="qnaMain" method="post">
								<div class="input-group">

									<select class="searchSelect" name="searchType">
										<option value="title"
											${page.cri.searchType eq 'title' ? 'selected' : '' }>제목
										</option>
										<option value="content"
											${page.cri.searchType eq 'content' ? 'selected' : '' }>
											내용</option>
										<option value="writer"
											${page.cri.searchType eq 'writer' ? 'selected' : '' }>작성자
										</option>
									</select> <span><input type="text" id="searchBox"
										name="searchValue"></span> <span class="input-group-btn">
										<button class="btn btn-default" type="submit">
											<i class="fa fa-search"></i>
										</button>
									</span>


								</div>
							</form>

							<!-- /input-group -->
							<div class="br"></div>
						</aside>

						<!-- 베스트 QNA -->
						<aside class="single_sidebar_widget post_category_widget">
							<h4 id="bestQna" class="widget">베스트 Q&A</h4>
							<c:forEach items="${best }" var="best">
								<ul style="text-align: left;" class="list cat-list">
									<li id="tlist"><a href="qnaDetail?q_no=${best.q_no }"
										class="d-flex justify-content-between"> <i
											class="fa-solid fa-q"></i>&nbsp;&nbsp;${best.title}
									</a></li>
								</ul>
							</c:forEach>
							<div class="br"></div>
						</aside>

						<!-- 인기 태그 -->
						<aside class="single-sidebar-widget">
							<h4 class="widget">인기 태그</h4>
							<c:forEach items="${tagList }" var="tagList">
								<ul>
									<li class="tagli"><a
										href="tagSearch?t_name=${tagList.t_name }"><button class="genric-btn success-border circle btn-sm">${tagList.t_name }</button></a></li>
								</ul>
							</c:forEach>
						</aside>

						<!-- 배너 광고 -->
						<aside class="single_sidebar_widget ads_widget">
							<img class="img-fluid" src="resources/qna/배너1.png" alt="">
							<img class="img-fluid" src="resources/qna/배너4.png" alt="">
							<img class="img-fluid" src="resources/qna/배너5.png" alt="">
						</aside>

					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================Blog Area =================-->
	<!-- <script>
        //		페이지 처리
        //      모든 a버튼을 눌렀을 때 a가 가지고 있는 pageNum값을 가지고 form태그로 이동하도록 처리
        //      동적쿼리 이용해서 sql문 변경
        //      화면에 검색키워드가 미리 남겨지도록 처리.
        var pagination = document.querySelector(".pagination");
        pagination.onclick = function () {
            event.preventDefault(); // 고유이벤트 속성 중지
            if (event.target.tagName != 'A')
                return;

            // 사용자가 클릭한 페이지 번호를 form에 넣고 서브밋을 보냅니다.
            document.pageForm.pageNum.value = event.target.dataset.pagenum;
            document.pageForm.submit(); // 서브밋
        }

        window.onload = function () {
            if (history.state == '')
                return; // 메시지를 출력했다면 함수종료

            var msg = '<c:out value="${msg }" />';

            if (msg != '') {
                alert(msg);
                // 기존 기록을 삭제하고 새로운 기록을 추가 ( 이렇게 변경된 값은 history.state로 데이터를 확인가능 )
                history.replaceState('', null, null); // 브라우저 기록컨트롤 (추가할데이터, 제목, url주소)
                // console.log(history.state);
            }
        }
    </script>
	<script>
		$(document).ready(function() {
			$(".dropdown-toggle").dropdown();
		});
	</script> -->
	<script>
		/*이미지 숨기기*/

		$(document).ready(function() {
			$('.qnaBody').find('img').css('display', 'none');
	/* 		$('.qnaBody').find('iframe').css('display', 'none'); */
		});
	</script>
</body>

</html>