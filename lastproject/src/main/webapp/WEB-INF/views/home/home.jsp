<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
	<meta charset="UTF-8">
	 <!-- Required Meta Tags -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <!-- Page Title -->
    <title>BanBanBan</title>


</head>
	
<style>
.partner_img{
	object-fit: cover;
	object-position:top;
	border-radius:50%;
	width: 120px !important;
	height: 120px !important;
	float: none;
	margin: 0 auto;
}

#best_rcom{
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 400;
	color: #4C4C4C;
}

#best_name{
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 500;
	font-size: 18px;
	color: #4C4C4C;
}

#welcome_1{
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 300;
}

h2{
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 700;
}
#profile{
	display: inline-block;
	margin-right: 20px;
}

#review{
	display: inline-block;
	padding: 0 50px 50px 0;
	text-align: left;
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 400;
}

.profile_img{
	object-fit: cover;
	object-position:top;
	border-radius:50%;
	width: 60px;
	height: 60px;
}

#qSection {
	border: 1px solid rgb(220, 220, 220);
}

.card-text {
	overflow: hidden;
	white-space: normal;
	word-wrap: break-word;
	display: -webkit-box;
	-webkit-line-clamp: 3;
	-webkit-box-orient: vertical;
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 300;
}

.review_text{
	overflow: hidden;
	white-space: normal;
	word-wrap: break-word;
	display: -webkit-box;
	-webkit-line-clamp: 4;
	-webkit-box-orient: vertical;
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 300;
}

h1{
	color: white;
}

#banner_content{
	color: white;
}
	.swal2-content{
		display: none;
	}

</style>
	<br><br><br><br><br>
     <!-- Banner Area Starts -->
    <section class="banner-area">
        <div class="container">
            <div class="row">

                <div class="col-lg-10" style="margin-left: 50px;">
                <br><br><br><br><br>
                    <h1>반려동물을 위한</h1>
                    <h1>모든 것</h1>
                    <p id="banner_content">&nbsp;OOO이 함께합니다</p>
                    <!-- <a href="reservationSelect" class="genric-btn info circle arrow">일반회원예약조회</a>
                    <a href="preservationSelect" class="genric-btn info circle arrow">파트너회원예약조회</a>
                    <a href="reservationSetting" class="genric-btn info circle arrow">파트너회원예약설정</a> -->
                    <br>
                    <!-- <a href="reservMember" class="genric-btn info circle arrow" style="text-decoration: none;">지금 예약하기<span class="lnr lnr-arrow-right"></span></a> -->
                    
                </div>
            </div>
        </div>
    </section>
    <!-- Banner Area End -->
    <!-- <section class="feature-area section-padding">
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
    </section> -->
    <br><br><br><br><br><br>
    <section class="welcome-area section-padding3" style="padding-bottom: 10px; margin-top: -7em;">
    <div class="col-lg-10" style="float: none; margin: 0 auto;">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="welcome-img" style="margin-left: 40px;">
                        <img src="resources/upload/cat.jpg" alt="" style="width:400px; height:550px;">
                    </div>
                </div>
                <div class="col-lg-6"  style="margin-left: -6em;">
                <br><br><br><br>
                    <div class="mt-5 mt-lg-0">
                        <h2>소중한 우리 아이 기록<br>어떻게 보관하고 계신가요?</h2>
                        <br>
                        <p id="welcome_1">블록체인에 담을 시간이 있을까?!</p>
                        <p id="welcome_1">블록체인에 저장하고 잃어버릴 걱정없이 언제든지 확인하세요.</p>
                    </div>
                </div>
            </div>
        </div>
        </div>
    </section>
    
<!-- Department Area Starts -->
    <section class="department-area section-padding4" style="padding: 50px 0 50px;">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3">
                    <div class="section-top text-center">
                        <h2>베스트 파트너 회원</h2>
                        <p></p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="department-slider owl-carousel">
                    <c:forEach items="${bestList}" var="best">
                        <div class="single-slide">
                            <div class="single-department item-padding text-center">
                            <div id="best_p_profile">
                            	<img class="partner_img" src="resources/upload/${best.picture }" onError="this.style.display='none'" alt=''>
                            </div>
                            <br>
                                <p id="best_name">${best.name }</p>
                                <p id="best_rcom">추천수 : ${best.rcom }</p>
                                <c:choose>
                                	<c:when test="${best.code eq 100 }"><p id="best_rcom">수의사</p></c:when>
                                	<c:when test="${best.code eq 101 }"><p id="best_rcom">훈련사</p></c:when>
                                	<c:when test="${best.code eq 102 }"><p id="best_rcom">펫시터</p></c:when>
                                	<c:otherwise><p id="best_rcom">미용사</p></c:otherwise>
                                </c:choose>        
                                <a href="pmemberDetail?id=${best.p_id}" class="btn btn-outline-primary btn-rounded btn-fw" style="text-decoration: none;">이 파트너회원에게 예약하기</a>
                            </div>
                        </div>
                       </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Department Area Starts -->
    
    
    <!-- Patient Area Starts -->
    <!-- <section class="patient-area section-padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3">
                    <div class="section-top text-center">
                        <h2>Patient are saying</h2>
                        <p>Green above he cattle god saw day multiply under fill in the cattle fowl a all, living, tree word link available in the service for subdue fruit.</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-5">
                    <div class="single-patient mb-4">
                        <img src="resources/assets/images/patient1.png" alt="">
                        <h3>daren jhonson</h3>
                        <h5>hp specialist</h5>
                        <p class="pt-3">Elementum libero hac leo integer. Risus hac road parturient feugiat. Litora cursus hendrerit bib elit Tempus inceptos posuere metus.</p>
                    </div>
                    <div class="single-patient">
                        <img src="resources/assets/images/patient2.png" alt="">
                        <h3>black heiden</h3>
                        <h5>hp specialist</h5>
                        <p class="pt-3">Elementum libero hac leo integer. Risus hac road parturient feugiat. Litora cursus hendrerit bib elit Tempus inceptos posuere metus.</p>
                    </div>
                </div>
                <div class="col-lg-5 offset-lg-1 align-self-center">
                    <div class="appointment-form text-center mt-5 mt-lg-0">
                        <h3 class="mb-5">appointment now</h3>
                        <form action="#">
                            <div class="form-group">
                                <input type="text" placeholder="Your Name" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Your Name'" required>
                            </div>
                            <div class="form-group">
                                <input type="email" placeholder="Your Email" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Your Email'" required> 
                            </div>
                            <div class="form-group">
                                <input type="text" id="datepicker" placeholder="Date" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Date'" required>
                            </div>
                            <div class="form-group">
                                <textarea name="message" cols="20" rows="7"  placeholder="Message" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Message'" required></textarea>
                            </div>
                            <a href="#" class="template-btn">appointment now</a>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section> -->
    
    <!-- Specialist Area Starts -->
    <section class="specialist-area section-padding" style="padding: 50px 0;">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3">
                    <div class="section-top text-center">
                        <h2>최신 후기</h2>
                        <p>사용자들의 솔직한 후기를 확인하세요</p>
                    </div>
                </div>
            </div>
            <div class="row">
            <c:forEach items="${serviceReviewList}" var="review">
                <div class="col-lg-4 col-sm-6">
                    <div class="single-doctor mb-4 mb-sm-0">
                        <div class="content-area" style="margin-bottom:20px;">
                            <div class="doctor-text text-center" style="height:250px">
                            <div id="profile">
                            	<img class="profile_img" src="resources/upload/${review.picture }" onError="this.style.display='none'" alt=''>
                            </div>
                            <div id="review">
	                            ${review.m_id }
	                            <br>
								<div class="star">
									<input type="hidden" class="rating" value="${review.rating }">
								</div>
							</div>
								<br>
                                <p class="review_text">${review.content }</p>
                                <c:forEach items="${review.fileList }" var="photo">
								<div style="margin-top: 10px; display:inline-block;">
									<img src="resources/upload/${photo.photo }" onError="this.style.display='none'" alt=''
										style="width: 60px; height: 60px;">
								</div>
							</c:forEach>
                            </div>
                        </div>   
                    </div>
                </div>
            </c:forEach>
            </div>
        </div>
    </section>
    <!-- Specialist Area Starts -->
    <!-- Hotline Area Starts -->
    <!-- <section class="hotline-area text-center section-padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h2>Emergency hotline</h2>
                    <span>(+01) – 256 567 550</span>
                    <p class="pt-3">We provide 24/7 customer support. Please feel free to contact us <br>for emergency case.</p>
                </div>
            </div>
        </div>
    </section> -->
    <!-- Hotline Area End -->
    
   <!-- News Area Starts -->
    <section class="specialist-area section-padding" style="padding: 20px 0;">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3">
                    <div class="section-top text-center">
                        <h2>최신 질문글</h2>
                        <p>어떤 질문들이 올라오고 있나요?</p>
                    </div>
                </div>
            </div>
            <div class="row">
            <c:forEach items="${qnaRecent }" var="recent">
                <div class="col-lg-4 col-md-6">
                <div class="single-news mt-5 mt-md-0">
	                
					  <div id="qSection" class="card-body" style="height:250px; margin-bottom:20px; background-color:white;">
					    <span style="color:#4C4C4C; font-size:20px;">
					    <i class="fa-solid fa-q fa-lg" style="color: dodgerblue; margin-right: 20px;"></i>
					    ${recent.title }</span>
					    <hr>
					    <p class="card-text">${recent.content}</p>
					    <a href="qnaDetail?q_no=${recent.q_no }" class="news-btn">자세히보기 <i class="fa fa-long-arrow-right"></i></a>
					  </div>
					
                   </div>
                   </div>
                   </c:forEach>
                   <div style="float: none; margin: 0 auto;">
                   <br>
                   <a href="qnaMain" class="btn btn-primary btn-rounded btn-fw" style="text-decoration: none;">더 많은 질문 보러가기</a>
                   <br><br><br><br><br><br><br><br>
                   </div>
            </div>
        </div>
    </section>
    <!-- News Area Starts -->
    <script>
    $(function () {
		$('.star').each(function (index, item) {
			$(this).raty({
				score: $(this).find('.rating').val(),
				path: "resources/star",
				width: 200,
				readOnly: true
			});
		})
	});
    </script>
    	<script>
	if("${insert}" != "" ){
		Swal.fire('회원가입이<br>완료되었습니다.');
	}
	</script>
</body>
</html>
