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
	.radioImg {
		width: 80px;
		height: 80px;
		border-radius: 70%;
		overflow: hidden;
	}
	
	#msgSubmit{
		color: #fff; 
    	background: #0062ff;
    	border: 1px solid transparent;
    	margin-left : 10px;
    	width: 175px;
    	font-size: 20px;
	}
	#msgSubmit:hover{
		color: #0062ff;
		border: 1px solid #0062ff;
		background: #fff;
	}
	#terminate{
		float: right; 
		margin:10px 30px 0 0;
		width: 175px; 
		height: 50px;
		font-size: 20px;
	}
	
	.petSelection {
		width: 100%;
		height: 100%;
		object-fit: cover;

		ul {
			padding: 16px 0;
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
		<div class="container" style="max-width: 1350px;">
			<div class="row">
				<div class="col-lg-3">
					<c:if test="${mId ne null }">
						<div class="blog_right_sidebar" style="margin-left: 40px; width: 300px;">
						<aside class="single_sidebar_widget author_widget">
							<img class="author_img rounded-circle" src="resources/upload/${mInfo.picture}"
								style="width: 210px" alt="">
							<div class="br"></div>
							<h4> ${mInfo.name }</h4>
							<div class="br"></div>
						</aside>
						<aside class="single_sidebar_widget post_category_widget">
							<h4 class="widget_title">My menu</h4>
							<ul class="list cat-list">
								<li><a href="memberMypage" class="d-flex justify-content-between">
										<p>내 프로필</p>
									</a></li>
								<li><a href="petmemberForm" class="d-flex justify-content-between">
										<p>반려동물 프로필</p>
									</a></li>
								<li><a href="protocol" class="d-flex justify-content-between">
										<p>반려동물 진료기록</p>
									</a></li>
								<li><a href="reservationSelect" class="d-flex justify-content-between">
										<p>예약 내역</p>
									</a></li>
								<li><a href="myPay" class="d-flex justify-content-between">
										<p>결제 내역</p>
									</a></li>
								<li><a href="mycounsel" class="d-flex justify-content-between">
										<p>상담 내역</p>
									</a></li>
								<li><a href="myreport" class="d-flex justify-content-between">
										<p>신고 내역</p>
									</a></li>
								<li><a href="myfallow" class="d-flex justify-content-between">
										<p>팔로우</p>
									</a></li>
								<li><a href="logout" class="d-flex justify-content-between">
										<p>로그아웃</p>
									</a></li>
								<li><a href="mdeleteForm" class="d-flex justify-content-between">
										<p>회원탈퇴</p>
									</a></li>
							</ul>
						</aside>
					</div>
					</c:if>	
					<c:if test="${pId ne null }">
					<div class="blog_right_sidebar" style="margin-left: 40px; width: 300px;">
						<aside class="single_sidebar_widget author_widget">
							<img class="author_img rounded-circle" src="resources/upload/${pInfo.picture}"
								style="width: 210px" alt="">
							<div class="br"></div>
							<h4>${pInfo.name }</h4>
							<div class="br"></div>
						</aside>
						<aside class="single_sidebar_widget post_category_widget">
							<h4 class="widget_title">My menu</h4>
							<ul class="list cat-list">
								<li><a href="pmemberMyPage" class="d-flex justify-content-between">
										<p>내 프로필</p>
									</a></li>
								<li><a href="reservationSetting" class="d-flex justify-content-between">
										<p>예약일정 설정</p>
									</a></li>
								<li><a href="preservationSelect" class="d-flex justify-content-between">
										<p>예약 내역</p>
									</a></li>
								<li><a href="pMemDiaList" class="d-flex justify-content-between">
										<p>진료 내역</p>
									</a></li>
								<li><a href="pMembenefit" class="d-flex justify-content-between">
										<p>결제 내역</p>
									</a></li>
								<li><a href="pmemcounsel" class="d-flex justify-content-between">
										<p>상담 내역</p>
									</a></li>
								<li><a href="pmemreport" class="d-flex justify-content-between">
										<p>신고 내역</p>
									</a></li>
								<li><a href="logout" class="d-flex justify-content-between">
										<p>로그아웃</p>
									</a></li>
								<li><a href="pmdeleteForm" class="d-flex justify-content-between">
										<p>회원탈퇴</p>
									</a></li>
									
							</ul>
						</aside>
					</div>
					</c:if>
				</div>
				<div class="col-lg-9 posts-list" style="position: relative; width: 100%; top: -20px; border: 1px solid #f3f3f3; padding: 50px; border-radius: 5px;">
					<div class="col-lg-12 col-md-12 blog_details">
						<div>
							<div style="margin-bottom: 20px;">
								<c:if test="${mId ne null }">
									<h2 style="padding-left: 35px;">
										<span>
											<img style="width: 80px; height: 80px; object-fit: cover; border-radius: 70%; overflow: hidden; border: 2px solid rgb(46, 46, 46); margin-right: 5px;"
												class="profile" src="resources/upload/${pInfo.picture }"
												onError="this.src='resources/qna/대체이미지2.png'"></span>
										<span>${pInfo.name}</span>&nbsp;<span>
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
										</span>와의 1:1 상담
									</h2>
								</c:if>
								<c:if test="${pId ne null }">
									<h2 style="text-align: center; margin-right: 7em;">
										<span><img
												style="width: 80px; height: 80px; object-fit: cover; border-radius: 70%; overflow: hidden; border: 2px solid rgb(46, 46, 46); margin-right: 5px;"
												class="profile" src="resources/upload/${mInfo.picture }"
												onError="this.src='resources/qna/대체이미지2.png'"></span> <span>
											<c:out value="${mInfo.name }" />님과의 1:1 상담입니다.</span>
									</h2>
								</c:if>
							</div>
							<!-- 반려동물 정보 -->
							<c:if test="${detail.pet_no != 0 || detail.pet_no eq null }">
								<div style="float: right; margin-top: -120px; margin-right: 32px; padding: 20px;">
									<table style="color: black">
										<tr>
											<td rowspan="3">
												<img style="width: 80px; height: 80px; object-fit: cover; border-radius: 70%; overflow: hidden; border: 2px solid rgb(46, 46, 46); margin-right: 5px;"
													class="profile" src="resources/upload/${petInfo.picture }"
													onError="this.src='resources/qna/대체이미지2.png'"></td>
											<td style="font-weight: bold;">
												<c:if test="${petInfo.code ==501 }">
													<c:out value="강아지" />
												</c:if>
												<c:if test="${petInfo.code ==502 }">
													<c:out value="고양이" />
												</c:if>
												<c:if test="${petInfo.code ==503 }">
													<c:out value="조류" />
												</c:if>
												<c:if test="${petInfo.code ==504 }">
													<c:out value="파충류" />
												</c:if>
												<c:if test="${petInfo.code ==505 }">
													<c:out value="어류" />
												</c:if>
												<c:if test="${petInfo.code ==506 }">
													<c:out value="토끼" />
												</c:if>
												<c:if test="${petInfo.code ==507 }">
													<c:out value="돼지" />
												</c:if>
												<c:if test="${petInfo.code ==508 }">
													<c:out value="햄스터" />
												</c:if>
												<c:if test="${petInfo.code ==509 }">
													<c:out value="미어캣" />
												</c:if>
												<c:if test="${petInfo.code ==510 }">
													<c:out value="여우" />
												</c:if>
												<c:if test="${petInfo.code ==511 }">
													<c:out value="거미" />
												</c:if>
											</td>
										</tr>
										<tr>
											<td>이름&nbsp;:&nbsp;&nbsp;${petInfo.name }</td>
										</tr>
										<tr>
											<td>몸무게&nbsp;:&nbsp;${petInfo.weight }&nbsp;kg</td>
										</tr>
									</table>
								</div>
							</c:if>

							<!-- 채팅 내용 -->
							<div id="chatbody"
								style="border: 1px solid #d3d3d3; background-color: white; margin: 30px; padding: 30px; color: black; height: 600px; border-radius: 5px; overflow: scroll;">
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
											<div align="right">
												<div class="mine"
													style="background-color: #38a4ff; padding: 10px; margin-left : 100px; border-radius: 10px; display: inline-block; color : white;">
													${detail.content }</div>
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
											<div align="right">
												<div class="mine"
													style="background-color: #38a4ff; padding: 10px; margin-left : 100px; border-radius: 10px; display: inline-block; color : white;">
													${detail.content }</div>
												<div class="mine">${detail.w_date }</div>
											</div>
										</c:if>
									</c:if>
								</c:forEach>
							</div>
							<c:if test="${oneCs.code == '302' || oneCs.code == '301' }">
								<div style="display : flex; margin-top: -15px;">
									<input type="text" id="CounselMsg" name="CounselMsg" class="form-control"placeholder="메시지를 입력해주세요"
											style="width : 640px; height : 50px; margin-left : 30px;">
									<button type="button" id="msgSubmit" class="genric-btn info-border radius" name="msgSubmit">전송</button>
								</div>
							</c:if>
							<c:if test="${oneCs.code == '303' }">
								<div style="background-color: rgb(220, 220, 220); text-align: center; border-radius: 10px; width: 200px; height: 60px; padding-top: 18px; margin-left: 20em; color : black;">
									<p style="font-size: 16px; font-family: sans-serif;">상담이 종료되었습니다.</p>
								</div>
							</c:if>
							<input type="hidden" id="pet_no" name="pet_no" value="${oneCs.pet_no }"> 
							<input type="hidden" id="p_no" name="p_no" value="${oneCs.c_no }"> 
							<input type="hidden" id="m_id" name="m_id" value="${oneCs.m_id }">
							<input type="hidden" id="p_id" name="p_id" value="${oneCs.p_id }">
							<c:if test="${mId ne null}">
								<input type="hidden" id="sender" name="sender" value="${mId }">
							</c:if>
							<c:if test="${pId ne null }">
								<input type="hidden" id="sender" name="sender" value="${pId }">
							</c:if>
							<c:if test="${oneCs.code == '302' || oneCs.code == '301' }">
								<button type="button" id="terminate" name="terminate" class="genric-btn success" >상담종료</button>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<script>
		$(document).ready(function () {

			$('#CounselMsg').keypress(function (event) {
				var keycode = (event.keyCode ? event.keyCode : event.which);
				if (keycode == '13') {
					send();
				}
				event.stop(propagation);
			});
			$('#msgSubmit').click(function () {
				send();
			})
		});

		function send() {
			var msg = $("#CounselMsg").val();
			console.log(msg);

			if (msg != null) {
				$.ajax({
					method: "POST",
					url: "newCsAns",
					data: {
						p_no: $("#p_no").val(),
						m_id: $("#m_id").val(),
						p_id: $("#p_id").val(),
						content: $("#CounselMsg").val(),
						code: $("#code").val(),
						sender: $("#sender").val(),
						pet_no: $("#pet_no").val()
					},
					success: function () {
						location.reload();
						var objDiv = document.getElementById("chatbody");
						objDiv.scrollTop = objDiv.scrollHeight;
					},
					error: function () {
						alert('메시지가 전송되지 않았습니다.');
					}
				})
			}
		}

		/*상담 종료*/
		$(function () {
			$("#terminate").click(function () {
				if (confirm("상담을 종료하면 더 이상 메시지를 보낼 수 없습니다. 정말 종료하시겠습니까?")) {
					$.ajax({
						method: "GET",
						url: "CodeUdt",
						data: {
							p_no: $("#p_no").val(),
						},
						success: function () {
							alert('상담이 종료되었습니다.');
							location.reload();
						},
						error: function () {
							alert('오류가 발생했습니다.');
						}
					})
				}
			})
		})

	</script>
</body>

</html>