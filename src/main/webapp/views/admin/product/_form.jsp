<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<form:form action="#" modelAttribute="product" method="post" enctype="multipart/form-data"
           class="card border-0  needs-validation" novalidate="true">
    <form:input path="id" type="hidden"/>
    <div class="row">
        <div class="col-6" class="">
            <div class="">
                <img src="../../../assets/images/product_01.jpg" alt="" class="img-fluid">
            </div>
            <div class="mt-2">
                <label for="imageUpload" class="btn btn-success text-center bg-secondary px-4">Upload</label>
                <input type="file" name="attach" id="imageUpload" class="d-none" accept=".png, .jpg, .jpeg"/>
            </div>

        </div>
        <div class="col-6">
            <div class="mb-3">
                <form:label path="category" cssClass="form-label">Category</form:label>
                <form:select path="category" cssClass="form-select" cssErrorClass="form-select is-invalid"
                             aria-label="category" items="${categories}" itemLabel="name">
                    <%--                                            <option selected>Open this select menu</option>--%>
                    <%--                    <form:options items="${categories}" itemLabel="name"/>--%>
                </form:select>
                <div class="invalid-feedback px-2">
                    <form:errors path="category"/>
                </div>
            </div>
            <div class="mb-3">
                <form:label path="name" for="name" cssClass="form-label ">Product name</form:label>
                <form:input path="name" id="name" cssClass="form-control" cssErrorClass="is-invalid form-control"/>
                <div class="invalid-feedback px-2">
                    <form:errors path="name"/>
                </div>
            </div>

            <div class="mb-3">
                <form:label path="price" for="price" cssClass="form-label">Price</form:label>
                <form:input path="price" id="price" cssClass="form-control" type="number" min="0" step="0,01"
                            cssErrorClass="is-invalid form-control"/>
                <div class="invalid-feedback px-2">
                    <form:errors path="price"/>
                </div>
            </div>
            <div class="mb-3">
                <form:label path="quantity" for="quantity" cssClass="form-label">Quantity</form:label>
                <form:input path="quantity" id="quantity" cssClass="form-control" type="number" min="0" step="1"
                            cssErrorClass="is-invalid form-control"/>
                <div class="invalid-feedback px-2">
                    <form:errors path="quantity"/>
                </div>
            </div>
            <div class="mb-3">
                <form:label path="description" for="description" cssClass="form-label">Description</form:label>
                <form:textarea path="description" id="description" cssClass="form-control" type="text"
                               cssErrorClass="is-invalid form-control"/>
                <div class="invalid-feedback px-2">
                    <form:errors path="description"/>
                </div>
            </div>
            <button class="btn btn-primary" formaction="/admin/products/save">Save</button>
            <button class="btn btn-primary" formaction="/admin/products/delete">Delete</button>
            <a href="/admin/products/clear" class="btn btn-primary">Reset</a>
        </div>
    </div>
</form:form>
