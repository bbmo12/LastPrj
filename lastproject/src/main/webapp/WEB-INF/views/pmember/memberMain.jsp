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
    <section class="department-area section-padding4">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3">
                    <div class="section-top text-center">
                        <h2>Best Partner</h2>
                        <p>반려동물을 사랑하는 마음은 물론, 반려동물 관련 자격증 또는 전문 지식을 갖춘 분들이 활동하고 있습니다. 반려동물과 보호자님 모두의 행복한 동행을 위해 든든한 파트너가 되어드립니다.</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="department-slider owl-carousel">
                    <c:forEach var="pmember" items="${pmember}">
                        <div class="single-slide">
                            <div class="slide-img">
                               <img src="resources/upload/${pmember.picture }" alt="" style="width: 300px; height: 250px;"class="img-fluid">
                                <div class="hover-state">
                                    <a href="pmemberDetail?id=${pmember.p_id }"><i class="fa fa-user-o"></i></a>
                                </div>
                            </div>
                            <div class="single-department item-padding text-center"> 
                            <c:if test="${pmember.code eq 100}">                           
							<h3>수의사</h3><h2>${pmember.name }</h2>	
						</c:if>
						<c:if test="${pmember.code eq 101}">
							<h3>훈련사</h3><h2>${pmember.name }</h2>							
						</c:if>
						<c:if test="${pmember.code eq 102}">
							<h3>펫시터</h3><h2>${pmember.name }</h2>	
						</c:if>
						<c:if test="${pmember.code eq 103}">
							<h3>미용사</h3><h2>${pmember.name }</h2>	
						</c:if>                                
                                <p style="font-size: 18px;">${pmember.n_content }</p>
                            </div>
                        </div>
                         </c:forEach>       
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="feature-area section-padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6">
                    <div class="single-feature text-center item-padding">
                        <img src="resources/assets/images/feature1.png" alt="">
                        <h3>advance technology</h3>
                        <p class="pt-3">Creeping for female light years that lesser can't evening heaven isn't bearing tree appear</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="single-feature text-center item-padding mt-4 mt-md-0">
                        <img src="resources/assets/images/feature2.png" alt="">
                        <h3>comfortable place</h3>
                        <p class="pt-3">Creeping for female light years that lesser can't evening heaven isn't bearing tree appear</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="single-feature text-center item-padding mt-4 mt-lg-0">
                        <img src="resources/assets/images/feature3.png" alt="">
                        <h3>quality equipment</h3>
                        <p class="pt-3">Creeping for female light years that lesser can't evening heaven isn't bearing tree appear</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="single-feature text-center item-padding mt-4 mt-lg-0">
                        <img src="resources/assets/images/feature4.png" alt="">
                        <h3>friendly staff</h3>
                        <p class="pt-3">Creeping for female light years that lesser can't evening heaven isn't bearing tree appear</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>
</html>