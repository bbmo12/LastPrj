<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<style>
	#w_address::placeholder {
		color: #fff;
		
	}

</style>

<body>
	<section class="specialist-area section-padding">
		<div class="container" id="mainContainer">
			<div class="row">
				<div class="col-lg-6 offset-lg-3">
					<div class="section-top text-center">
						<h1>Our Partner</h1>
						<c:if test="${page.cri.code eq 100}">
							<h3>수의사를 소개합니다</h3>
							<p>우리동네 전문 수의사를 찾아보세요!</p>
						</c:if>
						<c:if test="${page.cri.code eq 101}">
							<h3>훈련사를 소개합니다</h3>
							<p>나와 우리 반려동물에게 꼭 맞는 훈련사를 찾아보세요!</p>
						</c:if>
						<c:if test="${page.cri.code eq 102}">
							<h3>펫시터를 소개합니다</h3>
							<p>언제 어디서든 펫시트를 부르세요!</p>
						</c:if>
						<c:if test="${page.cri.code eq 103}">
							<h3>미용사를 소개합니다</h3>
							<p>전담 그루머를 찾아보세요!</p>
						</c:if>
					</div>
				</div>
			</div>
			<div class="row" id="data-container">
			
				<c:forEach items="${pageList }" var="pmember">
					<div class="col-lg-3 col-sm-6">
						<div class="single-doctor mb-4 mb-lg-0">
							<div class="doctor-img">
								<img src="resources/upload/${pmember.picture }" onerror="this.src='resources/upload/pet.PNG'" class="img-fluid"
									style="width: 300px; height: 200px;">
							</div>
							<div class="content-area">
								<div class="doctor-name text-center">								
									<a href="pmemberDetail?id=${pmember.p_id}">
										<h3>${pmember.name }</h3>
									</a>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<form action="pmemberList" name="goform">
		<input id="pmemberCode" type="hidden" name="code" value="${param.code }">
		<input type="hidden" name="pageNum" value="1"	>	
		<div class="blog_right_sidebar" style="width: 500px; float: none; margin: 0 auto;">
			<aside class="single_sidebar_widget search_widget">
				<div class="input-group">
					<input type="text"  class="form-control" id="w_address" name="w_address" placeholder="지역명을 입력해주세요" value="${param.w_address }">
					<span class="input-group-btn">
						<button class="btn btn-default" type="submit" >
							<i class="fa fa-search"></i>
						</button>
					</span>
				</div>
				<!-- /input-group -->
			</aside>
		</div>
		</form>
	 <my:nav jsFunc="go_page" page="${page}"/> 
	</section>
	<script type="text/javascript">
	    function go_page(p) {
	    	goform.pageNum.value=p;
	    	goform.submit();		
		}
	    w_address.addEventListener('click', function () {
			event.target.select();
		})
	</script>
</body>
</html>