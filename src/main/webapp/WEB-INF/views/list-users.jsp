<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>List Users</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
          crossorigin="anonymous">
</head>

<body>

<div id="wrapper">
    <div id="header">
        <h2>List of registered owner</h2>
    </div>
</div>
<br>
<br>
<div id="container">
    <div id="content">

        <table class="table table-sm table-bordered">
            <th>Index</th>
            <th>Id</th>
            <th>Email</th>
            <th>Name</th>
            <th>Phone</th>
            <th>Action</th>
            </tr>
            <%--            <jsp:useBean id="users" scope="request" type="java.util.List"/>--%>
            <c:forEach items="${users}" var="theUser" varStatus="theCount">

                <!-- construct an "update" link with customer id -->
                <c:url var="updateLink" value="/update">
                    <c:param name="userId" value="${theUser.id}"/>
                </c:url>

                <!-- construct an "delete" link with customer id -->
                <c:url var="deleteLink" value="/delete">
                    <c:param name="userId" value="${theUser.id}"/>
                </c:url>

                <tr>
                    <td>${theCount.count}</td>
                    <td>${theUser.id}</td>
                    <td>${theUser.email}</td>
                    <td>${theUser.username}</td>
                    <td>${theUser.phone}</td>
                    <td><a href="${updateLink}">Update</a> | <a href="${deleteLink}"
                                                                onclick="if (!(confirm('Are you sure you want to delete this user?'))) return false"
                    >Delete</a></td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>

</body>
</html>