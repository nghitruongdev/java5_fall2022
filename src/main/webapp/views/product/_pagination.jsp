<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<ul class="pages">
    <c:if test="${(page.totalPages > 2) && !page.first}">
        <li><a href="?page=1"><i class="fa fa-angle-double-left"></i></a></li>
    </c:if>
    <c:forEach items="${pages}" begin="${begin}" end="${end}" varStatus="status">
        <li class="${(status.index == page.number)? 'active': ''}">
            <c:if test="${status.index == page.number}">
                <a href="#"> ${status.index + 1}</a>
            </c:if>
            <c:if test="${status.index != page.number}">
                <a href="?page=${status.index + 1}">
                        ${status.index + 1}
                </a>
            </c:if>
        </li>
    </c:forEach>
    <c:if test="${(page.totalPages > 2) && !page.last}">
        <li><a href="?page=${page.totalPages}"><i class="fa fa-angle-double-right"></i></a></li>
    </c:if>
</ul>
