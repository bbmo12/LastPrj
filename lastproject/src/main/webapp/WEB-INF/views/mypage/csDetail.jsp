<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

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

#leftBubble:after {
	content: '';
	position: absolute;
	left: 0;
	top: 50%;
	width: 0;
	height: 0;
	border: 32px solid transparent;
	border-right-color: #d1d1d1;
	border-left: 0;
	border-top: 0;
	margin-top: -16px;
	margin-left: -32px;
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

img {
	width: 80px;
	height: 80px;
	object-fit: cover;
	border-radius: 70%;
	overflow: hidden;
	border: 2px solid rgb(46, 46, 46);
	margin-right: 5px;
}

.petInfo {
	width: 670px;
	height: 120px;
	margin-left: 20px;
	background: rgb(241, 241, 241);
	padding: 20px;
	margin-bottom: 30px;
}

#CounselMsg {
	width: 800px;
	height: 300px;
	border-radius: 10px;
}

.other {
	float: left;
}

.mine {
	float: right;
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
						<%-- <aside class="single_sidebar_widget author_widget">
							<img class="author_img rounded-circle"
								src="resources/upload/${pmember.picture}" style="width: 210px"
								alt="">
							<div class="br"></div>
							<h4>${pmember.name }</h4>
							<div class="br"></div>
						</aside> --%>
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
					style="position: relative; width: 100%; top: -20px; border: 1px solid #f3f3f3; padding: 50px; border-radius: 5px;">
					<div class="col-lg-12 col-md-12 blog_details">

						<div>
							<!-- 채팅 상대방 이름 -->
							<%-- <p>세션아이디 : ${mId }</p> --%>
							<div style="margin-bottom: 20px;">
								<c:if test="${mId ne null }">
									<h2>
										<span><img
											style="width: 80px; height: 80px; object-fit: cover; border-radius: 70%; overflow: hidden; border: 2px solid rgb(46, 46, 46); margin-right: 5px;"
											class="profile" src="resources/upload/${pInfo.picture }"
											onError="this.src='resources/qna/대체이미지2.png'"></span> <span>${pInfo.name }</span>&nbsp;<span><c:if
												test="${pInfo.code == 100}">
												<c:out value="수의사" />
											</c:if> <c:if test="${pInfo.code == 101}">
												<c:out value="훈련사" />
											</c:if> <c:if test="${pInfo.code == 102}">
												<c:out value="펫시터" />
											</c:if> <c:if test="${pInfo.code == 103}">
												<c:out value="미용사" />
											</c:if></span>와의 1:1 상담
									</h2>
								</c:if>

								<c:if test="${pId ne null }">
									<h2>
										<span><img
											style="width: 80px; height: 80px; object-fit: cover; border-radius: 70%; overflow: hidden; border: 2px solid rgb(46, 46, 46); margin-right: 5px;"
											class="profile" src="resources/upload/${mInfo.picture }"
											onError="this.src='resources/qna/대체이미지2.png'"></span> <span><c:out
												value="${mInfo.name }" />님과의 1:1 상담입니다.</span>
									</h2>
								</c:if>
							</div>

							<!-- 반려동물 정보 -->
							<c:if test="${detail.pet_no != 0 || detail.pet_no eq null }">
							<h4>반려동물 정보</h4>
							<div
								style="width: 670px; height: 120px; margin-left: 30px; background: rgb(241, 241, 241); padding: 20px; margin-bottom: 30px;">
								<table style="color: black">
									<tr>
										<td rowspan="3"><img
											style="width: 80px; height: 80px; object-fit: cover; border-radius: 70%; overflow: hidden; border: 2px solid rgb(46, 46, 46); margin-right: 5px;"
											class="profile" src="resources/upload/${petInfo.picture }"
											onError="this.src='resources/qna/대체이미지2.png'"></td>
										<td style="font-weight: bold;"><c:if
												test="${petInfo.code ==501 }">
												<c:out value="강아지" />
											</c:if> <c:if test="${petInfo.code ==502 }">
												<c:out value="고양이" />
											</c:if> <c:if test="${petInfo.code ==503 }">
												<c:out value="조류" />
											</c:if> <c:if test="${petInfo.code ==504 }">
												<c:out value="파충류" />
											</c:if> <c:if test="${petInfo.code ==505 }">
												<c:out value="어류" />
											</c:if> <c:if test="${petInfo.code ==506 }">
												<c:out value="토끼" />
											</c:if> <c:if test="${petInfo.code ==507 }">
												<c:out value="돼지" />
											</c:if> <c:if test="${petInfo.code ==508 }">
												<c:out value="햄스터" />
											</c:if> <c:if test="${petInfo.code ==509 }">
												<c:out value="미어캣" />
											</c:if> <c:if test="${petInfo.code ==510 }">
												<c:out value="여우" />
											</c:if> <c:if test="${petInfo.code ==511 }">
												<c:out value="거미" />
											</c:if></td>
									</tr>
									<tr>
										<td>이름 : ${petInfo.name }</td>
									</tr>
									<tr>
										<td>몸무게 : ${petInfo.weight } kg</td>
									</tr>
								</table>
							</div>
							</c:if>

							<!-- 채팅 내용 -->
							<div id="chatbody" style="border: 1px solid #d3d3d3; background-color: white; margin: 30px; padding: 30px; color: black; height: 600px; border-radius: 5px; overflow: scroll;">
								<c:forEach items="${csDetail }" var="detail">

									<!-- 일반 멤버의 경우 -->
									<c:if test="${mId ne null }">

										<!-- 채팅 상대방 -->
										<c:if test="${detail.p_id eq detail.sender }">
											<div class="other">${pInfo.name }</div>
											<div>
											<div class="leftBubble"
												style="background-color: #d1d1d1; padding: 10px; margin-right : 100px; border-radius: 10px; display: inline-block;">
												${detail.content }</div>
												<div class="other">${detail.w_date }</div>
											</div>

										</c:if>

										<!-- 본인 -->
										<c:if test="${detail.m_id eq detail.sender }">
											<div align= "right">
											<div class="mine"
												style="background-color: #38a4ff; padding: 10px; margin-left : 100px; border-radius: 10px; display: inline-block; color : white;">${detail.content }</div>
												<div class="mine">${detail.w_date }</div>
											</div>
										</c:if>
									</c:if>

									<!-- 파트너 멤버의 경우 -->
									<c:if test="${pId ne null }">

										<!-- 채팅 상대방 -->
										<c:if test="${detail.m_id eq detail.sender }">
											<div class="other">${mInfo.name }</div>
											<div>
											<div class="leftBubble"
												style="background-color: #d1d1d1; padding: 10px; margin-right : 100px; border-radius: 10px; display: inline-block;">
												${detail.content }</div>
												<div class="other">${detail.w_date }</div>
											</div>

										</c:if>

										<!-- 본인 -->
										<c:if test="${detail.p_id eq detail.sender }">
											<div align= "right">
											<div class="mine"
												style="background-color: #38a4ff; padding: 10px; margin-left : 100px; border-radius: 10px; display: inline-block; color : white;">${detail.content }</div>
												<div class="mine">${detail.w_date }</div>
											</div>
										</c:if>
									</c:if>
								</c:forEach>
							</div>

							<div>


								<c:if test="${oneCs.code == '302' || oneCs.code == '301' }">
								<div style="display : flex">
									<span><input type="text" id="CounselMsg"
										name="CounselMsg" class="form-control"
										placeholder="메시지를 입력해주세요" style="width : 570px; height : 50px; margin-left : 30px;"></span>
									<span><button type="button" id="msgSubmit"
											class="genric-btn info-border radius" name="msgSubmit" style="margin-left : 10px;">전송</button></span>
								</div>
								</c:if>

								<c:if test="${oneCs.code == '303' }">
									<div
										style="background-color: rgb(220, 220, 220); text-align: center; border-radius: 10px; width: 300px; height: 60px; padding-top: 20px; margin-left: 200px; color : black;">
										<p>상담이 종료되었습니다.</p>
									</div>
								</c:if>

								` <input type="hidden" id="pet_no" name="pet_no"
									value="${oneCs.pet_no }"> <input type="hidden"
									id="p_no" name="p_no" value="${oneCs.c_no }"> <input
									type="hidden" id="m_id" name="m_id" value="${oneCs.m_id }">
								<input type="hidden" id="p_id" name="p_id"
									value="${oneCs.p_id }">
								<c:if test="${mId ne null}">
									<input type="hidden" id="sender" name="sender" value="${mId }">
								</c:if>
								<c:if test="${pId ne null }">
									<input type="hidden" id="sender" name="sender" value="${pId }">
								</c:if>

								<c:if test="${oneCs.code == '302' || oneCs.code == '301' }">
									<div>
										<button type="button" id="terminate" name="terminate"
											class="genric-btn success" style="float: right; margin-right : 30px;">상담
											종료</button>
									</div>
								</c:if>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<script>
		$(document).ready(function() {

			/* setInterval(AjaxCall(), 300); */

			/* $('#CounselMsg').focus(); */

			/*메시지 전송*/

			$('#CounselMsg').keypress(function(event) {
				var keycode = (event.keyCode ? event.keyCode : event.which);
				if (keycode == '13') {
					send();
				}

				event.stop(propagation);
			});

			$('#msgSubmit').click(function() {
				send();
			})
		});

		function send() {
			var msg = $("#CounselMsg").val();
			console.log(msg);

			if (msg != null) {
				$.ajax({
					method : "POST",
					url : "newCsAns",
					data : {
						p_no : $("#p_no").val(),
						m_id : $("#m_id").val(),
						p_id : $("#p_id").val(),
						content : $("#CounselMsg").val(),
						code : $("#code").val(),
						sender : $("#sender").val(),
						pet_no : $("#pet_no").val()
					},
					success : function() {
						location.reload();
						var objDiv = document.getElementById("chatbody");
						objDiv.scrollTop = objDiv.scrollHeight;
					},
					error : function() {
						alert('메시지가 전송되지 않았습니다.');
					}
				})
			}
		}

		/*상담 종료*/
		$(function() {
			$("#terminate").click(function() {
				if (confirm("상담을 종료하면 더 이상 메시지를 보낼 수 없습니다. 정말 종료하시겠습니까?")) {
					$.ajax({
						method : "GET",
						url : "CodeUdt",
						data : {
							p_no : $("#p_no").val(),
						},
						success : function() {
							alert('상담이 종료되었습니다.');
							location.reload();
						},
						error : function() {
							alert('오류가 발생했습니다.');
						}
					})
				}
			})
		})
		/* function AjaxCall() {

			$.ajax({

				cache : false,
				url : "csDetail",
				success : function(data) {
					location.reload();
				}
			})
		}

		}) */
	</script>
</body>

</html>