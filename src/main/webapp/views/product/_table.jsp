<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<table class="table">
    <thead>
    <tr>
        <th scope="col"><a href="/product/index" class="">ID</a></th>
        <th scope="col"><a href="/product/index">Name</a></th>
        <th scope="col"><a href="/product/index">Price</a></th>
        <th scope="col"><a href="/product/index">Date</a></th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${items}" var="item" varStatus="status">
        <tr>
            <th scope="row">${item.id}</th>
            <td>${item.name}</td>
            <td>${item.price}</td>
            <td>${item.createdate}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>