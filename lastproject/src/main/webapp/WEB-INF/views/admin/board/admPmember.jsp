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
					FROM : <input type="text" id="fromDate" name="fromDate">&nbsp;&nbsp;
					TO : <input type="text" id="toDate" name="toDate">
					<button type="button" id="btnSearch">검 색</button>
				</form>
			</div>

			<div class="template-demo">
				<button type="button" class="btn btn-link btn-rounded btn-fw"
					id="doctor">수의사</button>
				<button type="button" class="btn btn-link btn-rounded btn-fw"
					id="trainer">훈련사</button>
				<button type="button" class="btn btn-link btn-rounded btn-fw"
					id="groomer">미용사</button>
				<button type="button" class="btn btn-link btn-rounded btn-fw"
					id="petsitter">펫시터</button>
				<button type="button" class="btn btn-link btn-rounded btn-fw"
					id="startDate">220220~20226</button>
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
					<c:forEach items="${pList }" var="pmember">
						<tr>
							<td>${pmember.name }</td>
							<td>${pmember.p_id}</td>
							<td>
								<div class="progress">
									<div class="progress-bar bg-success" role="progressbar"
										style="width: ${pmember.c_report}%" aria-valuenow="70"
										aria-valuemin="0" aria-valuemax="100"></div>
								</div>
							</td>
							<td>${pmember.startdate}</td>
							<td><a href="admPlistCode?content=${pmember.f_content}">${pmember.f_content}</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
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

		//페이징 처리
		/*
		function go_page(p) {
			goform.pageNum.value = p;
			goform.submit();

		}//end 페이징 */

		/* //주소 검색
		w_address.addEventListener('click', function() {
			event.target.select();
		})//end 주소 검색 */

		//리스트 만드는 함수 : viewPmemberList
		/*						<div class="progress">
									<div class="progress-bar bg-success" role="progressbar"
										style="width: ${pmember.c_report}%" aria-valuenow="70"
										aria-valuemin="0" aria-valuemax="100">
									</div>
								</div>*/

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

		}// end viewPmemberList.

		//수의사 리스트 출력
		$("#doctor").on('click', function() {
			var code = 100;
			$.ajax({
				url : 'admPlistCode',
				method : 'post',
				data : {
					'code' : code
				},
				//contentType : 'application/json',
				success : function(result) {
					viewPmemberList(result);
				}
			});
		});
		//훈련사 리스트 출력
		$("#trainer").on('click', function() {
			var code = '101';
			$.ajax({
				url : 'admPlistCode',
				method : 'post',
				data : {
					'code' : code
				},
				success : function(result) {
					viewPmemberList(result);
				}
			});

		});

		//미용사 리스트 출력
		$("#groomer").on('click', function() {
			var code = '103';
			$.ajax({
				url : 'admPlistCode',
				method : 'post',
				data : {
					'code' : code
				},
				success : function(result) {
					viewPmemberList(result);
				}
			});
		});

		//펫시터 리스트 출력
		$("#petsitter").on('click', function() {
			var code = '102';
			$.ajax({
				url : 'admPlistCode',
				method : 'post',
				data : {
					'code' : code
				},
				success : function(result) {
					viewPmemberList(result);
				}
			});
		});

		
		// =============날짜 검색 ==============
		$("#startDate").on('click', function() {
			$.ajax({
				url : 'admStartDateList',
				method : 'post',
				success : function(result) {
					viewPmemberList(result);
				}
			});
		});

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

            $('#fromDate').datepicker('setDate', 'today');
            $('#toDate').datepicker('setDate', '+1D'); // -1D:하루전  -1M : 한달전
        });// =============end 날짜 검색 ==============

	</script>
</body>

</html>