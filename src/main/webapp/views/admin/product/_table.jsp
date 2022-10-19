<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="card mb-4">
    <div class="card-header">
        <i class="fas fa-table me-1"></i>
        Product Table
    </div>
    <div class="card-body">
        <table id="datatablesSimple">
            <thead>
            <tr>
                <th>#</th>
                <th>Image</th>
                <th>Name</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Description</th>
                <th>Category</th>
                <th>Edit</th>
            </tr>
            </thead>
            <tfoot>
            <tr>
                <th>#</th>
                <th>Image</th>
                <th>Name</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Description</th>
                <th>Category</th>
                <th>Edit</th>
            </tr>
            </tfoot>
            <tbody>
            <c:forEach items="${products}" var="item" varStatus="status">
                <tr>
                    <td>${item.id}</td>
                    <td><img src="${item.img}" alt="${item.name}" class="img-fluid"></td>
                    <td>${item.name}</td>
                    <td>${item.price}</td>
                    <td>${item.quantity}</td>
                    <td>${item.description}</td>
                    <td>${item.category.name}</td>
                    <td>
                        <div class="d-flex">
                            <a href="/admin/products/${item.id}"
                               class="btn text-secondary">
                                <i class="fa fa-edit"></i>
                            </a>
                            <form action="/admin/products/delete" class="px-0 mx-0" method="post">
                                <input type="hidden" name="id" value="${item.id}">
                                <button class="btn">
                                    <i class="fa fa-trash text-danger"></i>
                                </button>
                            </form>
                        </div>

                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
