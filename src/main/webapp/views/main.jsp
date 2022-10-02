<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<h2 class="text-center my-3 py-2" style="background-color: white">SẢN PHẨM BÁN CHẠY</h2>
<div id="product-container" class="row row-cols-md-2 row-cols-3  mx-3"
     style="background-color: rgba(242,248,250,0.53)">
    <c:forEach items="${items}" var="item" varStatus="status">
        <div class="card mb-3" style="width: 18rem; margin-right: auto">
            <img
                    src="${item.img}"
                    class="card-img-top mt-3"
                    alt="..."
            />
            <div class="card-body">
                <h5 class="card-title">${item.name}</h5>
                <p class="card-text">
                        ${item.price}
                </p>
                <div class="text-end">
                        <%--                   <form action="/cart/add/${item.id}" class="" method="post">--%>
                    <button onclick="addItem(${item.id})" class="btn btn-dark"
                            style="background-color: rgb(52,105,215)">Add to cart
                    </button>
                        <%--                   </form>--%>
                </div>
            </div>
        </div>
    </c:forEach>
</div>
<script>
    $(() => {
        let margin = ($("#product-container .card").first().css("margin"));
        $("#product-container .card").css("margin", margin);
        $(window).resize(() => {
            $("#product-container .card").css("margin-right", "auto");
            let margin = ($("#product-container .card").first().css("margin"));
            $("#product-container .card").css("margin", margin);
        })
    })
</script>