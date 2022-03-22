	// 아코디언 함수
	$(document).on("click", ".que", function() {
		$(this).next(".anw").stop().slideToggle(300);
		$(this).toggleClass('on').siblings().removeClass('on');
		$(this).next(".anw").siblings(".anw").slideUp(300); // 1개씩 펼치기
	})//end 아코디언 함수
	
	

	
	
	//==================================================================================일반회원에 관한 JS
	//======================enter 키===================
	function admMemberListBtn() {
		var input;
		input = $("#admMemberListInput").val();
		
		if( input === 'one' ){
			
			$("#admMemberListInput").val('two'); //버튼 클릭 체크
			
			
			
			let htmladmMemberList;
			htmladmMemberList = `<form id="admDateForm" onsubmit="return false"
				onkeypress="eventkey();">
				<input type="hidden" name="code">
				<code>가입일 검색</code>
				&nbsp;&nbsp;&nbsp;&nbsp; <input type="hidden" name="pageNum"
					value="1"> from : <input type="text" id="fromDate"
					name="fromDate">&nbsp;&nbsp; to : <input type="text"
					id="toDate" name="toDate"> <br>
				<code>이름,아이디로 검색</code>
				&nbsp;&nbsp;&nbsp;&nbsp; <select id="key" name="key">
					<option value="" selected>전 체</option>
					<option value="name">이름</option>
					<option value="m_id">아이디</option>
				</select> <input type="text" id="data" name="data" size="20">&nbsp;
				<button type="submit" onclick="pagingList();"
					class="btn btn-default">
					<i class="fa fa-search"></i>
				</button>
				<input type="reset">
			</form>
			<code>조건 별 검색</code>
			&nbsp;&nbsp;&nbsp;&nbsp;
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
				class="btn btn-link btn-rounded btn-fw codep" id="petN"
				data-code="102">탈퇴한 회원</button>
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
			<div id="pagination"></div>`;
			$(".admMemberListDiv").append(htmladmMemberList);
			
			
			pagingList(); //회원 목록 ajax 함수 호출
			
		
		} else {
			$("#admMemberListInput").val('one'); // 버튼 클릭 체크
			$(".admMemberListDiv").empty(); // 아코디언이 닫히면서  해당 역역 지워버림 
		};
		
		}; // 일반회원 목록 버튼 끝
	
	
	
	
	
	function eventkey() {
		if (event.keyCode == 13) {
			pagingList();
		} else {
			return false;
		}
	}//====================end enter 키================
	
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
				
				
				if(result[i].startDate != null){
					
				
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
						
					} else if (result[i].startDate == null ) {
						console.log(result[i].endDate);
						$("#myTable").append("<tr><td align='center' colspan='4'>"+result[i].endDate+"일 탈퇴한 회원입니다</td></tr>");
					
								}
							}) // end each.
							
			
		}
		//=====================  end리스트 만드는 함수 ====================
		 
	
	
	
	
	//==================================================================================일반회원에 관한 JS     
	function admPmemberListBtn() {
			var input;
			input = $("#admPmemberListInput").val();
			
			if( input === 'one' ){
				
				$("#admPmemberListInput").val('two'); //버튼 클릭 체크
				
				let htmladmPmemberList;
				htmladmPmemberList = `<form id="admDateFormP" onsubmit="return false"
					onkeypress="eventkeyP();">
					<input type="hidden" name="code">
					<code>가입일 검색</code>
					&nbsp;&nbsp;&nbsp;&nbsp; <input type="hidden" name="pageNum"
						value="1"> from : <input type="text" id="fromDateP"
						name="fromDate">&nbsp;&nbsp; to : <input type="text"
						id="toDateP" name="toDate"> <br>
					<code>이름,아이디로 검색</code>
					&nbsp;&nbsp;&nbsp;&nbsp; <select id="key" name="key">
						<option value="" selected>전 체</option>
						<option value="name">이름</option>
						<option value="p_id">아이디</option>
					</select> <input type="text" id="data" name="data" size="20">&nbsp;
					<button type="submit" onclick="pagingListP();"
						class="btn btn-default">
						<i class="fa fa-search"></i>
					</button>
					<input type="reset">
				</form>
				<code>조건 별 검색</code>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<button type="button"
					class="btn btn-link btn-rounded btn-fw codepP" id="key"
					data-code="">전체</button>
				<button type="button"
					class="btn btn-link btn-rounded btn-fw codepP" id="doctor"
					data-code="100">수의사</button>
				<button type="button"
					class="btn btn-link btn-rounded btn-fw codepP" id="trainer"
					data-code="101">훈련사</button>
				<button type="button"
					class="btn btn-link btn-rounded btn-fw codepP" id="groomer"
					data-code="103">미용사</button>
				<button type="button"
					class="btn btn-link btn-rounded btn-fw codepP" id="petsitter"
					data-code="102">펫시터</button>
				<button type="button"
					class="btn btn-link btn-rounded btn-fw codepP" id="petN"
					data-code="104">탈퇴한 회원</button>
				</p>
				<table class="table table-hover">
					<thead>
						<tr>
							<th>이름</th>
							<th>아이디</th>
							<th>가입일</th>
							<th>파트너 쉽</th>
							<th>조회</th>
						</tr>
					</thead>
					<tbody id="myTableP">

					</tbody>
				</table>
				<div id="paginationP"></div>`;
				$(".admPmemberListDiv").append(htmladmPmemberList);
				
				
				pagingListP(); //회원 목록 ajax 함수 호출
				
				
				
				
				
				
				
				
				
			} else {
				
				$("#admPmemberListInput").val('one'); // 버튼 클릭 체크
				$(".admPmemberListDiv").empty(); // 아코디언이 닫히면서  해당 역역 지워버림 
				
				
			}//end if
			
		}// end admPmemberListBtn()
	
		 //======================enter 키===================
	function eventkeyP() {
		if (event.keyCode == 13) {
			pagingListP();
		} else {
			return false;
		}
	}//====================end enter 키================
     // ===================== 리스트 만드는 함수 ====================
		let viewPmemberListP = function(result) {
			$("#myTableP").empty();
			console.log("result는: " + result);
			$.each(result,function(i) {
				if(result[i].startdate != null){
					
					/* + "<div class='progress'>"
					+ "<div class='progress-bar bg-success' role='progressbar' style='width:"
					+ result[i].c_report
					+ "%' aria-valuenow='70' aria-valuemin='0' aria-valuemax='100'>"
					+ "</div></div>"
					+ "</td><td>" */
						$("#myTableP").append(
														"<tr><td><a onclick='showP()'>"														
														+ result[i].name
														+ "</a></td><td>"
														+ result[i].p_id
														+ "</td><td>"
														+ result[i].startdate
														+ "</td><td>"
														+ result[i].f_content
														+ "</td></tr>" );
			} else if (result[i].startdate == null ) {
				console.log(result[i].enddate);
				$("#myTable").append("<tr><td align='center' colspan='4'>"+result[i].enddate+"일 탈퇴한 회원입니다</td></tr>");
			
						}
							}) // end each.
							
			

		}//=====================  end리스트 만드는 함수 ====================
     
		
		// =================회원 단건 조회 Modal===================
		
			function showP() {
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
		function goDetailP(e) {
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
		$(".codepP").on('click', function() {
			var code = $(this).data('code');
			$('#admDateFormP')[0].code.value = code
			$('#admDateFormP')[0].pageNum.value = 1;
			pagingListP();
			
		});//===================end 리스트 호출 버튼================== 
		
		
		//===========리스트 ajax 호출==========
		function pagingListP() {
			var str = $('#admDateFormP').serialize();
			$.ajax({
				url : 'admPlistCode',
				method : 'post',
				data :str,
				//contentType : 'application/json',
				success : function(result) {
					console.log("리절트리스트는 :"+result.list);
					console.log("리절트페이지는 : " + result.page);
					viewPmemberListP(result.list);
					viewPageP(result.page);
				}
			});
		}//===========end  리스트 ajax 호출==========
			
		//==================페이징 처리===================
		function viewPageP(page) {
			console.log("page는 :"+page);
			var nav =  `<nav class="blog-pagination justify-content-center d-flex">
			<ul class="pagination">`
			if(page.prev) {
				nav += `<li class="page-item">
				<a href="javascript:goPageP(\${page.startPage-1})" class="page-link"
					aria-label="Previous">
					<span aria-hidden="true">
						<span class="fa fa-angle-left"></span>
					</span></a>
				</li>`
			}
				for ( var i=page.startPage ; i <=  page.endPage; i++){
					nav += `<li class="page-item \${page.pageNum == i ? 'active' : '' }"><a
								href="javascript:goPageP(\${i})" class="page-link">\${i }</a>
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
			$('#paginationP').html(nav);
			
		}// end viewPage
			
		function goPageP(pa) {
			console.log("pa 는 :" + pa);
			$('#admDateFormP')[0].pageNum.value = pa;
			pagingListP();
		}
		
		//======================end 페이징 처리=================
			
			
			
			
			// =============날짜 검색 ==============
     
        // =============end 날짜 검색 ==============
     // ==================================날짜 검색 ==============================