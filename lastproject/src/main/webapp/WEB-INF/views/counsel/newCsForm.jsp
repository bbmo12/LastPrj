<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<style>
#my_section {
	padding: 50px;
}

body {
	background-color: #f9f9fa
}

.flex {
	-webkit-box-flex: 1;
	-ms-flex: 1 1 auto;
	flex: 1 1 auto
}

@media ( max-width :991.98px) {
	.padding {
		padding: 1.5rem
	}
}

@media ( max-width :767.98px) {
	.padding {
		padding: 1rem
	}
}

.padding {
	padding: 5rem
}

.card {
	box-shadow: none;
	-webkit-box-shadow: none;
	-moz-box-shadow: none;
	-ms-box-shadow: none
}

.pl-3, .px-3 {
	padding-left: 1rem !important
}

.card {
	position: relative;
	display: flex;
	flex-direction: column;
	min-width: 0;
	word-wrap: break-word;
	background-color: #fff;
	background-clip: border-box;
	border: 1px solid #d2d2dc;
	border-radius: 0
}

.card .card-title {
	color: #000000;
	margin-bottom: 0.625rem;
	text-transform: capitalize;
	font-size: 0.875rem;
	font-weight: 500
}

.card .card-description {
	margin-bottom: .875rem;
	font-weight: 400;
	color: #76838f
}

.table-responsive {
	display: block;
	width: 100%;
	overflow-x: auto;
	-webkit-overflow-scrolling: touch;
	-ms-overflow-style: -ms-autohiding-scrollbar
}

.table th {
	font-size: 20px;
	font-weight: 500;
}

.table {
	width: 100%;
	max-width: 100%;
	margin-bottom: 1rem;
	background-color: transparent
}

.table td {
	font-size: 16px;
	padding: .875rem 0.9375rem
}

.badge {
	border-radius: 0;
	font-size: 12px;
	line-height: 1;
	padding: .375rem .5625rem;
	font-weight: normal
}

.radioImg {
	width: 80px;
	height: 80px;
	border-radius: 70%;
	overflow: hidden;
}

.petSelection {
	width: 100%;
	height: 100%;
	object-fit: cover; ul { padding : 16px 0;
	list-style: none;
}

.petSelect {
	displsy: flex;
	flex-direction: row;
}

</style>

<body>
	<section class="banner-area other-page">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<h1>MyPage</h1>
					<a href="home">Home</a> <span>|</span> <a href="pmemberMyPage">MyPage</a>
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
							<img class="author_img rounded-circle"
								src="resources/upload/${pmember.picture}" style="width: 210px"
								alt="">
							<div class="br"></div>
							<h4>${pmember.name }</h4>
							<div class="br"></div>
						</aside>
						<aside class="single_sidebar_widget post_category_widget">
							<h4 class="widget_title">My menu</h4>
							<ul class="list cat-list">
								<li><a href="pmemberMyPage"
									class="d-flex justify-content-between">
										<p>내 프로필</p>
								</a></li>
								<li><a href="preservationSelect"
									class="d-flex justify-content-between">
										<p>예약 내역</p>
								</a></li>
								<li><a href="pMemDiaList"
									class="d-flex justify-content-between">
										<p>진료 내역</p>
								</a></li>
								<li><a href="pMembenefit"
									class="d-flex justify-content-between">
										<p>결제 내역</p>
								</a></li>
								<li><a href="pmemcounsel"
									class="d-flex justify-content-between">
										<p>상담 내역</p>
								</a></li>
								<li><a href="pmemreport"
									class="d-flex justify-content-between">
										<p>신고 내역</p>
								</a></li>
								<li><a href="#" class="d-flex justify-content-between">
										<p>로그아웃</p>
								</a></li>
								<li><a href="#" class="d-flex justify-content-between">
										<p>회원탈퇴</p>
								</a></li>
							</ul>
						</aside>
					</div>
				</div>
				<div class="col-lg-9 posts-list"
					style="position: relative; top: -20px;">
					<div class="col-lg-12 col-md-12 blog_details">
						<div align="center">
							<h1>첫 상담 차트 작성</h1>
						</div>
						<div>
						 <form name="newCs" id="newCs" action="newCs" method="post">
								<div>${pInfo.name }님과의상담을 시작합니다.</div>
									
								<input type="hidden" id="p_id" name="p_id" value="${pInfo.p_id }">
								<input type="hidden" id="m_id" name="m_id" value="${mId }" >
								<input type="hidden" id="sender" name="sender" value="${mId }">
	
								<h3>상담받고자 하는 반려동물을 선택해주세요.</h3>
								<div class="petSelect"
									style="margin-bottom: 50px; margin-top: 50px;">
									<c:forEach items="${petList }" var="pet">
										<div class="radioImg">
											<img class="petSelection" src="resources/qna/${pet.picture }"
												onError="this.src='resources/qna/대체이미지2.png'">
										</div>
										<input type="radio" id="pet_no" name="pet_no"
											value="${pet.pet_no}">&nbsp;${pet.name }
									</c:forEach>
								</div>

								<h3>상담 내용을 적어주세요</h3>
								<textarea id="content" name="content"></textarea>

								<button type="submit" id="submitCs" class="btn btn-primary">상담 시작</button>
								<button type="button" class="btn btn-secondary"
									onclick="history.back()">취소</button>
							</form>
						</div>
					</div>
				</div>
			</div>
	</section>
	<script>
		/* $(function(){
			$('#submitCs').click(function(){
				$.ajax({
					method : "POST",
					url : "newCs",
					data : {
						"p_id" : $("#p_id").val(),
						"m_id" : $("#m_id").val(),
						"sender" : $("#sender").val(),
						"pet_no" : $("#pet_no").val(),
						"content" : $("#content").val()
					},
					success : function(){
						alert('상담이 등록되었습니다.');
					},
					error : function(){
						alert('오류가 발생했습니다');
					}
				})
			})	
		}) */
	
	</script>
</body>
</html>