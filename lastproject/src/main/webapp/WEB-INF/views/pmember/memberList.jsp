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
	#keyword::placeholder {
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
								<img src="resources/upload/${pmember.picture }" alt="난바보" class="img-fluid"
									style="width: 300px; height: 200px;">
							</div>
							<div class="content-area">
								<div class="doctor-name text-center">
									<input id="pmemberCode" type="hidden" value="${pmember.code }">
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
		<div class="blog_right_sidebar" style="width: 500px; float: none; margin: 0 auto;">
			<aside class="single_sidebar_widget search_widget">
				<div class="input-group">
					<input type="text" class="form-control" id="keyword" name="keyword" placeholder="지역명을 입력해주세요">
					<span class="input-group-btn">
						<button class="btn btn-default" type="button" onclick="getLocal()">
							<i class="fa fa-search"></i>
						</button>
					</span>
				</div>
				<!-- /input-group -->
			</aside>
		</div>
		<nav class="blog-pagination justify-content-center d-flex">
			<ul class="pagination">
				<li class="page-item">
					<a href="pmemberList?pageNum=${page.startPage-1}&code=${page.cri.code}" class="page-link"
						aria-label="Previous">
						<span aria-hidden="true">
							<span class="fa fa-angle-left"></span>
						</span></a>
				</li>
				<c:forEach var="num" begin="${page.startPage }" end="${page.endPage }">
					<li class="page-item ${page.pageNum eq num ? 'active' : '' }"><a
							href="pmemberList?pageNum=${num }&code=${page.cri.code}" class="page-link">${num }</a>
					</li>
				</c:forEach>
				<li class="page-item"><a href="pmemberList?pageNum=${page.endPage+1}&code=${page.cri.code}"
						class="page-link" aria-label="Next">
						<span aria-hidden="true">
							<span class="fa fa-angle-right"></span>
						</span></a>
				</li>
			</ul>
		</nav>
		<form action="../pmemberList" name="pageForm" method="get">
			<input type="hidden" name="pageNum" value="${page.cri.pageNum }">
			<input type="hidden" name="amount" value="${page.cri.amount }">
		</form>
	</section>
	<script type="text/javascript">
		function getLocal() {
			var code = document.getElementById('pmemberCode').value;
			var local = document.getElementById('keyword').value;
			$('#keyword').val('');
			$.ajax({
				url: 'pmemberLocal',
				method: 'post',
				data: {
					coded: code,
					local: local
				}
			}).done(function (data) {
				console.log(data);
				var container = document.getElementById('mainContainer');
				var main = document.getElementById('data-container');
				main.remove();
				var row = document.createElement('div');
				row.className = 'row';
				for (var i = 0; i < data.length; i++) {
					var content = document.createElement('div');
					content.className = 'col-lg-3 col-sm-6';
					content.innerHTML = `<div class="single-doctor mb-4 mb-lg-0">
								<div class="doctor-img">
									<img src="resources/upload/\${data[i].picture }" alt="난바보" class="img-fluid">
								</div>
								<div class="content-area">
									<div class="doctor-name text-center">
									<input id="pmemberCode" type="hidden" value="\${data[i].code }">
										<a href="pmemberDetail?id=\${data[i].p_id}">
											<h3>\${data[i].name}</h3>
										</a>
									</div>
								</div>
							</div>`;
					row.append(content);
					container.append(row);
				}
			});
		}
	</script>
</body>

</html>