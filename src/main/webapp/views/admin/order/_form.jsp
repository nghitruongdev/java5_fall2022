<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="modal fade" id="detail-${order.id}" data-bs-backdrop="static" data-bs-keyboard="false"
     tabindex="-1" aria-labelledby="detail-${order.id}-label" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="detail-${order.id}-label">Order Details -
                    Order: ${order.id}</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <table class="table">
                    <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Product name</th>
                        <th scope="col">Product Image</th>
                        <th scope="col">Price</th>
                        <th scope="col">Quantity</th>
                        <th scope="col">Total</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${order.orderDetailsById}" var="item" varStatus="status">
                        <tr>
                            <td>${item.id}</td>
                            <td>${item.product.name}</td>
                            <td>
                                <img src="/upload/${item.product.img}" alt="${item.product.name}" class="img-fluid">
                            </td>
                            <td>${item.quantity}</td>
                            <td><fmt:formatNumber value="${item.price}"
                                                  type="CURRENCY" currencyCode="VND"/>
                            </td>
                            <td><fmt:formatNumber value="${item.total}"
                                                  type="CURRENCY" currencyCode="VND"/>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
