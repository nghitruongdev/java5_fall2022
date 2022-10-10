<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<table class="table">
    <table class="table">
        <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">Name</th>
            <th scope="col">Price</th>
            <th scope="col">Date</th>
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
    <div class="d-flex">
        <a href="/product/page?p=0" class="">First</a>
        <a href="/product/page?p=${page.number - 1}" class="">Previous</a>
        <a href="/product/page?p=${page.number + 1}" class="">Next</a>
        <a href="/product/page?p=${page.totalPages - 1}" class="">Last</a>
    </div>
    <ul>
        <li class="">Số thực thể hiện tại: ${page.numberOfElements}</li>
        <li class="">Trang số: ${page.number}</li>
        <li class="">Kích thước trang: ${page.size}</li>
        <li class="">Tổng số thực thể: ${page.totalElements}</li>
        <li class="">Tổng số trang: ${page.totalPages}</li>
    </ul>
