<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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
								<img src="resources/assets/images/doctor1.jpg" alt=""
									class="img-fluid">
							</div>
							<div class="content-area">
								<div class="doctor-name text-center">
									<a href="pmemberDetail?name=${pmember.name}"><h3>${pmember.name }</h3></a>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>
</body>
</html>