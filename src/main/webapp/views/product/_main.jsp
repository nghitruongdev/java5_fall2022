<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="products">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="filters">
                    <ul>
                        <li class="" data-filter="*">
                            <a href="/products"
                               class="nav-link ${uri.substring(uri.lastIndexOf("/") + 1).startsWith("products")? 'active' : ''}">All
                                Products</a>
                        </li>
                        <c:forEach items="${categories}" var="item" varStatus="status">
                            <li class="">
                                <a href="/products/${item.id}"
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
                                <div class="product-item">
                                    <a href="#"><img src="../../assets/images/product_01.jpg" alt=""></a>
                                        <%--    <a href="#"><img src="${item.img}" alt=""></a>--%>
                                    <div class="down-content">
                                        <a href="#">
                                            <h4>${item.name}</h4>
                                        </a>
                                        <h6>$${item.price}</h6>
                                        <p>${item.description}</p>
                                        <ul class="stars">
                                            <li><i class="fa fa-star"></i></li>
                                            <li><i class="fa fa-star"></i></li>
                                            <li><i class="fa fa-star"></i></li>
                                            <li><i class="fa fa-star"></i></li>
                                            <li><i class="fa fa-star"></i></li>
                                        </ul>
                                        <span>Reviews (24)</span>
                                    </div>
                                </div>
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
