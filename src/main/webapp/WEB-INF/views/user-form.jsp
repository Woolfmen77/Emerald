<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Form</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/add-customer-style.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
          crossorigin="anonymous">
</head>

<body>
<div id="wrapper">
    <div id="header">
        <h2> CRM - User Relationship Manager</h2>
    </div>
</div>

<div id="container">
    <h3>Save User</h3>

    <div class="panel-body">
        <form:form action="update" cssClass="form-horizontal" method="POST" modelAttribute="user">

            <form:hidden path="id"/>

            <div class="form-group">
                <label for="email" class="col-md-4 control-label">Email:</label>
                <div class="col-md-10">
                    <form:input path="email" cssClass="form-control"/>
                </div>
            </div>
            <div class="form-group">
                <label for="username" class="col-md-4 control-label">Name:</label>
                <div class="col-md-10">
                    <form:input path="username" cssClass="form-control"/>
                </div>
            </div>
            <div class="form-group">
                <label for="phone" type="number" class="col-md-4 control-label">Phone:</label>
                <div class="col-md-10">
                    <form:input type="number" path="phone" cssClass="form-control"/>
                </div>
            </div>

            <div class="form-group">
                <div class="col-md-offset-4 col-md-10">
                    <form:button cssClass="btn btn-primary">Submit</form:button>
                </div>
            </div>


        </form:form>
    </div>

    <div style="clear:both"></div>

    <p>
        <a href="${pageContext.request.contextPath}/list">Back to List</a>
    </p>

</div>

</body>
</html>