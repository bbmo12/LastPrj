<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags/"  prefix="my"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>

</head>

<style>
	#my_section {
		padding: 50px;
	}

	.flex {
		-webkit-box-flex: 1;
		-ms-flex: 1 1 auto;
		flex: 1 1 auto
	}

	.padding {
		padding: 5rem
	}

	.pl-3,
	.px-3 {
		padding-left: 1rem !important
	}

	.table th {
		font-size: 20px;
		font-weight: 500;
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
	
	.card-text {
        display: inline-block;
        width: 200px;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }
</style>

<body>
    <section class="banner-area other-page">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h1>MyPage</h1>
                    <a href="home">Home</a> <span>|</span>
                    <a href="pmemberMyPage">MyPage</a>
                </div>
            </div>
        </div>
    </section>
    <section id="my_section">
        <div class="container" style="max-width: 1350px;">
            <div class="row">
                <div class="col-lg-3">
                    <div class="blog_right_sidebar" style="margin-left: 40px; width: 300px;">
                        <aside class="single_sidebar_widget author_widget">
                            <img class="author_img rounded-circle" src="resources/upload/${pmember.picture}"
                                style="width: 210px" alt="">
                            <div class="br"></div>
                            <h4>${pmember.name }</h4>
                            <div class="br"></div>
                        </aside>
                        <aside class="single_sidebar_widget post_category_widget">
                            <h4 class="widget_title">My menu</h4>
                            <ul class="list cat-list">
                                <li><a href="memberMypage" class="d-flex justify-content-between">
                                        <p>내 프로필</p>
                                    </a></li>
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
                <div class="col-lg-9 posts-list" style="position: relative; top: -20px;">
                    <div class="col-lg-12 col-md-12 blog_details">
                        <div align="center">
                            <h1>신고내역조회</h1>
                        </div>
                        <div class="row">
                            <div class="col-md-12" style="margin: 20px 0 0 -6px;">
                                <div class="table-wrap">
                                    <form action="pmemreport" name="goform">
                                        <input type="hidden" name="pageNum" value="1">
                                        <table class="table table-striped">
                                            <thead>
                                                <tr style="text-align: center;">
                                                    <th>신고회원</th>
                                                    <th>신고내용</th>
                                                    <th>신고날짜</th>
                                                    <th>신고유형</th>
                                                    <th>처리상태</th>
                                                    <th>기각사유</th>
                                                </tr>
                                            </thead>
                                            <tbody style="text-align: center">
                                                <c:if test="${ fn:length(pmemreport) == 0  }">
                                                    <tr>
                                                        <td colspan="6" align="center">조회된 결과가 없습니다.</td>
                                                    </tr>
                                                </c:if>
                                                <c:forEach items="${pmemreport }" var="report">
                                                    <tr>
                                                        <td>${report.reported }</td>
                                                        <td class="card-text">${report.content } </td>
                                                        <td>${report.w_date}</td>
                                                        <td>
                                                            <c:if test="${report.code eq 601}">
                                                                불법 광고 및 홍보
                                                            </c:if>
                                                            <c:if test="${report.code eq 602}">
                                                                음란물/선정성 콘텐츠
                                                            </c:if>
                                                            <c:if test="${report.code eq 603}">
                                                                욕설/비속어/모욕
                                                            </c:if>
                                                            <c:if test="${report.code eq 604}">
                                                                사생활침해
                                                            </c:if>
                                                            <c:if test="${report.code eq 605}">
                                                                게시물 도배
                                                            </c:if>
                                                        </td>
                                                        <td>
                                                            <c:if test="${report.repor eq 701}">
                                                                <label class="badge badge-info">신고대기</label>
                                                            </c:if>
                                                            <c:if test="${report.repor eq 702}">
                                                                <label class="badge badge-danger">신고기각</label>
                                                            </c:if>
                                                            <c:if test="${report.repor eq 703}">
                                                                <label class="badge badge-success">신고승인</label>
                                                            </c:if>
                                                        </td>
                                                        <td>
                                                            <c:if test="${report.repor eq 702}">
                                                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter"style="border: none;">
                                                                    사유확인
                                                                </button>
                                                                <!-- Modal -->
                                                                <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"aria-hidden="true">
                                                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                                                        <div class="modal-content">
                                                                            <div class="modal-header">
                                                                                <h3 class="modal-title" id="exampleModalLongTitle">신고기각사유</h3>
                                                                                <button type="button" class="close" data-dismiss="modal"aria-label="Close">
                                                                                    <span aria-hidden="true">&times;</span>
                                                                                </button>
                                                                            </div>
                                                                            <div class="modal-body">
                                                                                ${report.state }
                                                                            </div>
                                                                            <div class="modal-footer">
                                                                                <button type="button" class="btn btn-primary"data-dismiss="modal">확 인</button>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </c:if>
                                                        </td>
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
    </section>
    <script>
        function go_page(p) {
            goform.pageNum.value = p;
            goform.submit();
        }
    </script>
</body>

</html>