<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>List Property</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/stylelog.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
          crossorigin="anonymous">
</head>

<body>

<div id="wrapper">
    <div id="header">
        <h2>Database of real estate obgects</h2>
    </div>
</div>
<br>
<br>

<div id="container" class="form-style-2">
    <div id="content">
        <table class="table table-bordered table-hover">
            <tr>
                <th>Index</th>
                <th>Id</th>
                <th>Apartment</th>
                <th>BuildingType</th>
                <th>PropertyType</th>
                <th>Repair</th>
                <th>Service</th>
                <th>Bathroom</th>
                <th>NumberRoom</th>
                <th>Price</th>
                <th>TotalArea</th>
                <th>LivingArea</th>
                <th>Description</th>
                <th>Balcony</th>
                <th>Floor</th>
                <th>Floors</th>
                <%--                <th>Address</th>--%>
            </tr>

            <c:forEach items="${propertiesCategory}" var="theProperty" varStatus="theCount">

                <tr>
                    <td>${theCount.count}</td>
                    <td>${theProperty.id}</td>
                    <td>${theProperty.apartment}</td>
                    <td>${theProperty.buildingType}</td>
                    <td>${theProperty.propertyType}</td>
                    <td>${theProperty.repair}</td>
                    <td>${theProperty.category}</td>
                    <td>${theProperty.bathroom}</td>
                    <td>${theProperty.numberRoom}</td>
                    <td>${theProperty.price}</td>
                    <td>${theProperty.totalArea}</td>
                    <td>${theProperty.livingArea}</td>
                    <td>${theProperty.description}</td>
                    <td>${theProperty.balcony}</td>
                    <td>${theProperty.floor}</td>
                    <td>${theProperty.floors}</td>
                        <%--                    <td>${theProperty.Address}</td>--%>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>

</body>
</html>
