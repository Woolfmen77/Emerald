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

    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
</head>

<body>
<div>
    <div id="wrapper">
        <div id="header">
            <h2>Sign in</h2>
        </div>
    </div>

    <div class="container-fluid">
        <div class="col-md-4 offset-md-4">
            <div class="form-container">
                <h3>Sign in</h3>

                <form:form method="POST" modelAttribute="userLogin">


                    <form:hidden path="id"/>

                    <table>
                        <tr>
                            <td><label>Name:</label></td>
                            <td><form:input path="username"/></td>
                        </tr>
                        <tr>
                            <td><label>Password:</label></td>
                            <td><form:input path="password"/></td>
                        </tr>
                    </table>

                    <div class="g-recaptcha" data-sitekey="6LcQYIgfAAAAACz3rU4KcnBWjYA7ubybtuFhUGww"></div>
                    <div><input type="checkbox" name="remember-me" value="remember-me"> Remember me</div>
                    <div><input type="submit" value="Sign in" class="sign in"/></div>
                </form:form>


                <div style="clear:both"></div>

            </div>
        </div>
    </div>

</div>

</body>
</html>
