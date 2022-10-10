<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: nghipc
  Date: 07/10/2022
  Time: 18:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <c:import url="../common-link.jsp"/>
    <title>LAB 6 - SEARCHING</title>
</head>
<body>
<h3>SEARCH BY PRICE</h3>
<div class="">
    <form action="/product/search" class="row">
        <div class="col-10">
            <div class="row">
                <div class="mb-3 col-6">
                    <label for="price-min" class="form-label">Min Price</label>
                    <input type="text" class="form-control" id="price-min" placeholder="Min price?">
                </div>
                <div class="mb-3 col-6">
                    <label for="price-max" class="form-label">Max Price</label>
                    <input type="text" class="form-control" id="price-max" placeholder="Max price?">
                </div>
            </div>
        </div>
        <div class="mt-3 col-2 align-items-center d-flex">
            <button class="btn btn-primary">Search</button>
        </div>
    </form>
</div>

<c:import url="_table.jsp"/>
${pageNumber}
</body>
</html>
