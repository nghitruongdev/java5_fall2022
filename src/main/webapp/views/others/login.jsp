<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<button id="btn-login" type="button" class="btn shadow text-white px-4" data-bs-toggle="modal" data-bs-target="#modalSignin" style="background-color: rgb(52,105,215)">
    Login
</button>

<div class="modal fade modal-signin position-absolute py-5" tabindex="-1" role="dialog" id="modalSignin" data-bs-backdrop="static" data-bs-keyboard="false">
    <div class="modal-dialog" role="document">
        <div class="modal-content rounded-4 shadow">
            <div class="modal-header p-5 pb-4 border-bottom-0">
                <h2 class="fw-bold mb-0">Welcome back!</h2>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>

            <div class="modal-body p-5 pt-0">
                <form class="" action="/account/login" method="post">
                    <div class="form-floating mb-3">
                        <input name="username" type="text" class="form-control rounded-3" id="username" placeholder="Username">
                        <label for="username">Username</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input name="password" type="password" class="form-control rounded-3" id="password" placeholder="Password">
                        <label for="password">Password</label>
                    </div>
                    <div class="form-check mb-3">
                        <input name="remember" class="form-check-input" type="checkbox" value="true" id="check-remember">
                        <label class="form-check-label" for="check-remember">
                            Remember Password
                        </label>
                    </div>
                    <button class="w-100 mb-2 btn btn-lg rounded-3 btn-primary" type="submit">Login</button>
                </form>
            </div>
        </div>
    </div>
</div>
<script>
    let getLoginInfo = () => {
        $.get(
            "/account/login", (data, status) => {
                let user = data;
                $("#username").val(user.username);
                $("#password").val(user.password);
                $("#check-remember").prop("checked", user.length != 0);
            }
        )
    };
    $(() => {
        $("#btn-login").click(() => {
            getLoginInfo();
        });
    });
</script>

