<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="/resources/img/faviconn.png" type="image/x-icon">
    <title><spring:message code="admin.user.title"/></title>


    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
          crossorigin="anonymous">
    <link rel="stylesheet" href="/resources/css/stylelog.css"/>
    <style>
        body {
            background-image: url(https://storge.pic2.me/c/1360x800/246/5f82ddfa3a0c34.00145412.jpg);
            background-repeat: no-repeat;
            background-position: center;
            background-size: cover;
            display: block;
        }
    </style>
    <%@ page import="com.rusanov.emerald.entity.enums.RoleEnum" %>
</head>
<body>
<jsp:include page="blocks/header.jsp"/>

<div class="container">
    <div class="col-md-4  offset-md-4">
        <div class="p-3 my-3">
            <div class="form-container m-5  bg-opacity-50 bg-dark">
                <div id="header" class="text-center ">
                    <h3 style="color: #FFFFFF"><spring:message code="admin.user.title"/></h3>
                </div>
                <form:form action="/admin/update" cssClass="form-horizontal" method="POST" modelAttribute="user">
                    <form:hidden path="id"/>
                    <div class="form-group bg-primary my-1 bg-opacity-50 btn">
                        <label for="enabled"><spring:message code="table.user.activity"/></label>
                        <br>
                        <select class="selectpicker bg-primary my-1 bg-opacity-50 btn" id="enabled" name="enabled">
                            <option disabled style="color: black"><spring:message code="table.user.activity"/></option>
                            <option selected value="${true}"><spring:message code="table.user.active"/></option>
                            <option value="${false}"><spring:message code="table.user.blocked"/></option>
                        </select>
                    </div>
                    <div class="form-group bg-primary my-1 bg-opacity-50 btn">
                        <label for="role"><spring:message code="table.user.role"/></label>
                        <br>
                        <select class="selectpicker bg-primary my-1 bg-opacity-50 btn" id="role" name="role">
                            table.user.role
                            <option disabled selected style="color: black"><spring:message code="table.property.select"/></option>
                            <c:forEach items="<%=RoleEnum.values()%>" var="role">
                                <option value="${role}"
                                        <c:if test='${user.role==role}'>selected</c:if>>
                                    <c:if test='${role=="ADMIN"}'><spring:message code="table.user.role.admin"/></c:if>
                                    <c:if test='${role=="OWNER"}'><spring:message code="table.user.role.owner"/></c:if>
                                    <c:if test='${role=="SPECIALIST"}'><spring:message code="table.user.role.specialist"/></c:if>
                                </option>
                            </c:forEach>
                        </select>
                    </div>

                    <input style="color: white" type="submit" value="<spring:message code="admin.user.change"/>"
                           class="form-group btn bg-primary my-1 bg-opacity-50"/>
                    <br>
                    <input type="button" value="<spring:message code="admin.user.backtolist"/>"
                           onclick="window.location.href='/admin/list'; return false;"
                           class="add-button bg-primary my-1 bg-opacity-50 btn "/>
                </form:form>
            </div>
        </div>
    </div>
    <div style="clear:both"></div>
    <br>

</div>


<br>
<br>
<br>
<br>
<br>
<br>
<br>
<div id="footer">
    <jsp:include page="blocks/footer.jsp"/>
</div>

</body>
</html>