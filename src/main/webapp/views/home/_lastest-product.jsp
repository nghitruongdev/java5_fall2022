<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="latest-products">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="section-heading">
                    <h2>Latest Products</h2>
                    <a href="/categories/all">view all products <i class="fa fa-angle-right"></i></a>
                </div>
            </div>
            <c:forEach items="${products}" varStatus="status" var="item">
                <div class="col-md-4">
                    <div class="product-item">
                        <a href="/cart/add/${item.id}"><img src="../../views/images/sp/${item.img}" alt=""></a>
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