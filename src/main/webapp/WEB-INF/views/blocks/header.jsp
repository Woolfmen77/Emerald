<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page isELIgnored="false" %>
<header id="header" class="fixed-top">
    <nav class="navbar navbar-expand-lg navbar-dark bg-opacity-50 bg-black">
        <div class="container">
            <a href="/" class="navbar-brand">Emerald</a>
            <button class="navbar-toggler collapsed" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navContent"
                    aria-controls="navContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="navbar-collapse collapse" id="navContent">
                <ul class="navbar-nav  mr-auto mb-3 mb-lg-0">
                    <li class="nav-item">
                        <a href="/property/list" class="nav-link link-dark
                           <c:if test="${userPrincipal.role.name() == null}">disabled</c:if> "><spring:message
                                code="label.object"/></a>
                    </li>


                    <c:choose>
                        <c:when test="${userPrincipal.role.name() == 'ADMIN'}">
                            <li class="nav-item">
                                <a href="/admin/list" class="nav-link link-dark"><spring:message
                                        code="label.user.list"/></a>
                            </li>
                            <li class="nav-item">
                                <a href="/property/categorySall" class="nav-link link-dark"><spring:message
                                        code="label.sall"/></a>
                            </li>
                            <li class="nav-item">
                                <a href="/property/categoryRental" class="nav-link link-dark"><spring:message
                                        code="label.rental"/></a>
                            </li>
                        </c:when>
                    </c:choose>
                </ul>
                <div class="collapse navbar-collapse d-flex flex-row-reverse">
                    <ul class="navbar-nav mr-auto mb-3 mb-lg-0">
                        <c:choose>
                            <c:when test="${userPrincipal.role.name() == null}">
                                <li class="nav-item">
                                    <a href="/login" class="nav-link link-dark "><spring:message
                                            code="label.login"/></a>
                                </li>
                                <li class="nav-item">
                                    <a href="/registration" class="nav-link link-dark "><spring:message
                                            code="label.singup"/></a>
                                </li>
                            </c:when>
                            <c:when test="${userPrincipal.role.name() != null}">
                                <li class="nav-item">
                                    <a href="/accaunt"
                                       class="nav-link link-dark ">
                                        <c:if test="${userPrincipal.role.name() == 'ADMIN'}">
                                            <spring:message code="table.user.role.admin"/></c:if>
                                        <c:if test="${userPrincipal.role.name() == 'OWNER'}">
                                            <spring:message code="table.user.role.owner"/></c:if>
                                        <c:if test="${userPrincipal.role.name() == 'SPECIALIST'}">
                                            <spring:message code="table.user.role.specialist"/></c:if>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="/logout"
                                       class="nav-link link-dark "><spring:message
                                            code="label.logout"/> </a>
                                </li>
                            </c:when>
                        </c:choose>
                    </ul>
                </div>
                <div id="header-languages-bar">
                    <a target="_self" href="?lang=en" hreflang="en" title="English">
                        <img class="header-language-image" width="29" height="25"
                             src="https://s2.o7planning.com/templates/o7planning/resources/images/languages/en.png"
                             style="border:1px solid white">
                    </a>
                    <a target="_self" href="?lang=uk" hreflang="uk" title="Ukraina">
                        <img class="header-language-image" width="29" height="25"
                             src="https://upload.wikimedia.org/wikipedia/commons/thumb/4/49/Flag_of_Ukraine.svg/250px-Flag_of_Ukraine.svg.png"
                             style="border:1px solid white">
                    </a>
                    <a target="_self" href="?lang=ru" hreflang="ru" title="Rusian">
                        <img class="header-language-image" width="29" height="25"
                             src="https://s2.o7planning.com/templates/o7planning/resources/images/languages/ru.png"
                             style="border:1px solid white">
                    </a>
                </div>
            </div>
        </div>
    </nav>
</header>