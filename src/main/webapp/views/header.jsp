<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: nghipc
  Date: 12/10/2022
  Time: 18:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar navbar-expand bg-light">
    <div class="container-fluid">
        <a class="navbar-brand fw-bold text-danger" href="#">NghiTV</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
                aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavDropdown">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Features</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                       aria-expanded="false">
                        Categories
                    </a>
                    <ul class="dropdown-menu">
                        <c:forEach items="${categories}" var="item" varStatus="status">
                            <li><a class="dropdown-item" href="/categories/${item.id}">${item.name}</a></li>
                        </c:forEach>
                    </ul>
                </li>
<%--                    ${categories}--%>
            </ul>
        </div>
        <button class="btn btn-primary col-2" style="min-width: 80px; max-width: 100px;">Sign In</button>
    </div>
</nav>
