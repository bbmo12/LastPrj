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
<!-- <script src="https://cdn.jsdelivr.net/npm/chart.js"></script> -->
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
			<!-- 조건 검색한 리스트에서 검색 -->
			<!-- 	<div>
				<input class="form-control" id="myInput" type="text"
					placeholder="Search.."> <br>
			</div> -->
			<!-- end 조건 검색한 리스트에서 검색 -->


			<div class="row">

				<div class="col-lg-6 grid-margin stretch-card">

					<div class="card">
						<div class="card-body">
							<div class="card-title">
								<h4>차트</h4>
								<button type="button" class="btn btn-link btn-rounded btn-fw"
									id="partChart" onclick="partChart();">기간 가입자 수</button>
								<button type="button" class="btn btn-link btn-rounded btn-fw"
									id="dateChart" onclick="petChart();">펫 품종별 비율</button>

							</div>
							<div id="petC" style="display: none;">

								<div class="card">

									<div class="card-body">

										<p class="card-description mainCount" id="petCount">
										<h4 class="card-title">펫 품종별 비율</h4>
										<p class="card-description mainCount" id="petCount">
											<code id="a"></code>
											<br>
											<code id="1"></code>
											<code id="2"></code>
											<code id="3"></code>
											<code id="4"></code>
										</p>
										<div class="admPetChart">
											<canvas id="admPetChart" style="height: 250px"></canvas>
										</div>
									</div>
								</div>
							</div>


							<div class="card" id="partC" style="display:;">
								<div class="card-body">
									<p class="card-description mainCount" id="petCount">
										<code id="a"></code>
										<br>
									<div id="b"></div>
									</p>
									<h4 class="card-title admMemChart">일반 회원 기간 별 가입자 수</h4>
									<canvas id="admMemChart" style="height: 250px"></canvas>
								</div>
							</div>

						</div>
					</div>
				</div>
				<!-- qwe 끝 -->

				<div class="col-lg-6 grid-margin stretch-card partner">
					<div class="card">
						<div class="card-body">
							<h4 class="card-title">일반회원 목록</h4>
							<p>
								<button type="button"
									class="btn btn-link btn-rounded btn-fw codep" id="key"
									data-code="">전체</button>
								<button type="button"
									class="btn btn-link btn-rounded btn-fw codep" id="petY"
									data-code="100">펫 보유</button>
								<button type="button"
									class="btn btn-link btn-rounded btn-fw codep" id="petN"
									data-code="101">펫 미보유</button>
								<button type="button"
									class="btn btn-link btn-rounded btn-fw codep" id="pets"
									data-code="pets">펫 목록</button>
							<form id="admDateForm" onsubmit="return false"
								onkeypress="eventkey();">
								<input type="hidden" name="code"> <input type="hidden"
									name="pageNum" value="1"> FROM : <input type="text"
									id="fromDate" name="fromDate">&nbsp;&nbsp; TO : <input
									type="text" id="toDate" name="toDate"> <br>
									<select id="key" name="key">
									<option value="" selected>전 체</option>
									<option value="name">이름</option>
									<option value="m_id">아이디</option>
								</select> <input type="text" id="data" name="data" size="20">&nbsp;
								<button type="submit" onclick="pagingList();">검 색</button>
								<input type="reset">
							</form>
							</p>
							<table class="table table-hover">
								<thead>
									<tr>
										<th>이름</th>
										<th>아이디</th>
										<th>가입일</th>
										<th>펫 보유</th>
									</tr>
								</thead>
								<tbody id="myTable">

								</tbody>
							</table>
							<div id="pagination"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 파트너 회원 단건 조회 Modal -->
	<div class="modal fade" id="myModal">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">해당 일반 회원</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<!-- Modal body -->
				<div class="modal-body">
					<div class='mem-body'></div>
					<!-- chart.js -->
					<div class="card">
						<div class="card-body">
							<h4 class="card-title myChart">추로스 chart</h4>
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

	<script>
	
	//======================enter 키===================
	function eventkey() {
		if (event.keyCode == 13) {
			pagingList();
		} else {
			return false;
		}
	}//====================end enter 키================
	
	// ============================차트 부분 : 기간 별 차트 그리기============================ 

	function partChart() { //일반 회원 기간 별 차트 그리기
			 $('#petC').hide();
			 $('#partC').show();
			 $("#admPetChart").remove();
			 $(".admPetChart").append("<canvas id='admPetChart'></canvas>");
			
			 tt = [];
				oo = [];
				$.ajax({
					url : 'admMemChart',
					method : 'get',
					success : function(res) {
						console.log(res[0].tt);
						$.each(res, function (i) {
							tt.push(res[i].tt);
							oo.push(res[i].oo);				
						})
						console.log(tt);
						
						const ctx = document.getElementById('admMemChart').getContext('2d');
						const admMemChart = new Chart(ctx, {
							type : 'line',
							data : {
								labels : tt,
								datasets : [ {
									label : '일반 회원',
									data : oo,
									backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
											'rgba(255, 159, 64, 0.2)',
											],
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
			partChart();
			
			
	
	function petChart() {// 품 종별 Bar 차트 그리기
		 $('#partC').hide();
		$('#petC').show();
		 $("#admMemChart").remove();
		 $(".admMemChart").append("<canvas id='admMemChart'></canvas>");
		
		tt=[];
		oo=[];
				
		var total;
		$.ajax({
			url : 'amdPetChart',
			method : 'get',
			success : function(res) {
				$.each(res, function (i) {
					tt.push(res[i].tt);
					oo.push(res[i].oo);				
					$("#i").html(res[i].oo+"의 마리수 :" + res[i].tt);
					
				});
				 console.log(res[0].ch);
				 $("#a").html("총 마리수 : "+res[0].ch);
				 
				 
				/*  <code id="1"></code> */
				
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
			}
		})

	}
	
	
	// 품 종별 Bar 차트 그리기 end

		
		$(function() {
				// title='상세정보를 보시려면 이름을 클릭하세요..'
				
				//Tooltip
				var title_;
				$("tr").hover(function(e){
					$('tr').attr( 'title', '상세정보를 보시려면 이름을 클릭하세요..' );
					title_ = $(this).attr("title");
					$("bod").append("<div id='ti'></div>");
					$("#ti").css("width","100px");
					$("#ti").text(title_);
				}, function() {													// <a> hover 시 : mouseLeave
	
					$(this).attr("title", title_);				// title 속성 반환
					$("#ti").remove();							// div#tip 삭제
	
				});//end Tooltip
			});
		
		 //===============================================테이블==========================================================
		//===================리스트 호출 버튼==================
		$(".codep").on('click', function() {
			var code = $(this).data('code');
			console.log(code);
			$('#admDateForm')[0].code.value = code
			$('#admDateForm')[0].pageNum.value = 1;
			pagingList();
			
		});//===================end 리스트 호출 버튼================== 
		
		
		//===========리스트 ajax 호출==========
		function pagingList() {
			var str = $('#admDateForm').serialize();
			console.log(str);
			
			$.ajax({
				url : 'admMlistCode',
				method : 'post',
				data :str,
				//contentType : 'application/json',
				success : function(result) {

					if(result.list == ''){
						alert('데이터가 없습니다!!');
						$("#myTable").empty();
						$("#pagination").empty();
						$("#myTable").append("<tr><td colspan='4' align='center'>데이터가 없습니다.</td></tr>");
					}else {
						viewPmemberList(result.list);
						viewPage(result.page);
						
					};
				},error : function () {
					alert('아 노답..');
					
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
					nav += `<li class="page-item \${page.pageNum == i ? 'active' : '' }"><a
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
			 
		// ===================== 리스트 만드는 함수 ====================
		let viewPmemberList = function(result) {
			$("#myTable").empty();		

			$.each(result,function(i) {
				console.log(result[i].pet_no)
				console.log(result[i].startDate)
						$("#myTable").append(
														"<tr><td><a onclick='show()'>"														
														+ result[i].name
														+ "</a></td><td>"
														+ result[i].m_id
														+ "</td><td>"
														+ result[i].startDate
														+ "</td><td>"
														+ (result[i].pet_no == null ? '미보유' : '보유' )
														+ "</td></tr>" );
							}) // end each.
		}
		//=====================  end리스트 만드는 함수 ====================

			
		// =================회원 단건 조회 Modal===================
		
			function show() {
				var m_id = $(event.target).parent().next().text();
				console.log(p_id);  
			
			//Modal에 띄어줄 단건조회 ajax : 파트너 회원 : 모든 정보 : 사진 까지 
			 $.ajax({
				url : 'admMemberOne',
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
					$(".modal-footer").append("<button type='button' id='goDetail' data-value="+res.list.p_id+" onclick='goDetail(this)' >상세페이지로..</button>");
					//$(".modal-footer").append("<a href='pmemberDetail?id="+res.list.p_id+"'>회원의 상세페이지로 이동</a>");
					
					//=========================Modal의 Chart 그리기
					
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
			$(this).find('#goDetail').remove();
		})//END 모달 내용 초기화
		
			
		

		
		// ==================================날짜 검색 ==============================
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
        });
     // ==================================날짜 검색 ============================== 끝!!
     
     //===============================================테이블========================================================== 끝!
	</script>
</body>

</html>