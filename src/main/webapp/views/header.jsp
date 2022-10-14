<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<nav class="navbar navbar-expand bg-light">
    <div class="container-fluid">
        <a class="navbar-brand fw-bold text-danger" href="/">NghiTV</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
                aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavDropdown">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/">Home</a>
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
                            <li><a class="dropdown-item" href="#">${item.name}</a></li>
                        </c:forEach>
                    </ul>
                </li>
            </ul>
        </div>
        <c:if test="${user == null}">
            <a href="/account/login" class="btn btn-primary col-2" style="min-width: 80px; max-width: 100px;">Sign
                In</a>
        </c:if>
        <c:if test="${user != nul}">
            <div class="dropdown text-end">
                <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" data-bs-toggle="dropdown"
                   aria-expanded="false">
                    <img src="https://github.com/mdo.png" alt="mdo" width="50" height="48" class="rounded-circle">
                </a>
                <ul class="dropdown-menu text-small">
                    <li><a class="dropdown-item" href="#">Giỏ hàng</a></li>
                    <li>
                        <hr class="dropdown-divider">
                    </li>
                    <li><a class="dropdown-item" href="/logout">Sign out</a></li>
                </ul>
            </div>
        </c:if>
    </div>
</nav>
<script>
    if ("${param.get("error")}" != null && "${param.get("error")}" != "") {
        Swal.fire(
            'Error!',
            '${param.get("error")}',
            'error'
        )
    }
</script>
