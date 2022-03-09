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
			<div>
				<input class="form-control" id="myInput" type="text"
					placeholder="Search.."> <br>
			</div>
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

	<%-- 
	<form action="admPmember" name="goform">
		<input id="pmemberCode" type="hidden" name="code"
			value="${param.code }"> <input type="hidden" name="pageNum"
			value="1">
		<div class="blog_right_sidebar"
			style="width: 500px; float: none; margin: 0 auto;">
			<aside class="single_sidebar_widget search_widget">
				<div class="input-group">
					<input type="text" class="form-control" id="w_address"
						name="w_address" placeholder="지역명을 입력해주세요"
						value="${param.w_address }"> <span class="input-group-btn">
						<button class="btn btn-default" type="submit">
							<i class="fa fa-search"></i>
						</button>
					</span>
				</div>
				<!-- /input-group -->
			</aside>
		</div>
	</form>
	<nav class="blog-pagination justify-content-center d-flex">
			<ul class="pagination">
				
				
					<li class="page-item active"><a href="javascript:go_page(1)" class="page-link">1</a>
					</li>
				
					<li class="page-item "><a href="javascript:go_page(2)" class="page-link">2</a>
					</li>
				
				
			</ul>
		</nav>
	<my:nav jsFunc="go_page" page="${page}"/>  --%>
	<!-- <div class="btn-group" role="group" aria-label="Basic example">
                            <button type="button" class="btn btn-primary">1</button>
                            <button type="button" class="btn btn-primary">2</button>
                            <button type="button" class="btn btn-primary">3</button>
                          </div> -->
	<script>
	
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
		let viewPmemberList = function(result) {
			$("#myTable").empty();
			console.log(result);

			$
					.each(
							result,
							function(i) {

								$("#myTable")
										.append(
												"<tr><td>"
														+ result[i].name
														+ "</td><td>"
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
														+ "</td></tr>");
							}) // end each.

		}//=====================  end리스트 만드는 함수 ====================

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
					viewPmemberList(result.list);
					viewPage(result.page);
				}
			});
		}//===========end  리스트 ajax 호출==========
		
			
			
		//===========페이징 처리==========
		function viewPage(page) {
			console.log(page);
			
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
				for ( var i=page.startPage ; i <  page.endPage; i++){
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
			
		}//===========end 페이징 처리==========
		
		
		
		
		
		// =============날짜 검색 ==============
		function goPage(pa) {
			$('#admDateForm')[0].pageNum.value = pa;
			pagingList();
		}

		$('#btnSearch').on('click',function(e){
			var str = $('#admDateForm').serialize();
			console.log(str);
			var fromDate = $("#fromDate").val();
			var toDate = $("#toDate").val();
			
			$.ajax({
				url : 'admPmemberDate',
				method : 'post',
				data : {
					"fromDate" : fromDate,
					"toDate" : toDate
				}, success : function(result) {
					console.log(result);
					viewPmemberList(result);
				}
			})
			
		});
		
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