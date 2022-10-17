<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="/resources/img/faviconn.png" type="image/x-icon">
    <title><spring:message code="label.registration"/></title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
          crossorigin="anonymous">
    <link rel="stylesheet" href="/resources/css/stylelog.css"/>
    <link rel="stylesheet" href="/resources/css/my_style.css"/>
    <style>
        body {
            background-image: url(https://i.obozrevatel.com/news/2022/3/2/6main.png?size=1200x630);
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
        }
    </style>
    <%@ page import="com.rusanov.emerald.entity.enums.RoleEnum" %>
</head>

<body>

<%@include file="blocks/header.jsp" %>

<div class="container-fluid">
    <div class="row">
        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
            <div class="col-md-4 m-5 offset-md-4">
                <div class="p-3 my-3">
                    <div class="form-container m-3.5  bg-opacity-50 bg-dark">
                        <div id="header" class="text-center ">
                            <h3 style="color: #FFFFFF"><spring:message code="label.registration"/></h3>
                        </div>

                        <form:form action="/registration" method="POST" cssClass="form-horizontal"
                                   modelAttribute="userForm">

                            <form:hidden path="id"/>
                            <spring:bind path="email">
                                <div class="form-group m-1 bg-dark bg-opacity-75 btn " ${status.error ? 'has-error' : ''}>
                                    <c:if test="${emailError}"><span style="color: #f1d107"><h5><spring:message
                                            code="label.registration.emailError"/></h5></span></c:if>
                                    <label for="email" style="color: white"><spring:message
                                            code="label.registration.email"/>:</label>
                                    <form:input type="text" path="email" cssClass="form-control"
                                                autofocus="true" cssStyle="border-radius: 30px"
                                                required="!"></form:input>
                                    <form:errors path="email" cssStyle="color: red"></form:errors>
                                </div>
                            </spring:bind>


                            <spring:bind path="username">
                                <div class="form-group m-1 bg-dark bg-opacity-75 btn" ${status.error ? 'has-error' : ''}>
                                    <c:if test="${usernameError}"><span style="color: #f1d107"><h5><spring:message
                                            code="label.registration.usernameError"/></h5></span></c:if>
                                    <label for="username" style="color: white"><spring:message
                                            code="label.authorization.login"/>:</label>
                                    <form:input type="text" path="username" cssClass="form-control"
                                                cssStyle="border-radius: 30px"
                                                autofocus="true" required="!"></form:input>
                                    <form:errors path="username" cssStyle="color: red"></form:errors>
                                </div>
                            </spring:bind>
                            <spring:bind path="name">
                                <div class="form-group m-1 bg-dark bg-opacity-75 btn" ${status.error ? 'has-error' : ''}>
                                        <%--                                <c:if test="${nameError}"><span style="color: #f1d107"><h5><spring:message code="label.registration.nameError"/></h5></span></c:if>--%>
                                    <label for="name" style="color: white"><spring:message
                                            code="label.registration.name"/>:</label>
                                    <form:input type="text" path="name" cssClass="form-control"
                                                cssStyle="border-radius: 30px"
                                                autofocus="true" required="!"></form:input>
                                    <form:errors path="name" cssStyle="color: red"></form:errors>
                                </div>
                            </spring:bind>
                            <spring:bind path="phone">
                                <div class="form-group m-1 bg-dark bg-opacity-75 btn" ${status.error ? 'has-error' : ''}>
                                    <label for="phone" style="color: white"><spring:message
                                            code="label.registration.phone"/>:</label>
                                    <form:input type="tel" path="phone"
                                                pattern="\+375\-[0-9]{2}\-[0-9]{3}\-[0-9]{2}\-[0-9]{2}"
                                                cssStyle="border-radius: 30px" cssClass="form-control"
                                                required="!"
                                                placeholder="375 29 000 00 00"></form:input>
                                    <form:errors path="phone" cssStyle="color: red"></form:errors>
                                </div>
                            </spring:bind>

                            <spring:bind path="role">
                                <div class="form-group bg-dark my-1 bg-opacity-50 btn ${status.error ? 'has-error' : ''}">
                                    <label for="role" style="color: white"><spring:message
                                            code="table.user.role"/>:</label>
                                    <br>
                                    <select class="selectpicker bg-dark my-1 bg-opacity-50 btn"
                                            style="border-radius: 30px"
                                            id="role" name="role">
                                        <option disabled style="color: white"><spring:message
                                                code="table.property.select"/></option>
                                        <option selected value="<%=RoleEnum.OWNER%>"><spring:message
                                                code="table.user.role.owner"/>
                                        </option>
                                        <option value="<%=RoleEnum.SPECIALIST%>"><spring:message
                                                code="table.user.role.specialist"/>
                                        </option>
                                    </select>
                                    <form:errors path="role"></form:errors>
                                </div>
                            </spring:bind>


                            <spring:bind path="password">
                                <div class="form-group m-1 bg-dark bg-opacity-75 btn" ${status.error ? 'has-error' : ''}>
                                    <label for="password" style="color: white"><spring:message
                                            code="label.authorization.password"/>:</label>
                                    <form:input type="password" path="password" cssStyle="border-radius: 30px"
                                                cssClass="form-control" required="!"></form:input>
                                    <form:errors path="password" cssStyle="color: red"></form:errors>
                                </div>
                            </spring:bind>

                            <spring:bind path="confirmPassword">
                                <div class="form-group m-1 bg-dark bg-opacity-75 btn" ${status.error ? 'has-error' : ''}>
                                    <c:if test="${passwordError}"><span style="color: #f1d107"><h5><spring:message
                                            code="label.registration.passwordError"/></h5></span></c:if>
                                    <label for="confirmPassword" style="color: white"><spring:message
                                            code="label.registration.confirm"/>:</label>
                                    <form:input type="password" path="confirmPassword" cssStyle="border-radius: 30px"
                                                cssClass="form-control" required="!"></form:input>
                                    <form:errors path="confirmPassword" cssStyle="color: red"></form:errors>
                                </div>
                            </spring:bind>
                            <input type="submit" style="color: #f5f2f2"
                                   value="<spring:message code="label.registration.save"/>"
                                   class="form-group m-1 bg-dark bg-opacity-75 btn"/>
                        </form:form>

                        <div style="clear:both"></div>

                    </div>
                </div>
            </div>
        </main>
    </div>
</div>


<%@include file="blocks/footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>