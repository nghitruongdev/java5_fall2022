<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="products">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="filters">
                    <ul>
                        <li class="" data-filter="*">
                            <a href="/categories/all"
                               class="nav-link ${uri.substring(uri.lastIndexOf("/") + 1).startsWith("categories")? 'active' : ''}">All
                                Products</a>
                        </li>
                        <c:forEach items="${categories}" var="item" varStatus="status">
                            <li class="">
                                <a href="/categories/${item.id}"
                                   class="nav-link ${uri.substring(uri.lastIndexOf("/") + 1).startsWith(item.id)? 'active' : ''}">
                                        ${item.name}
                                </a>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            <div class="">
            </div>
            <div class="col-md-12">
                <div class="filters-content">
                    <!-- add class: des | dev | gra | all-->
                    <div class="row">
                        <c:forEach items="${products}" var="item">
                            <div class="col-md-4">
                                <c:set value="${item}" var="item" scope="request"/>
                                <c:import url="../product/_product-card.jsp"/>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <c:import url="_pagination.jsp"/>
            </div>
        </div>
    </div>
</div>
