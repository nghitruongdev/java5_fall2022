<%--
  Created by IntelliJ IDEA.
  User: nghipc
  Date: 17/09/2022
  Time: 18:14
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>--%>
<%--<%@ taglib uri="https://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>--%>
<html>
<head>
    <title>Lab02</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
</head>
<body class="">
<div class="padding">
    <div class="container d-flex justify-content-center mb-3">
        <!--form mask starts-->
        <div class="card shadow container-fluid">
                <h4 class="card-title mt-3">Thông tin sản phẩm</h4>
            <div class="card-body">
<%--                <p class="card-description">Nhập vào tên và giá sản phẩm</p>--%>
                <form class="forms-sample" action="/product/add" method="post">
                    <div class="form-group row">
                        <div class="col">
                            <label>Tên sản phẩm:</label> <input class="form-control"
                                                               value="" name="name">
                        </div>
                        <div class="col">
                            <label>Giá sản phẩm:</label> <input type="number" step="0.01" min="0" class="form-control"
                                                             value="" name="price">
                        </div>
                        <div class="col-1 d-flex mt-auto">
                    <button class="btn btn-success  mx-auto">Save</button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="container">
                <div class="">
                    <table class="table table-bordered mx-auto shadow">
                        <thead class="font-weight-bold text-center bg-success bg-opacity-50">
                        <tr>
                            <td>Tên sản phẩm</td>
                            <td>Giá sản phẩm</td>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>Iphone 13</td>
                            <td>1000</td>
                        </tr>
                        <tr>
                            <td>Iphone 13 Pro</td>
                            <td>1100</td>
                        </tr>
                        <tr>
                            <td>Iphone 13 Pro Max</td>
                            <td>1200</td>
                        </tr>
                       <c:forEach items="${list}" var="product">
                        <tr>
                            <td>${product.name}</td>
                            <td>${product.price}</td>
                        </tr>
                       </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

        </div>
        <!--form mask ends-->
    </div>

</div>
</body>
</html>
