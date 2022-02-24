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
	#local::placeholder {
		color: #fff;
	}
</style>

<body>
	<section class="specialist-area section-padding">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 offset-lg-3">
					<div class="section-top text-center">
						<h2>Our specialish</h2>
						<p>Green above he cattle god saw day multiply under fill in
							the cattle fowl a all, living, tree word link available in the
							service for subdue fruit.</p>
					</div>
				</div>
			</div>
			<div class="row">
				<c:forEach items="${pmember }" var="pmember">
					<div class="col-lg-3 col-sm-6">
						<div class="single-doctor mb-4 mb-lg-0">
							<div class="doctor-img">
								<img src="resources/upload/${pmember.picture }" alt="난바보" class="img-fluid">
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

		<div class="blog_right_sidebar" style="width: 500px; float: none; margin: 0 auto; ">
			<aside class="single_sidebar_widget search_widget">
				<div class="input-group">
					<input type="text" class="form-control" id="local" placeholder="지역명을 입력해주세요">
					<span class="input-group-btn">
						<button class="btn btn-default" type="button" onclick="getLocal()"><i class="fa fa-search"></i></button>
					</span>
				</div><!-- /input-group -->
			</aside>
		</div>
	</section>
	<script type="text/javascript">
	function getLocal() {
			var local = document.getElementById('local').value;
			console.log(local);
		$.ajax({
			url: 'pmemberLocal',
			data: {
				local: local
			}
		}).done(function (data) {
			console.log(data);
		});	
	}
	</script>
</body>

</html>