<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="modal fade" id="detail-${u.id}" data-bs-backdrop="static" data-bs-keyboard="false"
     tabindex="-1" aria-labelledby="detail-${u.id}-label" aria-hidden="true">
    <div class="modal-dialog modal-lg p-0">
        <div class="modal-content p-0">
            <div class="modal-body p-0">
                <form:form action="/student/save" method="post" enctype="multipart/form-data" modelAttribute="u"
                           class="card border-0  shadow mx-auto needs-validation" novalidate="true">
                    <div class="card-up d-flex justify-content-end p-2">
                        <button type="button" class="btn-close btn btn-close-white" data-bs-dismiss="modal"
                                aria-label="Close"></button>
                    </div>
                    <form:hidden path="password" value="${u.password != null? u.password : '123'}"/>
                    <div class="avatar shadow border position-relative mx-auto">
                        <label id="btn-upload" for="imageUpload"
                               class="btn position-absolute top-100 start-100 rounded-circle px-2 py-1">
                            <i class="icon fa-solid fa-camera"></i>
                            <span class="visually-hidden">Personal Avatar</span>
                            <input type="file" name="attach" id="imageUpload" class="d-none"
                                   accept=".png, .jpg, .jpeg"/>
                            <form:hidden path="img"/>
                        </label>
                        <div class="border w-100 h-100 rounded-circle">
                            <c:if test="${u.img == null|| u.img.equals('')}">
                                <img id="imagePreview"
                                     src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRr0YlatAy-hrNCQjzZ7fqDzNiXt7HGmzVaA&usqp=CAU"
                                     alt="" class="img-fluid rounded-circle border w-100 h-100"
                                     data-bs-toggle="tooltip" data-bs-placement="right"
                                     title="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRr0YlatAy-hrNCQjzZ7fqDzNiXt7HGmzVaA&usqp=CAU"
                                     loading="lazy">
                            </c:if>
                            <c:if test="${u.img != null && u.img != ''}">
                                <img id="imagePreview" src="/upload/${u.img}" alt=""
                                     class="img-fluid rounded-circle border w-100 h-100"
                                     data-bs-toggle="tooltip" data-bs-placement="right" title="${u.img}"
                                     loading="lazy">
                            </c:if>
                        </div>
                    </div>
                    <div class="px-4">
                        <p class=" h2 mt-3">Enter your details</p>
                        <form:hidden path="id"/>
                        <form:hidden path="password"/>
                        <div class="row">
                            <div class="mb-3 col-md-6">
                                <form:label path="username" for="username" cssClass="form-label">Username</form:label>
                                <form:input path="username" id="username" cssClass="form-control" type="text"
                                            cssErrorClass="is-invalid form-control"/>
                                <div class="invalid-feedback px-2">
                                    <form:errors path="username"/>
                                </div>
                            </div>
                            <div class="mb-3 col-md-6">
                                <form:label path="fullName" for="fullName"
                                            cssClass="form-label px-2">Full name</form:label>
                                <form:input path="fullName" id="fullName" cssClass="form-control"
                                            cssErrorClass="is-invalid form-control"/>
                                <div class="invalid-feedback px-2">
                                    <form:errors path="fullName"/>
                                </div>
                            </div>
                            <div class="mb-3 col-md-6">
                                <form:label path="email" for="email" cssClass="form-label">Email Address</form:label>
                                <form:input path="email" id="email" cssClass="form-control" type="email"
                                            cssErrorClass="is-invalid form-control"/>
                                <div class="invalid-feedback px-2">
                                    <form:errors path="email"/>
                                </div>
                            </div>

                            <div class="mb-3 col-md-6">
                                <form:label path="phone" for="phone" cssClass="form-label">Phone</form:label>
                                <form:input path="phone" id="phone" cssClass="form-control" type="text"
                                            cssErrorClass="is-invalid form-control"/>
                                <div class="invalid-feedback px-2">
                                    <form:errors path="phone"/>
                                </div>
                            </div>
                            <div class="mb-3 col-md-6">
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" role="switch"
                                           id="flexSwitchCheckDefault"
                                           value="true"
                                           name="admin" ${u.admin? 'checked': ''}>
                                    <label class="form-check-label" for="flexSwitchCheckDefault">Admin</label>
                                </div>
                            </div>
                            <div class="mb-3 col-md-6">
                                <form:label path="address" for="address" cssClass="form-label">Address</form:label>
                                <form:textarea path="address" id="address" cssClass="form-control" type="text"
                                               cssErrorClass="is-invalid form-control"/>
                                <div class="invalid-feedback px-2">
                                    <form:errors path="address"/>
                                </div>
                            </div>
                            <div class="text-end">
                                <button formaction="/admin/users/save"
                                        class="form-btn btn-primary btn p-2 px-5 mx-auto my-4">Save
                                </button>
                                <c:if test="${u.username != null}">
                                    <button formaction="/admin/users/delete"
                                            class=" btn-danger btn p-2 px-5 mx-auto my-4">
                                        Delete
                                    </button>
                                    <button formaction="/admin/users/clear"
                                            class=" btn-secondary btn p-2 px-5 mx-auto my-4">
                                        Reset
                                    </button>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</div>
</div>

