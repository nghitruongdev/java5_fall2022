<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <c:import url="../../assets/common-link/common-meta.jsp"/>
    <c:import url="../../assets/common-link/common-css.jsp"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
    <script src="https://kit.fontawesome.com/34cc1d8757.js" crossorigin="anonymous"></script>
    <title>Title</title>
    <style>
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
</head>
<body>
<c:import url="../layout/_header.jsp"/>
<div class="container" style="padding-top: 100px;">
    <div class="row">
        <div class="col-lg-5 col-md-6 col-8 mx-auto">
            <div class="card flex-row border-0 shadow rounded-3 overflow-hidden">
                <!-- <div class="card-img-left d-none d-md-flex img-login">
                  </div> -->
                <div class="card-body mx-4 my-2">
                    <div class="card-img text-center mb-4">
                        <img class="img-fluid" style="max-width: 100px;"
                             src="https://img5.thuthuatphanmem.vn/uploads/2022/01/16/logo-fpt-fpt-polytechnic-tach-nen_043151201.png"
                             alt="">

                    </div>
                    <h5 class="card-title lead text-muted mb-3 fw-light">Welcome Back!</h5>

                    <form action="/account/login" method="post" name="loginForm" class="needs-validation" novalidate>

                        <div class="form-floating mb-3 has-validation">
                            <input type="text" name="username"
                                   class="form-control"
                                   value="${savedUser.username}"
                                   id="username" placeholder=" " required>
                            <label class="text-muted fw-light" for="username">Nhập username</label>
                            <%--                            <div class="invalid-feedback">Nhập username từ 3 đến 20 kí tự.</div>--%>
                        </div>

                        <div class="form-floating mb-3 has-validation">
                            <input type="password"
                                   name="password"
                                   value="${savedUser.password}"
                                   class="form-control"
                                   id="password" placeholder=" " required>
                            <label class="text-muted fw-light" for="password">Nhập password</label>
                            <%--                            <div class="invalid-feedback">Nhập A-z, 0-9, '-' và từ 6 kí tự trở lên.</div>--%>
                        </div>


                        <div class="form-check mb-3">
                            <input class="form-check-input" type="checkbox"
                                   id="rememberPasswordCheck" value="true"
                                   name="remember"  ${savedUser != null ? 'checked' : ''}>
                            <label class="form-check-label fw-light" for="rememberPasswordCheck">
                                Ghi nhớ mật khẩu
                            </label>
                        </div>
                        <div class="d-grid mb-2">
                            <button ng-click="login();" ng-disabled="loginForm.$invalid"
                                    class="btn btn-lg btn-primary btn-login fw-bold text-uppercase" type="submit">đăng
                                nhập
                            </button>
                        </div>
                        <div class=" text-center">
                            <!-- <a class=" mt-2 small" href="#!update-password">Quên mật khẩu?</a> -->
                            <a href="#!register" class=" small">Chưa có tài khoản?</a>
                        </div>

                        <hr class="my-4">

                        <div class="d-grid mb-2">
                            <button class="btn btn-lg btn-google btn-login  text-light" type="submit">
                                <i class="fab fa-google me-2"></i> Đăng nhập Google
                            </button>
                        </div>

                        <div class="d-grid">
                            <button class="btn btn-lg btn-facebook btn-login  text-light mt-2" type="submit">
                                <i class="fab fa-facebook-f me-2"></i> Đăng nhập Facebook
                            </button>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<c:import url="../../assets/common-link/common-js.jsp"/>

</body>
</html>

