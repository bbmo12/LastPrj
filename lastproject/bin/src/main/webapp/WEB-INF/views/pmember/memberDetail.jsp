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
</style>

<body>
	<section class="banner-area other-page">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<h1>MyPage</h1>
					<a href="index.html">Home</a> <span>|</span> <a href="blog-details.html">MyPage</a>
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
							<img class="author_img rounded-circle" src="resources/assets/images/blog/author.png" alt="">
							<div class="br"></div>
							<h2>${pmemdetail.name}</h2>
							<h3>${pmemdetail.w_name}</h3>
							<div class="br"></div>
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
														alt="post">
												</div>
											</div>
											<div class="col-lg-4 col-md-6 mb-4 mb-lg-0">
												<div class="categories_post">
													<img src="resources/assets/images/blog/cat-post/cat-post-2.jpg"
														alt="post">
												</div>
											</div>
											<div class="col-lg-4 col-md-6">
												<div class="categories_post">
													<img src="resources/assets/images/blog/cat-post/cat-post-1.jpg"
														alt="post">
												</div>
											</div>
										</div>
									</div>
									<div class="col-lg-9 col-md-9 blog_details">
										<h3 style="font-weight:bold">${pmemdetail.w_address}&nbsp;${pmemdetail.w_d_address }</h3>
										<c:forEach items="${pmemdetail.timeList }" var="time">
											<h3 style="font-weight: normal">${time.w_day }&nbsp;${time.starttime}
											&nbsp;-&nbsp;${time.endtime }</h3>
										</c:forEach>
										<h3 style="font-weight: normal">${pmemdetail.n_content}</h3>
									</div>
									<div class="col-lg-12 my-4">
										<p>MCSE boot camps have its supporters and its detractors.
											Some people do not understand why you should have to spend
											money on boot camp when you can get the MCSE study materials
											yourself at a fraction of the camp price. However, who has
											the willpower.</p>
										<p>MCSE boot camps have its supporters and its detractors.
											Some people do not understand why you should have to spend
											money on boot camp when you can get the MCSE study materials
											yourself at a fraction of the camp price. However, who has
											the willpower.</p>
									</div>
								</section>
							</div>
						</div>
					</div>
					<div class="comments-area">
						<h4>후기</h4>
						<c:forEach items="${counsel }" var="counsel">
							<div class="comment-list">
								<div class="single-comment justify-content-between d-flex">
									<div class="user justify-content-between d-flex">
										<div class="thumb">
											<img src="resources/assets/images/blog-details/c1.jpg" alt="등록된사진이 없습니다.">
										</div>
										<div class="desc">
											<h5>${counsel.m_id }&nbsp;&nbsp;평점:${counsel.rating }점</h5>
											<input id="counselProfile" type="hidden" value=${counsel.m_id }>
											<p></p>
											<h5 class="comment">${counsel.content }</h5>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-3" style="margin-top: 20px;">
										<img src="resources/assets/images/elements/d.jpg" alt="" class="img-fluid">
									</div>
									<div class="col-md-3" style="margin-top: 20px;">
										<img src="resources/assets/images/elements/d.jpg" alt="" class="img-fluid">
									</div>
									<div class="col-md-3" style="margin-top: 20px;">
										<img src="resources/assets/images/elements/d.jpg" alt="" class="img-fluid">
									</div>
								</div>
							</div>
						</c:forEach>
						<c:forEach items="${service }" var="service">
							<div class="comment-list">
								<div class="single-comment justify-content-between d-flex">
									<div class="user justify-content-between d-flex">
										<div class="thumb">
											<img src="resources/assets/images/blog-details/c1.jpg" alt="">
										</div>
										<div class="desc">
											<h5>${service.m_id }&nbsp;&nbsp;평점:${service.rating }점</h5>
											<input id="serviceProfile" type="hidden" value=${service.m_id }>
											<p></p>
											<h5 class="comment">${service.content }</h5>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-3" style="margin-top: 20px;">
										<img src="resources/assets/images/elements/d.jpg" alt="" class="img-fluid">
									</div>
									<div class="col-md-3" style="margin-top: 20px;">
										<img src="resources/assets/images/elements/d.jpg" alt="" class="img-fluid">
									</div>
									<div class="col-md-3" style="margin-top: 20px;">
										<img src="resources/assets/images/elements/d.jpg" alt="" class="img-fluid">
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</section>
	<script>
		document.addEventListener('DOMContentLoaded', () => {
			counFile();
			servicefile();
		});

		function counFile() {
			var counsel = document.getElementById('counselProfile').value;
			$.ajax({
				url: 'counProfile',
				method: 'post',
				data: {
					coun: counsel
				}
			}).done(function (data) {
				console.log("상담" + data);
			});
		}

		function servicefile() {
			var service = document.getElementById('serviceProfile').value;
			$.ajax({
				url: 'serviceProfile',
				method: 'post',
				data: {
					mid: service
				}
			}).done(function (data) {
				console.log(data);
			});
		}
	</script>
</body>

</html>