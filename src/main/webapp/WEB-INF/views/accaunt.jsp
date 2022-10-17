<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title><spring:message code="table.user.title.page.accaunt"/></title>

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="/resources/img/faviconn.png" type="image/x-icon">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
          crossorigin="anonymous">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/stylelog.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/my_style.css"/>
    <style>
        body {
            background-image: url(https://cdn.pixabay.com/photo/2017/11/27/21/31/computer-2982270_960_720.jpg);
            background-repeat: no-repeat;
            background-position: center;
            background-size: cover;
            display: block;
        }

        tr:hover td {
            text-decoration: underline;
        }
    </style>
</head>

<body>
<jsp:include page="blocks/header.jsp"/>
<br>
<div>
    <br>
    <div class="text-center bg-black my-2 bg-opacity-50 ">
        <h2 style="color: white"><spring:message code="table.user.title.page.accaunt"/></h2>
    </div>
</div>
<div>
</div>
<div class=" p-5 my-3">
    <div class="my-auto p-5 d-block">
        <div class=" my-auto">
            <div>
                <div>
                    <table class="table table-bordered table-hover  border-info  bg-dark bg-opacity-50"
                           style="color: white">
                        <tr>
                            <th style="color: white"><spring:message code="table.property.id"/></th>
                            <td style="color: white">${userPrincipal.id}</td>
                        </tr>
                        <tr>
                            <th style="color: white"><spring:message code="table.user.email"/></th>
                            <td style="color: white">${userPrincipal.email}</td>
                        </tr>
                        <tr>
                            <th style="color: white"><spring:message code="table.user.login"/></th>
                            <td style="color: white">${userPrincipal.username}</td>
                        </tr>
                        <tr>
                            <th style="color: white"><spring:message code="table.user.name"/></th>
                            <td style="color: white">${userPrincipal.name}</td>
                        </tr>
                        <tr>
                            <th style="color: white"><spring:message code="table.user.phone"/></th>
                            <td style="color: white">${userPrincipal.phone}</td>
                        </tr>
                        <tr>
                            <th style="color: white"><spring:message code="table.user.role"/></th>
                            <td style="color: white">
                                <c:if test='${userPrincipal.role=="ADMIN"}'><spring:message
                                        code="table.user.role.admin"/></c:if>
                                <c:if test='${userPrincipal.role=="OWNER"}'><spring:message
                                        code="table.user.role.owner"/></c:if>
                                <c:if test='${userPrincipal.role=="SPECIALIST"}'><spring:message
                                        code="table.user.role.specialist"/></c:if>
                            </td>
                        </tr>
                        <tr class="border-5">
                            <th style="color: white"><spring:message code="table.property.action"/></th>
                            <td style="color: white">
                                <a href="/update/${userPrincipal.id}" style="color: #ffffff"><spring:message
                                        code="table.property.edit"/></a> | <a
                                    href="/delete/${userPrincipal.id}"
                                    style="color: #ffffff"
                                    onclick="if (!(confirm('<spring:message
                                            code="table.property.delete.this"/>?'))) return false"
                            ><spring:message code="table.property.delete"/></a></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    function clearFilter() {
        window.location = '/admin/list';
    }
</script>

<div class="footer">
    <%@include file="blocks/footer.jsp" %>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>