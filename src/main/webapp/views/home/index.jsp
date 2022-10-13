<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <c:import url="../../assets/common-link/common-meta.jsp"/>
    <c:import url="../../assets/common-link/common-css.jsp"/>

    <title>VN&CO Clothing - Homepage</title>
</head>

<body>
<!-- ***** Preloader Start ***** -->
<c:import url="../layout/_pre-loader.jsp" />

<!-- Header -->
<c:import url="../layout/_header.jsp"/>

<!-- Page Content -->
<!-- Banner  -->
<c:import url="../layout/_banner.jsp"/>

<!-- Lastest products -->
<c:import url="_lastest-product.jsp"/>

<!-- Best Features-->
<c:import url="_best-features.jsp"/>

<!-- Purchase now-->
<c:import url="_purchase-now.jsp"/>

<!-- Footer -->
<c:import url="../layout/_footer.jsp"/>

<c:import url="../../assets/common-link/common-js.jsp"/>

</body>

</html>
