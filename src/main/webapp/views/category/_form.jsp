<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<form:form action="/category/index" class="" modelAttribute="item">
  <form:input path="id" type="text" name="id" placeholder="Category Id?" />
  <form:input path="name" type="text" name="name" placeholder="Category name?" />
  <hr>
  <button class="" formaction="/category/create">Create</button>
  <button class="" formaction="/category/update">Update</button>
  <a href="/category/delete/${item.id}" class="">Delete</a>
  <a href="/category/" class="">Reset</a>
</form:form>