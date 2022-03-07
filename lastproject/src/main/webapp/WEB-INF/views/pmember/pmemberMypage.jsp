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
					<a href="home">Home</a> <span>|</span>
					<a href="pmemberMyPage">MyPage</a>
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
							<img class="author_img rounded-circle" src="resources/upload/${pmember.picture}"
								style="width: 210px" alt="">
							<div class="br"></div>
							<h4>${pmember.name }</h4>
							<div class="br"></div>
						</aside>
						<aside class="single_sidebar_widget post_category_widget">
							<h4 class="widget_title">My menu</h4>
							<ul class="list cat-list">
								<li><a href="pmemberMyPage" class="d-flex justify-content-between">
										<p>내 프로필</p>
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
								<li><a href="#" class="d-flex justify-content-between">
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
				<div class="col-lg-9 posts-list">
					<div class="single-post row" style="margin-left: 10px;">
						<div class="col-lg-9 col-md-9 blog_details">
							<div class="form-group">
								<h3 style="font-weight: bolder;">이름</h3>
								<input type="text" style="border: none" id="name" name="name" value="${pmember.name}"
									readonly>
							</div>
							<div class="form-group">
								<h3 style="font-weight: bolder;">아이디</h3>
								<input type="email" style="border: none" id="p_id" name="p_id" value="${pmember.p_id}"
									readonly>
							</div>
							<div class="form-group">
								<h3 style="font-weight: bolder;">비밀번호</h3>
								<input type="password" style="border: none" id="password" name="password"
									value="${pmember.password}" readonly>
							</div>
							<div class="form-group">
								<h3 style="font-weight: bolder;">전화번호</h3>
								<input style="border: none" id="tel" name="tel" value="${pmember.tel}" readonly>
							</div>
							<div class="form-group">
								<h3 style="font-weight: bolder;">사업장 이름</h3>
								<input style="border: none" id="w_name" name="w_name" value="${pmember.w_name}"
									readonly>
							</div>
							<div class="form-group">
								<h3 style="font-weight: bolder;">사업장 주소</h3>
								<textarea style="border: none; overflow: hidden;" id="address" name="address" readonly cols="50"
									rows="1">${pmember.w_address}  ${pmember.w_d_address }</textarea>
							</div>
							<div class="form-group">
								<h3 style="font-weight: bolder;">사업장 전화번호</h3>
								<input type="text" style="border: none" id="w_tel" name="w_tel" value="${pmember.w_tel}"
									readonly>
							</div>
							<div class="form-group">
								<h3 style="font-weight: bolder;">운영안내</h3>
								<c:forEach items="${time }" var="time">
									<input type="text" style="border: none" id="time" name="time"
										value="${time.w_day } ${time.starttime} - ${time.endtime }" readonly>
								</c:forEach>
								<input type="text" style="border: none" id="content" name="content"
									value="${pmember.n_content}" readonly>
							</div>
							<div class="form-group">
								<h3 style="font-weight: bolder;">사업장 소개</h3>
								<textarea style="border: none; overflow: hidden;" id="p_info" name="p_info" readonly cols="100"
									rows="3">${pmember.p_info}</textarea>
							</div>
							<div class="form-group">
								<h3 style="font-weight: bolder;">경력</h3>
								<input type="text" style="border: none" id="career" name="career"
									value="${pmember.career}" readonly>
							</div>
							<button type="button" onclick="location.href='pmemberUpdateForm'" class="genric-btn info radius">내정보 수정</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>

</html>