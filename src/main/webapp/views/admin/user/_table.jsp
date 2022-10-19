<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="card mb-4">
    <div class="card-header">
        <i class="fas fa-table me-1"></i>
        User Table
    </div>
    <div class="card-body">
        <table id="datatablesSimple">
            <thead>
            <tr>
                <th>#</th>
                <th>Image</th>
                <th>Username</th>
                <th>Full Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Role</th>
                <th>Edit</th>
            </tr>
            </thead>
            <tfoot>
            <tr>
                <th>#</th>
                <th>Image</th>
                <th>Username</th>
                <th>Full Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Role</th>
                <th>Edit</th>
            </tr>
            </tfoot>
            <tbody>
            <c:forEach items="${users}" var="item" varStatus="status">
                <tr>
                    <td>${item.id}</td>
                    <td><img src="/upload/${item.img}" alt="${item.username}" class="img-fluid"></td>
                    <td>${item.username}</td>
                    <td>${item.fullName}</td>
                    <td>${item.email}</td>
                    <td>${item.phone}</td>
                    <td>${item.admin? 'Admin' : 'User'}</td>
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
