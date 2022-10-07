<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <c:import url="common-css-links.jsp"/>
</head>
<body>
<c:import url="header.jsp"/>
<c:import url="main.jsp"/>
<p id="message" class="visually-hidden">${message}</p>
<script>
    let alertMessage = (message) => {
        if (message != null && !message.length == 0) {
            alert(message);
        }
    };
    let addItem = (id) => {
        $.post("/cart/add/" + id)
            .done((data) => {
                //https://stackoverflow.com/questions/3300332/jquery-find-on-data-from-ajax-call-is-returning-object-object-instead
                //if top-level element(children of body), use filter()
                //else, use find()
                $("#cart-div").html($(data).find("#cart-div").children());
                alertMessage($(data).filter("#message").text());
            });
    };
    $(() => {
        alertMessage("${message}");
    });
</script>
</body>
</html>
