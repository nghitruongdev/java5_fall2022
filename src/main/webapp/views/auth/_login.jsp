<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--background-color: rgb(52,105,215)--%>
<li class="nav-item mt-0 ml-2">
    <!-- Button trigger modal -->
    <div id="btn-login" type="button" class="btn" data-toggle="modal" data-target="#modalSignin" style="cursor: pointer;">
                <span class="fa fa-user nav-icon"></span>
    </div>
</li>

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

