<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
    <!-- Navbar Brand-->
    <a class="navbar-brand ps-3" href="#">VNCO</a>
    <!-- Sidebar Toggle-->
    <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i
            class="fas fa-bars"></i></button>
    <!-- Navbar Search-->
    <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
        <div class="input-group">
            <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..."
                   aria-describedby="btnNavbarSearch"/>
            <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button>
        </div>
    </form>
    <!-- Navbar-->
    <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
        <li class="nav-item dropdown">
            <a class="nav-link p-0 text-white" href="#" role="button" data-bs-toggle="dropdown"
               aria-expanded="false">
                <c:choose>
                    <c:when test='${loggedInUser.img != null && !loggedInUser.img.equals("")}'>
                        <img src="/upload/${loggedInUser.img}" alt="mdo" width="35" height="35"
                             class="rounded-circle img-fluid">
                    </c:when>
                    <c:otherwise>
                        <img src="https://github.com/mdo.png" alt="mdo" width="35" height="35"
                             class="rounded-circle img-fluid">
                    </c:otherwise>
                </c:choose>
            </a>
            <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="#">Action</a></li>
                <li><a class="dropdown-item" href="#">Another action</a></li>
                <li><a class="dropdown-item" href="#">Something else here</a></li>
            </ul>
            <%--            <div class="dropdown-menu">--%>
            <%--                <a class="dropdown-item" href="#">Action</a>--%>
            <%--                <a class="dropdown-item" href="#">Another action</a>--%>
            <%--                <div class="dropdown-divider"></div>--%>
            <%--                <a class="dropdown-item" href="/account/logout">Sign out</a>--%>
            <%--            </div>--%>
        </li>
    </ul>
    </li>
    </ul>
</nav>
