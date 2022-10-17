<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ page isELIgnored="false" %>
<!doctype html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="/resources/img/faviconn.png" type="image/x-icon">
    <title><spring:message code="label.authorization"/></title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
          crossorigin="anonymous">

    <link rel="stylesheet" href="/resources/css/stylelog.css"/>
    <style>
        body {
            background-image: url(https://photo.virtualbrest.ru/uploads/2022/04/27/353534543.jpg);
            background-repeat: no-repeat;
            background-position: center;
            background-size: cover;
        }
    </style>

</head>
<body>
<%@include file="blocks/header.jsp" %>

<div class="container">
    <div class="col-md-4 offset-md-4">
        <div class="p-3 my-3">
            <div class="form-container m-5  bg-opacity-50 bg-dark">
                <div class="text-center ">
                    <h3 style="color: #f5f2f2"><spring:message code="label.authorization"/></h3>
                </div>

                <form action="/login" class="form-horizontal" method="post">
                    <div class="form-group my-1 bg-dark bg-opacity-75 btn">
                        <label style="color: #f5f2f2"><spring:message code="label.authorization.login"/>:</label>
                        <input type="text" name="username" class="form-control" style="border-radius: 10px"
                               placeholder="name" required>
                    </div>
                    <c:if test="${error}"><span style="color: #f1d107"><h5><spring:message
                            code="label.authorization.error"/></h5></span></c:if>
                    <div class="form-group  my-1 bg-dark bg-opacity-75 btn">
                        <label style="color: #f5f2f2"><spring:message code="label.authorization.password"/>:</label>
                        <input type="password" name="password" class="form-control" style="border-radius: 10px"
                               placeholder="password" required>
                    </div>

                    <div style="color: #FFFFFF"><input type="checkbox" name="remember-me"
                                                       value="remember-me"/><spring:message
                            code="label.authorization.remember"/></div>
                    <div><input type="submit" value="<spring:message code="label.authorization.signin"/>"
                                style="color: #f5f2f2" class="form-group bg-dark bg-opacity-75 btn"/></div>
                </form>

                <div style="clear:both"></div>

            </div>
            <br>
            <br>
            <br>
            <br>
        </div>
    </div>
</div>

<%@include file="blocks/footer.jsp" %>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>

</body>
</html>
