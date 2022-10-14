<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<ul class="pages">
    <c:if test="${(page.totalPages > 2) && !page.first}">
        <li><a href="?page=1"><i class="fa fa-angle-double-left"></i></a></li>
    </c:if>
    <c:forEach items="${pages}" varStatus="status" var="idx">
        <li class="${(idx - 1 == page.number)? 'active': ''}">
            <c:if test="${idx - 1 == page.number}">
                <a href="#"> ${idx}</a>
            </c:if>
            <c:if test="${idx - 1 != page.number}">
                <a href="?page=${idx}">
                        ${idx}
                </a>
            </c:if>
        </li>
    </c:forEach>
    <c:if test="${(page.totalPages > 2) && !page.last}">
        <li><a href="?page=${page.totalPages}"><i class="fa fa-angle-double-right"></i></a></li>
    </c:if>
</ul>
