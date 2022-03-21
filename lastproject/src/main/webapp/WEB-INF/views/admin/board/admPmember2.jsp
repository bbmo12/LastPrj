<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<!-- <script	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script> -->
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"
	integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css"
	integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>
.container-fluid {
	width: 100%;
	padding-right: 0px;
	padding-left: 0px;
	margin-right: auto;
	margin-left: auto;
}
</style>
</head>
<body>
	<div class="card">
		<div class="card-body">
			<h4 class="card-title">파트너회원</h4>
			<p class="card-description">
				관리
				<code>조건 별 검색</code>
			</p>
			<div>
				<form id="admDateForm">
					<input type="hidden" name="code"> <input type="hidden"
						name="pageNum" value="1"> FROM : <input type="text"
						id="fromDate" name="fromDate">&nbsp;&nbsp; TO : <input
						type="text" id="toDate" name="toDate">
					<!-- <button type="button" id="btnSearch">검 색</button> -->
				</form>
			</div>
			<div class="template-demo">
				<button type="button" class="btn btn-link btn-rounded btn-fw codep"
					id="doctor" data-code="">전체</button>
				<button type="button" class="btn btn-link btn-rounded btn-fw codep"
					id="doctor" data-code="100">수의사</button>
				<button type="button" class="btn btn-link btn-rounded btn-fw codep"
					id="trainer" data-code="101">훈련사</button>
				<button type="button" class="btn btn-link btn-rounded btn-fw codep"
					id="groomer" data-code="102">미용사</button>
				<button type="button" class="btn btn-link btn-rounded btn-fw codep"
					id="petsitter" data-code="103">펫시터</button>
			</div>
			<!-- 조건 검색한 리스트에서 검색 -->
			<div>
				<input class="form-control" id="myInput" type="text"
					placeholder="Search.."> <br>
			</div>
			<!-- end 조건 검색한 리스트에서 검색 -->
			<table class="table table-striped">
				<thead>
					<tr>
						<!-- <th>사진</th> -->
						<th>이름</th>
						<th>아이디</th>
						<th>신고건수</th>
						<th>가입날짜</th>
						<th>파트너쉽</th>
					</tr>
				</thead>
				<tbody id="myTable">

				</tbody>
			</table>
			<div id="pagination"></div>
		</div>
	</div>


	<!-- 파트너 회원 단건 조회 Modal -->
	<div class="modal fade" id="myModal">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">해당 파트너 회원</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">

					<div class='mem-body'></div>

					<!-- chart.js -->
					<div class="card">
						<div class="card-body">
							<h4 class="card-title">추로스 chart</h4>
							<canvas id="myChart" style="height: 50px"></canvas>
						</div>
					</div>
					<!--end chart.js -->

				</div>

				<!-- Modal footer -->
				<div class="modal-footer">

					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>

			</div>
		</div>
	</div>
	<!-- end 파트너 회원 단건 조회 Modal -->

	<!-- 해당 파트너 회원한테 메시지 보내기 Modal -->

	<!-- end 해당 파트너 회원한테 메시지 보내기 Modal -->

	<script>
		
		//검색 함수
		$(function() {
		
			$("#myInput").on("keyup",function() {
						var value = $(this).val().toLowerCase();

						$("#myTable tr").filter(
								function() {
									$(this).toggle(
											$(this).text().toLowerCase()
													.indexOf(value) > -1)
								});
					});
		});// end 검색함수
		
		// ===================== 리스트 만드는 함수 ====================
		let viewPmemberList = function(result) {
			$("#myTable").empty();
			console.log("result는: " + result);

			$.each(result,function(i) {
						$("#myTable").append(
														"<tr><td><a onclick='show()'>"														
														+ result[i].name
														+ "</a></td><td>"
														+ result[i].p_id
														+ "</td><td>"
														+ "<div class='progress'>"
														+ "<div class='progress-bar bg-success' role='progressbar' style='width:"
														+ result[i].c_report
														+ "%' aria-valuenow='70' aria-valuemin='0' aria-valuemax='100'>"
														+ "</div></div>"
														+ "</td><td>"
														+ result[i].startdate
														+ "</td><td>"
														+ result[i].f_content
														+ "</td></tr>" );
							}) // end each.
							
			

		}//=====================  end리스트 만드는 함수 ====================

			
		// =================회원 단건 조회 Modal===================
		
			function show() {
				/* var p_id = $(event.target).parent().next().text();
			console.log(p_id); */
			var p_id = 'kim1@a.com';
			//Modal에 띄어줄 단건조회 ajax : 파트너 회원 : 모든 정보 : 사진 까지 
			 $.ajax({
				url : 'admPmemberOne',
				method : 'post',
				data : {'p_id' : p_id },
				success : function (res) {					
					console.log(res.list);
					$('.mem-body').append("<ul><img src='resources/upload/"+ res.list.picture +"'></img>"
											+ "<li>" +res.list.startdate 
											+"</li><li>"
											+ res.list.name
											+ "</li><li>"
											+ res.list.w_address
											+ "</li><li>"
											+ res.list.w_tel
											+ "</li><li>"
											+ res.list.p_info
							    			+"</li></ul>");
					$(".modal-footer").append("<button type='button' data-value="+res.list.p_id+" onclick='goDetail(this)' >상세페이지로..</button>");
					//$(".modal-footer").append("<a href='pmemberDetail?id="+res.list.p_id+"'>회원의 상세페이지로 이동</a>");
					
					//=========================Modal의 Chart 그리기
					const ctx = document.getElementById('myChart').getContext('2d');
					const myChart = new Chart(ctx, {
						type : 'bar',
						data : {
							labels : [ '신고 당한 수', '추천 수','서비스 제공 수','총매출','팔로워 수' ],
							datasets : [ {
								label : '# of Votes',
								data : [ res.list.c_report, '8', '1' ],
								backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
										'rgba(255, 159, 64, 0.2)',
										'rgba(255, 159, 64, 0.2)' ],
								borderColor : [ 'rgba(255, 99, 132, 1)',
										'rgba(255, 159, 64, 1)', 'rgba(255, 159, 64, 1)' ],
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
					//========================end Modal의 Chart 그리기
					
				}
			}); //end Modal에 띄어줄 단건조회 ajax
			
			
			
			$("#myModal").modal('show'); //Modal Open
			
		}// =================end 회원 단건 조회 Modal=================
		
			
			
		//=============상세보기 페이지 새 창 열어서  :  권한 없어서 못가는 거 같은데
		function goDetail(e) {
			var p_id = $(e).data('value');
			console.log("p_id : " +p_id);
			var url = `pmemberDetail?id=\${p_id}`;
			console.log("url :"+url);
			window.open(url);
			
		}//=============end window.open()
			
			
		//모달 내용 초기화
		$('#myModal').on('hidden.bs.modal', function(e) {
			$(this).find('ul').empty();
			$(this).find('a').remove();
		})//END 모달 내용 초기화
		
			
		//===================리스트 호출 버튼==================
		$(".codep").on('click', function() {
			var code = $(this).data('code');
			$('#admDateForm')[0].code.value = code
			$('#admDateForm')[0].pageNum.value = 1;
			pagingList();
			
		});//===================end 리스트 호출 버튼================== 
		
		
		//===========리스트 ajax 호출==========
		function pagingList() {
			var str = $('#admDateForm').serialize();
			$.ajax({
				url : 'admPlistCode',
				method : 'post',
				data :str,
				//contentType : 'application/json',
				success : function(result) {
					console.log("리절트리스트는 :"+result.list);
					console.log("리절트페이지는 : " + result.page);
					viewPmemberList(result.list);
					viewPage(result.page);
				}
			});
		}//===========end  리스트 ajax 호출==========
			
		//==================페이징 처리===================
		function viewPage(page) {
			console.log("page는 :"+page);
			
			var nav =  `<nav class="blog-pagination justify-content-center d-flex">
			<ul class="pagination">`
			if(page.prev) {
				nav += `<li class="page-item">
				<a href="javascript:goPage(\${page.startPage-1})" class="page-link"
					aria-label="Previous">
					<span aria-hidden="true">
						<span class="fa fa-angle-left"></span>
					</span></a>
				</li>`
			}
				for ( var i=page.startPage ; i <=  page.endPage; i++){
					nav += `<li class="page-item ${page.pageNum eq num ? 'active' : '' }"><a
								href="javascript:goPage(\${i})" class="page-link">\${i }</a>
								</li>`
				}
				
			if(page.next){
				nav += `<li class="page-item"><a href="javascript:goPage(\${page.endPage+1})"
					class="page-link" aria-label="Next">
				<span aria-hidden="true">
					<span class="fa fa-angle-right"></span>
				</span></a>
		</li>`
		
			}
				
			nav += `</ul></nav>`
			$('#pagination').html(nav);
			
		}// end viewPage
			
		function goPage(pa) {
			console.log("pa 는 :" + pa);
			$('#admDateForm')[0].pageNum.value = pa;
			pagingList();
		}
		
		//======================end 페이징 처리=================

		
		// =============날짜 검색 ==============
        $("#datepicker").datepicker({
            dateFormat: 'yy-mm-dd',
            prevText: '이전 달',
            nextText: '다음 달',
            monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
            monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
            dayNames: ['일', '월', '화', '수', '목', '금', '토'],
            dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
            dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
            showMonthAfterYear: true,
            yearSuffix: '년',
            showOtherMonths: true,
            changeYear: true,
            changeMonth: true,
            showOn: "both",
            buttonImage: "",
            buttonImageOnly: true,
            buttonText: "선택"

        });
        $('#datepicker').datepicker('setDate', 'today');

        $(function () {
            $.datepicker.setDefaults({
                dateFormat: 'yy-mm-dd',
                prevText: '이전 달',
                nextText: '다음 달',
                monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
                monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월',
                    '12월'
                ],
                dayNames: ['일', '월', '화', '수', '목', '금', '토'],
                dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
                dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
                showMonthAfterYear: true,
                yearSuffix: '년',
                showOtherMonths: true,
                changeYear: true,
                changeMonth: true,
                showOn: "both",
                buttonImage: "",
                buttonImageOnly: false,
                buttonText: "선택"
            });
            $("#fromDate").datepicker();
            $("#toDate").datepicker();

            /* $('#fromDate').datepicker('setDate', 'today');
            $('#toDate').datepicker('setDate', '+1D'); // -1D:하루전  -1M : 한달전 */
            
            
	    	pagingList();
        });// =============end 날짜 검색 ==============
	</script>
</body>

</html>