<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib tagdir="/WEB-INF/tags/" prefix="my"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>

	<style>
		a:link,
		a:visited,
		a:hover {
			
			text-decoration: none;
		}

		.tagli {
			float: left;
			margin-right: 5px;
		}
		
		.tagli2{
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

		.qnaForm,
		.img-fluid {
			padding-top: 30px;
		}

		#searchBox {
			margin-left: 20px;
			width: 210px;
			height: 50px;
			padding-left: 15px;
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

		#bInfo {
			text-align: right;
			color: #353535;
			margin-left: 40px;
			margin-top: 40px;
		}

		.qnaBody {
			font-size: 20px;
			/* color: black; */
			margin:0 60px 15px 70px;
			text-align: justify
		}

		.searchSelect {
			color: black;
			position: relative;
			top: 50px;
		}

		.widget {
			background-color: #0062ff;
			height: 50px;
			text-align: center;
			color: white;
			padding: 15px;
			margin-bottom: 25px;
		}

		.genric-btn success {
			font-size: 13px;
		}
		
		#qna-button{
		color:white;
		}
		
		#qna-button:hover{
		color: white;
		}
		
	/* 	#view-button,
		#qna-button{
    		border: 1px solid transparent;
    		color: #0062ff;
		} */
		
	/* 	#view-button:hover,
		#qna-button:hover{
			color: #0062ff;
			border: 1px solid #0062ff;
			background: #fff;
		} */
		
	</style>

</head>

<body>
	<section class="banner-area other-page">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<h1>Open Q&A</h1>
					<h3>반려동물 전문가와 베테랑 집사들이 반려동물에 관한 모든 궁금증을 해결해드립니다!</h3>
				</div>
				<sec:authorize access="hasRole('MEMBER')">
					<div class="qnaForm">
						<a href="qnaForm" class="btn btn-primary btn-rounded btn-fw" id="qna-button">질문글작성하기</a>
					</div>
				</sec:authorize>
			</div>
		</div>
	</section>
	<section class="blog_area" style="padding-top: 50px;">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<div class="blog_left_sidebar">
						<form action="qnaMain" id="goform" name="goform">
							<input type="hidden" id="pageNum" name="pageNum" value="1">
							<c:forEach items="${qnaList }" var="list">
								<article class="row blog_item" id="blogBody">
									<div class="col-lg-12">
										<div class="blog_post">
											<div class="blog_details">
												<table class="more_list">
													<tr>
														<td>
															<i class="fa-solid fa-q fa-4x"
																style="color: dodgerblue; margin-right: 20px;"></i></td>
														<td style="width: 450px; font-size: 25px; color: black;">
															${list.title }</td>
														<td>
															<ul id="bInfo" class="blog_meta list">
																<li>${list.writer }&nbsp;&nbsp;
																	<i class="fa fa-user-o"></i>
																</li>
																<li>${list.w_date }&nbsp;&nbsp;
																	<i class="fa fa-calendar-o"></i>
																</li>
																<li>${list.hit }Views&nbsp;&nbsp;
																	<i class="fa fa-eye"></i>
																</li>
																<li>${list.recnt }Comments&nbsp;&nbsp;
																	<i class="fafa-comment-o"></i>
																</li>
															</ul>
														</td>
													</tr>
												</table>
												<div class="qnaBody">${list.content }</div>
												<!-- 태그 목록 -->
												<div class="tags" style="margin-left: 50px;">
													<%-- <c:forEach items="${list.tagList }" var="hash">
														<ul class="tagList">
															<c:if test="${hash.t_name ne null}">
																<li class="tagli2">
																	<a href="tagSearch?t_name=${hash.t_name }">
																		<button
																			class="genric-btn success circle btn-sm">${hash.t_name}</button>
																	</a>
																</li>
															</c:if>
														</ul>
													</c:forEach> --%>
													
													<ul class="tagList">
															<c:if test="${list.t_name ne null}">
															<!-- <script>
																var tag = $('#tag_list').val();
																console.log(tag);
																
																var tagSplit = tag.split(',');
																console.log(tagSplit);
																
																for(var i in tagSplit){
																	
																	var li2 = $('.tagli2');
																	
																	var a = $('<a>').attr({
																		'href':'tagSearch?t_name='+tagSplit[i]
																	});
																	
																	var btn = $('<button>').attr({
																		'class':'genric-btn success circle btn-sm',
																	});
																	
																	btn.text(tagSplit[i]);
																	a.append(btn);
																	li2.append(a);
																	
																}
															</script> -->
																<c:forTokens var="tag" items="${list.t_name}" delims=",">
															
															
																<li class="tagli2">
																	<a href="tagSearch?t_name=${tag}">
																		<button
																			class="genric-btn success circle btn-sm">${tag}</button>
																	</a>
																</li>
																</c:forTokens>
															</c:if>
														</ul>
												</div>
												<!-- 상세조회 페이지 이동 -->
												<a class="btn btn-outline-primary btn-fw" id="view-button"
													href="qnaDetail?q_no=${list.q_no }"
													style="float: right; margin-right: 32px;">View More</a>
											</div>
										</div>
									</div>
								</article>
								<hr size="2" />
							</c:forEach>
						</form>
						<my:nav jsFunc="go_page" page="${page}" />
					</div>
				</div>

				<!-- side 부분 -->
				<div class="col-lg-4" id="side">
					<div class="blog_right_sidebar">
						<!-- 검색 -->
						<aside class="single_sidebar_widget search_widget" style="margin-top: -40px;">
							<form action="qnaMain" method="post">
								<select class="searchSelect" name="searchType">
									<option value="title" ${page.cri.searchType eq 'title' ? 'selected' : '' }>제목
									</option>
									<option value="content" ${page.cri.searchType eq 'content' ? 'selected' : '' }>
										내용</option>
									<option value="writer" ${page.cri.searchType eq 'writer' ? 'selected' : '' }>작성자
									</option>
								</select>
								<div class="input-group" style="width: 230px; margin-left: 71px;">
									<input type="text" class="form-control" id="searchBox" name="searchValue">
									<span class="input-group-btn">
										<button class="btn btn-default" type="submit">
											<i class="fa fa-search"></i>
										</button>
									</span>
								</div>
							</form>
						</aside>
						<div class="br"></div>
						<!-- 베스트 QNA -->
						<aside class="single_sidebar_widget post_category_widget">
							<h4 id="bestQna" class="widget">베스트 Q&A</h4>
							<c:forEach items="${best }" var="best">
								<ul style="text-align: left;" class="list cat-list">
									<li id="tlist">
									<a href="qnaDetail?q_no=${best.q_no }" class="d-flex justify-content-between">
										<i class="fa-solid fa-q" style="color:gray;"></i>&nbsp;&nbsp;${best.title}
									</a></li>
								</ul>
							</c:forEach>
						</aside>
						<!-- 인기 태그 -->
						<aside class="single-sidebar-widget">
							<h4 class="widget">인기 태그</h4>
							<c:forEach items="${tagList }" var="tagList">
								<ul>
									<li class="tagli">
										<a href="tagSearch?t_name=${tagList.t_name }">
											<button class="genric-btn success-border circle btn-sm">${tagList.t_name}</button>
										</a>
									</li>
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
	<script>
		/*이미지 숨기기*/
		$(document).ready(function () {
			$('.qnaBody').find('img').css('display', 'none');
			/* 		$('.qnaBody').find('iframe').css('display', 'none'); */
		});

		function go_page(p) {
			goform.pageNum.value = p;
			goform.submit();
		}
	</script>
</body>

</html>