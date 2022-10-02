<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header class="p-3 border-bottom shadow">
    <%--    <p id="another-div" class="visually-hidden">${message}</p>--%>
    <div class="container">
        <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
            <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-dark text-decoration-none">
            </a>

            <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                <li><a href="#" class="nav-link px-2 link-secondary">NGHITV</a></li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle fw-bold fs-larger text-dark" href="#" role="button" data-bs-toggle="dropdown"
                       aria-expanded="false">
                        Sản phẩm
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">Điện thoại</a></li>
                        <li><a class="dropdown-item" href="#">Laptop</a></li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>
                        <li><a class="dropdown-item" href="#">Phụ kiện di động</a></li>
                    </ul>
                </li>
            </ul>
            <div class="fw-bold fs-larger mx-4" id="cart-div">
                <div type="button" class=" position-relative">
                    <a href="/cart/view" class="position-relative">
                        <i class="bi bi-cart-fill" style="font-size: 2rem; color: rgb(44,103,169);"></i>
                        <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
                         <span class="visually-hidden">Total count in cart</span>
                            ${cart.count}</span>
                    </a>

                </div>
            </div>
            <c:if test="${user == null}">
                <c:import url="login.jsp"/>
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
                        <li><a class="dropdown-item" href="/account/logout">Sign out</a></li>
                    </ul>
                </div>
            </c:if>
        </div>
    </div>
</header>

