<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lab03</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <script src="https://kit.fontawesome.com/34cc1d8757.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"
            integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="../static/css/student_form.css">
    <script>
        if("${message}" != ""){
            alert("${message}");
        };
    </script>
</head>
<body class="bg-secondary">
<div class="container vh-100">
    <nav class="navbar navbar-expand bg-transparent">
        <div class="container-fluid">
            <a class="navbar-brand fw-bold h1" href="#">NGHITV</a>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                           aria-expanded="false">
                            Student Form
                        </a>
                    </li>
                </ul>
<%--                <form class="d-flex" role="search">--%>
<%--                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">--%>
<%--                </form>--%>
            </div>
        </div>
    </nav>
    <form:form  action="/student/save" method="post" enctype="multipart/form-data" modelAttribute="student" class="card border-0  shadow col-8 mx-auto needs-validation" novalidate="true">
        <div class="card-up d-flex justify-content-end">
            <div class="mt-2 pe-4">
                <div class="btn-group btn-lang-container ml-auto" role="group" aria-label="Basic radio toggle button group">
                    <input type="radio" class="btn-check" name="lang" id="btnradio2" autocomplete="off" value="vi">
                    <label class="btn-lang btn btn-outline-success" for="btnradio2">VI</label>

                    <input type="radio" class="btn-check" name="lang" id="btnradio3" autocomplete="off" value="en">
                    <label class="btn-lang btn btn-outline-success" for="btnradio3">EN</label>
                </div>
            </div>
        </div>
        <div class="avatar shadow border position-relative mx-auto">
            <label id="btn-upload" for="imageUpload" class="btn position-absolute top-100 start-100 rounded-circle px-2 py-1">
                <i class="icon fa-solid fa-camera"></i>
                <span class="visually-hidden">Personal Avatar</span>
                <input type="file" name="attach" id="imageUpload" class="d-none" accept=".png, .jpg, .jpeg"/>
                <form:hidden path="img"/>
            </label>
            <div class="border w-100 h-100 rounded-circle">
                <c:if test="${student.img == null|| student.img.equals('')}">
                    <img id="imagePreview" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRr0YlatAy-hrNCQjzZ7fqDzNiXt7HGmzVaA&usqp=CAU" alt="" class="img-fluid rounded-circle border w-100 h-100"
                         data-bs-toggle="tooltip" data-bs-placement="right" title="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRr0YlatAy-hrNCQjzZ7fqDzNiXt7HGmzVaA&usqp=CAU" loading="lazy">
                </c:if>
                <c:if test="${student.img != null && student.img != ''}">
                    <img id="imagePreview" src="${pageContext.request.contextPath}${student.img}"  alt="" class="img-fluid rounded-circle border w-100 h-100"
                         data-bs-toggle="tooltip" data-bs-placement="right" title="${student.img}" loading="lazy">
                </c:if>
            </div>
        </div>
        <div class="px-4">
        <p class=" h2 mt-3">Enter your details</p>
            <div class="row">
            <div class="mb-3 col-md-6">
                    <form:label path="name" for="name" cssClass="form-label px-2">Full name</form:label>
                    <form:input path="name" id="name" cssClass="form-control" cssErrorClass="is-invalid form-control"  />
                    <div class="invalid-feedback px-2">
                        <form:errors path="name" />
                    </div>
            </div>
            <div class="mb-3 col-md-6">
                <form:label path="email" for="email" cssClass="form-label">Email Address</form:label>
                <form:input path="email" id="email" cssClass="form-control" type="email" cssErrorClass="is-invalid form-control" />
                <div class="invalid-feedback px-2">
                    <form:errors path="email" />
                </div>
            </div>
            </div>
            <div class="row">
                <div class="mb-3 col-md-6">
                    <form:label path="mark" for="mark" cssClass="form-label">Mark</form:label>
                    <form:input path="mark" id="mark" cssClass="form-control" type="number" min="0" max="10" step="0.1"  cssErrorClass="is-invalid form-control" />
                    <div class="invalid-feedback px-2">
                        <form:errors path="mark" />
                    </div>
                </div>
                <div class="mb-3 col-md-6">
                    <form:label path="gender" cssClass="form-label d-block">Gender</form:label>
                        <div class=" d-block mx-3">
                    <c:forEach items="${genders}" var="entry">
                            <form:radiobutton path="gender" id="${entry.value}" value="${entry.key}" cssClass="form-check-input mx-2" cssErrorClass="form-check-input mx-2 is-invalid"/>
                            <label  for="${entry.value}" class="form-check-label">
                               ${entry.value}
                            </label>
                    </c:forEach>
                    <div class="invalid-feedback px-2">
                        <form:errors path="gender" />
                    </div>
                        </div>
                </div>
                <div class="mb-3 col-md-6">
                    <form:label path="faculty" cssClass="form-label">Faculty</form:label>
                    <form:select path="faculty" cssClass="form-select" cssErrorClass="form-select is-invalid" aria-label="Faculty">
                        <%--                        <option selected>Open this select menu</option>--%>
                        <form:options items="${faculties}"/>
                                       </form:select>
                    <div class="invalid-feedback px-2">
                        <form:errors path="faculty" />
                    </div>
                </div>

                <div class="mb-3 col-md-6">
                    <form:label path="hobbies" cssClass="form-label d-block">Hobbies</form:label>
                    <c:forEach items="${hobbies}" var="entry">
                    <form:checkbox path="hobbies" cssClass="form-check-input mx-2" cssErrorClass="form-check-input mx-2 is-invalid" id="${entry.key}" value="${entry.key}"/>
                    <label class="form-check-label" for="${entry.key}">
                        ${entry.value}
                    </label>
                    </c:forEach>
                    <div class="invalid-feedback px-2">
                        <form:errors path="hobbies" />
                    </div>
                </div>
            </div>
        </div>
        <button class="form-btn btn-primary btn p-2 px-5 mx-auto my-4">Save</button>
    </form:form>
</div>
<script>
    const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
    const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl));
</script>
<script src="../static/js/upload.js"></script>
</body>
</html>
