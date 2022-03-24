<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<style>
	.petSelect ul li {
		list-style-type: none;
		float: left;
		margin-left: 20px;
	}
	
	#my_section {
		margin-top: -70px;
    	padding-bottom: 25px;
	}

	.no_deco {
		text-decoration: none !important;
		font-size: 0.8rem !important;
		color: black;
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
		object-fit: cover;
	}

	ul {
		padding: 16px 0;
		list-style: none;
	}

	.petSelect {
		displsy: flex;
		flex-direction: row;
	}

	.newCs {
		margin-top: 50px;
		margin-bottom: 50px;
	}

	.btns {
		margin-left: 400px;
	}

	#radios {
		display: flex;
		flex-direction: row;
	}

	br.clear {
		clear: both
	}

	.blog_right_sidebar {
		box-shadow: 0 .15rem 1.75rem 0 rgba(58, 59, 69, .1) !important;
		border: 1px solid #e3e6f0;
		border-radius: 0.35rem;
		float: none !important;
		margin: 0 auto !important;
		background-color: white;
		width: 250px;
	}

	.partner_img {
		object-fit: cover;
		object-position: top;
		border-radius: 50%;
		width: 180px !important;
		height: 180px !important;
		float: none;
		margin: 0 auto;
	}

	#myinfo {
		font-size: 0.8rem;
		/* font-family: 'NanumBarunGothic'; */
		font-style: normal;
		font-weight: 300;
	}

	#Mainname {
		font-size: 1.5rem !important;
		/* font-family: 'NanumBarunGothic' !important; */
		font-style: normal !important;
		font-weight: 700 !important;
		color: gray;
	}

	#menu_bold {
		font-size: 1.0rem;
		/* font-family: 'NanumBarunGothic'; */
		font-style: normal;
		font-weight: 700;
		color: black;
	}
</style>

<body>
	<section class="department-area" style="padding: 30px 0 30px;">
		<div class="container">
			<div class="col-lg-6 offset-lg-3">
				<div class="section-top text-center">
					<br><br><br>
					<h2></h2>
				</div>
			</div>
		</div>
	</section>
	<section id="my_section">
		<div class="container" style="max-width: 1350px;">
			<div class="row">
				<div class="col-lg-3">
					<h2 align="center">MyPage</h2>
					<br>
					<div class="blog_right_sidebar">
						<aside class="single_sidebar_widget author_widget">
							<img class="partner_img" src="resources/upload/${mInfo.picture}"
								onerror="this.src='resources/upload/cat.jpg'" style="width: 210px; height: 167px;">
							<br><br>
							<h4 id="Mainname">${mInfo.name }님</h4>
							<div class="br"></div>
							<div id="myinfo">
								<i class="fa-solid fa-pen"></i>&nbsp;<a class="no_deco" href="mconfirmPass">내 정보수정하기</a>
							</div>
						</aside>
					</div>
					<br>
					<div class="blog_right_sidebar">
						<aside class="single_sidebar_widget post_category_widget">
							<h4 class="widget_title">My menu</h4>
							<ul class="list cat-list nanumbarungothic">
								<p id="menu_bold">내 활동 내역</p>
								<li><a href="protocol" class="d-flex justify-content-between no_deco">
										<p>반려동물 진료기록</p>
									</a></li>
								<li><a href="reservationSelect" class="d-flex justify-content-between no_deco">
										<p>예약 내역</p>
									</a></li>
								<li><a href="myPay" class="d-flex justify-content-between no_deco">
										<p>결제 내역</p>
									</a></li>
								<li><a href="mycounsel" class="d-flex justify-content-between no_deco">
										<p>상담 내역</p>
									</a></li>
								<li><a href="myreport" class="d-flex justify-content-between no_deco">
										<p>신고 내역</p>
									</a></li>
								<li><a href="myfallow" class="d-flex justify-content-between no_deco">
										<p>팔로우</p>
									</a></li>
								<br><br>
								<p id="menu_bold">회원 정보 관리</p>
								<li><a href="mconfirmPass" class="d-flex justify-content-between no_deco">
										<p>회원 정보 수정</p>
									</a></li>
								<li><a href="logout" class="d-flex justify-content-between no_deco">
										<p>로그아웃</p>
									</a></li>
								<li><a href="mdeleteForm" class="d-flex justify-content-between no_deco">
										<p>회원탈퇴</p>
									</a></li>
							</ul>
						</aside>
					</div>
				</div>

				<div class="col-lg-9 posts-list"
					style="border: 1px solid #f3f3f3; padding: 50px; border-radius: 5px; height: 1050px; margin-top: 72px;">
					<div class="col-lg-12 col-md-12 blog_details">
						<div align="center">
							<h2>상담 차트 작성</h2>
						</div>
						<div>
							<form name="newCs" id="newCs" action="newCs" method="post" onsubmit="return fmcheck();">
								<div style="text-align: center; margin-bottom: 20px;">
									<h3>
										<span>${pInfo.name }</span>&nbsp;<span>
											<c:if test="${pInfo.code == 100}">
												<c:out value="수의사" />
											</c:if>
											<c:if test="${pInfo.code == 101}">
												<c:out value="훈련사" />
											</c:if>
											<c:if test="${pInfo.code == 102}">
												<c:out value="펫시터" />
											</c:if>
											<c:if test="${pInfo.code == 103}">
												<c:out value="미용사" />
											</c:if>
										</span>와의 첫 상담을 위한 차트를 작성해주세요.
									</h3>
								</div>
								<input type="hidden" id="p_id" name="p_id" value="${pInfo.p_id }">
								<input type="hidden" id="m_id" name="m_id" value="${mId }">
								<input type="hidden" id="sender" name="sender" value="${mId }">
								<h3>반려동물 선택</h3>
								<h4 style="color: gray;">*상담받고자 하는 반려동물을 선택해주세요.</h4>
								<div class="petSelect">
									<ul>
										<li>
											<div class="radioImg">
												<img class="petSelection" src="resources/qna/가위표.png">
											</div> <input type="radio" id="pet_no" name="pet_no" value="" checked="checked">&nbsp;
											<label>없음/비공개</label>
										</li>
										<c:forEach items="${petList }" var="pet">
											<li>
												<div class="radioImg">
													<img class="petSelection" src="resources/qna/${pet.picture }"
														onError="this.src='resources/qna/대체이미지2.png'">
												</div>
												<input type="radio" id="pet_no" name="pet_no"value="${pet.pet_no}">&nbsp;${pet.name }
											</li>
										</c:forEach>
									</ul>
								</div>
								<br class="clear"> 
									<div style="margin-top: 30px;">
										<h3>상담 내용</h3>
										<textarea id="content" name="content" class="form-control"
											style="width: 100%; height: 500px; margin-bottom: 30px;">*반려동물의 증상, 전문가에게 궁금한 점 등을 자세히 적어주세요.</textarea>
									</div>
									<div id="btns" style="margin-left: 21em;">
										<button type="submit" id="submitCs" style="width: 100px;"class="btn btn-primary">상담 시작</button>
										<button type="button" class="btn btn-secondary" style="width: 100px;"onclick="history.back()">취소</button>
									</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<script>
		content.addEventListener('click', function () {
			event.target.select();
		});
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

		function fmcheck() {
			var content = $('#content').val();
			if (content == "") {
				Swal.fire('상담 내용이 입력되지 않았습니다.');
				return false;
			}
		}
	</script>
</body>

</html>