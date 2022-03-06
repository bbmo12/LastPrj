<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<style>
	#my_section {
		padding: 50px;
	}

	.comment-list {
		display: none;
	}

	#back {
		display: none;
	}
</style>

<body>
	<section class="banner-area other-page">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<h1>Our Partner</h1>
					<a href="home">Home</a> <span>|</span>
					<c:if test="${pmemdetail.code eq 100}">
						<a href="pmemberList?code=100">PartnerPage</a>
					</c:if>
					<c:if test="${pmemdetail.code eq 101}">
						<a href="pmemberList?code=101">PartnerPage</a>
					</c:if>
					<c:if test="${pmemdetail.code eq 102}">
						<a href="pmemberList?code=102">PartnerPage</a>
					</c:if>
					<c:if test="${pmemdetail.code eq 103}">
						<a href="pmemberList?code=103">PartnerPage</a>
					</c:if>
				</div>
			</div>
		</div>
	</section>
	<section id="my_section">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="blog_right_sidebar">
						<aside class="single_sidebar_widget author_widget">
							<img class="author_img rounded-circle" src="resources/upload/${pmemdetail.picture }"
								style="width: 210px;" alt="등록된 사진이 없습니다.">
							<div class="br"></div>
							<h2>${pmemdetail.name}</h2>
							<h3 style="position: relative; top: 10px; right: 10px;">${pmemdetail.w_name}</h3>
							<img alt="" src="resources/upload/rec.png" id="recommend"
								onclick="likeHit(`${pmemdetail.p_id}`)"
								style="cursor:pointer; width: 50px; height: 50px; position: relative; left: 70px; top: -50px;">
							<div class="br" style="margin-top: -25px;"></div>
						</aside>
						<aside class="single_sidebar_widget post_category_widget">
							<h4 class="widget_title">상담하기</h4>
							<h4 class="widget_title">예 약</h4>
						</aside>
					</div>
				</div>
				<div class="col-lg-9 posts-list">
					<div class="single-post row">
						<div class="col-lg-12">
							<div class="quotes">
								<h3>자기소개</h3>
								${pmemdetail.p_info}
							</div>
							<div class="row">
								<section>
									<div class="container">
										<div class="row">
											<div class="col-lg-4 col-md-6 mb-4 mb-lg-0">
												<div class="categories_post">
													<img src="resources/assets/images/blog/cat-post/cat-post-3.jpg"
														alt="등록된 사진이 없습니다.">
												</div>
											</div>
											<div class="col-lg-4 col-md-6 mb-4 mb-lg-0">
												<div class="categories_post">
													<img src="resources/assets/images/blog/cat-post/cat-post-2.jpg"
														alt="등록된 사진이 없습니다.">
												</div>
											</div>
											<div class="col-lg-4 col-md-6">
												<div class="categories_post">
													<img src="resources/assets/images/blog/cat-post/cat-post-1.jpg"
														alt="등록된 사진이 없습니다.">
												</div>
											</div>
										</div>
									</div>
									<div class="col-lg-9 col-md-9 blog_details">
										<h3 style="font-weight: bold">
											${pmemdetail.w_address}&nbsp;${pmemdetail.w_d_address }</h3>
										<c:forEach items="${time }" var="time">
											<h3 style="font-weight: normal">${time.w_day }&nbsp;${time.starttime}
												&nbsp;-&nbsp;${time.endtime }</h3>
										</c:forEach>
										<h3 style="font-weight: normal">${pmemdetail.n_content}</h3>
									</div>
								</section>
							</div>
						</div>
					</div>
					<div class="comments-area">
						<h3>고객후기</h3>
						<c:forEach items="${counsel }" var="counsel">
							<div class="comment-list">
								<div class="single-comment justify-content-between d-flex">
									<div class="user justify-content-between d-flex">
										<div class="thumb">
											<img class="author_img rounded-circle"
												src="resources/upload/${counsel.picture }" alt="등록된 사진이 없습니다."
												style="width: 100px;">
										</div>
										<div class="desc">
											<h5>${counsel.m_id }</h5>
											<div class="star">
												<input type="hidden" class="rating" value="${counsel.rating }">
											</div>
											<input id="counselProfile" type="hidden" value=${counsel.m_id }>
											<p></p>
											<h5 class="comment">${counsel.content }</h5>
										</div>
									</div>
								</div>
								<div class="row" id="servicePhoto">
									<c:forEach items="${counsel.fileList }" var="photo">
										<div style="margin-top: 20px;">
											<img src="resources/upload/${photo.photo }" alt="등록된 사진이 없습니다."
												style="width: 250px; height: 250px; position: relative; right: -3em;">
										</div>
									</c:forEach>
								</div>
							</div>
						</c:forEach>
						<c:forEach items="${service }" var="service">
							<div class="comment-list" id="comment">
								<div class="single-comment justify-content-between d-flex">
									<div class="user justify-content-between d-flex">
										<div class="thumb">
											<img class="author_img rounded-circle"
												src="resources/upload/${service.picture }" alt="등록된 사진이 없습니다."
												style="width: 100px;">
										</div>
										<div class="desc">
											<h5>${service.m_id }&nbsp;&nbsp;평점:${service.rating }점</h5>
											<div class="star">
												<input type="hidden" class="rating" value="${service.rating }">
											</div>
											<input id="serviceProfile" type="hidden" value="${service.m_id }">
											<p></p>
											<h5 class="comment">${service.content }</h5>
										</div>
									</div>
								</div>
								<div class="row" id="servicePhoto">
									<c:forEach items="${service.fileList }" var="photo">
										<div style="margin-top: 20px;">
											<img src="resources/upload/${photo.photo }" alt="등록된 사진이 없습니다."
												style="width: 250px; height: 250px; position: relative; right: -3em;">
										</div>
									</c:forEach>
								</div>
							</div>
						</c:forEach>
						<div class="reply-btn">
							<a href="" class="btn-reply text-uppercase" id="load" style="text-align: center;">More
								Review</a>
						</div>
						<div class="reply-btn">
							<a href="#top" class="btn-reply text-uppercase" id="back" style="text-align: center;">Back
								to top</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<script>
		function likeHit(p_id) {
			console.log(p_id);
			var p_id = p_id;
			$.ajax({
				type: "POST",
				url: "pmemberLike",
				data: {
					"p_id": p_id
				},
				success: function () {
			    console.log("dddddd");
				}
			});
		}
		$(function () {
			$('.star').each(function (index, item) {
				$(this).raty({
					score: $(this).find('.rating').val(),
					path: "resources/star",
					width: 200,
					readOnly: true
				});
			})
		});
		/*스크롤 */
		$(function () {
			$('.comment-list').slice(0, 2).show();
			$('#load').click(function (e) {
				e.preventDefault();
				$('.comment-list:hidden').slice(0, 2).show();
				if ($('.comment-list:hidden').length == 0) {
					$('#load').fadeOut('fast');
					$('#back').fadeIn('slow');
				}
			});
		});

		$('#back').click(function () {
			$('body,html').animate({
				scrollTop: 0
			}, 600);
			return false;
		});
	</script>
</body>

</html>