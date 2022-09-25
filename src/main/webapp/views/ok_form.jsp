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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
</head>
<body class="bg-dark d-flex align-items-center">
<div class="card bg-secondary bg-opacity-50 m-auto col-6">
    <div class="card-body text-center">
        <form action="/ctrl/ok" method="post" class="">
            <button class="btn btn-primary">Button 1</button>
            <button formmethod="get" class="btn btn-primary mx-3">Button 2</button>
            <button formaction="/ctrl/ok3" class="btn btn-primary">Button 3</button>
        </form>
        <p class="lead text-white">Result: ${message}</p>
    </div>

</div>
</body>
</html>
