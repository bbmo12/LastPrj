<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib tagdir="/WEB-INF/tags/" prefix="my"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
.card-text {
	display: inline-block;
	width: 200px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}
</style>

<body>
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
								<li><a href="protocol" class="d-flex justify-content-between">
										<p>반려동물 진료기록</p>
								</a></li>
								<li><a href="reservationSelect" class="d-flex justify-content-between">
										<p>예약 내역</p>
								</a></li>
								<li><a href="myPay" class="d-flex justify-content-between">
										<p>결제 내역</p>
								</a></li>
								<li><a href="mycounsel" class="d-flex justify-content-between">
										<p>상담 내역</p>
								</a></li>
								<li><a href="myreport" class="d-flex justify-content-between">
										<p>신고 내역</p>
								</a></li>
								<li><a href="myfallow" class="d-flex justify-content-between">
										<p>팔로우</p>
								</a></li>
								<li><a href="logout" class="d-flex justify-content-between">
										<p>로그아웃</p>
								</a></li>
								<li><a href="mdeleteForm" class="d-flex justify-content-between">
										<p>회원탈퇴</p>
								</a></li>
							</ul>

						</aside>
					</div>
				</div>
				<div class="col-lg-9 posts-list">
					<div class="col-lg-12 col-md-12 blog_details">
						<form action="mycounsel" id="goform" name="goform">
							<input type="hidden" id="pageNum" name="pageNum" value="1">
							<table class="table">
								<thead>
									<tr>
										<th>반려동물</th>
										<th>증상</th>
										<th>파트너회원이름</th>
										<th>상태</th>
										<th>작성일</th>
										<th>상담신청일</th>
										<th>상담내용보기</th>
										<th>후기</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${ fn:length(mycounsel) == 0  }">
										<tr>
											<td colspan="6" align="center">조회된 결과가 없습니다.</td>
										</tr>
									</c:if>
									<c:forEach items="${mycounsel }" var="mycounsel">
										<tr>
										<td><input type="hidden" id="c_no" name="c_no" value="${mycounsel.c_no}">${mycounsel.c_no } </td>
											<td>${mycounsel.p_name }</td>
											<td class="card-text">${mycounsel.content}</td>
											<td>${mycounsel.pm_name }</td>
											<td>${mycounsel.co_content }</td>
											<td>${mycounsel.w_date }</td>
											<td><button type="button" onclick="location.href='csDetail?p_id=${mycounsel.p_id }&m_id=${mycounsel.m_id }&pet_no=${mycounsel.pet_no }&c_no=${mycounsel.c_no}'">상담내용보기</button> </td>
											<c:choose>
												<c:when test="${mycounsel.code eq 303 }">
													<c:choose>
														<c:when test="${ mycounsel.r_check eq 0}">
															<td><button  type="button"
																	class="btn btn-secondary" data-toggle="modal" onclick='reviewadd("${mycounsel.c_no}");'
																	data-target="#reviewWriteModal">리뷰쓰기</button></td>
														</c:when>
														<c:otherwise>
															<td><button  type="button"
																	class="btn btn-secondary" data-toggle="modal" onclick='reviewread("${mycounsel.c_no}");'
																	data-target="#exampleModal1">리뷰보기</button></td>
														</c:otherwise>
													</c:choose>
												</c:when>
												<c:otherwise>
													<td><button>실패</button></td>
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
	<div class="modal fade" id="exampleModal1" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
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
					<div id="content"></div>
					<div class="star-rating">
						
							
						
					</div>
				</div>
				<!-- modal 하단 버튼 -->
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">취소</button>
					<button id="sendReserv" name="sendReserv" type="button"
						class="btn btn-primary" data-dismiss="modal">확인</button>
				</div>
			</div>
		</div>
	</div>

  
  
  


<!-- 리뷰작성 모달창 -->
	<!-- Modal -->
	<div class="modal fade" id="reviewWriteModal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title" id="exampleModalLabel">후기작성</h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form action="counselReviewInsert" method="post"
					enctype="multipart/form-data">
					<!-- modal 몸통 -->
					<div class="modal-body">

						<div align="center">
							<h3 align="center">후기를 남겨주세요!</h3>
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
								placeholder="후기내용" rows="4" cols="80"></textarea>
						</div>

					</div>
					<!-- modal 하단 버튼 -->
					<div class="modal-footer">
						<input type="hidden" id="insert_c_no" name="c_no" value="">
						<button type="submit">작성</button>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">취소</button>

					</div>
				</form>
			</div>
		</div>
	</div>






<!--리뷰 보는 모달창  -->
	<script type="text/javascript">
/* 	
	$(function() {
		$('#example').barrating('set', 2);
	   
	   }); */
	   
	   function reviewread(e){
		   var c_no = e;
			  $("#content").empty();
			  $(".star-rating").empty();
			  
			  $.ajax({
					url: 'cnoreview',
					method: 'post',
					data : {'c_no' : c_no},
					success : function(result){
						
						console.log(result.content)
						var content = result.content;
						var rating = result.rating;
					
				
						console.log(rating);
					
						$('.star-rating').raty({ readOnly: true, score:rating,  path: "resources/star",width: 200});
						
						
						$('#content').append(content);
					
						
					}
		 		})
	   }
	   
	  
  </script>




<!-- 후기작성 모달창 -->
	<script type="text/javascript">
	function reviewadd(e){
	console.log(e);
		var c_no = e;
		$("#content").empty();
		  $("#rating").empty();
   	 $("#insert_c_no").val(c_no);
	}
	
   </script>
   
   
   <!-- 별점조회 -->
<!--    <script type="text/javascript">
  //별점
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
  -->






	<script type="text/javascript">
		function go_page(p) {
			goform.pageNum.value = p;
			goform.submit();
		}
	</script>

</body>
</html>