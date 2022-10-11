<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<table class="table">
    <thead>
    <tr>
        <th scope="col">Loại hàng</th>
        <th scope="col">Tổng giá</th>
        <th scope="col">Số sản phẩm</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${items}" var="item" varStatus="status">
        <tr>
            <th scope="row">${item.group.name}</th>
            <td>${item.sum}</td>
            <td>${item.count}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>