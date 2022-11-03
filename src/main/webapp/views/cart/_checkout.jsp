<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div class="card mb-4">
    <div class="card-body">
        <form:form action="/cart/checkout" modelAttribute="order" method="post" id="checkout-form"
                   class="card border-0  needs-validation" novalidate="true">
            <form:input path="id" type="hidden"/>
<%--            <form:input path="user" type="hidden" value="${loggedInUser}"/>--%>
            <form:input path="total" type="hidden" value="${cart.amount}"/>
            <div class="row mt-3">
                <div class="col-8 mx-auto">
                    <div class="form-group mb-3">
                        <label for="exampleInputEmail1">Your name</label>
                        <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp"
                               value="${loggedInUser.fullName}" disabled>
                    </div>
                    <div class="form-group mb-3">
                        <form:label path="phone" for="phone" cssClass="form-label ">Phone number</form:label>
                        <form:input path="phone" id="phone" cssClass="form-control"
                                    cssErrorClass="is-invalid form-control" value="${loggedInUser.phone}"/>
                        <div class="invalid-feedback px-2">
                            <form:errors path="phone"/>
                        </div>
                    </div>
                    <div class="form-group mb-3">
                        <form:label path="address" for="address" cssClass="form-label ">Address</form:label>
                        <form:input path="address" id="address" cssClass="form-control"
                                    cssErrorClass="is-invalid form-control" value="${loggedInUser.address}"/>
                        <div class="invalid-feedback px-2">
                            <form:errors path="address"/>
                        </div>
                    </div>
                </div>
            </div>
        </form:form>
    </div>
</div>
