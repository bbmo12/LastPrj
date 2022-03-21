<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags/" prefix="my"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://cdn.jsdelivr.net/gh/ethereum/web3.js@1.0.0-beta.37/dist/web3.min.js"></script>
<script src="template/js/diaLog.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<style>
	#my_section {
		padding: 50px;
	}
	.padding {
		padding: 5rem
	}
	.pl-3,
	.px-3 {
		padding-left: 1rem !important
	}
	.table th {
		font-size: 20px;
		font-weight: 500;
	}
	.table {
		width: 100%;
		max-width: 100%;
		margin-bottom: 1rem;
		background-color: transparent
	}
	
	.table-striped tbody tr:nth-of-type(odd) {
  		background-color: #f9f9fd;
 	}
	.table td {
		font-size: 16px;
		padding: .875rem 0.9375rem
	}
	.badge {
		font-size: 12px;
		line-height: 1;
		padding: .375rem .5625rem;
		font-weight: normal;
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
	.star-rating :checked~label {
		color: #f90;
	}
	.star-rating label:hover,
	.star-rating label:hover~label {
		color: #fc0;
	}
	.badge-info {
		background-color: cornflowerblue;
		border: none;
	}
	
	 .badge-pay{
		background-color: #38a4ff;
		color: #fff;
    }
    #sidebar {
		width: 500px;
		float: none;
		margin-left: 12em;
		background-color: #fff;
		border: none;

	}
    .codep {
		color: #0062ff; 
    	background: #FFF;
    	border: 1px solid transparent;
    	font-size: 16px;	
	}
	.codep:hover {
		color: #0062ff;
    	border: 1px solid #0062ff;
    	background: #fff;	
	}
	
</style>

<body>
	<section class="banner-area other-page">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<h1>MyPage</h1>
					<a href="home">Home</a> <span>|</span> <a href="memberMypage">MyPage</a>
				</div>
			</div>
		</div>
	</section>
	<section id="my_section">
		<div class="container" style="max-width: 1350px;">
			<div class="row">
				<div class="col-lg-3">
					<div class="blog_right_sidebar"
						style="margin-left: 40px; width: 300px;">
						<aside class="single_sidebar_widget author_widget">
							<img class="author_img rounded-circle"
								src="resources/upload/${member.picture}" onerror ="this.src='resources/upload/cat.jpg'" style="width: 210px"
								alt="">
							<div class="br"></div>
							<h4>${member.name }</h4>
							<div class="br"></div>
						</aside>
						<aside class="single_sidebar_widget post_category_widget">
							<h4 class="widget_title">My menu</h4>
							<ul class="list cat-list">
								<li><a href="memberMypage" class="d-flex justify-content-between">
										<p>내 프로필</p>
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
				<div class="col-lg-9 posts-list" style="position: relative; top: 20px;">
					<div class="col-lg-12 col-md-12 blog_details">
						<div align="center">
						<br><h1>${member.name }님의 예약 내역</h1><br>
						</div>
						<div class="row">
							<div class="col-md-12" style="margin: 20px 0 0 -45px;">
								<div class="table-wrap">
									<button type="button" class="codep" style="margin: 0 50px 0 15em;" data-code="">전체</button>
									<button type="button" class="codep" style="margin-right: 50px;" data-code="100">진료</button>
									<button type="button" class="codep" style="margin-right: 50px;" data-code="101">훈련</button>
									<button type="button" class="codep" style="margin-right: 50px;" data-code="102">미용</button>
									<button type="button" class="codep" style="margin-right: 50px;" data-code="103">돌봄서비스</button>
									<table class="table table-striped" style="margin-top: 25px;margin-left: 40px; width: 100%">
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
										<tbody id="myTable">
										</tbody>
									</table>
									<div class="blog_right_sidebar" id="sidebar">
										<form id="admDateForm" onsubmit="return false"	onkeypress="eventkey();" onclick="pagingList();">
											<input type="hidden" name="code">
											<input	type="hidden" name="pageNum" value="1">
											<aside class="single_sidebar_widget search_widget"	style="display: flex;">
												<select id="key" name="key">
													<option value="all" selected="selected">전 체</option>
												</select>
												<div class="input-group">
													<input type="text" class="form-control" id="data"name="data"> 
													<span class="input-group-btn">
														<button class="btn btn-default" type="submit">
															<i class="fa fa-search"></i>
														</button>
													</span>
												</div>
											</aside>
										</form>
									</div>
									<div id="pagination"></div>
									<div>
										<form id="frm" action="" method="post"></form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Modal -->
	<div class="modal fade" id="exampleModal1" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title" id="exampleModalLabel">리뷰보기</h3>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<!-- modal 몸통 -->
				<div class="modal-body 1">
					<div id="content"></div>
					<div class="star"></div>
					<div id="image"></div>
				<!-- modal 하단 버튼 -->
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
					<button id="sendReserv" name="sendReserv" type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
				</div>
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
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form action="serviceReviewInsert" method="post"
					enctype="multipart/form-data">
					<!-- modal 몸통 -->
					<div class="modal-body">

						<div align="center">
							<h3 align="center">후기를 남겨주세요!</h3>
							<div class="star-rating">
								<!-- <input type="radio" id="5-stars" name="rating" value="5" /> 
								<label for="5-stars" class="star">&#9733;</label> 
								<input type="radio" id="4-stars" name="rating" value="4" /> 
								<label for="4-stars" class="star">&#9733;</label> 
								<input type="radio" id="3-stars" name="rating" value="3" /> 
								<label for="3-stars" class="star">&#9733;</label>
								<input type="radio" id="2-stars" name="rating" value="2" /> 
								<label for="2-stars" class="star">&#9733;</label> 
								<input type="radio" id="1-stars" name="rating" value="1" /> 
								<label for="1-stars" class="star">&#9733;</label> -->
							</div>
							<input id="star2" name="rating" type="hidden">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword4">후기내용</label>
							<textarea class="form-control" id="content" name="content"
								placeholder="후기내용" rows="4" cols="80"></textarea>
						</div>

						<div class="form-group" style="margin-top: -10px;">
							<label>후기사진</label><br> 
							<input class="file-upload-browse btn btn-primary" type="file"
								id="multiFileList1" name="multiFileList1" multiple="multiple">
							<button type="button" class="btn btn-primary btn-sm" onclick="addFile1()">+</button>
							<div id="ffile1"></div>
						</div>
					</div>
					<!-- modal 하단 버튼 -->
					<div class="modal-footer">
						<input type="hidden" id="insert_r_no" name="r_no" value="">
						<button type="submit">작성</button>
						<!-- onclick="serviceReview()" -->
						<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
					</div>
				</form>
			</div>
		</div>
	</div>


	<script>
	let viewPmemberList = function (result) {

		$("#myTable").empty();
		
		$.each(result, function (i) {
			
			var choicedTag = "<tr><td>" +
			result[i].r_no +
			"</td><td>" +
			result[i].name +
			"</td><td class='card-text'>" +
			result[i].r_date +
			"</td><td>" +
			result[i].time +
			"</td><td>" +
			result[i].rcontent +
			"</td><td>"+
			result[i].pcontent +
			"</td><td id='td"+[i]+"'><input class='in_code' type='hidden' value="+result[i].rccontent+ ">"
			+result[i].rccontent +
			"</td><td>" 
			if(result[i] != 'null'){
			result[i].refuse }+
			"</td>";
			
			if(result[i].code == 405){
				if(result[i].r_check == 0){
					choicedTag += "<td><button type='button' onclick='reviewadd("+result[i].r_no+");' class='btn btn-secondary' data-toggle='modal' data-target='#reviewWriteModal'>리뷰쓰기</button></td></tr>";
				}else{
					choicedTag += "<td><button onclick='reviewread("+result[i].r_no+");' type='button' class='btn btn-secondary' data-toggle='modal' data-target='#exampleModal1'>리뷰보기</button></td></tr>";
				}
			}else{
				choicedTag += '<td><button>실패</button></td></tr>';
			}
			$("#myTable").append(choicedTag);
			
			if($("#td"+i).text()=='진료완료'){
				$("#td"+i).attr('class','badge badge-pay');
			}
			
		}) // end each.
	console.log("여기ㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣ",$(".in_code").parent());
		var val = $(".in_code").parent();
		for (var i = 0; i < val.length; i++) {
			//예약결과코드 분류
			if (val[i].innerText == '결제가능') {
				console.log(val[i]);
				val[i].classList.add("code");
				$(".code").empty();
				var check = $(".code").append(`<button class="badge badge-warning" type ="button" onclick="payBtn(event)">결제하기</button>`);
			} else if (val[i].innerText == '승인거절') {
				val[i].classList.add("refuse");
			} else if (val[i].innerText == '결제완료') {
				val[i].classList.add("complete");
				$(".complete").empty();
				var check = $(".complete").append(`<span>예약완료</span>`);
			}else if (val[i].innerText == '진료완료'){
			} //else if문
			
		} //for문
	} //=========================end viewPmemberList : 받아온 데이터로 List만드는 함수===============
	

		<!-- 리뷰 작성 모달창 -->
	$(document).ready(function () {
		$('.star-rating').raty({
			path: "resources/star"
			, width: 200
		  	, click: function(score) {
		    $('#star2').val(score);
		  }
		});
	});

	


	
	function addFile1() {
		var filediv = $('<div>').attr({
			'id' : 'filediv'
		});
		
		var input = $('<input>').attr({
			'id': 'multiFileList1',
			'class': 'file-upload-browse btn btn-primary',
			'name': 'multiFileList1',
			'type': 'file'
		}).css('margin-top', '3px');
		
		var btn = $('<button>').attr({
			'onclick' : 'deleteFile(event)',
			'type' : 'button',
			'class' : 'btn btn-primary btn-sm',
			'id':'deleteBtn',
			'style': 'margin-left:5px'
		}).text('-');
		
		filediv.append(input);
		filediv.append(btn);
		$('#ffile1').append(filediv);
	}
	
	function deleteFile(event){
		var e = event.target.parentElement;
		e.remove();
	}

	<!--리뷰 보는 모달창  -->
	
	function reviewread(e){
		var r_no = e;
		$("#content").empty();
		$(".star").empty();
		$("#image").empty();
		
		  $.ajax({
				url: 'rnoreview',
				method: 'post',
				data : {'r_no' : r_no},
				success : function(result){
					
					for(var i = 0; i < result.fileList.length; i++){
						
						var imgsrc = 'resources/upload/'+result.fileList[i].picture;
						var img = $('<img>').attr({
									'src': imgsrc,
									'alt': "등록된 사진이 없습니다."
									});
						var div = $('<div>');
						div.append(img);
						$('#image').append(div);
					}
					
					var content = result.content;
					var rating = result.rating;
					$('.star').raty({ score:rating, width:200, path: "resources/star", readOnly: true});
					$('#content').append(content);
				}
	 		})
	}
  



	<!-- 후기작성 모달창 -->
	
	function reviewadd(e) {
		$("#content").empty();
		  
		var r_no = e;
 	 $("#insert_r_no").val(r_no);
	}


		
		
		function payBtn(event) {
			var rno = $(event.target).parent().parent().children().first().text();
			var m_id = "${m_id }";
			console.log(m_id);
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
						if (rsp.success) {
							var msg = '결제가 완료되었습니다.';
							msg += '결제 금액 : ' + rsp.paid_amount;
							location.onload();
							// success.submit();
							// 결제 성공 시 정보를 넘겨줘야한다면 body에 form을 만든 뒤 위의 코드를 사용하는 방법이 있습니다.
						} else {
							var msg = '결제에 실패하였습니다.';
							msg += '에러내용 : ' + rsp.error_msg;
						}
						alert(msg);
					});
					payUpdate();
				}
			});
				//결제 완료 후 결제 내역 등록
				function payUpdate(){
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
			}
		}
	<!-- 리뷰작성 -->
	function serviceReview(){
		
		var content = $("#content").val();
		var rating = $("input[name=rating]").val();
		var rev_no = $("#rev_no").val();
		var multiFileList1 = $("multiFileList1").val();
		
		$.ajax({
			url: "serviceReviewInsert",
			enctype: 'multipart/form-data',
			type: "post",
			data : {
				'rating' : rating, 
				'r_no': rev_no,
				'content': content,
				'multiFileList1': multiFileList1
				},
			processData: false,
			contentType: false,
			cache: false,
			success : function(result){
				alert("ggod")
				location.reload();
				
			}
			
		})
		
	}
		/* function go_page(p){
			goform.pageNum.value=p;
	    	goform.submit();
		} */


		//======================enter 키===================
		function eventkey() {
			if (event.keyCode == 13) {
				pagingList();
			} else {
				return false;
			}
		} //====================end enter 키================

		// ===================viewPmemberList : 받아온 데이터로 List만드는 함수==========================
		


		// ===========================조건 별 검색 + 페이징 처리==============================
		$(".codep").on('click', function () {
			var code = $(this).data('code');
			$('#admDateForm')[0].code.value = code
			$('#admDateForm')[0].pageNum.value = 1;
			pagingList();

		});

		function pagingList() {

			$("#blockChain").empty();
			var str = $('#admDateForm').serialize();
			$.ajax({
				url: 'reservationSelect1',
				method: 'post',
				data: str,
				//contentType : 'application/json',
				success: function (result) {
					if (result.list == '') {
						$(".table").empty();
						$(".table").append(`<thead>
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
							<tbody id="myTable">
							</tbody>`)
						$("#myTable").empty();
						$("#myTable").append("<tr><td colspan='9' align='center'>데이터가 없습니다.</td></tr>");
						// $(".table").empty();

					} else {
						viewPmemberList(result.list);
						viewPage(result.page);
					}

				}
			});
		} // end paginList()

		function viewPage(page) {

			var nav = `<nav class="blog-pagination justify-content-center d-flex">
			<ul class="pagination">`
			if (page.prev) {
				nav += `<li class="page-item">
				<a href="javascript:goPage(\${page.startPage-1})" class="page-link"
					aria-label="Previous">
					<span aria-hidden="true">
						<span class="fa fa-angle-left"></span>
					</span></a>
				</li>`
			}
			for (var i = page.startPage; i <= page.endPage; i++) {
				nav += `<li class="page-item ${page.pageNum eq num ? 'active' : '' }"><a
								href="javascript:goPage(\${i})" class="page-link">\${i }</a>
								</li>`
			}

			if (page.next) {
				nav += `<li class="page-item"><a href="javascript:goPage(\${page.endPage+1})"
					class="page-link" aria-label="Next">
				<span aria-hidden="true">
					<span class="fa fa-angle-right"></span>
				</span></a>
		</li>`

			}

			nav += `</ul></nav>`
			$('#pagination').html(nav);

		} // end viewPage(page)

		function goPage(pa) {
			$('#admDateForm')[0].pageNum.value = pa;
			pagingList();
		}
		pagingList();
		// ===========================end 조건 별 검색 + 페이징 처리==============================


		// ==============================블록체인 ===============================================
		$("#block_chain").on('click', function (event) {
			$(".table").empty();
			$("#blockChain").empty();
			$("#blockChain").append(`예약번호 입력 :  <select class="reservNo" onchange="reservNo(event)" size="1">
													<option value="" disabled selected>예약번호</option>
													 	<c:forEach items="${reservation }" var="res">
													 		<option value="${res.r_no}">${res.r_no}</option>
													 	</c:forEach>`);
			/* <input type ="text" id ="r_no">  <button type='button' onclick="myFunction()">조회</button>`); */
		});

		function myFunction() {
			var r_no = $("#r_no").val();
			diaLog.methods.diaLogSearch(r_no)
				.call()
				.then(function (result) {
				})
		}

		function reservNo(event) {
			var r_no = $(".reservNo option:selected").val();
			diaLog.methods.diaLogSearch(r_no)
				.call()
				.then(function (result) {

					if (result.d_name == '') {
						$(".table").empty();
						$(".table").append(`
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
									<tbody id="myTable">
										<tr>
											<td colspan ="5" align="center">해당 블록체인이 없습니다</td>
										</tr>
									</tbody>`);
					} else {
						$(".table").empty();
						$(".table").append(`
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
									<tbody id="myTable">
										<tr>
											<td>` + result.d_name + `</td>
											<td>` + result.result + `</td>
											<td>` + result.symptom + `</td>
											<td>` + result.w_date + `</td>
											<td>` + result.m_id + `</td>
										</tr>
									</tbody>`);
					}
				})
		}
		
	</script>
</body>
</html>