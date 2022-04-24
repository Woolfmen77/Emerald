<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registration</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/stylelog.css"/>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
          crossorigin="anonymous">
</head>

<body>
<div id="wrapper">
    <div id="header">
        <h2>Registration</h2>
    </div>
</div>

<div class="container-fluid">
    <div class="col-md-4 offset-md-4">
        <div class="form-container">

            <form:form action="saveUser" method="POST" modelAttribute="userRegistration">

                <!-- need to associate this data with customer id -->
                <form:hidden path="id"/>

                <table>
                    <tr>
                        <td><label>Email:</label></td>
                        <td><form:input path="email"/></td>
                    </tr>
                    <tr>
                        <td><label>Name:</label></td>
                        <td><form:input path="username"/></td>
                    </tr>
                    <tr>
                        <td><label>Phone:</label></td>
                        <td><form:input path="phone"/></td>
                    </tr>
                    <tr>
                        <td><label>Password:</label></td>
                        <td><form:input path="password"/></td>
                    </tr>
                    <tr>
                        <td><label>Confirm Password:</label></td>
                        <td><form:input path="confirmPassword"/></td>
                    </tr>
                    <tr>
                        <td><label></label></td>
                        <td><input type="submit" value="Save" class="save"/></td>
                    </tr>
                </table>
            </form:form>

            <div style="clear:both"></div>

        </div>
    </div>
</div>

</body>
</html>