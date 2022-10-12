<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <c:import url="../common-link.jsp"/>
    <title>Title</title>
</head>
<body>
<div class="container bg-light vh-100">
    <div class="row pt-3 pb-4">
        <div class=" col-lg-5 col-md-6 col-8 mx-auto">
            <div class="card flex-row border-0 shadow rounded-3 overflow-hidden">
                <!-- <div class="card-img-left d-none d-md-flex img-login">
                  </div> -->
                <div class="card-body mx-4 my-2">
                    <c:if test="${message != null}">
                        <div class="alert ${user == null? 'alert-danger' : 'alert-success'} d-flex align-items-center"
                             role="alert">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor"
                                 class="bi bi-exclamation-octagon-fill flex-grow-0 me-2" viewBox="0 0 16 16">
                                <path d="M11.46.146A.5.5 0 0 0 11.107 0H4.893a.5.5 0 0 0-.353.146L.146 4.54A.5.5 0 0 0 0 4.893v6.214a.5.5 0 0 0 .146.353l4.394 4.394a.5.5 0 0 0 .353.146h6.214a.5.5 0 0 0 .353-.146l4.394-4.394a.5.5 0 0 0 .146-.353V4.893a.5.5 0 0 0-.146-.353L11.46.146zM8 4c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995A.905.905 0 0 1 8 4zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
                            </svg>
                            <div>${message}</div>
                        </div>
                    </c:if>
                    <div class="card-img text-center mb-4">
                        <img class="img-fluid" style="max-width: 100px;"
                             src="https://img5.thuthuatphanmem.vn/uploads/2022/01/16/logo-fpt-fpt-polytechnic-tach-nen_043151201.png"
                             alt="">

                    </div>
                    <h5 class="card-title lead text-muted mb-3 fw-light  ">Welcome Back!</h5>

                    <form name="" class="" action="/account/login" method="post">

                        <div class="form-floating mb-3">
                            <input type="text" name="username"
                                   class="form-control"
                                   id="username" placeholder=" " required>
                            <label class="text-muted fw-light" for="username">Nhập username</label>
                            <%--              <div class="invalid-feedback">Nhập username từ 3 đến 20 kí tự.</div>--%>
                        </div>

                        <div class="form-floating mb-3">
                            <input type="password" name="password"
                                   class="form-control"
                                   id="password" placeholder=" " required>
                            <label class="text-muted fw-light" for="password">Nhập password</label>
                            <%--              <div class="invalid-feedback">Nhập A-z, 0-9, '-' và từ 6 kí tự trở lên.</div>--%>
                        </div>


                        <div class="form-check mb-3">
                            <input class="form-check-input" type="checkbox" ng-model="isRemember"
                                   id="rememberPasswordCheck">
                            <label class="form-check-label fw-light" for="rememberPasswordCheck">
                                Ghi nhớ mật khẩu
                            </label>
                        </div>
                        <div class="mb-2 text-center">
                            <button
                                    class="btn py-2  w-50  btn-primary btn-login lead text-uppercase" type="submit">
                                đăng nhập
                            </button>
                        </div>
                        <div class=" text-center">
                            <!-- <a class=" mt-2 small" href="#!update-password">Quên mật khẩu?</a> -->
                            <a href="#" class=" small">Chưa có tài khoản?</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
