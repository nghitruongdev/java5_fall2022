<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<table class="table">
    <thead>
    <tr>
        <th scope="col">#</th>
        <th scope="col">Name</th>
        <th scope="col"></th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${items}" var="item" varStatus="status">
        <tr>
            <th scope="row">${item.id}</th>
            <td>${item.name}</td>
            <td>
                <a href="/category/edit/${item.id}">Edit</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>