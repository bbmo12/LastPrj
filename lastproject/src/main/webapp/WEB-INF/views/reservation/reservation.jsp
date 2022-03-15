<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags/" prefix="my"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />

<script type="text/javascript"
	src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
      integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<style>
#my_section {
	padding: 50px;
}

.star-rating {
	display: flex;
	flex-direction: row-reverse;
	font-size: 1.5em;
	justify-content: space-around;
	padding: 0 .2em;
	text-align: center;
	width: 5em;
}

.star-rating input {
	display: none;
}

.star-rating label {
	color: #ccc;
	cursor: pointer;
}

.star-rating :checked ~ label {
	color: #f90;
}

.star-rating label:hover, .star-rating label:hover ~ label {
	color: #fc0;
}
</style>
<body>
	<%-- ${sessionScope.mId } --%>

	<section class="banner-area other-page">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<h1>MyPage</h1>
					<a href="index.html">Home</a> <span>|</span> <a
						href="blog-details.html">MyPage</a>
				</div>
			</div>
		</div>
	</section>

	<br>
	<br>
	<br>
	<br>
	<div align="center">
		<h1>일반회원 예약내역조회</h1>
	</div>

	<section id="my_section">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="blog_right_sidebar">
						<aside class="single_sidebar_widget author_widget">
							<img class="author_img rounded-circle"
								src="resources/upload/${member.picture}" style="width: 210px"
								alt="">
							<div class="br"></div>
							<h4>${member.name }</h4>
							<div class="br"></div>
						</aside>

						<aside class="single_sidebar_widget post_category_widget">
							<h4 class="widget_title">My menu</h4>
							<ul class="list cat-list">
								<li><a href="memberMypage"
									class="d-flex justify-content-between">
										<p>내 프로필</p>
								</a></li>
								<li><a href="petmemberForm"
									class="d-flex justify-content-between">
										<p>반려동물 프로필</p>
								</a></li>
								<li><a href="#" class="d-flex justify-content-between">
										<p>예약 내역</p>
								</a></li>
								<li><a href="#" class="d-flex justify-content-between">
										<p>결제 내역</p>
								</a></li>
								<li><a href="#" class="d-flex justify-content-between">
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
					<div class="col-lg-12 col-md-12 blog_details">
						<form action="reservationSelect" id="goform" name="goform">
							<input type="hidden" id="pageNum" name="pageNum" value="1">
							<table class="table">
								<thead>
									<tr>
										<th>예약번호</th>
										<th>수의사 이름</th>
										<th>예약신청일자</th>
										<th>예약시간</th>
										<th>예약내용</th>
										<th>품종</th>
										<th>예약여부</th>
										<th>취소사유</th>
										<th>후기</th>
									</tr>
								</thead>
								<tbody>
										<c:if test="${fn:length(reservation) == 0 }">
											<tr>
												<td colspan="9" align="center">조회된 결과가 없습니다.</td>
											</tr>
										</c:if>
									<c:forEach items="${reservation }" var="res" varStatus="status">
										<tr>
											<td><input class="rno" type="hidden" id="r_no"
												name="r_no" value="${res.r_no }">${res.r_no }</td>
											<td>${res.name }</td>
											<td>${res.r_date}</td>
											<td>${res.time }</td>
											<td>${res.rcontent }</td>
											<td>${res.pcontent }</td>
											<td><input class="in_code" type="hidden"
												value="${res.rccontent }"> ${res.rccontent }</td>
											<td>${res.refuse}</td>
											<c:choose>
												<c:when test="${res.code eq 405 }">
													<c:choose>
														<c:when test="${res.r_check eq 0 }">
															<td><button type="button"
																	onclick="reviewWrite(event)">리뷰작성</button></td>
														</c:when>

														<c:otherwise>
															<td><button type="button" 
																onclick="reviewRead('${res.r_no}')" data-toggle="modal">리뷰보기
															</button></td>
														</c:otherwise>
													</c:choose>
												</c:when>
												<c:otherwise>
													<td>
														<button>실패</button>
													</td>
												</c:otherwise>
											</c:choose>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</form>
					</div>
				</div>
			</div>
		</div>
		<my:nav jsFunc="go_page" page="${page}" />
	</section>

	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title" id="exampleModalLabel">리뷰보기</h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<!-- modal 몸통 -->
				<div class="modal-body">

					<span id="dvalue"> <input type="hidden" id="date_value"></span>
					<br> <span id="tvalue"> <input type="hidden"
						id="time_value"></span> <br> <input type="text" id="rating"
						name="rating" value="res.rating" readonly="readonly"
						style="font-size: 15px; border: none;"><br> <input
						name="content" id="content"> <select class="animalNo">
						<option value="" disabled selected>펫 번호(이름)</option>
						<c:forEach items="${petList}" var="pet">
							<option value="${pet.pet_no }">${pet.pet_no }(${pet.name })</option>
						</c:forEach>
					</select>

				</div>
				<!-- modal 하단 버튼 -->
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">취소</button>
					<button id="sendReserv" name="sendReserv" type="button"
						class="btn btn-primary" data-dismiss="modal">예약하기</button>
				</div>
			</div>
		</div>
	</div>






	<!-- <div class="modal">
		모달 띄운후 내용입력부분 바디. 
		<div class="modal_body">
			<div class="form-group">
				<h5 id="pname"></h5>
			</div>
			<div>
				<h1>여기가 별점?</h1>
				<div class="star-rating">
					<input type="radio" id="5-stars" name="rating" value="5" /> <label
						for="5-stars" class="star">&#9733;</label> <input type="radio"
						id="4-stars" name="rating" value="4" /> <label for="4-stars"
						class="star">&#9733;</label> <input type="radio" id="3-stars"
						name="rating" value="3" /> <label for="3-stars" class="star">&#9733;</label>
					<input type="radio" id="2-stars" name="rating" value="2" /> <label
						for="2-stars" class="star">&#9733;</label> <input type="radio"
						id="1-stars" name="rating" value="1" /> <label for="1-stars"
						class="star">&#9733;</label>
				</div>
			</div>
			<div class="form-group">
				<label for="exampleInputPassword4">후기내용</label>
				<textarea class="form-control" id="content" name="content"
					placeholder="후기내용" rows="4" cols="80">
                        </textarea>
			</div>
			<div class="form-group">
								<label>프로필 사진</label>
								<div class="input-group col-xs-12">
								<input  class="file-upload-browse btn btn-primary" type="file" id="file" name ="file">
								</div>
							</div>
			<input type="hidden" id="rev_no" name="rev_no" value="">
			<button type="button" onclick="serviceReview()">작성</button>
			<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>


		</div>
	</div> -->





	<!-- 리뷰 작성 모달창 -->
	<script type="text/javascript">
	var wow;
   function reviewWrite(event){
	   wow = $(event.target).parent().parent().children().first().text()
	$("#rev_no").val(wow)
	   console.log($(event.target).parent().parent().children().first().text());
	      var body = document.querySelector('body');
	      var modal = document.querySelector('.modal');	      
	      
	          modal.classList.toggle('show');
	          if (modal.classList.contains('show')) {
	            body.style.overflow = 'hidden';
	            reviewadd(wow);
	          } 
	      
	       modal.addEventListener('click', (event) => {
	        if (event.target === modal) {
	          modal.classList.toggle('show');
	          
	          if (!modal.classList.contains('show')) {
	            body.style.overflow = 'auto';
	            
	          }
	        }
	      });
	}
   </script>


	<!--리뷰 보는 모달창  -->
	<script type="text/javascript">
   	function reviewRead(re){
   		var r_no = re;
   		console.log(r_no)
   		 $.ajax({
   			url: 'reviewSearch',
   			method : 'post',
   			data: {"r_no" : r_no},
   			success : function(res) {
   				console.log(res[0].rating)
   				$("#modal-body").append("<tr><td>" + res[0].rating + "</td></tr>");
				
			}
   		});
   		
   		$("#myModal").modal('show');
   		
   	}; 
   	<!--리뷰 보는 모달창  -->
   
   
   
   </script>



	<!-- 후기작성 모달창 -->
 	<script type="text/javascript">
   	function reviewadd(wow){
   		var r_no = wow
   		/* var name = $("#name").val() */
   		$.ajax({
   			url: "reviewWrithForm",
   			type: "post",
   			data: {"r_no":r_no},
   			success : function(result){
   				
   				console.log(result);
   				/* $(".modal_body").empty(); */
   				if(result == ""){
   	                $(".modal_body").append(`<p>오류</p>`)
   	             } else
   	                {
   	            	 $("#pname").text("파트너이름:"+result.name)
   	                /* $(".modal_body").append(`<p> 파트너회원이름은 :`  + result.name +`<p>`) */
   	                }
   	             console.log(result)
   	          },
   	          error : function(){
   	          
   	          }
   	       }) 
   	    } 
   
   </script> 


	<script>
		//table td값만
		var val = $(".in_code").parent();
		console.log(val);
		console.log(val.length);
		for (var i = 0; i < val.length; i++) {
			//예약결과코드 분류
			if (val[i].innerText == '결제가능') {
				console.log(val[i]);
				val[i].classList.add("code");
				$(".code").empty();
				var check = $(".code").append(
						`<button type ="button" class="payBtn">결제하기</button>`);

			} else if (val[i].innerText == '승인거절') {
				val[i].classList.add("refuse");
			} else if (val[i].innerText == '결제완료') {
				val[i].classList.add("complete");
				$(".complete").empty();
				var check = $(".complete").append(`<span>예약완료</span>`);
			} //else if문
		} //for문
		
		$(".payBtn").on('click', function() {
			var rno = $(this).parent().parent().children().first().text();
			console.log($(this).parent().parent().children().first().text());
			var m_id = "${m_id }";
			var pay;
			
			$.ajax({
				url : 'servicePay',
				method : 'POST',
				data : {'r_no' : rno },
				async : false,
				success : function(result){
					console.log(result);
					pay = result.price;
					//p_id = result.p_id;
					var IMP = window.IMP; // 생략가능
					IMP.init('imp48272965');
					// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
					// ''안에 띄어쓰기 없이 가맹점 식별코드를 붙여넣어주세요. 안그러면 결제창이 안뜹니다.
					IMP.request_pay({
						pg: 'kakao',
						pay_method: 'card',
						merchant_uid: 'merchant_' + new Date().getTime(),
						name: result.content + "예약",
						// 결제창에서 보여질 이름
						// name: '주문명 : ${auction.a_title}',
						// 위와같이 model에 담은 정보를 넣어 쓸수도 있습니다.
						amount: result.price,
						// amount: ${bid.b_bid},
						// 가격 
						buyer_name: m_id,
						// 구매자 이름, 구매자 정보도 model값으로 바꿀 수 있습니다.
						// 구매자 정보에 여러가지도 있으므로, 자세한 내용은 맨 위 링크를 참고해주세요.
						buyer_postcode: '123-456',
					}, function (rsp) {
						console.log(rsp);
						if (rsp.success) {
							var msg = '결제가 완료되었습니다.';
							msg += '결제 금액 : ' + rsp.paid_amount;
							location.reload();
							// success.submit();
							// 결제 성공 시 정보를 넘겨줘야한다면 body에 form을 만든 뒤 위의 코드를 사용하는 방법이 있습니다.
						} else {
							var msg = '결제에 실패하였습니다.';
							msg += '에러내용 : ' + rsp.error_msg;
						}
						alert(msg);
					});
				}
			});
			
			
			
			console.log(pay+"원");
				//결제 완료 후 결제 내역 등록
				$.ajax({
				url : 'payupdate',
				method : 'post',
				data : {
					'r_no' : rno,
					'm_id': m_id,
					'price': pay
				},
				success : function(result) {
				},
				error : function(error) {
					alert("결제실패")
				}
			}) 
		})
	</script>
	<!-- 리뷰작성 -->
	<script type="text/javascript">
	function serviceReview(){
		var content = $("#content").val();
		var rating = $("input[name=rating]").val();
		var rev_no = $("#rev_no").val();
		console.log("별점")
		console.log(rating)
		$.ajax({
			url: "serviceReviewInsert",
			type: "post",
			data : {'rating' : rating,
				'r_no': rev_no,
				'content': content},
			success : function(result){
				alert("ggod")
				location.reload();
				
			}
			
		})
		
	}
		function go_page(p){
			goform.pageNum.value=p;
	    	goform.submit();
		}
	</script>



</body>
</html>