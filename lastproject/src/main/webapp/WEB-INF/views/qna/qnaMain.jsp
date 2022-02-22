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
<script>
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href = "qnaMain?nowPage=${paging.nowPage}&cntPerPage=" + sel;
	}
</script>


</head>
<body>
	<section class="banner-area other-page">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<h1>Blog Home</h1>
					<a href="index.html">Home</a> <span>|</span> <a
						href="blog-home.html">Blog Home</a>
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
											<li>${qnaList.writer }<i class="fa fa-user-o"></i></li>
											<li>${qnaList.w_date }<i class="fa fa-calendar-o"></i></li>
											<li>${qnaList.hit }Views<i class="fa fa-eye"></i></li>
											<li>Comments <i class="fa fa-comment-o"></i></li>
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
													<td>${qnaList.content }<c:forEach
															items="${qnaList.tagList }" var="taglist">
															<ul class="tagList">
																<li class="tagli"><a href="#">${taglist.t_name}</a></li>
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


						<!-- Pagination
						<div style="display: block; text-align: center;">
							<c:if test="${paging.startPage != 1 }">
								<a
									href="/boardList?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
							</c:if>
							<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
								var="p">
								<c:choose>
									<c:when test="${p == paging.nowPage }">
										<b>${p }</b>
									</c:when>
									<c:when test="${p != paging.nowPage }">
										<a
											href="/boardList?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
									</c:when>
								</c:choose>
							</c:forEach>
							<c:if test="${paging.endPage != paging.lastPage}">
								<a
									href="/boardList?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
							</c:if>
						</div>-->
					</div>
				</div>
				<div class="col-lg-4">
					<div class="blog_right_sidebar">
						<aside class="single_sidebar_widget search_widget">
							<a href="qnaForm"><button type="button" class="q-btn">질문글
									남기기</button></a>

							<div class="input-group">
								<input type="text" class="form-control" name="searchValue">
								<span class="input-group-btn">
									<button class="btn btn-default" type="button">
										<i class="fa fa-search"></i>
									</button>
								</span>
							</div>
							<!-- /input-group -->
							<div class="br"></div>
						</aside>
						<aside class="single-sidebar-widget tag_cloud_widget">
							<h4 class="widget_title">인기 태그</h4>
							<c:forEach items="${tagList }" var="tagList">
								<ul class="tagList">
									<li class="tagli"><a href="#">${tagList.t_name }</a></li>
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

</body>

</html>