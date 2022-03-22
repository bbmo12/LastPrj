<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib tagdir="/WEB-INF/tags/" prefix="my"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<style>
h1{
	font-family: 'Binggrae';
	color: white;
}

h2{
	font-family: 'Binggrae';
	font-weight: 700;
}

	#banner_content{
		color: white;
	}
	.swal2-content{
		display: none;
	}
* {
	box-sizing: border-box;
}

.que:first-child {
	border-top: 1px solid black;
}

.que {
	position: relative;
	padding: 17px 0;
	cursor: pointer;
	font-size: 14px;
	border-bottom: 1px solid #dddddd;
}

.que::before {
	display: inline-block;
	content: 'Q';
	font-size: 14px;
	color: #006633;
	margin-right: 5px;
}

.que.on>span {
	font-weight: bold;
	color: #006633;
}

.anw {
	display: none;
	overflow: hidden;
	font-size: 14px;
	background-color: #f4f4f2;
	padding: 27px 0;
}

.anw::before {
	display: inline-block;
	content: 'A';
	font-size: 14px;
	font-weight: bold;
	color: #666;
	margin-right: 5px;
}
</style>
</head>
<body>
	<br><br><br><br><br>
    <section class="banner-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-10" style="margin-left: 50px;">
                <br><br><br><br><br>
                    <h1>공지사항</h1>
					<h3 style="margin-top:5%;">우리 사이트에 관한 모든 궁금증을 해결해드립니다!</h3>
                   <sec:authorize access="hasRole('ADMIN')">
					<div class="boardForm">
						<a href="boardForm" class="genric-btn info circle btn-lg" id="qna-button">공지사항 작성하기</a>
					</div>
				</sec:authorize>
                    <br>
                </div>
            </div>
        </div>
    </section>
	<section class="department-area section-padding4">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 offset-lg-3">
					<div class="section-top text-center">
						<h2>공지사항</h2>
						<p>반려동물을 사랑하는 마음은 물론, 반려동물 관련 자격증 또는 전문 지식을 갖춘 분들이 활동하고 있습니다.
							반려동물과 보호자님 모두의 행복한 동행을 위해 든든한 파트너가 되어드립니다.</p>
					</div>
				</div>
			</div>
			<c:if test="${boardList[0].b_no eq null}">
				<tr>
					<td colspan="6" align="center">데이터가 존재하지 않습니다.</td>
				</tr>
			</c:if>

			<div id="Accordion_wrap">
				<c:if test="${boardList ne null }">
					<c:forEach items="${boardList }" var="boards">
						<div class="que">
							<span>${boards.title }</span>
						</div>
						<div class="anw">
							<span>${boards.content }</span> <span>${boards.w_date }</span>
						</div>
					</c:forEach>
				</c:if>
			</div>

			<!-- 검색 -->
			<div class="blog_right_sidebar" id="sidebar">
				<form id="frm" action="" method="post" onsubmit="return false"
					onkeypress="eventkey();">

					<aside class="single_sidebar_widget search_widget"
						style="display: flex;">
						<select id="search" name="search">
							<option value="all" selected>전 체</option>
							<option value="title">제 목</option>
							<option value="content">내 용</option>
						</select>
						<div class="input-group">
							<input type="text" class="form-control" id="data" name="data">
							<span class="input-group-btn">
								<button class="btn btn-default" type="button"
									onclick="searchData()">
									<i class="fa fa-search"></i>
								</button>
							</span>
						</div>
					</aside>

					<select id="search" name="search">
						<option value="all" selected>전 체</option>
						<option value="title">제 목</option>
						<option value="content">내 용</option>
					</select> <input type="text" id="data" name="data" size="20">&nbsp;
					<button type="button" onclick="searchData()">검 색</button>

				</form>
			</div>
		</div>
	</section>
</body>
<script>
	// enter 키 : 이상함
	function eventkey() {
		if (event.keyCode == 13) {
			searchData();
		} else {
			return false;
		}
	} //end enter 키

	//검색 데이터 호출
	function searchData() {
		var let = $("#search option:selected").val();
		var le = $("#data").val();
		console.log(let);
		console.log(le);
		
		$.ajax({
			url : "admBoardSearch",
			type : "post",
			data : {
				"key" : $("#search option:selected").val(),
				"data" : $("#data").val()
			},
			dataType : "json",
			success : function(result) {
				console.log(result);
				if (result.length > 0) {
					htmlView(result);
				} else {
					alert("조건에 맞는 결과 없음")
				}
			}
		});
	}// end 검색 데이터 호출

	//검색 된 데이터 테이블 생성
	function htmlView(data) {
		console.log(data)
		$('#Accordion_wrap').empty();

		$.each(data, function(i) {
			console.log(data[i].title)
			$('#Accordion_wrap').append(
					"<div class='que'><span>" + data[i].title
							+ "</span></div><div class='anw'>"
							+ data[i].content + data[i].w_date + "</div>");
		});
	}//end 검색 된 데이터 테이블 생성

	// 아코디언 함수
	$(document).on("click", ".que", function() {
		$(this).next(".anw").stop().slideToggle(300);
		$(this).toggleClass('on').siblings().removeClass('on');
		$(this).next(".anw").siblings(".anw").slideUp(300); // 1개씩 펼치기
	})//end 아코디언 함수

	
	
</script>

</html>