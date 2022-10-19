<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header class="">
    <nav class="navbar navbar-expand-lg ">
        <div class="container">
            <a class="navbar-brand" href="${isHome? '#' : '/'}">
                <h2>VN<em>CO</em></h2>
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive"
                    aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav w-100 pr-5">
                    <li class="nav-item ${isHome? 'active': ''}">
                        <a class="nav-link" href="${isHome? '#' : '/'}">Home
                            <span class="sr-only">(current)</span>
                        </a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown"
                           aria-expanded="false">
                            Categories
                        </a>
                        <div class="dropdown-menu">
                            <c:forEach items="${categories}" var="item" varStatus="status">
                                <a href="/categories/${item.id}" class="dropdown-item small">${item.name}</a>
                            </c:forEach>
                        </div>
                        </a>
                    </li>
                    <li class="nav-item ${ isProduct ?'active': ''}">
                        <a class="nav-link" href="${isProduct? '#' : '/categories/all'}">Our Products</a>
                    </li>
                    <li class="nav-item ${ isAbout ?'active': ''}">
                        <a class="nav-link" href="${isAbout? '#' : '/about'}">About Us</a>
                    </li>
                    <li class="nav-item ${ isContact ?'active': ''}">
                        <a class="nav-link" href="${isContact? '#' : '/contact'}">Contact Us</a>
                    </li>
                    <li class="nav-item ml-auto mt-2 position-relative">
                        <a href="/cart/view" class="nav-icon-link">
                            <span class="fa fa-cart-plus nav-icon"></span>
                            <span id="cart-badge" class="badge badge-pill badge-danger text-white">${cart.count}</span>
                        </a>
                    </li>

                    <c:if test="${loggedInUser == null}">
                        <c:import url="../auth/_login.jsp"/>
                    </c:if>
                    <c:if test="${loggedInUser != nul}">
                        <li class="nav-item dropdown text-left mt-2">
                            <a class=" p-0 text-white" href="#" role="button" data-toggle="dropdown"
                               aria-expanded="false">
                                <c:choose>
                                    <c:when test='${loggedInUser.img != null && !loggedInUser.img.equals("")}'>
                                        <img src="/upload/${loggedInUser.img}" alt="${loggedInUser.username}" width="35"
                                             height="35"
                                             class="rounded-circle img-fluid">
                                    </c:when>
                                    <c:otherwise>
                                        <img src="https://github.com/mdo.png" alt="${loggedInUser.username}" width="35"
                                             height="35"
                                             class="rounded-circle img-fluid">
                                    </c:otherwise>
                                </c:choose>
                                    <%--                                <img src="https://github.com/mdo.png" alt="mdo" width="35" height="35"--%>
                                    <%--                                     class="rounded-circle img-fluid">--%>
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
<c:import url="../auth/_login-form.jsp"/>