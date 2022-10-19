<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <c:import url="../../assets/common-link/common-meta.jsp"/>
    <c:import url="../../assets/common-link/common-css.jsp"/>
    <c:import url="../../assets/common-link/common-bootsrap-5.2.jsp"/>
    <title>Shopping Cart</title>
</head>
<body>
<c:import url="../layout/_header.jsp"/>
<section id="cart-container" class="p-5" style="background-color: rgba(234,244,255,0.75);">
    <div class="container py-5">
        <div class="row d-flex justify-content-center my-4">
            <div class="col-md-8">
                <c:choose>
                    <c:when test='${uri.contains("checkout")}'>
                        <c:import url="_checkout.jsp"/>
                    </c:when>
                    <c:otherwise>
                        <div class="card mb-4">
                            <div class="card-header py-3 d-flex justify-content-between">
                                <h5 class="mb-0"><a href="/categories/all" class="text-body text-decoration-none"><i
                                        class="fas fa-long-arrow-alt-left me-2"></i> &nbsp;Continue shopping</a>
                                </h5>
                                <h5 class="mb-0">Cart - ${cart.size} items</h5>
                            </div>
                            <div class="card-body">
                                <c:if test="${!(cart.size>0)}">
                                    <img src="https://rtworkspace.com/wp-content/plugins/rtworkspace-ecommerce-wp-plugin/assets/img/empty-cart.png"
                                         alt="" class="img-fluid">
                                </c:if>
                                <c:if test="${cart.size>0}">
                                    <c:forEach items="${cart.items}" var="item" varStatus="status">
                                        <!-- Single item -->
                                        <div class="row">
                                            <div class="col-lg-3 col-md-12 mb-4 mb-lg-0">
                                                <!-- Image -->
                                                <div class="bg-image hover-overlay hover-zoom ripple rounded"
                                                     data-mdb-ripple-color="light">
                                                    <img src="/upload/${item.img != null? item.img : 'default.png'}"
                                                         class="w-100" alt="${item.name}"/>
                                                    <a href="#!">
                                                        <div class="mask"
                                                             style="background-color: rgba(251, 251, 251, 0.2)"></div>
                                                    </a>
                                                </div>
                                                <!-- Image -->
                                            </div>

                                            <div class="col-lg-5 col-md-6 mb-4 mb-lg-0">
                                                <!-- Data -->
                                                <p><strong>${item.name}</strong></p>
                                                <p>${item.description}</p>
                                                <form action="/cart/remove/${item.id}" class="" method="post">
                                                        <%--                                                onclick="removeItem(${item.id})"--%>
                                                    <button type="submit"
                                                            class="btn btn-primary btn-sm me-1 mb-2"
                                                            data-mdb-toggle="tooltip" title="Remove item">
                                                        <i class="fas fa-trash"></i>
                                                    </button>
                                                    <button type="button" class="btn btn-danger btn-sm mb-2"
                                                            data-mdb-toggle="tooltip"
                                                            title="Move to the wish list">
                                                        <i class="fas fa-heart"></i>
                                                    </button>
                                                </form>
                                                <!-- Data -->
                                            </div>

                                            <div class="col-lg-4 col-md-6 mb-4 mb-lg-0">
                                                <!-- Quantity -->
                                                <label class="form-label" for="form1">Quantity</label>
                                                <form action="/cart/update" class="" method="post">
                                                    <div class="d-flex mb-4" style="max-width: 300px">
                                                        <button type="button" class="btn btn-primary px-3 me-2"
                                                                onclick="this.parentNode.querySelector('input[type=number]').stepDown()"
                                                                style="background-color: rgb(52,105,215)">
                                                            <i class="fas fa-minus"></i>
                                                        </button>

                                                        <div class="form-outline">
                                                            <input type="hidden" name="id" value="${item.id}">
                                                                <%--                                                        updateItem(this)--%>
                                                            <input id="form1" onblur="this.form.submit()" min="0"
                                                                   name="quantity"
                                                                   step="1"
                                                                   type="number"
                                                                   class="form-control" value="${item.quantity}"/>
                                                        </div>

                                                        <button type="button" class="btn btn-primary px-3 ms-2"
                                                                onclick="this.parentNode.querySelector('input[type=number]').stepUp()"
                                                                style="background-color: rgb(52,105,215)">
                                                            <i class="fas fa-plus"></i>
                                                        </button>
                                                    </div>
                                                </form>

                                                <!-- Quantity -->

                                                <!-- Price -->
                                                <p class="text-start text-md-center">
                                                    <strong><fmt:formatNumber value="${item.price * item.quantity}"
                                                                              type="CURRENCY"
                                                                              currencyCode="VND"/></strong>
                                                </p>
                                                <!-- Price -->
                                            </div>
                                        </div>
                                        <c:if test="${!status.last}">
                                            <!-- Single item -->
                                            <hr class="my-4"/>
                                        </c:if>
                                    </c:forEach>
                                </c:if>
                            </div>
                            <div class="card-footer">
                                <a href="clear" class="text-danger"><i class=" mx-2 bi bi-trash3"></i>Clear All</a>
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="col-md-4">
                <div class="card mb-4">
                    <div class="card-header py-3">
                        <h5 class="mb-0">Summary</h5>
                    </div>
                    <div class="card-body">
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 pb-0">
                                Products
                                <span><fmt:formatNumber value="${cart.amount}" type="CURRENCY"
                                                        currencyCode="VND"/></span>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center px-0">
                                Shipping
                                <span>Free</span>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 mb-3">
                                <div>
                                    <strong>Total amount</strong>
                                    <strong>
                                        <p class="mb-0">(including VAT)</p>
                                    </strong>
                                </div>
                                <span><strong><fmt:formatNumber value="${cart.amount}" type="CURRENCY"
                                                                currencyCode="VND"/></strong></span>
                            </li>
                        </ul>
                        <c:choose>
                            <c:when test='${uri.contains("checkout")}'>
                                <button class="btn btn-primary btn-lg btn-block"
                                        style="background-color: rgb(72 112 196)"
                                        onclick="$('#checkout-form').submit();">
                                    Place an order
                                </button>
                            </c:when>
                            <c:otherwise>
                                <a href="/cart/checkout" class="btn btn-primary btn-lg btn-block"
                                   style="background-color: rgb(72 112 196)">
                                    Go to checkout
                                </a>
                            </c:otherwise>
                        </c:choose>

                    </div>
                </div>
                <div class="card mb-4 mb-lg-0">
                    <div class="card-body">
                        <p><strong>We accept</strong></p>
                        <img class="me-2" width="45px"
                             src="https://mdbcdn.b-cdn.net/wp-content/plugins/woocommerce-gateway-stripe/assets/images/visa.svg"
                             alt="Visa"/>
                        <img class="me-2" width="45px"
                             src="https://mdbcdn.b-cdn.net/wp-content/plugins/woocommerce-gateway-stripe/assets/images/amex.svg"
                             alt="American Express"/>
                        <img class="me-2" width="45px"
                             src="https://mdbcdn.b-cdn.net/wp-content/plugins/woocommerce-gateway-stripe/assets/images/mastercard.svg"
                             alt="Mastercard"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<p class="visually-hidden" id="message">${message}</p>
<c:import url="../../assets/common-link/common-js.jsp"/>
<script>
    let alertMessage = (message) => {
        if (message != null && !message.length == 0) {
            alert(message);
        }
    };
    $(() => {
        alertMessage("${message}");
    });
</script>
</body>
</html>
