<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags/"  prefix="my"%>
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

    body {
        background-color: #f9f9fa
    }

    .flex {
        -webkit-box-flex: 1;
        -ms-flex: 1 1 auto;
        flex: 1 1 auto
    }

   
    .padding {
        padding: 5rem
    }

    .card {
        box-shadow: none;
        -webkit-box-shadow: none;
        -moz-box-shadow: none;
        -ms-box-shadow: none
    }

    .pl-3,
    .px-3 {
        padding-left: 1rem !important
    }

    .card {
        position: relative;
        display: flex;
        flex-direction: column;
        min-width: 0;
        word-wrap: break-word;
        background-color: #fff;
        background-clip: border-box;
        border: 1px solid #d2d2dc;
        border-radius: 0
    }

    .card .card-title {
        color: #000000;
        margin-bottom: 0.625rem;
        text-transform: capitalize;
        font-size: 0.875rem;
        font-weight: 500
    }

    .card .card-description {
        margin-bottom: .875rem;
        font-weight: 400;
        color: #76838f
    }


    .table-responsive {
        display: block;
        width: 100%;
        overflow-x: auto;
        -webkit-overflow-scrolling: touch;
        -ms-overflow-style: -ms-autohiding-scrollbar
    }

    .table th {
        font-size: 20px;
        font-weight: bold;
    }

    .table {
        width: 100%;
        max-width: 100%;
        margin-bottom: 1rem;
        background-color: transparent
    }

    .table td {
        font-size: 16px;
        padding: .875rem 0.9375rem
    }

    .badge {
        font-size: 12px;
        line-height: 1;
        padding: .375rem .5625rem;
        font-weight: normal
    }
    .badge-info{
        background-color: cornflowerblue;
        border: none;
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
        <div>
            <div class="row" style="width: 1500px; margin-left: 13em;">
                <div>
                    <div class="blog_right_sidebar">
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
                                <li><a href="pmemberMyPage" class="d-flex justify-content-between">
                                        <p>내 프로필</p>
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
                                <li><a href="#" class="d-flex justify-content-between">
                                        <p>로그아웃</p>
                                    </a></li>
                                <li><a href="#" class="d-flex justify-content-between">
                                        <p>회원탈퇴</p>
                                    </a></li>
                            </ul>
                        </aside>
                    </div>
                </div>
                <div class="col-lg-9 posts-list" style="position: relative; top: -20px;">
                    <div class="col-lg-12 col-md-12 blog_details" style="width: 100%;">
                        <div align="center">
                            <h1>신고내역조회</h1>
                        </div>
                        <div class="page-content page-container" id="page-content" style="margin-top: 20px;">
                            <div class="row container d-flex justify-content-center">
                                <div class="card" style="width: 100%">
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <form action="pmemcounsel" name="goform">
                                                <input type="hidden" name="pageNum" value="1">
                                                <table id="htmltable" class="table">
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
                                                        <c:forEach items="${pmemreport }" var="report">
                                                            <tr>
                                                                <td>${report.reported }</td>
                                                                <td>${report.content } </td>
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
                                                                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter" style="border: none;">
                                                                            사유확인
                                                                        </button>
                                                                        <!-- Modal -->
                                                                        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                                                            <div class="modal-dialog modal-dialog-centered" role="document">
                                                                                <div class="modal-content">
                                                                                    <div class="modal-header">
                                                                                        <h3 class="modal-title" id="exampleModalLongTitle">신고기각사유</h3>
                                                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                                            <span aria-hidden="true">&times;</span>
                                                                                        </button>
                                                                                    </div>
                                                                                    <div class="modal-body">
                                                                                        ${report.state }
                                                                                    </div>
                                                                                    <div class="modal-footer">
                                                                                        <button type="button" class="btn btn-primary" data-dismiss="modal">확 인</button>
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
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <my:nav jsFunc="go_page" page="${page}" />
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