<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 10/14/2022
  Time: 11:33 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<body>
<div class="mb-3">
    <label for="name" class="form-label">name</label>
    <input type="text" class="form-control" id="name" placeholder="name">
</div>
<div class="mb-3">
    <label for="price" class="form-label">price</label>
    <input type="number" class="form-control" id="price" placeholder="price">
</div>
<div class="mb-3">
    <label for="quantity" class="form-label">quantity</label>
    <input type="number" class="form-control" id="quantity" placeholder="quantity">
</div>

<div class="mb-3">
    <label for="description" class="form-label">description</label>
    <textarea class="form-control" id="description" rows="5"></textarea>
</div>
<div class="form-group">
    <label>Loại giày</label> <select name="maLoaiGiay"
                                     class="form-control"
                                     style="border: inset rgb(112, 112, 112); width: 500px; padding: 10px;">
    <c:forEach var="item" items="">
        <option value=""></option>
    </c:forEach>
</select>
</div>
<div class="mb-3">
    <label for="picture" class="form-label">Default file input example</label>
    <input class="form-control" type="file" id="picture">
</div>
<button formaction="/admin/index/insert" class="btn btn-info"
        type="submit">Lưu</button>
</body>

</html>
