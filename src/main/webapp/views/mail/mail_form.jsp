<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <title>Document</title>
    <style>
        .required {
            color: red;
        }
    </style>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
</head>

<body>

<div class="w-75 mx-auto card px-5 py-4 mt-3" style="max-width: 500px;">
    <form action="" class="row">
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
            <label for="" class="form-label">Your name <span class="required">*</span></label>
            <input type="text" class="form-control" id="">
        </div>
        <div class="mb-3 col-6">
            <label for="" class="form-label">To <span class="required">*</span></label>
            <input type="email" class="form-control" id="">
        </div>
        <div class="mb-3">
            <label for="" class="form-label">Subject <span class="required">*</span></label>
            <input type="text" class="form-control" id="">
        </div>
        <div class="mb-3">
            <label for="" class="form-label">Content</label>
            <textarea class="form-control" aria-label="With textarea" style="min-height: 100px;"></textarea>
        </div>
        <div class="input-group mb-3">
            <input type="file" class="form-control" id="inputGroupFile02">
            <label class="input-group-text" for="inputGroupFile02">Upload</label>
        </div>
        <div class="mt-2 text-end">
            <button type="submit" class="btn btn-danger px-4">Submit</button>
        </div>
    </form>
</div>
</body>

</html>

