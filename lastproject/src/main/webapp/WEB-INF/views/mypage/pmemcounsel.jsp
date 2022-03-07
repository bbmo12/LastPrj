<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

@media ( max-width :991.98px) {
	.padding {
		padding: 1.5rem
	}
}

@media ( max-width :767.98px) {
	.padding {
		padding: 1rem
	}
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

.pl-3, .px-3 {
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

p {
	font-size: 0.875rem;
	margin-bottom: .5rem;
	line-height: .2rem
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
	font-weight: 500;
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
	border-radius: 0;
	font-size: 12px;
	line-height: 1;
	padding: .375rem .5625rem;
	font-weight: normal
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
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
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
                                <li><a href="#" class="d-flex justify-content-between">
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
                <div class="col-lg-9 posts-list">
                    <div class="col-lg-12 col-md-12 blog_details">
                        <div class="page-content page-container" id="page-content">
                            <div class="row container d-flex justify-content-center">
                                <div class="card" style="width: 100%">
                                    <div class="card-body" style="width: 100%">
                                        <div class="table-responsive" style="width: 100%">
                                            <table id="htmltable" class="table">
                                                <thead>
                                                    <tr style="text-align: center;">
                                                        <th>동물이름</th>
                                                        <th>상담회원</th>
                                                        <th>상담내용</th>
                                                        <th>상담상태</th>
                                                        <th>작성일</th>
                                                    </tr>
                                                </thead>
                                                <tbody style="text-align: center">
                                                    <c:forEach items="${pmemcounsel }" var="counsel">
                                                        <tr>
                                                            <td>${counsel.p_name }</td>
                                                            <td>${counsel.m_id } </td>
                                                            <td>${counsel.content}</td>
                                                            <td>
                                                                <c:if test="${counsel.code eq 301}">
                                                                    <label class="badge badge-info">상담요청</label>
                                                                </c:if>
                                                                <c:if test="${counsel.code eq 302}">
                                                                    <label class="badge badge-warning">진행중</label>
                                                                </c:if>
                                                                <c:if test="${counsel.code eq 303}">
                                                                    <label class="badge badge-success">상담완료</label>
                                                                </c:if>
                                                            </td>
                                                            <td>${counsel.w_date }</td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>

</html>