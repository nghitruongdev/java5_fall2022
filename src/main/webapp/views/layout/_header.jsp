<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header class="">
    <nav class="navbar navbar-expand">
        <div class="container">
            <a class="navbar-brand" href="/">
                <h2>VN<em>CO</em></h2>
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive"
                    aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav w-100 pr-5">
                    <li class="nav-item ${isAbout || isProduct || isContact? '': 'active'}">
                        <a class="nav-link" href="/">Home
                            <span class="sr-only">(current)</span>
                        </a>
                    </li>
                    <li class="nav-item ${ isProduct ?'active': ''}">
                        <a class="nav-link" href="/products">Our Products</a>
                    </li>
                    <li class="nav-item ${ isAbout ?'active': ''}">
                        <a class="nav-link" href="/about">About Us</a>
                    </li>
                    <li class="nav-item ${ isContact ?'active': ''}">
                        <a class="nav-link" href="/contact">Contact Us</a>
                    </li>
                    <li class="nav-item ml-auto mt-2 position-relative">
                        <a href="#" class="nav-icon-link">
                            <span class="fa fa-cart-plus nav-icon"></span>
                            <span id="cart-badge" class="badge badge-pill badge-danger text-white">1</span>
                        </a>
                    </li>

                    <c:if test="${user == null}">
                        <c:import url="../auth/_login.jsp"/>
                    </c:if>
                    <c:if test="${user != nul}">
                        <li class="nav-item dropdown text-left mt-2">
                            <a class=" p-0 text-white" href="#" role="button" data-toggle="dropdown"
                               aria-expanded="false">
                                <img src="https://github.com/mdo.png" alt="mdo" width="35" height="35"
                                     class="rounded-circle img-fluid">
                            </a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="#">Action</a>
                                <a class="dropdown-item" href="#">Another action</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="/account/logout">Sign out</a>
                            </div>
                        </li>
                    </c:if>
                </ul>
            </div>
        </div>
    </nav>
</header>
<c:import url="../auth/_login-form.jsp" />