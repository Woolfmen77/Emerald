<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page isELIgnored="false" %>
<!doctype html>
<html>
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="/resources/img/faviconn.png" type="image/x-icon">
    <title>Emerald</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
          crossorigin="anonymous">

    <link rel="stylesheet" href="/resources/css/my_style.css"/>

    <style>
        body {
            background-image: url(https://cdn.pixabay.com/photo/2021/02/09/20/45/architecture-5999913_960_720.jpg);
            background-repeat: no-repeat;
            background-size: cover;
            display: block;
        }
    </style>

</head>
<body>
<%@include file="blocks/header.jsp" %>
<div class="p-5">
    <div class="p-5">
        <h2 style="color: white"><spring:message code="label.mail.confirm"/></h2>

        <br>
    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
<div class="footer">
    <%@include file="blocks/footer.jsp" %>
</div>

</body>
</html>