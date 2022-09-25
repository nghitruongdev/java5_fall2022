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
<body class=" d-flex align-items-center">
<form action="/param/form/2022" method="get">
    <input type="text" class="form-control" name="par">
</form>
<ul>
    <li>PathVariable: ${var}</li>
    <li>Request Parameter: ${par}</li>
</ul>
</body>
</html>
