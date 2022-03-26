<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib tagdir="/WEB-INF/tags"  prefix="my"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/gh/ethereum/web3.js@1.0.0-beta.37/dist/web3.min.js"></script> 
<script src="template/js/diaLog.js"></script>

</head>
<style>
	#my_section {
		margin-top: -70px;
    	padding-bottom: 25px;
	}

	.padding {
		padding: 5rem
	}

	.table th {
		text-align: center;
		font-size: 1.0rem;
		/* font-family: 'NanumBarunGothic'; */
		font-style: normal;
		font-weight: 500 !important;
		color: black;	
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

	.badge-info {
		background-color: cornflowerblue;
		border: none;
	}
	
    .badge-pay{
		background-color: #38a4ff;
		color: #fff;
    }
    .no_deco {
		text-decoration: none !important;
		font-size: 0.8rem !important;
		color: black;
	}

	.blog_right_sidebar {
		box-shadow: 0 .15rem 1.75rem 0 rgba(58, 59, 69, .1) !important;
		border: 1px solid #e3e6f0;
		border-radius: 0.35rem;
		float: none !important;
		margin: 0 auto !important;
		background-color: white;
		width: 250px;
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

	#Mainname {
		font-size: 1.5rem !important;
		/* font-family: 'NanumBarunGothic' !important; */
		font-style: normal !important;
		font-weight: 700 !important;
		color: gray;
	}

	#myinfo {
		font-size: 0.8rem;
		/* font-family: 'NanumBarunGothic'; */
		font-style: normal;
		font-weight: 300;
	}

	#menu_bold {
		font-size: 1.0rem;
		/* font-family: 'NanumBarunGothic'; */
		font-style: normal;
		font-weight: 700;
		color: black;
	}

	.card-body {
		font-size: 1.0rem;
		/* font-family: 'NanumBarunGothic'; */
		font-style: normal;
		font-weight: 300;
		color: black;

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
</style>
<body>
    <section class="department-area" style="padding: 30px 0 30px;">
		<div class="container">
			<div class="col-lg-6 offset-lg-3">
				<div class="section-top text-center">
					<br><br><br>
					<h2></h2>
				</div>
			</div>
		</div>
	</section>
	<section id="my_section">
		<div class="container" style="max-width: 1450px;">
			<div class="row">
				<div class="col-lg-3">
					<h2 align="center">MyPage</h2>
					<br>
					<div class="blog_right_sidebar">
						<aside class="single_sidebar_widget author_widget">
							<img class="partner_img" src="/upload/${pmember.pfile}"
								onerror="this.src='resources/upload/pet.PNG'" style="width: 210px; height: 167px;">
							<br><br>
							<h4 id="Mainname">${pmember.name }님</h4>
							<div class="br"></div>
							<div id="myinfo">
								<i class="fa-solid fa-pen"></i>&nbsp;<a class="no_deco" href="confirmPass">내 정보 수정하기</a>
							</div>
						</aside>
					</div><br>
					<div class="blog_right_sidebar">
						<aside class="single_sidebar_widget post_category_widget">
							<h4 class="widget_title">My menu</h4>
							<ul class="list cat-list nanumbarungothic">
								<p id="menu_bold">내 활동 내역</p>
								<li><a href="reservationSetting" class="d-flex justify-content-between">
										<p>예약일정 설정</p>
									</a></li>
								<li><a href="preservationSelect" class="d-flex justify-content-between">
										<p>예약 내역</p>
									</a></li>
								<li><a href="pMemDiaList" class="d-flex justify-content-between">
										<p>진료 내역</p>
									</a></li>
								<li><a href="pMembenefit" class="d-flex justify-content-between">
										<p>결제 내역</p>
									</a></li>
								<li><a href="pmemcounsel" class="d-flex justify-content-between">
										<p>상담 내역</p>
									</a></li>
								<li><a href="pmemreport" class="d-flex justify-content-between">
										<p>신고 내역</p>
									</a></li>
								<br><br>
								<p id="menu_bold">회원 정보 관리</p>
								<li><a href="confirmPass" class="d-flex justify-content-between no_deco">
										<p>회원 정보 수정</p>
									</a></li>
								<li><a href="logout" class="d-flex justify-content-between">
										<p>로그아웃</p>
									</a></li>
								<li><a href="pmdeleteForm" class="d-flex justify-content-between">
										<p>회원탈퇴</p>
									</a></li>
							</ul>
						</aside>
					</div>
				</div>
				<div class="col-lg-9 posts-list">
					<div class="single-post row">
						<div class="col-lg-12 col-md-12 blog_details">
							<br><br>
							<div class="card">
								<div class="card-header">
									<div align="left">
										<i class="fa-solid fa-flag"></i>&nbsp;&nbsp;&nbsp;${pmember.name }님의 예약내역
									</div>
								</div>
								<div class="card-body">
									<div class="row">
										<div class="table-wrap" style="width: 1000px;">
											<form action="preservationSelect" name="goform" id="goform">
												<input type="hidden" name="pageNum" value="1">
												<table class="table table-striped">
													<thead>
														<tr style="text-align: center;">
															<th>예약번호</th>
															<th>예약신청일자</th>
															<th>예약시간</th>
															<th>예약자 이름</th>
															<th>품종</th>
															<th>예약내용</th>
															<th>승인여부</th>
														</tr>
													</thead>
													<tbody align="center">
												<c:if test="${ fn:length(preservation) == 0  }">
                                                    <tr>
                                                        <td colspan="8" align="center">조회된 결과가 없습니다.</td>
                                                    </tr>
                                                </c:if>
												<c:forEach items="${preservation }" var="pres">
													<tr>
														<td><input class="rno" type="hidden" value="${pres.r_no }">${pres.r_no }</td>
														<td>${pres.rd_date }</td>
														
														<td><input type="hidden" value="${pres.startdate }"><input type="hidden" value="${pres.time }">${pres.startdate }&nbsp; ${pres.time }</td>
														<td>${pres.m_id }</td>
														<td><input type="hidden" value="${pres.refuse }"> ${pres.pcontent }
														<td><input type="hidden" value="${pres.rcontent }"><button type='button' class ='btn btn-secondary' data-toggle='modal' data-target='#rcontentModal'  onclick='contentBtn(event)'>내용보기</button></td>
														<td><input class="in_code" type="hidden" value="${pres.rccontent }">${pres.rccontent }</td>
													</tr>
												</c:forEach>
											</tbody>
												</table>
											</form>
											<my:nav jsFunc="go_page" page="${page}" />
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title" id="exampleModalLabel">진료작성</h3>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<!-- modal 몸통 -->
				<div class="modal-body" style="color: black;">
					<div class="form-group">
						<input type="hidden" id="m_id" name="m_id">
						<input type="hidden" id="p_id" name="p_id" value="${p_id }">
						<input type="hidden" id="r_no" name="r_no">
						<span id="span_d_name" style="width: 250px !important;">&nbsp;진단명 :
							<input type="text" id="d_name" name="d_name" style="border: 1px solid;"></span><br><br>
						<span id="span_symptom" style="width: 250px !important;"> &nbsp; &nbsp; 증 상 :
							<input type="text" id="symptom" name="symptom" style="border: 1px solid;"></span><br><br>
						<span id="span_result" style="width: 250px !important;"> &nbsp; &nbsp; 처 방 :
							<input type="text" id="d_result" name="d_result" style="border: 1px solid;"></span>
					</div>
				</div>
				<!-- modal 하단 버튼 -->
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
					<button id="sendDiaLog" name="sendReserv" type="button" class="btn btn-primary"
						data-dismiss="modal">작성완료</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 거절사유Modal -->
	<div class="modal fade" id="refuseModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title" id="exampleModalLabel">거절사유</h3>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<!-- modal 몸통 -->
				<div class="modal-body 2">
					<div class="refuse_div">
						<span  style ="color: black !important;"id="refuse_why"></span>
					</div>
						<button style = "float: right"type="button" class="btn btn-secondary" data-dismiss="modal">확인</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 예약내용Modal -->
	<div class="modal fade" id="rcontentModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title" id="exampleModalLabel">예약내용</h3>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<!-- modal 몸통 -->
				<div class="modal-body 3">
					<div class="rcontent_div">
						<span style ="color: black !important;" id="rcontent_why"></span>
					</div>
						<button style = "float: right"type="button" class="btn btn-secondary" data-dismiss="modal">확인</button>
				</div>
			</div>
		</div>
	</div>
	
	<script>
		const today = moment();
		console.log("Today's date is" + today.format('YYYY-MM-DD'));
		var val = $(".in_code").parent();
		for (var i = 0; i < val.length; i++) {
			if (val[i].innerText == '승인대기') {
				val[i].classList.add("code");
				$(".code").empty();
				var check = $(".code").append(`<button type="button"  class="badge badge-success" onclick="ok(event)">승인</button> 
						       				   <button type="button" class="badge badge-danger" onclick="no(event)">거절</button>`);
			} else if (val[i].innerText == '결제완료') {
				val[i].classList.add("diaLog");
				$(".diaLog").empty();
				
				var reservDate = $(val[i]).parent().children().first().next().next().next().text();
				var reservsplit = $(val[i]).parent().children().first().next().next().text().split('-');
				var reservVal1 = reservsplit[0];
				var reservVal2 = reservsplit[1];
				var reservVal3 = reservsplit[2];
				reservVal3 = reservVal3.slice(4,6);
				var totalVal = reservVal1+reservVal2+reservVal3;
				console.log("받은값",totalVal,"    현재시간",today.format('YYMMDDHH'));
				
				if(parseInt(totalVal) <= parseInt(today.format('YYMMDDHH')) ){
					var check = $(".diaLog").append(`<button id="diaLogModal" type="button" class="btn btn-secondary diaLogModal"
													data-toggle="modal" data-target="#exampleModal">진료기록작성</button>`);
				}else{
					$(".diaLog").append(`<label class="badge badge-success">예약완료</label>`);
				}
			} else if (val[i].innerText == '승인거절'){
				val[i].classList.add("fail");
				$(".fail").empty();
				var check = $(".fail").append(`<button type="button" class="refuse badge badge-danger" data-toggle='modal' data-target='#refuseModal' onclick='refuse(event)'>승인거절</button>`);
			} else if (val[i].innerText == '진료완료'){
				val[i].classList.add("succes");
				$(".succes").empty();
				var check = $(".succes").append(`<label class="badge badge-pay">진료완료</label>`);
			} else if (val[i].innerText == '결제가능'){
				val[i].classList.add("warn");
				$(".warn").empty();
				var check = $(".warn").append(`<label class="badge badge-warning">결제대기</label>`);
			}
			
		}

		function ok(event) {
			var rno = $(event.target).parent().parent().children().first().text();
			var m_id = $(event.target).parent().prev().prev().prev().text();
			console.log(m_id);
			var flag = confirm("해당 예약신청을 승인하시겠습니까?");
			if (flag == true) {
				$.ajax({
					url: 'okupdate',
					method: 'post',
					data: {
						"rno": rno
					},
					success: function (result) {
						alert("해당 승인신청이 성공적으로 완료되었습니다.");
						okWebAlert(m_id);
					},
					error: function (error) {
						alert("승인확인도중 오류가 발생하였습니다.");
					}
				});
			} else {
				alert("예약신청 승인을 취소하셨습니다.");
			}
		}

		function no(event) {
			var date = $(event.target).parent().parent().children().first().next().next().children().first().val();
			var time = $(event.target).parent().parent().children().first().next().next().children().first().next().val();
			console.log(time);
			var rno = $(event.target).parent().parent().children().first().text();
			var m_id = $(event.target).parent().prev().prev().prev().text();
			var flag = confirm("해당 예약신청을 거절하시겠습니까?");

			var refuse = prompt("거절사유를 작성해주세요." + "");
			if (flag == true) {
				$.ajax({
					url: 'noupdate',
					method: 'post',
					data: {
						'r_no': rno,
						'refuse': refuse,
						'reserv_date' : date,
						'reserv_time' : time
					},
					success: function (result) {
						noWebAlert(m_id);
						location.reload();
					},
					error: function (error) {
						alert("거절사유 작성중 오류발생");
					}
				})
				alert("해당 예약신청을 거절하셨습니다.");
			}
		}

		$(".diaLogModal").on('click', function () {
			var r_no = $(this).parent().parent().children().first().text();
			console.log(r_no);
			$("#r_no").val(r_no);
			var m_id = $(this).parent().prev().prev().prev().text();
			$("#m_id").val(m_id);
		});

		//모달창(진료) 값 보내기 여기 블록체인값 추가로 넣자
		$("#sendDiaLog").on('click', function () {
			//날짜,회원아이디,파트너회원아이디는 블록체인에 담을것들
			var w_date = today.format('YYYY-MM-DD');
			var m_id = $("#m_id").val();
			var p_id = $("#p_id").val();
			var d_name = $("#d_name").val();
			var symptom = $("#symptom").val();
			var result = $("#d_result").val();
			var dia_r_no = $("#r_no").val();
				 $.ajax({
					url : 'diaInsert',
					method : 'post',
					data : {'r_no' : dia_r_no ,
							'p_id' : p_id,
							'd_name' : d_name,
							'symptom' : symptom,
							'result' : result },
					success : function(res){
						alert("작성완료");
						diaWebAlert(m_id);   		//예약번호,진단명,진단결과,증상,작성일자,회원아이디,파트너회원아이디
						console.log(account);
				         diaLog.methods.diagnosis(dia_r_no,d_name,result,symptom,w_date,m_id,p_id)
				         .send({from: account, gas:3000000})
				         .then(function(result){console.log(location.reload());})
					}
				}); 
		});

		function okWebAlert(m_id) {

			var content = "예약신청이 승인되었습니다.";
			// 전송한 정보를 db에 저장	
			$.ajax({
				type: 'post',
				url: 'noticeInsert',
				dataType: 'text',
				data: {
					"n_to": m_id,
					"content": content
				},
				success: function () { // db전송 성공시 실시간 알림 전송
					// 소켓에 전달되는 메시지
					// 위에 기술한 EchoHandler에서 ,(comma)를 이용하여 분리시킨다.
					socket.send(m_id + "," + content);
					alert("전송되었습니다.");
					location.reload();
				},
				error: function (error) {
					console.log(error);
					alert("실패");
				}
			});
		}


		function noWebAlert(m_id) {

			var content = "예약신청이 거절되었습니다.";
			// 전송한 정보를 db에 저장	
			$.ajax({
				type: 'post',
				url: 'noticeInsert',
				dataType: 'text',
				data: {
					"n_to": m_id,
					"content": content
				},
				success: function () { // db전송 성공시 실시간 알림 전송
					// 소켓에 전달되는 메시지
					// 위에 기술한 EchoHandler에서 ,(comma)를 이용하여 분리시킨다.
					socket.send(m_id + "," + content);
					alert("전송되었습니다.");
					//location.reload();
				},
				error: function (error) {
					console.log(error);
					alert("실패");
				}
			});
		}

		function diaWebAlert(m_id) {

			var content = "진료결과 알림";
			// 전송한 정보를 db에 저장	
			$.ajax({
				type: 'post',
				url: 'noticeInsert',
				dataType: 'text',
				data: {
					"n_to": m_id,
					"content": content
				},
				success: function () { // db전송 성공시 실시간 알림 전송
					// 소켓에 전달되는 메시지
					// 위에 기술한 EchoHandler에서 ,(comma)를 이용하여 분리시킨다.
					socket.send(m_id + "," + content);
					alert("전송되었습니다.");
					//location.reload();
				},
				error: function (error) {
					console.log(error);
					alert("실패");
				}
			});
		}

		function go_page(p) {
			goform.pageNum.value = p;
			goform.submit();
		}
		function refuse(event){
			$("#refuse_why").empty();
			var refuseVal = $(event.target).parent().prev().prev().children().first().val();
			console.log(refuseVal);
			$("#refuse_why").append("거절사유 : "+refuseVal);
		}
		function contentBtn(event){
			$("#rcontent_why").empty();
			var rcontentVal = $(event.target).prev().val();
			console.log(rcontentVal);
			$("#rcontent_why").append("예약내용 : " + rcontentVal);
		}
	</script>
</body>

</html>