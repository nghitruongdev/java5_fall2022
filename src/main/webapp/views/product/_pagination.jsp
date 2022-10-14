<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<ul class="pages">
    <li class="active"><a href="#">2</a></li>
    <c:forEach var="i" begin="1" end="${totalPages}" varStatus="status">
        <li><a href="#" class="active">${i}</a></li>
    </c:forEach>
    <%--    <li class="active"><a href="#">2</a></li>--%>
    <%--    <li><a href="#">3</a></li>--%>
    <%--    <li><a href="#">4</a></li>--%>
    <%--    <li><a href="#"><i class="fa fa-angle-double-right"></i></a></li>--%>
</ul>