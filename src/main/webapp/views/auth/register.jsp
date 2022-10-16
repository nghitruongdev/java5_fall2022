<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <c:import url="../../assets/common-link/common-meta.jsp" />
    <c:import url="../../assets/common-link/common-css.jsp" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
    <script src="https://kit.fontawesome.com/34cc1d8757.js" crossorigin="anonymous"></script>
    <title>Title</title>
    <style>
        .card-img-left.img-login{
            width: 45%;
            /* Link to your background image using in the property below! */
            /* background: scroll center url('https://source.unsplash.com/WEQbe2jBg40/414x512'); */
            background: scroll center url('https://images.unsplash.com/photo-1546410531-bb4caa6b424d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1471&q=80');
            background-size: cover;
        }

        .card-img-left.img-register{
            width: 45%;
            /* Link to your background image using in the property below! */
            /* background: scroll center url('https://source.unsplash.com/WEQbe2jBg40/414x512'); */
            background: scroll center url('https://images.unsplash.com/photo-1543599538-a6c4f6cc5c05?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80');
            background-size: cover;
        }


        .btn-google {
            color: white !important;
            background-color: #ea4335;
        }

        .btn-facebook {
            color: white !important;
            /* color: rgb(244, 55, 55) !important; */
            background-color: #3b5998;
        }
    </style>
    <script>
        if("${message}" != ""){
            alert("${message}");
        };
    </script>
</head>
<body>
<c:import url="../layout/_header.jsp" />
<div class="container mt-3">
    <div class="row">
        <div class="col-lg-10 col-xl-9 mx-auto">
            <div class="card flex-row my-5 border-0 shadow rounded-3 overflow-hidden">
                <div class="card-img-left d-none d-md-flex img-register">
                    <!-- Background image for card set in CSS! -->
                </div>
                <div class="card-body p-4 p-sm-5">
                    <div class="card-img text-center mb-4">
                        <img class="img-fluid" style="max-width: 200px;"
                             src="https://img5.thuthuatphanmem.vn/uploads/2022/01/16/logo-fpt-fpt-polytechnic-tach-nen_043151201.png" alt="">

                    </div>
                    <h5 class="card-title fw-light mb-3 text-muted">Đăng ký tài khoản</h5>
                    <form:form action="/account/register" modelAttribute="user" method="post" name="registerForm" class="needs-validation" novalidate>
                        <div class="form-floating mb-3 has-validation">
                            <input
                                   type="text" name="username"
                                   class="form-control"  id="username"
                                   cssErrorClass="is-invalid form-control">
                            <label class="text-muted fw-light" for="username">Username</label>
                            <form:errors path="name"/>
<%--                            <div class="invalid-feedback">{{usernameExists? 'Username đã tồn tại trong hệ thống' : 'Nhập username từ 3 đến 20 kí tự.'}}</div>--%>
                        </div>
                        <div class="form-floating mb-3 has-validation">
                            <input type="email" name="email"
                                   class="form-control"
                                   id="email" placeholder="abc@fpt.edu.vn" required>
                            <label class="text-muted fw-light" for="email">Email</label>
                            <form:errors path="email" />
<%--                            <div class="invalid-feedback">{{emailExists? 'Email đã tồn tại trong hệ thống.' : 'Nhập email hợp lệ.'}}</div>--%>
                        </div>

                        <div class="form-floating mb-3 has-validation">
                            <input ng-model="user.password" ng-minlength="6" ng-pattern="/^[a-zA-Z0-9-]*$/"
                                   type="password" name="pw"
                                   class="form-control {{(registerForm.pw.$untouched && !registerForm.pw.$dirty)? '' : registerForm.pw.$invalid? 'is-invalid':'is-valid'}}"
                                   id="password" placeholder=" " required>
                            <label class="text-muted fw-light" for="password">Nhập mật khẩu mới</label>
                            <div class="invalid-feedback">Nhập A-z, 0-9, '-' và từ 6 kí tự trở lên.</div>
                        </div>

                        <div class="form-floating mb-3 mt-4 has-validation">
                            <input ng-model="verify" ng-minlength="6" ng-pattern="/^[a-zA-Z0-9-]*$/"
                                   type="password" name="verify"
                                   class="form-control {{(registerForm.verify.$untouched && !registerForm.verify.$dirty)? '' : registerForm.verify.$invalid || (user.password != verify)? 'is-invalid' : 'is-valid'}}"
                                   id="verify" placeholder=" " required>
                            <label class="text-muted fw-light" for="verify">Xác nhận mật khẩu</label>
                            <div class="invalid-feedback">
                                {{
                                (user.password != verify)? 'Xác nhận mật khẩu không trùng khớp.'
                                : 'Nhập A-z, 0-9, "-" và từ 6 kí tự trở lên.'
                                }}

                            </div>
                        </div>


                        <a href="#!login" class="small text-center d-block">Đã có tài khoản?</a>
                        <hr class="my-4">
                        <div class="d-grid mb-2">
                            <button ng-click="add();" ng-disabled="registerForm.$pristine || registerForm.$invalid"
                                    class="btn btn-lg btn-success btn-login fw-bold text-uppercase" type="submit">đăng ký</button>
                        </div>

                        <div class="d-grid mb-2">
                            <button class="btn btn-lg btn-google btn-login fw-bold text-uppercase" type="submit">
                                <i class="fab fa-google me-2"></i> Đăng ký Google
                            </button>
                        </div>

                        <div class="d-grid">
                            <button class="btn btn-lg btn-facebook btn-login fw-bold text-uppercase" type="submit">
                                <i class="fab fa-facebook-f me-2"></i> Đăng ký Facebook
                            </button>
                        </div>

                    </form:form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
