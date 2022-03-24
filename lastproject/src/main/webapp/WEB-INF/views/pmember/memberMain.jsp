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
	.btn-fw{
		height: 55px;
   		padding-top: 15px;
    	font-size: 20px;
    	background-color: #0062ff;
 		color:#FFF;
	}
	
	.btn-fw:hover {
		color: #0062ff;
		background: #fff;
		border: 1px solid #0062ff;
	}


</style>
<body>
	<section class="department-area section-padding4" style="padding: 130px 0 130px;">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 offset-lg-3">
					<div class="section-top text-center">
						<h2>Best Partner</h2>
						<p>반려동물을 사랑하는 마음은 물론, 반려동물 관련 자격증 또는 전문 지식을 갖춘 분들이 활동하고 있습니다.
							반려동물과 보호자님 모두의 행복한 동행을 위해 든든한 파트너가 되어드립니다.</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="department-slider owl-carousel">
						<c:forEach var="pmember" items="${pmember}">
							<div class="single-slide">
								<div class="slide-img">
									<img src="/upload/${pmember.pfile }" onerror="this.src='resources/upload/pet.PNG'"
										style="width: 300px; height: 250px;" class="img-fluid">
									<div class="hover-state">
										<a href="pmemberDetail?id=${pmember.p_id }"><i class="fa fa-user-o"></i></a>
									</div>
								</div>
								<div class="single-department item-padding text-center">
									<c:if test="${pmember.code eq 100}">
										<h3>수의사</h3>
										<h2>${pmember.name }</h2>
									</c:if>
									<c:if test="${pmember.code eq 101}">
										<h3>훈련사</h3>
										<h2>${pmember.name }</h2>
									</c:if>
									<c:if test="${pmember.code eq 102}">
										<h3>펫시터</h3>
										<h2>${pmember.name }</h2>
									</c:if>
									<c:if test="${pmember.code eq 103}">
										<h3>미용사</h3>
										<h2>${pmember.name }</h2>
									</c:if>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</section>
	<div style="width: 100%; height: 150px">
		<h1
			style="font-weight: 700; letter-spacing: 0.2px; text-align: center; padding-top: 30px; font-size: 50px; line-height: 70px; color: #555555">
			믿을 수 있고<br>안심할 수 있어요
		</h1>
		<p style="text-align: center; font-size: 17px; color: #393C47; margin-top: 3px">
			까다로운 선발·관리 체계와 안전 시스템을 구축하였습니다</p>
	</div>
	<div style="display: flex; padding: 0px 300px 0px 500px; margin-top: 110px">
		<img src="/upload/do.png" style="width: 400px; height: 450px; border-radius: 2px">
		<div style="margin: 5em 0 0 5em;">
			<h1 style="font-size: 47px; color: #333333; font-weight: 600; line-height: 67px">
				훈련사의<br>체계적 교육!
			</h1>
			<h3
				style="font-weight: 400; margin-top: 38px; font-size: 17px; color: #333333; letter-spacing: -0.1px; line-height: normal">
				비대면 상담 / 방문 훈련 예약 <br>우리 아이 성향 맞춤 솔루션을 받아보세요!
			</h3>
			<a href="pmemberList?code=101"class="btn btn-outline-primary btn-rounded btn-fw">훈련사</a>
		</div>
	</div>
	<div style="display: flex; justify-content: space-between; padding: 50px 400px 0px 550px">
		<div style="padding-top: 72px">
			<h1 style="font-size: 47px; color: #333333; font-weight: 600; line-height: 67px">
				반려동물의<br>건강 관리!
			</h1>
			<h3 style="font-weight: 400; margin-top: 38px; font-size: 17px; color: #333333; letter-spacing: -0.1px; line-height: normal">
				인증 된 수의사<br>안심하고 반려동물을 맡겨보세요!
			</h3>
			<a href="pmemberList?code=100" class="btn btn-outline-primary btn-rounded btn-fw">수의사</a>
		</div>
		<img src="/upload/dod.png" style="width: 400px; height: 450px; border-radius: 2px;  margin-right: 10em;">
	</div>
	<div style="display: flex; padding: 0px 300px 0px 500px; margin-top: 50px">
		<img src="/upload/dogg.png" style="width: 400px; height: 450px; border-radius: 2px">
		<div style="margin:5em 0 0 5em;">
			<h1 style="font-size: 47px; color: #333333; font-weight: 600; line-height: 67px">
				믿고 맡기는<br>전문 펫시터!
			</h1>
			<h3 style="font-weight: 400; margin-top: 38px; font-size: 17px; color: #333333; letter-spacing: -0.1px; line-height: normal">
				언제 어디서든<br>안심하고 펫시터를 불러보세요!
			</h3>
			<a href="pmemberList?code=102" class="btn btn-outline-primary btn-rounded btn-fw">펫시터</a>
		</div>
	</div>
	<div style="display: flex; justify-content: space-between; padding: 50px 400px 0px 550px">
		<div style="padding-top: 72px">
			<h1 style="font-size: 47px; color: #333333; font-weight: 600; line-height: 67px">
				우리아이<br>전담 그루머
			</h1>
			<h3 style="font-weight: 400; margin-top: 38px; font-size: 17px; color: #333333; letter-spacing: -0.1px; line-height: normal">
				전담 그루머가 운영하는<br>트렌디한 미용 샵 지역별로 찾아보세요!
			</h3>
			<a href="pmemberList?code=103"class="btn btn-outline-primary btn-rounded btn-fw">미용사</a>
		</div>
		<img src="/upload/ddog.png" style="width: 400px; height: 450px; border-radius: 2px; margin-right: 10em;">
	</div>
	<div
		style="display: flex; align-items: center; flex-direction: column; justify-content: center; height: 500px; background: #FFFFFF">
		<div style="display: flex; flex-direction: row; align-items: center; padding-right: 30px; ">
			<div style="margin-bottom: 20px">
				<h1 style="font-size: 47px; color: #333333; font-weight: 600; line-height: 67px; padding-left: 20px; ">
					더 궁금한 점이<br>있으신가요?
				</h1>
				<div style="margin: -12em 0  0 30em;">
					<h2 style="font-size: 50px; font-weight: 700; color: #555555; line-height: 70px">
						무료 상담!<br>OPEN Q&amp;A!</h2>
					<h3 style="font-size: 17px; font-weight: 400; color: #333333; margin-top: 20px; line-height: 27px">
						궁금한 점이 있거나, 사전 상담이 필요하다면<br>Q&amp;A에 질문 글을 올려보세요!</h3>
					<a href="qnaMain" class="btn btn-outline-primary btn-rounded btn-fw">질문하기</a>
				</div>
			</div>
		</div>
	</div>
</body>

</html>