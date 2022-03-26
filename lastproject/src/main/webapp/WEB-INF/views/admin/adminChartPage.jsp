<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- <script src="resources/adminJs/adminChartPageJS.js"></script> -->
<style>
.single_sidebar_widget .post_category_widget {
	text-decoration: none !important;
	font-size: 2rem !important;
}

.col-lg-3{
	padding:50px;
}
.posts-list {
margin-top:1.9%;
}


#my_section {
	padding: 50px;
	background: #f9f9fd;
}

.blog_right_sidebar {
	box-shadow: 0 .15rem 1.75rem 0 rgba(58, 59, 69, .1) !important;
	border: 1px solid #e3e6f0;
	border-radius: 0.35rem
}


.card {
	box-shadow: 0 .15rem 1.75rem 0 rgba(58, 59, 69, .1) !important;
	border: 1px solid #e3e6f0;
	border-radius: 0.35rem
}

.card-header {
	background: white;
	font-size: 1.0rem;
	/* font-family: 'NanumBarunGothic'; */
	font-style: normal;
	font-weight: 400;
	color: black;
}

.card-footer {
	background: white;
	font-size: 1.0rem;
	/* font-family: 'NanumBarunGothic'; */
	font-style: normal;
	font-weight: 400;
}

#notice_footer {
	text-align: center;
	font-size: 1.0rem;
	/* font-family: 'NanumBarunGothic'; */
	font-style: normal;
	font-weight: 400;
}

.card_notice {
	font-size: 0.8rem;
	/* font-family: 'NanumBarunGothic'; */
	font-style: normal;
	font-weight: 400;
}

.partner_img {
	object-fit: cover;
	object-position: top;
	border-radius: 50%;
	width: 180px !important;
	height: 180px !important;
	float: none;
	margin: 0 auto;
}

.pet_img {
	object-fit: cover;
	object-position: top;
	border-radius: 50%;
	width: 100px !important;
	height: 100px !important;
	float: none;
	margin-bottom: 5px;
}

.widget_title {
	background: #0062ff !important;
}

#cardTitle {
	font-size: 1.25rem;
	/* font-family: 'NanumBarunGothic'; */
	font-style: normal;
	font-weight: 700;
}

#myinfo {
	font-size: 0.8rem;
	/* font-family: 'NanumBarunGothic'; */
	font-style: normal;
	font-weight: 300;
}

#pet_img2 {
	display: inline-block;
	text-align: center;
	margin-right: 15px;
	font-size: 0.8rem;
	/* font-family: 'NanumBarunGothic'; */
	font-style: normal;
	font-weight: 400;
}

.que:first-child {
	
}

.que {
	position: relative;
}

.que::before {
	display: inline-block;
}

.que.on>span {
	
}

.anw {
	display: none;
	overflow: hidden;
}

.anw::before {
	display: inline-block;
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

<body>
<br><br><br><br><br>
     <!-- Banner Area Starts -->
    <section class="banner-area">
        <div class="container">
            <div class="row">

                <div class="col-lg-10" style="margin-left: 50px;">
                <br><br><br><br><br>
                    <h1>관리자 페이지</h1>
                    <h1>관리자님 반갑습니다.</h1>
                </div>
            </div>
        </div>
    </section>
	<section id="my_section">
		<div class="container" style="max-width: 1350px;">
			<div class="row">
				<div class="col-lg-3">
					<h5><a href="adminPage">메인 페이지</a></h5>
					<br>
					<div class="blog_right_sidebar" style="width: 250px;">
						<aside class="single_sidebar_widget author_widget">
							<img class="partner_img" src="resources/upload/${member.pfile}"
								onerror="this.src='resources/upload/cat.jpg'" alt=""> <br>
							<br>
							<h4>관리자님</h4>
							<div class="br"></div>
							<div id="myinfo">
								<i class="fa-solid fa-pen"></i>&nbsp;해야할 일
							</div>
						</aside>
					</div>
					<br>
					<div class="blog_right_sidebar" style="width: 250px;">
						<aside class="single_sidebar_widget post_category_widget">
							<h4 class="widget_title">My menu</h4>
							<ul class="list cat-list nanumbarungothic">
								<li><a href="adminChartPage"
									class="d-flex justify-content-between">
										<p>차트</p>
								</a></li>
								<li><a href="adminMemberPage"
									class="d-flex justify-content-between">
										<p>목록</p>
								</a></li>
								<li><a href="adminReportPage"
									class="d-flex justify-content-between">
										<p>신고 관리</p>
								</a></li>
								<li><a href="adminBoardPage"
									class="d-flex justify-content-between">
										<p>공지사항</p>
								</a></li>
								<li><a href="logout" class="d-flex justify-content-between">
										<p>로그아웃</p>
								</a></li>
							</ul>
						</aside>
					</div>
				</div>
				<div class="col-lg-9 posts-list">
					<div class="single-post row">
						<div class="col-lg-12 col-md-12 blog_details">
							<div class="row">
								<div class="col-lg-4 col-md-4">
									<br> <br>
									<div class="card"
										style="border-left: 0.25rem solid #0062ff !important;">
										<div class="card-body text-center" style="padding: 20px">
											<div style="margin-right: 20px;">
												<span class="fa-stack fa-lg" style="margin-right: 10px;">
													<i class="fa fa-circle fa-stack-2x" style="color: #0062ff"></i>
													<i class="fa fa-calendar-check fa-stack-1x fa-inverse"></i>
												</span><span id="cardTitle">일반회원 가입자 수</span>
											</div>
											<h3 id="admMemberC"></h3>
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-md-4">
									<br> <br>
									<div class="card"
										style="border-left: 0.25rem solid #36b9cc !important;">
										<div class="card-body text-center" style="padding: 20px;">
											<div style="margin-right: 20px;">
												<span class="fa-stack fa-lg" style="margin-right: 10px;">
													<i class="fa fa-circle fa-stack-2x" style="color: #36b9cc"></i>
													<i class="fa fa-comments fa-stack-1x fa-inverse"></i>
												</span><span id="cardTitle">펫 마릿수</span>
											</div>
											<h3 id="admPetC"></h3>
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-md-4">
									<br> <br>
									<div class="card"
										style="border-left: 0.25rem solid #f6c23e !important;">
										<div class="card-body text-center" style="padding: 20px">
											<div style="margin-right: 20px;">
												<span class="fa-stack fa-lg" style="margin-right: 10px;">
													<i class="fa fa-circle fa-stack-2x" style="color: #f6c23e"></i>
													<i class="fa fa-feather-pointed fa-stack-1x fa-inverse"></i>
												</span><span id="cardTitle">파트너회원 가입자 수</span>
											</div>
											<h3 id="admPmemberC"></h3>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-12 col-md-12 blog_details">
							<div class="card">
								<div class="card-header que admPartChartA">
									<i class="fa fa-users" aria-hidden="true"></i>&nbsp;<i class="fa fa-line-chart" aria-hidden="true"></i>&nbsp;&nbsp;일반회원 기간 별 가입자 수
								</div>
								<div class="card-body card_notice anw" style="padding: 15px">
									<div class="admPartChart">
									<h4 class="card-title">일반 회원 기간 별 가입자 수</h4>
									<canvas id="admPartChart" style="height: 250px"></canvas>
									</div>
								</div>
								<div id="notice_footer">
									<p>수신일로부터 7일이 지난 알림은 자동 삭제됩니다.</p>
								</div>
							</div>
						</div>

						<div class="col-lg-12 col-md-12 blog_details">
							<div class="card">
								<div class="card-header que admPetChartA">
									<i class="fa-solid fa-paw"></i>&nbsp;<i class="fa fa-bar-chart" aria-hidden="true"></i>&nbsp;&nbsp; 반려동물 품종 별 차트
								</div>
								<div class="card-body anw" style="padding: 15px">
									<p class="card-description mainCount" id="petCount">
									<h4 class="card-title">펫 품종별 비율</h4>
									<p class="card-description mainCount" id="petCount">
										<code id="a"></code>
										<br>
										<code id="ip"></code>
									</p>
									<div class="admPetChart">
										<canvas id="admPetChart" style="height: 250px"></canvas>
									</div>
								</div>
								<div class="card-footer">
									<span style="color: #0062ff"><i class="fa-solid fa-plus"></i>&nbsp;&nbsp;</span><span>반려동물
										추가</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<script>
		//JavaScript 영역의 대부분은 adminChartPageJS.js 파일에 있습니다
		
		adminCount();
		 
		//개수 불러오는 함수
		function adminCount() {
		    $.ajax({
		        url : 'adminCount',
		        method : 'get',
		        success : function(res) {
		            console.log(res.petCount);
		            console.log(res.pmemCount);
		            console.log(res.memCount);
		            $("#admMemberC").append(res.memCount+"명");
		            $("#admPmemberC").append(res.pmemCount+"명");
		            $("#admPetC").append(res.petCount+"마리");
		            
		        },error : function(error) {
		            alert('Count를 불러오는 데 오류가 있습니다')
		            return false;
		            
		        }
		        
		    });
		    
		}

		// 아코디언 함수
		$(document).on("click", ".que", function() {
		    $(this).next(".anw").stop().slideToggle(300);
		    $(this).toggleClass('on').siblings().removeClass('on');
		    $(this).next(".anw").siblings(".anw").slideUp(300); // 1개씩 펼치기
		})//end 아코디언 함수


		//div admPetChartA 클래스 클릭시 함수
		$(document).on("click",".admPetChartA" ,function(){
		    $(".admPetChart").append("<canvas id='admPetChart'></canvas>");
		     $("#admPetChart").remove();
		     petChart();
		 function petChart() {// 품 종별 Bar 차트 그리기

		    tt = [];
		    oo = [];

		    var total;
		    ip = [];
		    $.ajax({
		        url : 'amdPetChart',
		        method : 'get',
		        success : function(res) {
		            $.each(res, function(i) {
		                tt.push(res[i].tt);
		                oo.push(res[i].oo);
		                console.log(res[i].oo);
		                ip += ` \${res[i].oo} 마릿 수 : \${res[i].tt}`;
		                
		            });
		            console.log(ip);
		            $("#ip").html(ip);
		            console.log(res[0].ch);
		            $("#a").html("총 마리수 : " + res[0].ch);


		            const txc = document.getElementById('admPetChart').getContext('2d');
		            const admPetChart = new Chart(txc, {
		                type : 'bar',
		                data : {
		                    labels : oo,
		                    datasets : [ {
		                        label : '# of Votes',
		                        data : tt,
		                        backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
		                                'rgba(255, 159, 64, 0.2)',
		                                'rgba(255, 159, 64, 0.2)' ],
		                        borderColor : [ 'rgba(255, 99, 132, 1)',
		                                'rgba(255, 159, 64, 1)',
		                                'rgba(255, 159, 64, 1)' ],
		                        borderWidth : 1
		                    } ]
		                },
		                options : {
		                    scales : {
		                        y : {
		                            beginAtZero : true
		                        }
		                    }
		                }
		            });
		        }
		    })

		} 

		});


		//div admPartChartA 클릭시 차트 그려짐
		$(document).on("click",".admPartChartA" ,function(){
		   $(".admPartChart").append("<canvas id='admPartChart'></canvas>");
		   $("#admPartChart").remove();

		   partChart();

		   function partChart() { //일반 회원 기간 별 차트 그리기
		        
		       tt = [];
		       oo = [];
		       aa = [];
		       bb = [];
		       $.ajax({
		           url : 'admMemChart',
		           method : 'get',
		           success : function(res) {
		               console.log(res);
		               console.log(res.memChart[0].tt);
		               console.log(res.memChart[0].oo); 
		               console.log(res.pmemChart[0].aa);
		               console.log(res.pmemChart[0].bb);
		              /*  var pmem = res.pmemChart;
		               var mem = res.memChart;
		                $.each(pmem,function(i){
		                   aa.push(res.pmemChart[i].aa);
		                   bb.push(res.pmemChart[i].bb);
		               });
		                $.each(mem,function(i){
		                       tt.push(mem[i].tt);
		                       oo.push(mem[i].oo);
		               }); 
		                
		                console.log(tt);
		                console.log(oo); */

		                const ccc = document.getElementById('admPartChart')
		                       .getContext('2d');
		               const admPartChart = new Chart(ccc, {
		                   type : 'line',
		                   data : {
		                       labels : tt,aa,
		                       datasets : [ {
		                           label : '일반 회원',
		                           data : oo,
		                           backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
		                                   'rgba(255, 159, 64, 0.2)', ],
		                           borderColor : [ 'rgba(255, 99, 132, 1)',
		                                   'rgba(255, 159, 64, 1)' ],
		                           borderWidth : 1
		                       } ,
		                        {
		                           label : '파트너 회원',
		                           data : bb,
		                           backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
		                                   'rgba(255, 159, 64, 0.2)', ],
		                           borderColor : [ 'rgba(255, 99, 132, 1)',
		                                   'rgba(255, 159, 64, 1)' ],
		                           borderWidth : 1
		                       } ]
		                   },
		                   options : {
		                       scales : {
		                           y : {
		                               beginAtZero : true
		                           }
		                       }
		                   }
		               }); 
		           } //success

		       }) // ajax

		   } //
		   
		});
	</script>

</body>

</html>