<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="product-item">
    <a href="#"><img src="assets/images/product_01.jpg" alt=""></a>
    <%--    <a href="#"><img src="${item.img}" alt=""></a>--%>
    <div class="down-content">
        <a href=/cart/add/${item.id}"">
            <h4>${item.name}</h4>
        </a>
        <h6><fmt:formatNumber value="${item.price}"
                              type="CURRENCY" currencyCode="VND"/></h6>
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
