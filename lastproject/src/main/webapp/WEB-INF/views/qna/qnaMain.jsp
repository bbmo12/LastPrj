<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
	float: left;
	margin-right: 5px;
}

.template-btn {
	float: right;
}

.q-btn {
	align: center;
	border: none;
	background-color: white-gray
}
</style>
<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
</head>

<body>
	<section class="banner-area other-page">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<h1>Open Q&A</h1>
				</div>
			</div>
		</div>
	</section>

	<!--================Blog Categorie Area =================-->
	<section class="blog_categorie_area"></section>
	<!--================Blog Categorie Area =================-->

	<!--================Blog Area =================-->

	<section class="blog_area">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<div class="blog_left_sidebar">
						<article class="row blog_item">
							<c:forEach items="${qnaList }" var="qnaList">

								<div class="col-md-3">
									<div class="blog_info text-right">


										<ul class="blog_meta list">
											<li>${qnaList.writer }&nbsp;&nbsp;<i class="fa fa-user-o"></i></li>
											<li>${qnaList.w_date }&nbsp;&nbsp;<i class="fa fa-calendar-o"></i></li>
											<li>${qnaList.hit }Views&nbsp;&nbsp;<i class="fa fa-eye"></i></li>
											<li>${qnaList.recnt }Comments&nbsp;&nbsp;<i class="fa fa-comment-o"></i></li>
										</ul>
									</div>
								</div>
								<div class="col-md-9">
									<div class="blog_post">
										<div class="blog_details">
											<table id="more_list">
												<tr>
													<th>${qnaList.title }</th>
												<tr>
												<tr>
													<td>${qnaList.content }
													<c:forEach
															items="${qnaList.tagList }" var="hash">
															<ul class="tagList">
																<li class="tagli"><a href="tagSearch?t_name=${hash.t_name }">${hash.t_name}</a></li>
															</ul>
														</c:forEach>
													</td>
												<tr>
											</table>
											<a class="template-btn"
												href="qnaDetail?q_no=${qnaList.q_no }">View More</a>
										</div>
									</div>
								</div>
								<hr>
							</c:forEach>
						</article>


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
				<div class="col-lg-4">
					<div class="blog_right_sidebar">
						<aside class="single_sidebar_widget search_widget">
							<a href="qnaForm"><button type="button" class="q-btn">질문글
									작성</button></a>
							<form action="qnaMain" method="post">
								<div class="input-group">

									<input type="text" class="form-control" name="searchValue">
									<span class="input-group-btn">
										<button class="btn btn-default" type="submit">
											<i class="fa fa-search"></i>
										</button>
									</span>
									<!--<div class="dropdown">
										<button class="btn btn-secondary dropdown-toggle"
											type="button" id="dropdownMenu2" data-toggle="dropdown"
											aria-haspopup="true" aria-expanded="false">선택
										</button>
										<div class="dropdown-menu" aria-labelledby="dropdownMenu2">
											<button class="dropdown-item" type="button">제목</button>
											<button class="dropdown-item" type="button">내용</button>
											<button class="dropdown-item" type="button">작성자</button>
										</div>
									</div>  -->

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
									</select>
								</div>
							</form>

							<!-- /input-group -->
							<div class="br"></div>
						</aside>
						<aside class="single-sidebar-widget tag_cloud_widget">
							<h4 class="widget_title">인기 태그</h4>
							<c:forEach items="${tagList }" var="tagList">
								<ul class="tagList">
									<li class="tagli"><a href="tagSearch?t_name=${tagList.t_name }">${tagList.t_name }</a></li>
								</ul>
							</c:forEach>
						</aside>


						<aside class="single_sidebar_widget ads_widget">
							<a href="#"><img class="img-fluid"
								src="assets/images/blog/add.jpg" alt=""></a>
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
    </script> -->
	<script>
		$(document).ready(function() {
			$(".dropdown-toggle").dropdown();
		});
	</script>
</body>

</html>