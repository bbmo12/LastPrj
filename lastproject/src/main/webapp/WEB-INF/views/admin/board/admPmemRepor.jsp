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
.card-text {
	display: inline-block;
	width: 300px;
	/* white-space: nowrap; */
	overflow: hidden;
	text-overflow: ellipsis;
	padding: 0 5px;
	align: center;
}

.container-fluid {
	width: 100%;
	padding-right: 0px;
	padding-left: 0px;
	margin-right: auto;
	margin-left: auto;
}
/* button {
	width: 90px !important;
} */
</style>
</head>
<body>
	<div class="card">
		<div class="card-body">
			<h4 class="card-title">파트너 회원 페이지</h4>
			<div class="btn-group bg-white p-3" role="group"
				aria-label="Basic example">
				<button type="button"
					class="btn btn-link text-dark py-0 border-right"
					onclick="location.href = 'admQna' ">
					<code>QnA 페이지</code>
				</button>
				<button type="button"
					class="btn btn-link text-dark py-0 border-right"
					onclick="location.href = 'admReview' ">
					<code>후기 페이지</code>
				</button>
				<button type="button"
					class="btn btn-link text-dark py-0 border-right"
					onclick="location.href = 'admMemRepor' ">
					<code>일반회원 페이지</code>
				</button>
				<button type="button"
					class="btn btn-link text-dark py-0 border-right"
					onclick="location.href = 'admPmemRepor' ">
					<code>파트너회원 페이지</code>
				</button>
			</div>
			<div>
				검색조건
				<form id="admDateForm" onsubmit="return false"
					onkeypress="eventkey();">
					<input type="hidden" name="code"><input type="hidden"
						name="pageNum" value="1"> FROM : <input type="text"
						id="fromDate" name="fromDate" class="mdi mdi-calendar mr-1">&nbsp;&nbsp;
					TO : <input type="text" id="toDate" name="toDate"
						class="mdi mdi-calendar mr-1"> &nbsp;&nbsp;<select
						id="key" name="key">
						<option value="" selected>전 체</option>
						<option value="p_id">아이디</option>
						<option value="name">이름</option>
					</select> <input type="text" id="data" name="data" size="20">&nbsp;
					<button type="submit" onclick="pagingList();"
						class="btn btn-outline-primary btn-icon-text">
						<i class="mdi mdi-file-check btn-icon-prepend"></i>검 색
					</button>
					<button type="button" class="btn btn-warning btn-icon-text">
						<i class="mdi mdi-reload btn-icon-prepend"></i> 초기화
					</button>
				</form>
			</div>
			<div class="template-demo">
				<button type="button" class="btn btn-link btn-rounded btn-fw codep"
					data-code="" data-repor="">전체</button>
				<button type="button" class="btn btn-link btn-rounded btn-fw codep"
					data-code="601" data-repor="">불법 광고 및 홍보</button>
				<button type="button" class="btn btn-link btn-rounded btn-fw codep"
					data-code="602" data-repor="">음란물/선정성 콘텐츠</button>
				<button type="button" class="btn btn-link btn-rounded btn-fw codep"
					data-code="603" data-repor="">욕설,비속어,모욕</button>
				<button type="button" class="btn btn-link btn-rounded btn-fw codep"
					data-code="604" data-repor="">사생활 침해</button>
				<button type="button" class="btn btn-link btn-rounded btn-fw codep"
					data-code="605" data-repor="">게시물 도배</button>
			</div>
			<br> <br>
			<h4>제재 대상 파트너 회원</h4>
			<table class="table table-striped">
				<thead>
					<tr>
						<!-- <th>사진</th> -->
						<th>이름</th>
						<th>아이디</th>
						<th>신고 건수</th>
						<th>가입날짜</th>
						<th>신고 사유</th>
						<th>신고 유형</th>
						<th>처리 사유</th>
						<th>처리 상태</th>
					</tr>
				</thead>
				<tbody id="myTable">
				</tbody>
			</table>
			<div id="pagination"></div>
			<br> <br>
			<h4>신고 제재 중인 파트너 회원</h4>
			<table class="table table-striped">
				<thead>
					<tr>
						<!-- <th>사진</th> -->
						<th>이름</th>
						<th>아이디</th>
						<th>신고 건수</th>
						<th>가입날짜</th>
						<th>신고 사유</th>
						<th>신고 유형</th>
						<th>처리 사유</th>
						<th>처리 상태</th>
					</tr>
				</thead>
				<tbody id="myTableTwo">
				</tbody>
			</table>
			<div id="paginationTwo"></div>
		</div>
	</div>
	<!-- Modal 창 -->
	<div class="modal fade" id="myModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">신고내역</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<ul id="repo" class="list-star">
						<!-- 신고 내역 -->
					</ul>

					<!-- 신고 처리 Form 태그 -->

					<form id="form" style="display: none;">
						<div class="form-group">
							<label for="amdReportOption">처리유형</label> <select class="repor"
								id="repor" name="repor">
								<option value="701" selected>미처리</option>
								<option value="702">기각</option>
								<option value="703">승인</option>
							</select>
						</div>
						<div class="form-group">
							<label for="message-text" class="col-form-label">처리사유</label>
							<textarea class="state" id="state" name="state"></textarea>
						</div>
					</form>
					<div class="modal-footer">
						<button type="button" id="admReportUpdate" name="admReportUpdate"
							class="btn btn-primary">확 인</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--end Modal 창 -->
	<script>		
	
	// form 태그 리셋 버튼
	$('.btn-icon-text').on('click',function(e){
		$('#admDateForm')[0].reset();
		
	}) // form 태그 리셋 버튼 end
	
	$('.btn-icon-text').on('click',function(e){
		alert('검색하시겠습니까?');
		console.log($('.code').val())
	/* 	var str = $('#admDateForm').serialize();
		console.log(str); */
		 if($('.code').val() === '' && $('#fromDate').val() === '' && $('#toDate').val() === '' && $('#key').val() === '' &&  $('#data').val() === '' && str.pageNum === 1 ){
			alert("검색값이 없습니다.");
			return false;
		} 
	});
	
	
		// ========================================================== 리스트 만드는 함수 ==================================================================== 테이블
		
		//======================enter 키===================
		function eventkey() {
			if (event.keyCode == 13) {
				pagingList();
			} else {
				return false;
			}
		}//====================end enter 키================cReport viewMemberList
		
		let viewMemberList = function(result) {
			$("#myTable").empty();
			console.log(result);

			$.each(result,function(i) {
				console.log(result[i].state);
				if(result[i].p_role == 2) {
					
				
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
														+"</td><td>"
														+ result[i].content
														+"</td><td>"
														+ result[i].state
														+"</td><td>"
														+ (result[i].p_role == 2 ? '제재 대상' : '제재 중')
														+ "</td></tr>" );
				}else{
					$("#myTableTwo").append(
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
							+"</td><td>"
							+ result[i].content
							+"</td><td>"
							+ result[i].state
							+"</td><td>"
							+ (result[i].p_role == 2 ? '제재 대상' : '제재 중')
							+ "</td></tr>" );
				}
		}) // end each.
}//=====================  end리스트 만드는 함수 ====================
		//===================================================================end 리스트 만드는 함수 : viewMemberList============================================ 끝!
		
		// Modal 미처리 신고 : Review
		function show(st) {
			console.log("st는 :"+st);
				$
						.ajax({
							url : 'admReportOneQna',
							method : 'post',
							data : {
								"rep_no" : st
							},
							success : function(res) {
								console.log(res[0].state);
								if (res == '') alert('해당 데이터가 없습니다');

								if(res[0].repor != 701  ){ //state 값이 있을 떄 + repor 가 선택 되어 있을 때 : 기각처리 / 승인처리 
									
	
									//$("form").append("<input type='hidden' id='rep_no' value ="+res[0].rep_no+">");
									$("#repo").append(
											"<li>신고유형 : " + res[0].f_content
													+ "</li><li>신고날짜 : "
													+ res[0].w_date
													+ "</li><li>신고자 : "
													+ res[0].reporter
													+ "</li><li>신고당한 : "
													+ res[0].reported
													+ "</li><li>신고사유 : "
													+ res[0].content
													+ "</li><li>게시글 내용 : "
													+ res[0].q_content
													+ "</li><li>신고처리 상태 : "
													+ (res[0].repor == 702 ? '기각처리' : '승인처리')
													+ "</li><li>해당처리 사유 : "
													+ (res[0].state == 'null' ? '없음' : res[0].state )
													+ "</li>");
									
									$(".modal-footer").append("<button class='btn btn-link' type='button' id='goDetail' data-value="+res[0].q_no+" onclick='goDetail(this)' >상세페이지로..</button>");

								}else {   //미처리 state + repor 가 값이 담겨져 있지 않을 떄
									$('#form').show();
									$("form")
											.append(
													"<input type='hidden' id='rep_no' value ="+res[0].rep_no+">");

									$("#repo").append(
											"<li>신고유형 : " + res[0].f_content
													+ "</li><li>신고날짜 : "
													+ res[0].w_date
													+ "</li><li>신고자 : "
													+ res[0].reporter
													+ "</li><li>신고당한 : "
													+ res[0].reported
													+ "</li><li>신고사유 : "
													+ res[0].content
													+ "</li><li>게시글 내용 : "
													+ res[0].q_content
													+ "</li>");
									$(".modal-footer").append("<button type='button' class='btn btn-link' id='goDetail' data-value="+res[0].q_no+" onclick='goDetail(this)' >상세페이지로..</button>");
								}
								
						console.log("rep_no 는 " +res[0].rep_no);

							},
							error : function(er) {
								alert('오류가 났음. 개발자 호츌');
							} //end error
						})// end ajax
						$("#myModal").modal('show');
			
		}
		// end Show function Modal 신고 단건 ======끝!
		
		//=============상세보기 페이지 새 창==============
		function goDetail(e) {
			var q_no = $(e).data('value');
			console.log("q_no : " +q_no);
			var url = `qnaDetail?q_no=\${q_no}`;
			console.log("url :"+url);
			window.open(url);
			
		}
		//=============상세보기 페이지 새 창============== 끝!

		//모달 내용 끌 떄 초기화
		$('#myModal').on('hidden.bs.modal', function(e) {
			$('#form').hide();
			$(this).find('ul').empty();
			$(this).find('form')[0].reset();
			$(this).find('#goDetail').remove();

		})//END 모달 내용 초기화

		//===========신고처리 : admReportUpdate==========
		$("#admReportUpdate").on("click", function(e) {
			var str = $('#form').serialize();
			console.log("str의 값"+str);
			var rep_no = $("#rep_no").val();
			console.log("rep_no : "+rep_no);
			var state = $("#state").val();
			console.log("state : "+state);
			var repor = $("#repor").val();
			console.log("repor : "+repor);
			
				$.ajax({
					url : 'admReportUpdate',
					method : 'post',
					data : {
						"rep_no" : $("#rep_no").val(),
						"state" : $("#state").val(),
						"repor" : $("#repor").val()
					},
					success : function(result) {
						alert("신고 처리가 성공적으로 완료되었습니다");
						console.log(result);
						location.reload();
					},
					error : function(err) {
						alert("신고 처리가 성공적으로 실패했습니다. 관리자 호출!");

					}
				}) //end Ajax
			
		})
		//===========신고처리 : admReportUpdate========== 끝!
			
			
		//===================리스트 호출 버튼==================
		$(".codep").on('click', function() {
			var code = $(this).data('code');
			console.log(code);
			$('#admDateForm')[0].code.value = code
			$('#admDateForm')[0].pageNum.value = 1;
			pagingList();
			
		}); 
		//===================end 리스트 호출 버튼================== 끝!
		
		
		//===========리스트 ajax 호출==========
		function pagingList() {
			var str = $('#admDateForm').serialize();
			console.log(str);
			$.ajax({
				url : 'admPmemReporList',
				method : 'post',
				data :str,
				success : function(result) {
					if(result.list == ''){
						alert('데이터가 없습니다!!');
						$("#myTable").empty();
						$("#pagination").empty();
						$("#myTable").append("<tr><td colspan='4' align='center'>데이터가 없습니다.</td></tr>");
					}else {
						viewMemberList(result.list);
						viewPage(result.page);
						
					};
				}
			});
		}//===========end  리스트 ajax 호출========== 끝!
			
		//==============================페이징 처리==========================
		function viewPage(page) {
			console.log("얘로 페이지를 만든다!"+page);
			
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
			
		}
			
		function goPage(pa) {
			$('#admDateForm')[0].pageNum.value = pa;
			pagingList();
		}
		//=============================end 페이징 처리============================= 끝!

		
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
        });// =============end 날짜 검색 ============== 끝!
        
	</script>
</body>

</html>