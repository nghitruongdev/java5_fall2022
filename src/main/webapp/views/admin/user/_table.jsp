<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="card mb-4 mt-4">
    <div class="card-header d-flex justify-content-between">
        <p><i class="fas fa-table me-1"></i>
            User Table</p>
        <button type="button" class="btn btn-success" data-bs-toggle="modal"
                data-bs-target="#detail-0">
            New User
        </button>
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
                    <td>
                        <c:choose>
                            <c:when test='${item.img != null && !item.img.equals("")}'>
                                <img src="/upload/${item.img}" alt="${item.username}" width="35" height="35"
                                     class="rounded-circle img-fluid">
                            </c:when>
                            <c:otherwise>
                                <img src="https://github.com/mdo.png" alt="mdo" width="35" height="35"
                                     class="rounded-circle img-fluid">
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td>${item.username}</td>
                    <td>${item.fullName}</td>
                    <td>${item.email}</td>
                    <td>${item.phone}</td>
                    <td>${item.admin? 'Admin' : 'User'}</td>
                    <td style="width: 100px;">
                        <div class="d-flex">
                            <div type="button" class="btn" data-bs-toggle="modal"
                                 data-bs-target="#detail-${item.id}">
                                <span class="fa fa-edit text-secondary"></span>
                            </div>

                            <div class="">
                                <form action="/admin/users/delete" class="px-0 mx-0" method="post">
                                    <input type="hidden" name="id" value="${item.id}">
                                    <button class="btn">
                                        <i class="fa fa-trash text-danger"></i>
                                    </button>
                                </form>
                            </div>

                        </div>
                    </td>
                </tr>
                <c:set var="u" value="${item}" scope="request"/>
                <c:import url="_form.jsp"/>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
