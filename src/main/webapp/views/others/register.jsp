<%--
  Created by IntelliJ IDEA.
  User: xuaanhaor
  Date: 10/13/22
  Time: 4:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
    <div class="container">
        <section class="vh-100 bg-image"
                 style="background-image: url('https://mdbcdn.b-cdn.net/img/Photos/new-templates/search-box/img4.webp');">
            <div class="mask d-flex align-items-center h-100 gradient-custom-3">
                <div class="container h-100">
                    <div class="row d-flex justify-content-center align-items-center h-100">
                        <div class="col-12 col-md-9 col-lg-7 col-xl-6">
                            <div class="card" style="border-radius: 15px;">
                                <div class="card-body p-5">
                                    <h2 class="text-uppercase text-center mb-5">Create an account</h2>

                                    <form action="/account/register" method="post">

                                        <div class="form-outline mb-4">
                                            <input type="text" id="fullname" class="form-control form-control-lg" name="fullname"/>
                                            <label class="form-label" for="fullname">Your Name</label>
                                        </div>

                                        <div class="form-outline mb-4">
                                            <input type="email" id="email" class="form-control form-control-lg" name="email" />
                                            <label class="form-label" for="email">Your Email</label>
                                        </div>

                                        <div class="form-outline mb-4">
                                            <input type="text" id="username" class="form-control form-control-lg" name="username"/>
                                            <label class="form-label" for="username">Username</label>
                                        </div>

                                        <div class="form-outline mb-4">
                                            <input type="password" id="password" class="form-control form-control-lg" name="password"/>
                                            <label class="form-label" for="password">Password</label>
                                        </div>

                                        <div class="form-outline mb-4">
                                            <input type="password" id="rpPassword" class="form-control form-control-lg" name="matchingPassword"/>
                                            <label class="form-label" for="rpPassword">Repeat your password</label>
                                        </div>

                                        <div class="form-outline mb-4">
                                            <input type="number" id="number" class="form-control form-control-lg" name="number"/>
                                            <label class="form-label" for="number">number</label>
                                        </div>


                                        <div class="form-check d-flex justify-content-center mb-5">
                                            <input class="form-check-input me-2" type="checkbox" value="" id="" />
                                            <label class="form-check-label" for="">
                                                I agree all statements in <a href="#!" class="text-body"><u>Terms of service</u></a>
                                            </label>
                                        </div>
                                        <t1>${error}</t1>

                                        <div class="d-flex justify-content-center">
                                            <button type="submit"
                                                    class="btn btn-success btn-block btn-lg gradient-custom-4 text-body">Register</button>
                                        </div>


                                        <p class="text-center text-muted mt-5 mb-0">Have already an account? <a href="#!"
                                                                                                                class="fw-bold text-body"><u>Login here</u></a></p>

                                    </form>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</body>
</html>
