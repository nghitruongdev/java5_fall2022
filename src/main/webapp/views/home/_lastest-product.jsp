<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                    <c:set value="${item}" var="item" scope="request"/>
                    <c:import url="../product/_product-card.jsp"/>
                </div>
            </c:forEach>
        </div>
    </div>
</div>