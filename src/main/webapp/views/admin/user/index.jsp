<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <c:import url="../../../assets/common-link/common-meta.jsp"/>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet"/>
    <link href="../../../assets/css/styles.css" rel="stylesheet"/>
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    <title>VNCO - Product Management</title>
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
    <style>
        body {
            font-family: 'Inter', sans-serif;
        }

        .card-up {
            height: 120px;
            background-color: rgb(10, 104, 159);
            /*overflow: hidden;*/
        }

        .avatar {
            width: 200px;
            height: 200px;
            margin-top: -100px;
            vertical-align: middle;
            background-color: white;
            border: 4px solid rgba(51, 51, 51, 0.316) !important;
            border-radius: 50%;
            padding: 3px;
        }

        .avatar img {
            object-fit: cover;
        }

        .avatar > #btn-upload {
            color: rgb(10, 104, 159);
            /* background-color: rgba(255, 255, 255, 0.794);  */
            background-color: rgba(255, 255, 255, 0.878);
            border: solid rgba(235, 235, 235, 0.639) 1px;
            transform: translate(-150%, -100%);
        }

        .avatar > #btn-upload:hover {
            color: rgb(10, 104, 159);
            /* background-color: rgba(255, 255, 255, 0.794);  */
            background-color: white !important;
        }

        .form-btn {
            background-color: rgb(25, 133, 195);
        }

        .form-btn:hover {
            background-color: rgb(24, 116, 169) !important;
            transform: translateY(-1px);
            transition: transform 200ms;
        }

        .btn-lang {
            background: white;
            color: green;
        }
    </style>
</head>
<body class="bg-secondary">
<c:import url="../layout/_header.jsp"/>
<div id="layoutSidenav">
    <c:import url="../layout/_sidenav.jsp"/>
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <c:import url="_table.jsp"/>
                <c:set var="u" value="${user}" scope="request"/>
                <c:import url="_form.jsp"/>
            </div>
        </main>
    </div>
</div>
<%--<c:import url="_form.jsp" />--%>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
<script src="../../../assets/js/scripts.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script src="assets/demo/chart-area-demo.js"></script>
<script src="assets/demo/chart-bar-demo.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
<script src="../../../assets/js/datatables-simple-demo.js"></script>

<script>
    const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
    const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl));
</script>
<script>
    $(document).ready(function () {
        $('#imageUpload').change(function (event) {
            readFile(event);
        })
    });

    const readFile = (input) => {
        let file;
        const fileList = input.target.files;
        if (fileList && fileList[0]) {
            file = fileList[0];
            console.log(file);
        } else return;

        const reader = new FileReader();
        reader.onload = (event) => {
            const preview = $('#imagePreview');
            preview.attr('src', event.target.result);
            preview.hide();
            preview.fadeIn(300);
            preview.attr('title', file.name);
            new bootstrap.Tooltip(preview);
        };
        reader.readAsDataURL(file);
    };
</script>
</body>
</html>

