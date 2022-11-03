<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<form:form action="#" modelAttribute="product" method="post" enctype="multipart/form-data"
           class="card border-0  needs-validation" novalidate="true">
    <form:input path="id" type="hidden"/>
    <div class="row mt-3">
        <div class="col-6 mt-4">
            <div class="card shadow rounded-3 mx-auto w-75">
                <label for="imageUpload" class="d-flex btn">
                    <img src="/upload/${product.img != null? product.img : 'default.png'}" alt=""
                         class="img-fluid text-center mx-auto" id="imagePreview">
                </label>
            </div>
            <div class="mt-4 d-flex">
                    <%--                <label for="imageUpload" class="btn btn-success text-center px-4 mx-auto">Upload</label>--%>
                <input type="file" name="attach" id="imageUpload" class="d-none" accept=".png, .jpg, .jpeg"/>
            </div>

        </div>
        <div class="col-6">
            <div class="mb-3">
                <form:label path="category" cssClass="form-label">Category</form:label>
                <form:select path="category" cssClass="form-select" cssErrorClass="form-select is-invalid"
                             aria-label="category" items="${categories}" itemLabel="name">
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
            <div class="text-end">
                <button class="btn btn-success" formaction="/admin/products/save">Save</button>
                <button class="btn btn-danger" formaction="/admin/products/delete">Delete</button>
                <a href="/admin/products/clear" class="btn btn-secondary">Reset</a>
            </div>

        </div>
    </div>
</form:form>
