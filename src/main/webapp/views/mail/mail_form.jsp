<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <title>Java5 - Lab 7</title>
    <style>
        .required {
            color: red;
        }
    </style>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <c:import url="../common-link.jsp"/>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>

<body>
<c:import url="../header.jsp"/>
<div class="w-75 mx-auto card px-5 py-4 mt-3" style="max-width: 500px;">
    <form action="/mail/send" class="row" method="post" enctype="multipart/form-data">
        <div class="d-flex">
            <div class="mt-2">
                <span class="btn btn-danger rounded mx-3"><i class="bi bi-envelope-open-fill text-white"></i></span>
            </div>
            <div class="">
                <h3 class="fw-light p-0 m-0">Get in touch</h3>
                <p class="lead form-text">Leave your message and we'll get back to you shortly</p>
            </div>
        </div>

        <div class="mb-3 col-6">
            <label for="name" class="form-label">Your name <span class="required">*</span></label>
            <input name="name" type="text" class="form-control" id="name">
        </div>
        <div class="mb-3 col-6">
            <label for="email" class="form-label">To <span class="required">*</span></label>
            <input name="to" type="email" class="form-control" id="email">
        </div>
        <div class="mb-3">
            <label for="subject" class="form-label">Subject <span class="required">*</span></label>
            <input name="subject" type="text" class="form-control" id="subject">
        </div>
        <div class="mb-3">
            <label for="body" class="form-label">Content</label>
            <textarea name="body" class="form-control" id="body" aria-label="With textarea"
                      style="min-height: 100px;"></textarea>
        </div>
        <div class="input-group mb-3">
            <input name="attachments" type="file" class="form-control" id="inputGroupFile02" multiple="multiple">
            <label class="input-group-text" for="inputGroupFile02">Upload</label>
        </div>
        <div class="mt-2 d-flex justify-content-end">
            <div class="mx-2">
                <button type="submit" class="btn btn-success px-3 py-2">Send Now</button>
            </div>
            <div class="">
                <button type="submit" class="btn btn-danger px-3 py-2" formaction="/mail/queue">Send Later</button>
            </div>
        </div>
    </form>
</div>
<script>
    if ("${message}" != null && "${message}" != "") {
        Swal.fire(
            'Congrats!',
            '${message}',
            'success'
        )
    }
</script>
</body>

</html>

