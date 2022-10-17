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
    <title><spring:message code="table.user.title"/></title>

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="/resources/img/faviconn.png" type="image/x-icon">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
          crossorigin="anonymous">

    <link rel="stylesheet" href="/resources/css/stylelog.css"/>
    <link rel="stylesheet" href="/resources/css/my_style.css"/>
    <style>
        body {
            background-image: url(https://kartinkin.net/uploads/posts/2021-07/1626279149_21-kartinkin-com-p-nedvizhimost-fon-krasivo-31.jpg);
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
        <h2 style="color: white"><spring:message code="table.user.title.page"/></h2>
    </div>
</div>
<div>
    <div class="container">
        <div class="col-md-6 m-5 offset-md-10">
            <div class="form-horizontal">
                <form method="post" action="/filter/adminFilter">
                    <label>
                        <input class="bg-white  btn" type="text" name="userFilter"
                               placeholder="<spring:message code="label.search"/>"
                               value="${userFilter}"/>
                    </label>
                    <select style="color: white"
                            class="selectpicker add-button  btn bg-black bg-opacity-50 btn-outline-secondary"
                            id="enabled"
                            name="enabled">
                        <option style="color: white" disabled selected><spring:message
                                code="table.user.activity"/></option>
                        <option value="${true}"><spring:message code="table.user.active"/></option>
                        <option value="${false}"><spring:message code="table.user.blocked"/></option>
                    </select>
                    <input class="add-button btn bg-black bg-opacity-50 btn-outline-secondary" type="submit"
                           style="color: white"
                           value="<spring:message code="label.search"/>"/>
                    <input class="add-button btn bg-black bg-opacity-50 btn-outline-secondary" type="button"
                           style="color: white"
                           value="<spring:message code="label.clean"/>"
                           onclick="clearFilter()"/>
                </form>
            </div>
        </div>
    </div>
</div>
<div class=" p-5 my-3">
    <div class="my-auto p-5 d-block">
        <div class=" my-auto">
            <div>
                <div>
                    <table class="table table-bordered table-hover  border-info  bg-dark bg-opacity-50"
                           style="color: white">
                        <th style="color: white"><spring:message code="table.property.index"/></th>
                        <th style="color: white"><spring:message code="table.property.id"/></th>
                        <th style="color: white"><spring:message code="table.user.email"/></th>
                        <th style="color: white"><spring:message code="table.user.login"/></th>
                        <th style="color: white"><spring:message code="table.user.name"/></th>
                        <th style="color: white"><spring:message code="table.user.phone"/></th>
                        <th style="color: white"><spring:message code="table.user.role"/></th>
                        <th style="color: white"><spring:message code="table.user.activity"/></th>
                        <th style="color: white"><spring:message code="table.property.action"/></th>


                        <c:forEach items="${users}" var="theUser" varStatus="theCount">

                            <c:url var="updateLink" value="/admin/update/${theUser.id}">
                            </c:url>

                            <c:url var="deleteLink" value="/admin/delete">
                                <c:param name="userId" value="${theUser.id}"/>
                            </c:url>

                            <tr>
                                <td style="color: white">${theCount.count}</td>
                                <td style="color: white">${theUser.id}</td>
                                <td style="color: white">${theUser.email}</td>
                                <td style="color: white">${theUser.username}</td>
                                <td style="color: white">${theUser.name}</td>
                                <td style="color: white">${theUser.phone}</td>
                                <td style="color: white">
                                    <c:if test='${theUser.role=="ADMIN"}'><spring:message code="table.user.role.admin"/></c:if>
                                    <c:if test='${theUser.role=="OWNER"}'><spring:message code="table.user.role.owner"/></c:if>
                                    <c:if test='${theUser.role=="SPECIALIST"}'><spring:message
                                            code="table.user.role.specialist"/></c:if>
                                </td>
                                <td style="color: white">
                                    <c:if test='${theUser.enabled==true}'><spring:message
                                            code="table.user.active"/></c:if>
                                    <c:if test='${theUser.enabled==false}'><spring:message
                                            code="table.user.blocked"/></c:if>
                                </td>
                                <td style="color: white">
                                    <c:if test="${theUser.id!=1}">
                                    <a href="${updateLink}" style="color: #ffffff"><spring:message
                                            code="table.property.edit"/></a> | <a
                                        href="${deleteLink}"
                                        style="color: #ffffff"
                                        onclick="if (!(confirm('<spring:message
                                                code="table.property.delete.this"/>?'))) return false"
                                ><spring:message code="table.property.delete"/></a></td>
                                </c:if>

                            </tr>
                        </c:forEach>
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