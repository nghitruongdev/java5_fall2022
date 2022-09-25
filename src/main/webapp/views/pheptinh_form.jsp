<%--
  Created by IntelliJ IDEA.
  User: nghipc
  Date: 17/09/2022
  Time: 18:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Lab02</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/34cc1d8757.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../static/css/calculator.css">
</head>
<body>
    <h1 class="title">SIMPLE CALCULATOR 🧮</h1>
<div class="plans col-6 mt-3">
    <form action="/pheptinh" method="get" class="d-flex align-items-center justify-content-center flex-column h-100 w-50 mx-auto">
        <div class="mb-3 w-100">
            <input type="number" step="0.01" class="form-control" id="num1" name="num1" placeholder="Enter first number" required>
        </div>
        <div class="mb-3 w-100">
            <input type="number" step="0.01" class="form-control" id="num2" name="num2" placeholder="Enter second number" required>
        </div>

        <div class="pheptinh-container d-flex justify-content-center w-100">
            <label for="+" class="plan">
                <input type="radio" class="" id="+" name="pheptinh" value="+" ${pheptinh == "+" || pheptinh == null? "checked": ""}>
                <div class="plan-content">
                    <i class="fa-solid fa-plus"></i>
                </div>
            </label>
            <label for="-" class="plan mx-2">
                <input type="radio" class="" id="-" name="pheptinh" value="-" ${pheptinh == "-"? "checked": ""}>
                <div class="plan-content">
                    <i class="fa-solid fa-minus"></i>
                </div>
            </label>
            <label for="multiply" class="plan">
                <input type="radio" class="" id="multiply" name="pheptinh" value="*" ${pheptinh == "*"? "checked": ""}>
                <div class="plan-content">
                    <i class="fa-solid fa-multiply"></i>
                </div>
            </label>
            <label for="divide" class="plan mx-2">
                <input type="radio" class="" id="divide" name="pheptinh" value="/" ${pheptinh == "/"? "checked": ""}>
                <div class="plan-content">
                    <i class="fa-solid fa-divide"></i>
                </div>
            </label>
        </div>
        <div class="row mt-3 w-100">
            <button class="btn btn-form btn-primary py-3 mx-auto">Calculate</button>
            <%--                <button class="btn col-1"><i class="fa-solid fa-rotate"></i></button>--%>
        </div>
        <div class="mt-3">
            <h1 class="d-3">${result}</h1>
        </div>
</form>
</div>
</body>
</html>
