
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Product Landing Page</title>
</head>
<body>
<ul class="">
    <c:forEach items="${items}" var="item">
        <li class="">${item.name} - $ (${item.price}):
            <form action="/cart/add/${item.id}" method="post" class="d-inline-block">
                <button class="nav-link">Add to cart</button>
            </form>
        </li>
    </c:forEach>
</ul>
<table class="table table-dark table-striped">
    <thead>
    <tr>
        <th scope="col">#</th>
        <th scope="col">Name</th>
        <th scope="col">Price</th>
        <th scope="col">Quantity</th>
        <th scope="col">Amount</th>
        <th scope="col"></th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${cartItems}" var="item">
        <tr>
            <th scope="row">${item.id}</th>
            <td>${item.name}</td>
            <td>${item.price}</td>
            <td>
                <form action="/cart/update" class="" method="post">
                    <input type="hidden" name="id" value="${item.id}">
                    <input type="number" class="" name="qty" step="1" min="1" onblur="this.form.submit()" value="${item.quantity}">
                </form>
            </td>
            <td>${item.price * item.quantity}</td>
            <td>
                <form action="/cart/remove/${item.id}" class="" method="post">
                    <button class="nav-link">Remove</button>
                </form>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<a href="/cart/clear" class="">Clear Cart</a>
<a href="/items/index" class="">Add More</a>
</body>
</html>
