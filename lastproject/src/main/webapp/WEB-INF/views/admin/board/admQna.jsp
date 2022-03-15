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
			<h4 class="card-title">자유게시판 페이지</h4>
			<div class="btn-group bg-white p-3" role="group"
				aria-label="Basic example">
				<button type="button"
					class="btn btn-link text-dark py-0 border-right"
					onclick="location.href = 'admService' ">
					<code>Service page</code>
				</button>
				<button type="button"
					class="btn btn-link text-dark py-0 border-right"
					onclick="location.href = 'admReview' ">
					<code>Reivew page</code>
				</button>
			</div>

			<div>
				<form id="admDateForm" onsubmit="return false"
					onkeypress="eventkey();">
					<input type="hidden" name="code"> <input type="hidden"
						name="repor"> <input type="hidden" name="pageNum"
						value="1"> FROM : <input type="text" id="fromDate"
						name="fromDate">&nbsp;&nbsp; TO : <input type="text"
						id="toDate" name="toDate"> 
						<select id="key" name="key">
						<option value="all" selected="selected">전 체</option>
					</select> <input type="text" id="data" name="data" size="20">&nbsp;
					<button type="submit" onclick="pagingList();">검 색</button>
					<!-- <button type="button" id="btnSearch">검 색</button> -->
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
				<button type="button" class="btn btn-link btn-rounded btn-fw codep"
					data-code="" data-repor="701">미처리</button>
				<button type="button" class="btn btn-link btn-rounded btn-fw codep"
					data-code="" data-repor="702">기각처리</button>
				<button type="button" class="btn btn-link btn-rounded btn-fw codep"
					data-code="" data-repor="703">승인처리</button>
			</div>
			<div>
				<input class="form-control" id="myInput" type="text"
					placeholder="Search.."> <br>
			</div>
			<table class="table table-striped">
				<thead>
					<tr>
						<!-- <th>사진</th> -->
						<th>신고자</th>
						<th>신고 당한 사람</th>
						<th>신고일</th>
						<th>신고 내역</th>
						<th>신고 유형</th>
						<th>처리 상태</th>
					</tr>
				</thead>
				<tbody id="myTable">

				</tbody>
			</table>
			<div id="pagination"></div>
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

					<ul id="repo">
						<!-- 신고 내역 -->
					</ul>

					<!-- 신고 처리 Form 태그 -->
					<form id="form">
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
				</div>
				<div class="modal-footer">
					<button type="button" id="admReportUpdate" name="admReportUpdate"
						class="btn btn-primary">확 인</button>
				</div>
			</div>
		</div>
	</div>
	<!--end Modal 창 -->
	<script>
	//======================enter 키===================
	function eventkey() {
		if (event.keyCode == 13) {
			pagingList();
		} else {
			return false;
		}
	}//====================end enter 키================
	
		//검색 함수
		$(function() {
			$("#myInput").on(
					"keyup",
					function() {
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
		
		let viewReviewList = function(result) {
			$("#myTable").empty();
			console.log(result);

			$
					.each(
							result,
							function(i) {
								if (result[i].repor === 701) {
									$("#myTable")
											.append(
													"<tr><td>"
															+ result[i].reporter
															+ "</td><td>"
															+ result[i].reported
															+ "</td><td>"
															+ result[i].w_date
															+ "</td><td>"
															+ result[i].content
															+ "</td><td id='content'>"
															+ result[i].f_content
															+ "</td><td>"
															+ "<button id='reportModal' type='button' class='btn btn-secondary' onclick='show("
															+ result[i].rep_no
															+ ")' value="
															+ result[i].rep_no
															+ " data-toggle='modal'  data-target='#exampleModal"
															+ result[i].rep_no
															+ "'>"
															+ "미처리</td></button></tr>");
								} else if (result[i].repor === 702) {

									$("#myTable")
											.append(
													"<tr><td>"
															+ result[i].reporter
															+ "</td><td>"
															+ result[i].reported
															+ "</td><td>"
															+ result[i].w_date
															+ "</td><td>"
															+ result[i].content
															+ "</td><td id='content'>"
															+ result[i].f_content
															+ "</td>"
															+ "<td><button id='cancelModal' type='button' onclick='show("
															+ result[i].rep_no
															+ ")' class='btn btn-secondary' data-toggle='modal' data-target='#cancelModal'> "
															+ "기각처리</td></button></tr>");
								} else {

									$("#myTable")
											.append(
													"<tr><td>"
															+ result[i].reporter
															+ "</td><td>"
															+ result[i].reported
															+ "</td><td>"
															+ result[i].w_date
															+ "</td><td>"
															+ result[i].content
															+ "</td><td id='content'>"
															+ result[i].f_content
															+ "</td>"
															+ "<td><button id='permitModal' type='button' class='btn btn-secondary' onclick='show("
															+ result[i].rep_no
															+ ")'  data-toggle='modal' data-target='#permitModal'>"
															+ "승인처리</td></button></tr>");
								}
								;
							});
		}
		//==============================end 리스트 만드는 함수 : viewReviewList============================
		
		
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
								if (res == '')
									alert('해당 데이터가 없습니다');

								console.log("rep_no 는 " +res[0].rep_no);

								$("form")
										.append(
												"<input type='hidden' id='rep_no' value ="+res[0].rep_no+">");

								$("#repo").append(
										"<ul><li>신고유형 : " + res[0].f_content
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
												+ "</li></ul>");
								$(".modal-footer").append("<button type='button' id='goDetail' data-value="+res[0].q_no+" onclick='goDetail(this)' >상세페이지로..</button>");
							},
							error : function(er) {
								alert('오류가 났음. 개발자 호츌');
							} //end error
						})// end ajax
						$("#myModal").modal('show');
			
		}// end Show function Modal 신고 단건
		
		//=============상세보기 페이지 새 창 열어서  :  권한 없어서 못가는 거 같은데
		function goDetail(e) {
			var q_no = $(e).data('value');
			console.log("q_no : " +q_no);
			var url = `qnaDetail?q_no=\${q_no}`;
			console.log("url :"+url);
			window.open(url);
			
		}//=============end window.open()

		//모달 내용 초기화
		$('#myModal').on('hidden.bs.modal', function(e) {
			$(this).find('ul').empty();
			$(this).find('form')[0].reset();
			$(this).find('#goDetail').remove();

		})//END 모달 내용 초기화

		//신고처리 : admReportUpdate
		$("#admReportUpdate").on("click", function(e) {
			var str = $('#form').serialize();
			console.log("str의 값"+str);
			var rep_no = $("#rep_no").val();
			console.log("rep_no : "+rep_no);
			var state = $("#state").val();
			console.log("state : "+state);
			var repor = $("#repor").val();
			console.log("repor : "+repor);

			var flag = confirm("신고처리 하시겠습니까?");
			if (flag == true) {
				$.ajax({
					url : 'admReportUpdate',
					method : 'post',
					data : {
						"rep_no" : rep_no,
						"state" : state,
						"repor" : repor
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
			}//end If
		})//end 신고 처리
			
			
		//===================리스트 호출 버튼==================
		$(".codep").on('click', function() {
			var code = $(this).data('code');
			var repor = $(this).data('repor');
			console.log(code);
			console.log(repor);
			$('#admDateForm')[0].code.value = code
			$('#admDateForm')[0].repor.value = repor
			$('#admDateForm')[0].pageNum.value = 1;
			pagingList();
			
		});//===================end 리스트 호출 버튼================== 
		
		
		//===========리스트 ajax 호출==========
		function pagingList() {
			var str = $('#admDateForm').serialize();
			console.log(str);
			$.ajax({
				url : 'admQlistCode',
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
						viewReviewList(result.list);
						viewPage(result.page);
						
					};
				}
			});
		}//===========end  리스트 ajax 호출==========
			
		//===========페이징 처리==========
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
			
		}
			
		function goPage(pa) {
			$('#admDateForm')[0].pageNum.value = pa;
			pagingList();
		}
		//===========end 페이징 처리==========

		
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