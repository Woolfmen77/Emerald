<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Owner</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
          crossorigin="anonymous">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css"/>
</head>
<body>

<nav class="py-2 bg-light border-bottom">
    <div class="container d-flex flex-wrap">
        <ul class="nav me-auto">
            <li class="nav-item"><a href="/home" class="nav-link link-dark px-2 active" aria-current="page">Home</a>
            </li>
            <li class="nav-item"><a href="#" class="nav-link link-dark px-2">Features</a></li>
            <li class="nav-item"><a href="#" class="nav-link link-dark px-2">Pricing</a></li>
            <li class="nav-item"><a href="#" class="nav-link link-dark px-2">FAQs</a></li>
            <li class="nav-item"><a href="#" class="nav-link link-dark px-2">About</a></li>
        </ul>
        <ul class="nav">
            <li class="nav-item"><a href="/login" class="nav-link link-dark px-2">Login</a></li>
            <li class="nav-item"><a href="/registration" class="nav-link link-dark px-2">Sign up</a></li>
        </ul>
    </div>
</nav>
<header class="py-3 mb-4 border-bottom">
    <div class="container d-flex flex-wrap justify-content-center">
        <a href="/" class="d-flex align-items-center mb-3 mb-lg-0 me-lg-auto text-dark text-decoration-none">
            <svg class="bi me-2" width="40" height="32">
                <use xlink:href="#bootstrap"></use>
            </svg>
            <span class="fs-4">Double header</span>
        </a>
        <form class="col-12 col-lg-auto mb-3 mb-lg-0">
            <input type="search" class="form-control" placeholder="Search..." aria-label="Search">
        </form>
    </div>
</header>

<h1>Hello owner!</h1>

<br>
<br>

<input type="button" value="Home"
       onclick="window.location.href='/'; return false;"
       class="add-button"/>

<br>
<br>
<form class="form-signin" method="post" action="${pageContext.request.contextPath}/logout">
    <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}">
    <button class="btn btn-lg btn-primary btn-block" type="submit">Exit</button>
</form>
<br>
<br>
</body>
</html>
