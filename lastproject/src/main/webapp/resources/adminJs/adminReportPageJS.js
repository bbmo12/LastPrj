		// 아코디언 함수
		$(document).on("click", ".que", function() {
			$(this).next(".anw").stop().slideToggle(300);
			$(this).toggleClass('on').siblings().removeClass('on');
			$(this).next(".anw").siblings(".anw").slideUp(300); // 1개씩 펼치기
		})//end 아코디언 함수
		
		
		//상단바 Count 호출 ajax
		adminReportCount();
		function adminReportCount() {
			$.ajax({
				url : 'adminReportCount',
				method : 'get',
				success : function(res) {
					console.log(res);
					$("#adminReportTotalCount").append(
							res.adminReportTotalCount);
					$("#adminReporCount").append(res.adminReporCount);
					$("#adminReportedCount").append(res.adminReportedCount);

				},
				eroor : function(error) {
					alert('엥??');
					window.reload();
				}
			})
		}//end 상단바 Count 호출 ajax
		
		//=============================================================================================================================================
		
		function admReporListBtn() {
			
			var input;
			input = $("#admRepoorListInput").val();
			 
			
			if( input === 'one' ){
				$("#admRepoorListInput").val('two');
				
				//실행시킬 함수 ===============
				let htmladmReporList;
		 		htmladmReporList = `
				<table class="table table-striped adminReporListTable">
				<thead>
					<tr style="text-align: center;">
						<th>아이디</th>
						<th>이름</th>
						<th>회원유형</th>
						<th>신고건수</th>
						<th>가입날짜</th>
						<th>보기</th>
						<th>제재</th>
					</tr>
				</thead>
				<tbody style="text-align: center" id="adminReporListTbody">

				</tbody>
			</table>
			<div id="pagination" class="admReporListPaging"></div>
		`; 
		$(".admRepoorListDiv").append(htmladmReporList);
			
					$.ajax({
							url:'adminReporList',
							method: 'get',
							success : function (res) {
									
								if(res.list == ''){
									$("#adminReporListTbody").append("<tr><td colspan='7' align='center'>조회된 결과가 없습니다.</td></tr>");
								
								} else {	
								
										console.log(res.list);
										console.log(res.page);
										
										viewadminReporList(res.list);
										viewpagingadminReporList(res.page);
											
									}// end if
								
							},// end success
							error : function(error) {
									alert('해당 회원의 목록을 불러오는 데 오류가 있습니다. 개발자에게 연락하십시오!');
								
							}//end error
						}) //end ajax
			
				
			} else  {
				$("#admRepoorListInput").val('one');
				$(".admRepoorListDiv").empty();
			};
		};// 신고 제재 대상 버튼~===================
		
		// ajax 호출 함수===============
			function viewpagingadminReporList(page) {
			console.log("얘로 페이지를 만든다!",page);
			
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
			$('.admReporListPaging').html(nav);
			
		} //end viewpagingadminReporList
		
		
		
		
		
		
		
		
		
		
		//=========================================================================================================================================신고 제재 대상에 관한 함수 끝~!!
		
		
		
		
		

		//============================================================================QNA 리스트 그리기===================================================
		//======================enter 키===================
		
		
		let htmladmQnaList 
			= `<form id="admDateFormQ" onsubmit="return false"
				onkeypress="eventkeyQ();">
				<input type="hidden" name="code"> <input type="hidden"
					name="repor"> <input type="hidden" name="pageNum"
					value="1"> FROM : <input type="text" id="fromDateQ"
					name="fromDate">&nbsp;&nbsp; TO : <input type="text"
					id="toDateQ" name="toDate"> &nbsp;&nbsp; <select
					id="key" name="key">
					<option value="" selected="selected">전 체</option>
					<option value="reporter">신고자</option>
					<option value="reported">신고당한사람</option>
				</select> <input type="text" id="data" name="data" size="20">&nbsp;
				<button type="submit" onclick="pagingListQ();">검 색</button>
				<input type="reset">
				<!-- <button type="button" id="btnSearch">검 색</button> -->
			</form>
			<div class="template-demo">
				<button type="button"
					class="btn btn-link btn-rounded btn-fw codepQ" data-code=""
					data-repor="">전체</button>
				<button type="button"
					class="btn btn-link btn-rounded btn-fw codepQ"
					data-code="601" data-repor="">불법 광고 및 홍보</button>
				<button type="button"
					class="btn btn-link btn-rounded btn-fw codepQ"
					data-code="602" data-repor="">음란물/선정성 콘텐츠</button>
				<button type="button"
					class="btn btn-link btn-rounded btn-fw codepQ"
					data-code="603" data-repor="">욕설,비속어,모욕</button>
				<button type="button"
					class="btn btn-link btn-rounded btn-fw codepQ"
					data-code="604" data-repor="">사생활 침해</button>
				<button type="button"
					class="btn btn-link btn-rounded btn-fw codepQ"
					data-code="605" data-repor="">게시물 도배</button>
				<button type="button"
					class="btn btn-link btn-rounded btn-fw codepQ" data-code=""
					data-repor="701">미처리</button>
				<button type="button"
					class="btn btn-link btn-rounded btn-fw codepQ" data-code=""
					data-repor="702">기각처리</button>
				<button type="button"
					class="btn btn-link btn-rounded btn-fw codepQ" data-code=""
					data-repor="703">승인처리</button>
			</div>
			<table class="table table-striped">
				<thead>
					<tr>
						<!-- <th>사진</th> -->
						<th>신고자</th>
						<th>신고일</th>
						<th>신고 유형</th>
						<th>처리 밑 조회</th>
					</tr>
				</thead>
				<tbody id="myTableQ">

				</tbody>
			</table>
			<div id="paginationQ"></div>`;
		
		
		
		
		
		
		function eventkeyQ() {
			if (event.keyCode == 13) {
				pagingListQ();
			} else {
				return false;
			}
		}//====================end enter 키================
		
		let viewReviewListQ = function(result) {
			$("#myTableQ").empty();
			console.log(result);

			$
					.each(
							result,
							function(i) {
								if (result[i].repor === 701) {
									$("#myTableQ")
											.append(
													"<tr><td>"
															+ result[i].reporter
															+ "</td><td>"
															+ result[i].w_date
															+ "</td><td>"
															+ result[i].f_content
															+ "</td><td>"
															+ "<button id='reportModal' type='button' class='btn btn-danger btn-icon-text' onclick='showQ("
															+ result[i].rep_no
															+ ")' value="
															+ result[i].rep_no
															+ " data-toggle='modal'  data-target='#exampleModal"
															+ result[i].rep_no
															+ "'>"
															+ "미처리</td></button></tr>");
								} else if (result[i].repor === 702) {

									$("#myTableQ")
											.append(
													"<tr><td>"
															+ result[i].reporter
															+ "</td><td>"
															+ result[i].w_date
															+ "</td><td>"
															+ result[i].f_content
															+ "</td>"
															+ "<td><button  type='button' onclick='showQ("
															+ result[i].rep_no
															+ ")' class='btn btn-secondary' data-toggle='modal' data-target='#exampleModal'> "
															+ "기각처리</td></button></tr>");
								} else {

									$("#myTableQ")
											.append(
													"<tr><td>"
															+ result[i].reporter
															+ "</td><td>"
															+ result[i].w_date
															+ "</td><td>"
															+ result[i].f_content
															+ "</td>"
															+ "<td><button  type='button' class='btn btn-success' onclick='showQ("
															+ result[i].rep_no
															+ ")'  data-toggle='modal' data-target='#exampleModal'>"
															+ "승인처리</td></button></tr>");
								}
								
							});
		}
		//===================================================end 리스트 만드는 함수 : viewReviewList================================= 끝!
		
		
		// Modal 미처리 신고 
		function showQ(st) {
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
									$("#admReportUpdate").show();
									
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
									$(".list").html('');									
									$(".current").html('');
									let html = 
										`<li data-value="701" class="option selected">미처리</li>
										<li data-value="701" class="option">기각</li>
										<li data-value="703" class="option">승인</li>`;	
									$(".list").append(html);
									let htm = `<span class="current">미처리</span>`;
									$(".current").append(htm);
									
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
			$("#admReportUpdate").hide();
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
		$(".codepQ").on('click', function() {
			var code;
			var repor;
		
			code = $(this).data('code');
			repor = $(this).data('repor');
			console.log(code);
			console.log(repor);
			$('#admDateFormQ')[0].code.value = code
			$('#admDateFormQ')[0].repor.value = repor
			$('#admDateFormQ')[0].pageNum.value = 1;
			pagingListQ();
			
		});//===================end 리스트 호출 버튼================== 끝!
		
		
		//===========리스트 ajax 호출==========
		function pagingListQ() {
			var str ;		
			str = $('#admDateFormQ').serialize();
			console.log(str);
			$.ajax({
				url : 'admQlistCode',
				method : 'post',
				data :str,
				//contentType : 'application/json',
				success : function(result) {
					if(result.list == ''){
						
						$("#myTableQ").empty();
						$("#paginationQ").empty();
						$("#myTableQ").append("<tr><td colspan='4' align='center'>데이터가 없습니다.</td></tr>");
					}else {
						viewReviewListQ(result.list);
						viewPageQ(result.page);
						
					};
				}
			});
		}//===========end  리스트 ajax 호출========== 끝!
			
		//==============================페이징 처리==========================
		function viewPageQ(page) {
			console.log(page);
						
			var nav =  `<nav class="blog-pagination justify-content-center d-flex">
			<ul class="pagination">`
			if(page.prev) {
				nav += `<li class="page-item">
				<a href="javascript:goPageQ(\${page.startPage-1})" class="page-link"
					aria-label="Previous">
					<span aria-hidden="true">
						<span class="fa fa-angle-left"></span>
					</span></a>
				</li>`
			}
				for ( var i=page.startPage ; i <=  page.endPage; i++){
					nav += `<li class="page-item \${page.pageNum == i ? 'active' : '' }"><a
								href="javascript:goPageQ(\${i})" class="page-link">\${i}</a>
								</li>`
				}
				
			if(page.next){
				nav += `<li class="page-item"><a href="javascript:goPageQ(\${page.endPage+1})"
					class="page-link" aria-label="Next">
				<span aria-hidden="true">
					<span class="fa fa-angle-right"></span>
				</span></a>
		</li>`
		
			}
				
			nav += `</ul></nav>`
			$('#paginationQ').html(nav);
			
		}
			
		function goPageQ(pa) {
			$('#admDateFormQ')[0].pageNum.value = pa;
			pagingListQ();
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
            $("#fromDateQ").datepicker();
            $("#toDateQ").datepicker();

            /* $('#fromDate').datepicker('setDate', 'today');
            $('#toDate').datepicker('setDate', '+1D'); // -1D:하루전  -1M : 한달전 */
	    	pagingListQ();
        });// =============end 날짜 검색 ============== 끝!
        //============================================================================QNA 리스트 그리기 끝===================================================
		
		
		
		
		