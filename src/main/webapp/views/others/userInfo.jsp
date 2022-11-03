<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>UserInfo</title>
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet"/>
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet"/>
    <!-- MDB -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/5.0.0/mdb.min.css" rel="stylesheet"/>
    <!-- MDB -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/5.0.0/mdb.min.js"></script>
    <link rel="stylesheet" href="../assets/css/userInfo.css">
</head>
<body>
<section class="vh-100" style="background-color: #ffffff;">
    <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col col-lg-6 mb-4 mb-lg-0">
                <div class="card mb-3" style="border-radius: .5rem;">
                    <div class="row g-0">
                        <div class="col-md-4 gradient-custom text-center text-white"
                             style="border-top-left-radius: .5rem; border-bottom-left-radius: .5rem;">
                            <img src="https://i.imgur.com/WTZ2YPO.png"
                                 alt="Avatar" class="img-fluid my-5" style="width: 100px;"/>
                            <h6>Logo nhóm thay cái hình ở trên</h6>
                            <h5>Account Details</h5>
                            <p>UserName</p>
                            <i class="far fa-edit mb-5"></i>
                        </div>
                        <div class="col-md-8">
                            <div class="card-body p-4" style="background-color: rgb(255, 253, 193);">
                                <h6>Information</h6>
                                <hr class="mt-0 mb-4">
                                <div class="row pt-1">
                                    <div class="form-outline col-6 mb-4">
                                        <input type="email" id="typeText1" class="form-control" name="email"/>
                                        <label class="form-label" for="typeText1">Email</label>
                                    </div>
                                    <div class="form-outline col-6 mb-4">
                                        <input type="password" id="typeText2" class="form-control" name="pass"/>
                                        <label class="form-label" for="typeText2">PassWord</label>
                                    </div>
                                    <div class="form-outline col-6 mb-4">
                                        <input type="tel" id="typePhone" class="form-control"/>
                                        <label class="form-label" for="typePhone">Your Phone</label>
                                    </div>
                                </div>
                                <h6>VN&CO</h6>
                                <hr class="mt-0 mb-4">
                                <div class="row pt-1">
                                    <div class="col-6 mb-3">
                                        <h6>Recent</h6>
                                        <p class="text-muted">Lorem ipsum</p>
                                    </div>
                                    <div class="col-6 mb-3">
                                        <h6>Most Viewed</h6>
                                        <p class="text-muted">Dolor sit amet</p>
                                    </div>
                                </div>
                                <div class="d-flex justify-content-start">
                                    <a href="#!"><i class="fab fa-facebook-f fa-lg me-3"></i></a>
                                    <a href="#!"><i class="fab fa-twitter fa-lg me-3"></i></a>
                                    <a href="#!"><i class="fab fa-instagram fa-lg"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>
