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
		<div class="container" id="mainContainer">
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
			<div class="row" id="pmemberProfile">
				<c:forEach items="${pmember }" var="pmember">
					<div class="col-lg-3 col-sm-6">
						<div class="single-doctor mb-4 mb-lg-0">
							<div class="doctor-img">
								<img src="resources/upload/${pmember.picture }" alt="난바보" class="img-fluid">
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

		<div class="blog_right_sidebar" style="width: 500px; float: none; margin: 0 auto; ">
			<aside class="single_sidebar_widget search_widget">
				<div class="input-group">
					<input type="text" class="form-control" id="local" placeholder="지역명을 입력해주세요">
					<span class="input-group-btn">
						<button class="btn btn-default" type="button" onclick="getLocal()">
						<i class="fa fa-search"></i></button>
					</span>
				</div><!-- /input-group -->
			</aside>
		</div>
	</section>
	<script type="text/javascript">
		function getLocal() {
			var code = document.getElementById('pmemberCode').value;
			var local = document.getElementById('local').value;
			$('#local').val('');
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
				var main = document.getElementById('pmemberProfile');
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