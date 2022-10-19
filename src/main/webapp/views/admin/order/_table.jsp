<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="card mb-4">
    <div class="card-header">
        <i class="fas fa-table me-1"></i>
        Order Table
    </div>
    <div class="card-body">
        <table id="datatablesSimple">
            <thead>
            <tr>
                <th>#</th>
                <th>Customer's Name</th>
                <th>Phone</th>
                <th>Address</th>
                <th>Total</th>
                <th>Details</th>
            </tr>
            </thead>
            <tfoot>
            <tr>
                <th>#</th>
                <th>Full Name</th>
                <th>Phone</th>
                <th>Address</th>
                <th>Total</th>
                <th>Details</th>
            </tr>
            </tfoot>
            <tbody>
            <c:forEach items="${orders}" var="item" varStatus="status">
                <tr>
                    <td>${item.id}</td>
                    <td>${item.user.fullName}</td>
                    <td>${item.phone}</td>
                    <td>${item.address}</td>
                    <td><fmt:formatNumber value="${item.total}"
                                          type="CURRENCY" currencyCode="VND"/>
                    </td>
                    <td style="width: 50px;" class="text-center">
                        <!-- Button trigger modal -->
                        <div type="button" class="btn" data-bs-toggle="modal"
                             data-bs-target="#detail-${item.id}">
                            <span class="fa fa-list text-secondary"></span>
                        </div>
                        <c:set var="order" value="${item}" scope="request"/>
                        <c:import url="_form.jsp"/>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
