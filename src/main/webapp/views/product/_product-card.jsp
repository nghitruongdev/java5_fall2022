<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="product-item">
    <a href="#"><img src='/upload/${item.img != null || !item.img.equals("")? item.img : "default.png"}' alt=""></a>
    <div class="down-content">
        <a href="#">
            <h4>${item.name}</h4>
        </a>
        <h6><fmt:formatNumber value="${item.price}"
                              type="CURRENCY" currencyCode="VND"/></h6>
        <p>${item.description}</p>
        <div class="d-flex justify-content-between">
            <ul class="stars">
                <li><i class="fa fa-star"></i></li>
                <li><i class="fa fa-star"></i></li>
                <li><i class="fa fa-star"></i></li>
                <li><i class="fa fa-star"></i></li>
                <li><i class="fa fa-star"></i></li>
            </ul>
            <a class="btn btn-danger" href="/cart/add/${item.id}">Add to cart</a>
        </div>
    </div>
</div>
