<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ attribute name="page" type="com.last.prj.pmember.service.PagingVO" required="true"%>
<%@ attribute name="jsFunc" required="false" type="java.lang.String" %>
<c:if test="${empty jsFunc}">
	<c:set var="jsFunc" value="go_page"></c:set>
</c:if>
		<nav class="blog-pagination justify-content-center d-flex">
			<ul class="pagination">
				<c:if test="${page.prev }">
				<li class="page-item">
					<a href="javascript:${jsFunc}(${page.startPage-1})" class="btn btn-outline-secondary"
						aria-label="Previous">
						<span aria-hidden="true">
							<span class="fa fa-angle-left"></span>
						</span></a>
				</li>
				</c:if>
				<c:forEach var="num" begin="${page.startPage }" end="${page.endPage }">
					<li class="page-item ${page.pageNum eq num ? 'active' : '' }"><a
							href="javascript:${jsFunc}(${num})" class="btn btn-outline-secondary">${num }</a>
					</li>
				</c:forEach>
				<c:if test="${page.next }">
				<li class="page-item"><a href="javascript:${jsFunc}(${page.endPage+1})"
						class="btn btn-outline-secondary" aria-label="Next">
						<span aria-hidden="true">
							<span class="fa fa-angle-right"></span>
						</span></a>
				</li>
				</c:if>
			</ul>
		</nav>