<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>	
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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

	.btn {
		width: 200px;
		margin-bottom: 10px;
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
								style="width: 210px; height: 167px;" onerror="this.src='resources/upload/pet.PNG'">
							<div class="br"></div>
							<h2>${pmemdetail.name}</h2>
							<h3>${pmemdetail.w_name}</h3>
							<div class="br"></div>						
							<sec:authorize access="hasRole('MEMBER')">
								<c:choose>
									<c:when test="${follow == 0 }">
										<img alt="" src="resources/upload/upfollow.png" id="follow"
											onclick="follow('${pmemdetail.p_id}')"
											style="cursor: pointer; width: 60px; height: 60px; margin-right: 20px;">
									</c:when>
									<c:otherwise>
										<img alt="" src="resources/upload/follow1.png" id="follow"
											onclick="follow('${pmemdetail.p_id}')"
											style="cursor: pointer; width: 60px; height: 60px; margin-right: 20px;">
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${like == 0 }">
										<img alt="" src="resources/upload/nocol.png" id="recommend"
											onclick="likeHit(`${pmemdetail.p_id}`)"
											style="cursor: pointer; width: 60px; height: 60px;">
									</c:when>
									<c:otherwise>
										<img alt="" src="resources/upload/rec.png" id="recommend"
											onclick="likeHit(`${pmemdetail.p_id}`)"
											style="cursor: pointer; width: 60px; height: 60px;">
									</c:otherwise>
								</c:choose>
							</sec:authorize>
							<sec:authorize access="hasRole('PARTNER') OR isAnonymous()">	
									<img alt="" src="resources/upload/upfollow.png" id="follow" onclick="noMember()"
										style="cursor:pointer; width: 60px; height: 60px;margin-right: 20px;">
									<img alt="" src="resources/upload/nocol.png" id="recommend" onclick="noMember()"
										style="cursor:pointer; width: 60px; height: 60px;">
							</sec:authorize>		
							<div class="br"></div>
						</aside>
						<aside class="single_sidebar_widget post_category_widget">
							<a href="EnterCs?p_id=${pmemdetail.p_id}">
								<button class="btn btn-primary">상담하기</button></a>
							<c:if test="${pmemdetail.p_role ne 4}">
								<form action="reservMember" name="reservForm" method="POST">
									<input type="hidden" id="p_id" name="p_id" value="${pmemdetail.p_id}">
									<button type="submit" class="btn btn-primary">예약하기</button>
								</form>
							</c:if>
						</aside>
					</div>
				</div>
				<div class="col-lg-9 posts-list">
					<div class="single-post row">
						<div class="col-lg-12">
							<div class="quotes" style="margin-bottom: 0px; font-style: normal;">
								<h3>자기소개</h3>
								${pmemdetail.p_info}
							</div>
							<h3 style="font-weight: bold; margin: 15px 0 0 20px;">경력·자격</h3>
							<div class="container">
							 <c:if test="${ fn:length(pimage) == 0  && fn:length(plicense) == 0 }">
						 	 <h3 align="center">등록된 사진이 없습니다.</h3>                                                  
                         	</c:if>
								<div class="row" style="margin-top: 20px;">
									<c:forEach items="${pimage}" var="image">
										<div class="col-xl-4 col-lg-3">
											<div class="categories_post">
												<img src="resources/upload/${image.picture}"
													style="width: 290px; height: 200px;" alt="등록된 사진이 없습니다.">
											</div>
										</div>
									</c:forEach>
									<c:forEach items="${plicense}" var="plicense">
										<div class="col-xl-4 col-lg-3">
											<div class="categories_post">
												<img src="resources/upload/${plicense.picture}"
													style="width: 290px; height: 200px;" alt="등록된 사진이 없습니다.">
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
							<div class="container" style="margin-top: 20px; border: solid 1px; border-color: #eee;">
								<div class="row">
									<div class="col-6" style="padding: 10px;">
										<img src="resources/upload/location.png" style="width: 40px; height: 40px;">
										<h3 style="display: inline-block;">주 소</h3>
										<div class="doctor-text text-center" style="display: flex; margin-left: 45px; color: black;">
										${pmemdetail.w_address}&nbsp;${pmemdetail.w_d_address }</div>
										<img src="resources/upload/time.png" style="width: 40px; height: 40px;">
										<h3 style="display: inline-block;">운영시간</h3><br>
										<c:forEach items="${time }" var="time">
											<div class="doctor-text text-center" style="display: inline-block; padding-left:45px; color: black;">
												${time.w_day }&nbsp;${time.starttime}&nbsp;-&nbsp;${time.endtime }
											</div>			
											<div class="doctor-text text-center" style="display: inline-block; color: black;">${time.n_content}</div><br>								
										</c:forEach>
										<img src="resources/upload/career.png" style="width: 40px; height: 40px;">
										<h3 style="display: inline-block;">대표경력</h3>
										<div class="doctor-text text-center" style="display: flex; margin-left: 45px; color: black;">
										${pmemdetail.career }</div>
										<img src="resources/upload/career2.png" style="width: 40px; height: 40px;">
										<h3 style="display: inline-block;">전문분야</h3>
										<div class="doctor-text text-center" style="display: flex; margin-left: 45px; color: black;">
										${pmemdetail.speciality }</div>
									</div>
									<div class="col-6" style="padding-top: 10px; margin-left:-35px;">
										<img src="resources/upload/price.png" style="width: 40px; height: 40px;">
										<h3 style="display: inline-block;">서비스정보</h3><br>
										<c:forEach items="${price }" var="price">
											<div class="doctor-text text-center" style="display: inline-block; height: 22px; padding-left:45px; color: black;">
												${price.title}&nbsp;:&nbsp;${price.price}
											</div><br>
										    <div class="doctor-text text-center" style="display: inline-block; margin-bottom: 5px; padding-left:45px;">${price.content }</div><br>	
										</c:forEach>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="comments-area" style="width: 839px;">
						<h3>고객후기</h3>
						 <c:if test="${ fn:length(counsel) == 0  && fn:length(service) == 0 }">
						 	 <h3 align="center">등록된 후기가 없습니다.</h3>                                                  
                         </c:if>
						<c:forEach items="${counsel }" var="counsel">
							<div class="comment-list">
								<div class="single-comment justify-content-between d-flex">
									<div class="user justify-content-between d-flex">
										<div class="thumb">
											<img class="author_img rounded-circle"
												src="resources/upload/${counsel.picture }" alt="등록된 사진이 없습니다."
												onError="this.style.display='none'" style="width: 100px;">
										</div>
										<div class="desc">
											<h5>${counsel.m_id }</h5>
											<div class="star">
												<input type="hidden" class="rating" value="${counsel.rating }">
											</div>
											<input id="counselProfile" type="hidden" value="${counsel.m_id }">
											<p></p>
											<h5 class="comment">${counsel.content }</h5>
										</div>
									</div>
								</div>
								<div class="row" id="servicePhoto">
									<c:forEach items="${counsel.fileList }" var="photo">
										<div style="margin-top: 20px;">
											<img src="resources/upload/${photo.photo }" alt="등록된 사진이 없습니다."
												onError="this.style.display='none'"
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
												onError="this.style.display='none'" style="width: 100px;">
										</div>
										<div class="desc">
											<h5>${service.m_id }</h5>
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
												onError="this.style.display='none'"
												style="width: 250px; height: 250px; position: relative; right: -3em;">
										</div>
									</c:forEach>
								</div>
							</div>
						</c:forEach>
						<div class="reply-btn">
							<a href="" class="btn-reply text-uppercase" id="load" style="text-align: center;">
								More Review</a>
						</div>
						<div class="reply-btn">
							<a href="#top" class="btn-reply text-uppercase" id="back" style="text-align: center;">
								Back to top</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<script>

		//추천버튼 
		function likeHit(p_id) {
			var p_id = p_id;
			$.ajax({
				type: "POST",
				url: "pmemberLike",
				data: {
					"p_id": p_id
				},
				success: function (likeCheck) {
					if (likeCheck == 0) {
						Swal.fire('추천되었습니다:)');
						 var imgTag = document.getElementById("recommend");
						 imgTag.setAttribute("src", "resources/upload/rec" + ".png"); //id값이 photo인 이미지태그 선택 후, 
						  //src 속성값을 수정
					} else if (likeCheck == 1) {
						Swal.fire({
							title: '추천을 취소시겠습니까?',
							icon: 'warning',
							showCancelButton: true,
							confirmButtonColor: '#d33', // confrim 버튼 색깔 지정 
							cancelButtonColor: '#3085d6',
							confirmButtonText: '취소하기', // confirm 버튼 텍스트 지정 
							cancelButtonText: '닫기',
						}).then(result => { // 만약 Promise리턴을 받으면, 
							if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면 
								Swal.fire('추천이 취소되었습니다.');
								var changeImg = document.getElementById("recommend");
								changeImg.setAttribute("src", "resources/upload/nocol" + ".png"); 
							}
						});
					}
				}
			});
		}
		//팔로우
		function follow(p_id) {
			var p_id = p_id;
			$.ajax({
				type: "POST",
				url: "insertFollow",
				data: {
					"p_id": p_id
				},
				success: function (followCheck) {
					if (followCheck == 0) {
						Swal.fire('팔로우');
						 var imgTag = document.getElementById("follow");
						 imgTag.setAttribute("src", "resources/upload/follow1" + ".png"); //id값이 photo인 이미지태그 선택 후, 
					} else if (followCheck == 1) {
						Swal.fire({
							title: '팔로우를 취소하시겠습니까?',
							icon: 'warning',
							showCancelButton: true,
							confirmButtonColor: '#d33', // confrim 버튼 색깔 지정 취소
							cancelButtonColor: '#3085d6',
							confirmButtonText: '취소하기', // confirm 버튼 텍스트 지정 
							cancelButtonText: '닫기',
						}).then(result => { // 만약 Promise리턴을 받으면, 
							if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면 
								Swal.fire('팔로우가 취소되었습니다.');
								var changeImg = document.getElementById("follow");
								changeImg.setAttribute("src", "resources/upload/upfollow" + ".png"); 						
							}
						});
					}
				}
			});
		}

		function noMember() {
			Swal.fire('일반회원이 아닙니다.');
		}
		//별점
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
	</script>
</body>

</html>